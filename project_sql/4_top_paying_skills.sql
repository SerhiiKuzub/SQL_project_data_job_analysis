-- ============================================================================
-- PROJECT:
-- FILE: 
-- PURPOSE: 
-- ============================================================================

SELECT 
    skills_dim.skills AS skill_name,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary_usd
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_postings_fact.job_work_from_home = TRUE 
GROUP BY
    skills_dim.skills
ORDER BY
    avg_salary_usd DESC
LIMIT 25;

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
    "skills": "jira",
    "avg_salary": "43702"
  },
  {
    "skills": "postgresql",
    "avg_salary": "42869"
  },
  {
    "skills": "python",
    "avg_salary": "41905"
  },
  {
    "skills": "confluence",
    "avg_salary": "40890"
  },
  {
    "skills": "git",
    "avg_salary": "40740"
  },
  {
    "skills": "spreadsheet",
    "avg_salary": "40509"
  },
  {
    "skills": "qlik",
    "avg_salary": "40053"
  },
  {
    "skills": "power bi",
    "avg_salary": "37371"
  },
  {
    "skills": "t-sql",
    "avg_salary": "37240"
  },
  {
    "skills": "alteryx",
    "avg_salary": "37131"
  },
  {
    "skills": "excel",
    "avg_salary": "37059"
  },
  {
    "skills": "sql",
    "avg_salary": "36322"
  },
  {
    "skills": "github",
    "avg_salary": "36074"
  },
  {
    "skills": "ms access",
    "avg_salary": "35996"
  },
  {
    "skills": "dax",
    "avg_salary": "35675"
  },
  {
    "skills": "sql server",
    "avg_salary": "35590"
  },
  {
    "skills": "looker",
    "avg_salary": "34875"
  },
  {
    "skills": "r",
    "avg_salary": "34531"
  },
  {
    "skills": "mysql",
    "avg_salary": "33721"
  },
  {
    "skills": "tableau",
    "avg_salary": "33030"
  },
  {
    "skills": "sheets",
    "avg_salary": "32763"
  },
  {
    "skills": "powerpoint",
    "avg_salary": "32040"
  },
  {
    "skills": "sqlite",
    "avg_salary": "29479"
  },
  {
    "skills": "slack",
    "avg_salary": "23523"
  }
]
*/
