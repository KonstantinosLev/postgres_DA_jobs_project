/*
Question: What are the top data analyst jobs.?
- Identify the top 10 highest paying DA roles that are available remotely
- Focuses on the job postings with specified salaries
- Inlclude company names of top 10 roles
*/

SELECT job_id,
       job_title,
       job_location,
       job_schedule_type,
       salary_year_avg,
       job_posted_date,
       company_dim.name as comp_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 
WHERE job_title_short = 'Data Analyst' AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;