/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
*/

SELECT s.skills, COUNT(*) AS frequency
FROM skills_dim s
JOIN skills_job_dim sj USING(skill_id)
JOIN job_postings_fact j USING(job_id)
WHERE j.job_title LIKE '%Data Analyst%'
GROUP BY s.skills
ORDER BY frequency DESC
LIMIT 5;
