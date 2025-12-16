/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
*/

SELECT s.skills, AVG(j.salary_year_avg) AS avg_salary
FROM skills_dim s
JOIN skills_job_dim sj USING(skill_id)
JOIN job_postings_fact j USING(job_id)
WHERE j.job_title LIKE '%Data Analyst%' AND j.salary_year_avg IS NOT NULL
GROUP BY s.skills
ORDER BY avg_salary DESC

