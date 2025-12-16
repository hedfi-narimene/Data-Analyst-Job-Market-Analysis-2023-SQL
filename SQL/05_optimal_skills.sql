/*
Question: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
*/

WITH skill_stats AS (
    SELECT 
        s.skills,
        COUNT(*) AS demand_count,
        AVG(j.salary_year_avg) AS avg_salary
    FROM skills_dim s
    JOIN skills_job_dim sj USING(skill_id)
    JOIN job_postings_fact j USING(job_id)
    WHERE j.job_title LIKE '%Data Analyst%'
      AND j.salary_year_avg IS NOT NULL
      AND j.job_work_from_home = true
    GROUP BY s.skills
)
SELECT *, (demand_count * avg_salary) AS score
FROM skill_stats
ORDER BY score DESC
LIMIT 10;

