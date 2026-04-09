WITH ranked_employees AS (
  SELECT
    first_name,
    last_name,
    department,
    FTE_salary,
    tenure,
    ROW_NUMBER() OVER(
      PARTITION BY department
      ORDER BY FTE_salary DESC, tenure DESC
    ) AS rank_in_dept
  FROM `limelight-hr-data.dbt_limelight_analytics.dim_employee_directory`
)
SELECT * FROM ranked_employees
WHERE rank_in_dept = 1;