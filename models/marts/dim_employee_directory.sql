WITH emp AS (
    SELECT * FROM {{ref('stg_employees')}}
),

comp AS (
    SELECT
        emp_id,
        base_salary,
        FTE_salary,
        salary_band
    FROM {{source('raw_hr_data','compensation')}}
),

offices AS (
    SELECT
        office_id,
        country
    FROM {{source('raw_hr_data','offices')}}
)

SELECT
    e.*,
    o.country,
    c.base_salary,
    c.FTE_salary,
    c.salary_band,
    -- Recreating the 'Equity Flag' logic in SQL
    CASE
        WHEN e.performance = 'Top' AND c.salary_band = 'L5' THEN 'High Risk'
        ELSE 'Stable'
    END AS retention_risk_status
FROM emp AS e
LEFT JOIN comp AS c
    ON e.employee_id = c.emp_id
LEFT JOIN offices AS o
    ON e.office_id = o.office_id