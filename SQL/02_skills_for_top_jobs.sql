/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
*/

WITH top_job AS (
    SELECT 
      a.job_id, 
      a.job_title, 
      a.salary_year_avg, 
      b.name AS company_name
    FROM job_postings_fact a
    JOIN company_dim b USING (company_id)
    WHERE 
      a.job_title LIKE '%Data Analyst%'
      AND a.salary_year_avg IS NOT NULL
      AND job_work_from_home = true
    ORDER BY 
      a.salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_job.job_id,
    top_job.job_title,
    top_job.salary_year_avg,
    top_job.company_name,
    string_agg(s.skills, ', ') AS skills_list
FROM top_job
JOIN skills_job_dim sj USING (job_id)
JOIN skills_dim s USING (skill_id)
GROUP BY top_job.job_id, top_job.job_title, top_job.salary_year_avg, top_job.company_name
ORDER BY top_job.salary_year_avg DESC;
