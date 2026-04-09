-- How much extra budged would it cost to give all 'High Risk' (Top performers in the L5 salary band) a 15% raise ?

SELECT 
  country,
  COUNT(employee_id) AS at_risk_count,
  ROUND(SUM(FTE_salary),2) AS current_at_risk_payroll,
  -- Calculate the 15% increase only for the at-risk group
  ROUND(SUM(FTE_salary * 0.15),2) AS additional_budget_needed
FROM `limelight-hr-data.dbt_limelight_analytics.dim_employee_directory`
WHERE retention_risk_status = 'High Risk'
GROUP BY
  1
ORDER BY
  additional_budget_needed DESC;