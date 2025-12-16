-- This script truncates all tables and loads CSV data into the database

-- Truncate all tables (CASCADE to handle foreign key dependencies)
TRUNCATE TABLE
    skills_job_dim,
    job_postings_fact,
    skills_dim,
    company_dim
CASCADE;

-- Load skills-job relationships
copy public.skills_job_dim 
FROM 'C:/Users/nnari/Desktop/Data-Analyst-Job-Market-Analysis-2023-SQL/Database/skills_job_dim.csv' 
WITH(
    FORMAT csv, 
    DELIMITER E'\\t', 
    HEADER, 
    ENCODING 'UTF8', 
    QUOTE '\"', 
    ESCAPE ''''
);

-- Load skills information
copy public.skills_dim
 FROM 'C:/Users/nnari/Desktop/Data-Analyst-Job-Market-Analysis-2023-SQL/Database/skills_dim.csv'
  WITH(
    FORMAT csv, 
    DELIMITER E'\\t', 
    HEADER, 
    ENCODING 'UTF8', 
    QUOTE '\"', 
    ESCAPE ''''
);

-- Load job postings
copy public.job_postings_fact
FROM 'C:/Users/nnari/Desktop/Data-Analyst-Job-Market-Analysis-2023-SQL/Database/job_postings_fact.csv' 
WITH(
    FORMAT csv, 
    DELIMITER E'\\t', 
    HEADER, 
    ENCODING 'UTF8', 
    QUOTE '\"', 
    ESCAPE ''''
);

-- Load company information
copy public.company_dim
 FROM 'C:/Users/nnari/Desktop/Data-Analyst-Job-Market-Analysis-2023-SQL/Database/company_dim.csv'
  WITH(
    FORMAT csv, 
    DELIMITER E'\\t', 
    HEADER, 
    ENCODING 'UTF8', 
    QUOTE '\"', 
    ESCAPE ''''
);

-- Check row counts to ensure data loaded successfully
SELECT COUNT(*) FROM company_dim;
SELECT COUNT(*) FROM skills_dim;
SELECT COUNT(*) FROM job_postings_fact;
SELECT COUNT(*) FROM skills_job_dim;