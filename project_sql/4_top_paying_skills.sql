-- ============================================================================
-- PROJECT: Top-Paying Data Analyst Jobs & Skill Demand Analysis
-- FILE: 4_top_paying_skills.sql
-- PURPOSE: Identify the highest-paying skills found in remote Data Analyst
--          positions based on average annual salary.
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
                                KEY INSIGHTS
===============================================================================

--- [ ENGLISH VERSION ] ---

This query calculates the average annual salary associated with each skill in remote Data Analyst postings with non-null salary data.

- Jira sits at the top of this result set with an average salary of $43,702, followed by PostgreSQL ($42,869), Python ($41,905), Confluence ($40,890), and Git ($40,740).
- Spreadsheets show an average salary of $40,509 for 'spreadsheet', $37,059 for 'excel', and $32,763 for 'sheets'.
- Among BI tools, Qlik averages $40,053, Power BI averages $37,371, Looker averages $34,875, and Tableau averages $33,030.
- SQL-related skills include T-SQL ($37,240), SQL ($36,322), SQL Server ($35,590), MySQL ($33,721), and SQLite ($29,479).
- R averages $34,531, while Slack records the lowest average in this top-25 list at $23,523.

Note: Average salaries reflect only remote Data Analyst postings in this dataset that contain explicitly reported salary values.

--- [ UKRAINIAN VERSION ] ---

Запит розраховує середню річну заробітну плату для кожної навички серед віддалених вакансій Data Analyst із вказаним рівнем оплати.

- Найвища середня зарплата в цьому списку у Jira ($43 702), далі йдуть PostgreSQL ($42 869), Python ($41 905), Confluence ($40 890) та Git ($40 740).
- Електронні таблиці демонструють наступні значення: 'spreadsheet' — $40 509, 'excel' — $37 059, 'sheets' — $32 763.
- Серед BI-інструментів Qlik має середню зарплату $40 053, Power BI — $37 371, Looker — $34 875, Tableau — $33 030.
- Середній рівень для SQL та СУБД складає: T-SQL ($37 240), SQL ($36 322), SQL Server ($35 590), MySQL ($33 721) та SQLite ($29 479).
- R показує середнє значення $34 531, а Slack замикає топ-25 із показником $23 523.

Примітка: Середні значення розраховані виключно на основі віддалених вакансій із заголовком 'Data Analyst' у цьому датасеті, для яких було явно вказано річну заробітну плату.
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