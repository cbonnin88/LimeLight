SELECT
    CAST(emp_id AS INT64) AS employee_id,
    INITCAP(first_name) AS first_name,
    INITCAP(last_name) AS last_name,
    gender,
    office_id,
    job_title,
    department,
    tenure,
    remote_type,
    performance,
    manager AS is_manager_flag,
    hours
FROM {{source('raw_hr_data','employees')}}