-- ============================================================================
-- PROJECT: Top-Paying Data Analyst Jobs & Skill Demand Analysis
-- FILE: 5_optimal_skills.sql
-- PURPOSE: Compare skill demand and average salaries for Data Analyst roles.
-- ============================================================================

-- Approach 1: CTE-based query (Modular and easy to extend)
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills AS skill_name,
        COUNT(skills_job_dim.job_id) AS demand_count
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
        skills_dim.skill_id,
        skills_dim.skills
), 
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary_usd
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
        AND job_postings_fact.job_work_from_home = TRUE 
    GROUP BY
        skills_job_dim.skill_id
)
SELECT
    skills_demand.skill_id,
    skills_demand.skill_name,
    skills_demand.demand_count,
    average_salary.avg_salary_usd
FROM
    skills_demand
INNER JOIN average_salary 
    ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    skills_demand.demand_count > 10
ORDER BY
    average_salary.avg_salary_usd DESC,
    skills_demand.demand_count DESC
LIMIT 25;

-- ----------------------------------------------------------------------------
-- Approach 2: Simpler aggregation using HAVING
-- ----------------------------------------------------------------------------
SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    COUNT(skills_job_dim.job_id) AS demand_count,
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
    skills_dim.skill_id,
    skills_dim.skills
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary_usd DESC,
    demand_count DESC
LIMIT 25;

/*
===============================================================================
                                KEY INSIGHTS
===============================================================================

--- [ ENGLISH VERSION ] ---

### Key Findings
By filtering for remote Data Analyst roles with salary data and high demand (>10 postings), this analysis identifies the skills offering the strongest balance of job market availability and high compensation:

1. High Demand & Strong Pay:
   - SQL: Top volume leader (107 postings, ~$36.3k avg) — essential baseline for the role.
   - Python & R: Python leads among general-purpose languages with higher average pay ($41.9k vs $34.5k for R).
   - T-SQL: Strong demand (31 postings) and solid pay ($37.2k) for MS SQL Server environments.

2. High-Paying Specialized Tools:
   - PostgreSQL: Highest average salary ($42.8k) among skills meeting the threshold (>10 roles).
   - Qlik & Power BI: Outpace Tableau in average compensation ($40k and $37.3k vs $33k).

3. Data Processing & Automation:
   - Excel & Alteryx: Demonstrate that spreadsheet skills and ETL/automation tools remain highly rewarded ($37k+ avg).

--- [ UKRAINIAN VERSION ] ---

### Основні висновки
Аналіз віддалених вакансій Data Analyst із вказаною зарплатою та попитом понад 10 оголошень показує навички з найкращим співвідношенням затребуваності та рівня доходу:

1. Високий попит та стабільний дохід:
   - SQL: Беззаперечний лідер за обсягом (107 вакансій, середня ЗП ~$36.3k) — базовий орієнтир для позиції.
   - Python та R: Python переважає за рівнем оплати ($41.9k проти $34.5k у R) при високому попиті (31 вакансія).
   - T-SQL: Висока цінність спеціалізації під MS SQL Server (31 вакансія, $37.2k).

2. Нішеві інструменти з підвищеною оплатою:
   - PostgreSQL: Найвища середня зарплата ($42.8k) серед навичок з попитом >10 вакансій.
   - Qlik та Power BI: Показують вищу середню ЗП порівняно з Tableau ($40k і $37.3k проти $33k).

3. Обробка даних та автоматизація:
   - Excel та Alteryx: Підтверджують, що табличні інструменти та ETL-автоматизація зберігають високу цінність для роботодавців ($37k+).

### Оптимальний порядок вивчення (Suggested Roadmap):
1. База: SQL + Excel / Google Sheets
2. Просунута аналітика: Python + PostgreSQL / T-SQL
3. BI та автоматизація: Power BI (DAX) / Qlik + Alteryx
===============================================================================
*/


/*
[
  {
    "skill_id": 57,
    "skills": "postgresql",
    "demand_count": "13",
    "avg_salary": "42869"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "31",
    "avg_salary": "41905"
  },
  {
    "skill_id": 190,
    "skills": "spreadsheet",
    "demand_count": "23",
    "avg_salary": "40509"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "19",
    "avg_salary": "40053"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "23",
    "avg_salary": "37371"
  },
  {
    "skill_id": 16,
    "skills": "t-sql",
    "demand_count": "31",
    "avg_salary": "37240"
  },
  {
    "skill_id": 201,
    "skills": "alteryx",
    "demand_count": "26",
    "avg_salary": "37131"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "23",
    "avg_salary": "37059"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "107",
    "avg_salary": "36322"
  },
  {
    "skill_id": 202,
    "skills": "ms access",
    "demand_count": "21",
    "avg_salary": "35996"
  },
  {
    "skill_id": 184,
    "skills": "dax",
    "demand_count": "22",
    "avg_salary": "35675"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "13",
    "avg_salary": "35590"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "19",
    "avg_salary": "34875"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "35",
    "avg_salary": "34531"
  },
  {
    "skill_id": 56,
    "skills": "mysql",
    "demand_count": "17",
    "avg_salary": "33721"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "21",
    "avg_salary": "33030"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "22",
    "avg_salary": "32763"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "21",
    "avg_salary": "32040"
  },
  {
    "skill_id": 70,
    "skills": "sqlite",
    "demand_count": "15",
    "avg_salary": "29479"
  }
]
*/
