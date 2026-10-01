-- ============================================================================
-- PROJECT:
-- FILE: 
-- PURPOSE: 
-- ============================================================================

WITH top_paying_jobs AS (
    SELECT
        job_postings_fact.job_id,
        job_postings_fact.job_title,
        job_postings_fact.salary_year_avg,
        company_dim.name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim 
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' 
        AND job_postings_fact.job_location = 'Anywhere' 
        AND job_postings_fact.salary_year_avg IS NOT NULL
    ORDER BY 
        job_postings_fact.salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.job_id,
    top_paying_jobs.job_title,
    top_paying_jobs.company_name,
    top_paying_jobs.salary_year_avg,
    skills_dim.skills AS skill_name
FROM top_paying_jobs
INNER JOIN skills_job_dim 
    ON top_paying_jobs.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    top_paying_jobs.salary_year_avg DESC;

/*
===============================================================================
                               KEY INSIGHTS & FINDINGS
===============================================================================

--- [ ENGLISH VERSION ] ---

### Executive Summary


--- [ UKRAINIAN VERSION / УКРАЇНСЬКА ВЕРСІЯ ] ---

### Основні результати

===============================================================================
*/


/*
[
  {
    "job_id": 1978,
    "job_title": "Data Analyst",
    "salary_year_avg": "74835.0",
    "company_name": "Delivery Hero",
    "skills": "sql"
  },
  {
    "job_id": 1978,
    "job_title": "Data Analyst",
    "salary_year_avg": "74835.0",
    "company_name": "Delivery Hero",
    "skills": "r"
  },
  {
    "job_id": 1978,
    "job_title": "Data Analyst",
    "salary_year_avg": "74835.0",
    "company_name": "Delivery Hero",
    "skills": "t-sql"
  },
  {
    "job_id": 1978,
    "job_title": "Data Analyst",
    "salary_year_avg": "74835.0",
    "company_name": "Delivery Hero",
    "skills": "sqlite"
  },
  {
    "job_id": 1978,
    "job_title": "Data Analyst",
    "salary_year_avg": "74835.0",
    "company_name": "Delivery Hero",
    "skills": "looker"
  },
  {
    "job_id": 1978,
    "job_title": "Data Analyst",
    "salary_year_avg": "74835.0",
    "company_name": "Delivery Hero",
    "skills": "sheets"
  },
  {
    "job_id": 838,
    "job_title": "Product Data Analyst",
    "salary_year_avg": "73795.0",
    "company_name": "adidas",
    "skills": "sql"
  },
  {
    "job_id": 838,
    "job_title": "Product Data Analyst",
    "salary_year_avg": "73795.0",
    "company_name": "adidas",
    "skills": "python"
  },
  {
    "job_id": 838,
    "job_title": "Product Data Analyst",
    "salary_year_avg": "73795.0",
    "company_name": "adidas",
    "skills": "t-sql"
  },
  {
    "job_id": 838,
    "job_title": "Product Data Analyst",
    "salary_year_avg": "73795.0",
    "company_name": "adidas",
    "skills": "postgresql"
  },
  {
    "job_id": 838,
    "job_title": "Product Data Analyst",
    "salary_year_avg": "73795.0",
    "company_name": "adidas",
    "skills": "dax"
  },
  {
    "job_id": 838,
    "job_title": "Product Data Analyst",
    "salary_year_avg": "73795.0",
    "company_name": "adidas",
    "skills": "spreadsheet"
  },
  {
    "job_id": 838,
    "job_title": "Product Data Analyst",
    "salary_year_avg": "73795.0",
    "company_name": "adidas",
    "skills": "jira"
  },
  {
    "job_id": 4027,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "72564.0",
    "company_name": "About You",
    "skills": "sql"
  },
  {
    "job_id": 4027,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "72564.0",
    "company_name": "About You",
    "skills": "spreadsheet"
  },
  {
    "job_id": 4027,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "72564.0",
    "company_name": "About You",
    "skills": "alteryx"
  },
  {
    "job_id": 4027,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "72564.0",
    "company_name": "About You",
    "skills": "git"
  },
  {
    "job_id": 496,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "69384.0",
    "company_name": "Deutsche Bank",
    "skills": "sql"
  },
  {
    "job_id": 496,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "69384.0",
    "company_name": "Deutsche Bank",
    "skills": "postgresql"
  },
  {
    "job_id": 496,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "69384.0",
    "company_name": "Deutsche Bank",
    "skills": "spreadsheet"
  },
  {
    "job_id": 997,
    "job_title": "Data Analyst (Finance)",
    "salary_year_avg": "68820.0",
    "company_name": "Wayfair Germany",
    "skills": "sql"
  },
  {
    "job_id": 997,
    "job_title": "Data Analyst (Finance)",
    "salary_year_avg": "68820.0",
    "company_name": "Wayfair Germany",
    "skills": "python"
  },
  {
    "job_id": 997,
    "job_title": "Data Analyst (Finance)",
    "salary_year_avg": "68820.0",
    "company_name": "Wayfair Germany",
    "skills": "r"
  },
  {
    "job_id": 997,
    "job_title": "Data Analyst (Finance)",
    "salary_year_avg": "68820.0",
    "company_name": "Wayfair Germany",
    "skills": "sql server"
  },
  {
    "job_id": 997,
    "job_title": "Data Analyst (Finance)",
    "salary_year_avg": "68820.0",
    "company_name": "Wayfair Germany",
    "skills": "qlik"
  },
  {
    "job_id": 997,
    "job_title": "Data Analyst (Finance)",
    "salary_year_avg": "68820.0",
    "company_name": "Wayfair Germany",
    "skills": "alteryx"
  },
  {
    "job_id": 1820,
    "job_title": "Product Data Analyst",
    "salary_year_avg": "68162.0",
    "company_name": "Allianz",
    "skills": "sql"
  },
  {
    "job_id": 1820,
    "job_title": "Product Data Analyst",
    "salary_year_avg": "68162.0",
    "company_name": "Allianz",
    "skills": "ms access"
  },
  {
    "job_id": 2064,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "66926.0",
    "company_name": "Personio",
    "skills": "sql"
  },
  {
    "job_id": 2064,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "66926.0",
    "company_name": "Personio",
    "skills": "python"
  },
  {
    "job_id": 2064,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "66926.0",
    "company_name": "Personio",
    "skills": "mysql"
  },
  {
    "job_id": 2064,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "66926.0",
    "company_name": "Personio",
    "skills": "powerpoint"
  },
  {
    "job_id": 1834,
    "job_title": "Data Analyst (Finance)",
    "salary_year_avg": "66629.0",
    "company_name": "HelloFresh",
    "skills": "sql"
  },
  {
    "job_id": 1834,
    "job_title": "Data Analyst (Finance)",
    "salary_year_avg": "66629.0",
    "company_name": "HelloFresh",
    "skills": "r"
  },
  {
    "job_id": 1834,
    "job_title": "Data Analyst (Finance)",
    "salary_year_avg": "66629.0",
    "company_name": "HelloFresh",
    "skills": "t-sql"
  },
  {
    "job_id": 1834,
    "job_title": "Data Analyst (Finance)",
    "salary_year_avg": "66629.0",
    "company_name": "HelloFresh",
    "skills": "powerpoint"
  },
  {
    "job_id": 2843,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "66550.0",
    "company_name": "Vistarion Consulting",
    "skills": "sql"
  },
  {
    "job_id": 2843,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "66550.0",
    "company_name": "Vistarion Consulting",
    "skills": "python"
  },
  {
    "job_id": 2843,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "66550.0",
    "company_name": "Vistarion Consulting",
    "skills": "ms access"
  },
  {
    "job_id": 4740,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "63782.0",
    "company_name": "N26",
    "skills": "sql"
  },
  {
    "job_id": 4740,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "63782.0",
    "company_name": "N26",
    "skills": "python"
  },
  {
    "job_id": 4740,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "63782.0",
    "company_name": "N26",
    "skills": "postgresql"
  },
  {
    "job_id": 4740,
    "job_title": "Data Quality Analyst",
    "salary_year_avg": "63782.0",
    "company_name": "N26",
    "skills": "looker"
  }
]
*/