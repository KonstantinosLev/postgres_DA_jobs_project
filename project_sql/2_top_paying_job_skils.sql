/*
Qestion: What skills are erequired for the top paying data analyst jobs?
- Add the specific skills required for these roles
-Identify the most in demand skills for data analysts
*/
WITH top_paying_jobs AS(
SELECT job_id,
       job_title,
       salary_year_avg,
       company_dim.name as comp_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 
WHERE job_title_short = 'Data Analyst' AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)

SELECT --top_paying_jobs.*,
COUNT(skills),skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills
ORDER BY COUNT(skills) DESC
--ORDER BY salary_year_avg DESC

/*
Here's the breakdown of the most demanded skills  based on job posting.
-Sql is leading by count of 8.
-Python follows with a count of 7.
-And 3rd comes Tableau with a count of 6.
-Other skills like Pandas,AWS,Azure,gitlab 
 and many more show varying degrees of demand.
*/