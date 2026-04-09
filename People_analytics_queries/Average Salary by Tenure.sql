-- Do People who stay longer get paid more ? or do new joiners get hired at higher rates ?

WITH tenure_stats AS (
  SELECT
    tenure,
    department,
    FTE_salary,
    -- Calculating the average salary for the whole department to compare
    AVG(FTE_salary) OVER(PARTITION BY department) AS dept_avg_salary
  FROM `limelight-hr-data.dbt_limelight_analytics.dim_employee_directory`
)
SELECT
  tenure,
  department,
  ROUND(AVG(tenure_stats.FTE_salary),2) AS avg_tenure_salary,
  ROUND(MAX(dept_avg_salary),2) AS dept_benchmark,
  -- Calculating the variance
  ROUND(AVG(tenure_stats.FTE_salary) - MAX(dept_avg_salary),2) AS diff_from_avg
FROM tenure_stats
GROUP BY
  1,2
ORDER BY
  2,1;