-- Temp Table

CREATE OR REPLACE TEMP TABLE leadership_benchmarks AS (
  SELECT
    job_title,
    ROUND(AVG(FTE_salary),2) AS avg_lead_pay
  FROM `limelight-hr-data.dbt_limelight_analytics.dim_employee_directory`
  WHERE department = 'Leadership'
  GROUP BY 
    1
);

-- Using the temp table to see how close tech leads are to CEO/CFO pay
SELECT
  e.first_name,
  e.job_title,
  e.FTE_salary,
  l.avg_lead_pay,
  (e.FTE_salary / l.avg_lead_pay) * 100 AS percent_of_leadership_avg
FROM `limelight-hr-data.dbt_limelight_analytics.dim_employee_directory` AS e
CROSS JOIN leadership_benchmarks AS l
WHERE e.job_title = 'Software Engineer'
  AND e.performance = 'Top'
LIMIT 10;