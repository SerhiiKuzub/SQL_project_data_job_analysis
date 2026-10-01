-- ============================================================================
-- PROJECT:
-- FILE: 
-- PURPOSE: 
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
-- Approach 2: Concise Aggregation with HAVING clause (Optimized execution)
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
