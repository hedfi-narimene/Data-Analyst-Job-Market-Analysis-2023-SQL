-- This script creates all necessary tables for the Data Analyst Job Market project

-- Drop tables if they exist to avoid conflicts
DROP TABLE IF EXISTS skills_job_dim;
DROP TABLE IF EXISTS job_postings_fact;
DROP TABLE IF EXISTS skills_dim;
DROP TABLE IF EXISTS company_dim;

-- Table for storing company information
CREATE TABLE company_dim (
    company_id INT PRIMARY KEY,
    name VARCHAR(255),
    link VARCHAR(255),
    link_google VARCHAR(500),
    thumbnail VARCHAR(500)
);

-- Table for storing skills information
CREATE TABLE skills_dim (
    skill_id INT PRIMARY KEY,
    skills VARCHAR(255),
    type VARCHAR(255)
    
);

-- Table for storing job postings facts
CREATE TABLE job_postings_fact (
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR(100),
    job_title VARCHAR(255),
    job_location VARCHAR(255),
    job_via VARCHAR(100),
    job_schedule_type VARCHAR(100),
    job_work_from_home BOOLEAN,
    search_location VARCHAR(100),
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country VARCHAR(100),
    salary_rate VARCHAR(20),
    salary_year_avg NUMERIC(10,2),
    salary_hour_avg NUMERIC(10,2),
    -- Foreign key linking to company
    CONSTRAINT fk_company
        FOREIGN KEY (company_id)
        REFERENCES company_dim(company_id)
);

-- Table for linking jobs with required skills
CREATE TABLE skills_job_dim (
    job_id INT NOT NULL,
    skill_id INT NOT NULL,
    -- Foreign keys linking to job_postings_fact and skills_dim
    CONSTRAINT fk_job
        FOREIGN KEY (job_id)
        REFERENCES job_postings_fact(job_id),
    CONSTRAINT fk_skill
        FOREIGN KEY (skill_id)
        REFERENCES skills_dim(skill_id)
);