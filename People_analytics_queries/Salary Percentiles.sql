-- Salary Percentiles, Who are the top 10% earners in each country ?

SELECT 
  first_name,
  last_name,
  country,
  job_title,
  FTE_salary,
  -- Calculate the percentile rank of salary within each country
  PERCENT_RANK() OVER(PARTITION BY country ORDER BY FTE_salary DESC) AS salary_percentile
FROM `limelight-hr-data.dbt_limelight_analytics.dim_employee_directory`
QUALIFY salary_percentile <= 0.10 -- Showing only the top 10%