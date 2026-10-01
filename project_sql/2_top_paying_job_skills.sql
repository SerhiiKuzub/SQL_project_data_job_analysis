-- ============================================================================
-- PROJECT: Top-Paying Data Analyst Jobs & Skill Demand Analysis
-- FILE: 2_top_paying_job_skills.sql
-- PURPOSE: Identify technical skill requirements for the top 10 highest-paying 
--          remote Data Analyst roles.
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
                                KEY INSIGHTS
===============================================================================

--- [ ENGLISH VERSION ] ---

This query maps technical skills to the 10 highest-paying remote Data Analyst postings identified in query 1.

- SQL is requested in all 10 postings (100% frequency).
- Python appears in 5 of the 10 postings (50%), while R appears in 3 postings (30%).
- Relational database dialects listed include PostgreSQL (3 postings), T-SQL (3 postings), MySQL (1 posting), and SQL Server (1 posting).
- Spreadsheets (listed as 'spreadsheet' or 'sheets') appear in 4 postings combined.
- BI and reporting tools in this result set include Looker (2 postings), Qlik (1 posting), and DAX (1 posting).
- Alteryx appears in 2 postings.

Note: These proportions are calculated strictly on the sample of 10 top-paying postings in this dataset and are not representative of skill frequency across the entire market.

--- [ UKRAINIAN VERSION ] ---

Запит виводить технічні навички, вказані у 10 найвище оплачуваних віддалених вакансіях для Data Analyst.

- SQL згадується в усіх 10 вакансіях (100% покриття у цій вибірці).
- Python присутній у 5 з 10 вакансій (50%), а R — у 3 вакансіях (30%).
- Серед діалектів та СУБД у списку є PostgreSQL (3 вакансії), T-SQL (3 вакансії), MySQL (1 вакансія) та SQL Server (1 вакансія).
- Електронні таблиці (зафіксовані як 'spreadsheet' або 'sheets') зустрічаються у 4 вакансіях сумарно.
- Інструменти аналітики та візуалізації включають Looker (2 вакансії), Qlik (1 вакансія) та DAX (1 вакансія).
- Alteryx згадується у 2 вакансіях.

Примітка: Ці частки розраховані виключно на малій вибірці з 10 найвище оплачуваних вакансій цього датасету і не відображають загальну частоту вимог на всьому ринку праці.
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