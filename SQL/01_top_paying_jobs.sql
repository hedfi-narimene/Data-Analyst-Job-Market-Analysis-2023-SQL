/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- Include company names of top 10 roles
*/

SELECT 
  a.job_title, 
  a.salary_year_avg , 
  b.name
FROM 
  job_postings_fact a
join 
  company_dim b
using(company_id)
WHERE 
  a.job_title LIKE '%Data Analyst%'
  AND a.salary_year_avg IS NOT NULL
  AND job_work_from_home = true
ORDER BY 
  a.salary_year_avg DESC
LIMIT 10;
