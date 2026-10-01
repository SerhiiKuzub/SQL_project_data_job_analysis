-- ============================================================================
-- PROJECT:
-- FILE: 
-- PURPOSE: 
-- ============================================================================

SELECT 
    skills_dim.skills AS skill_name,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skills
ORDER BY 
    demand_count DESC
LIMIT 10;

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
    "skills": "sql",
    "demand_count": "1519"
  },
  {
    "skills": "python",
    "demand_count": "394"
  },
  {
    "skills": "t-sql",
    "demand_count": "378"
  },
  {
    "skills": "r",
    "demand_count": "351"
  },
  {
    "skills": "ms access",
    "demand_count": "327"
  },
  {
    "skills": "powerpoint",
    "demand_count": "313"
  },
  {
    "skills": "sheets",
    "demand_count": "311"
  },
  {
    "skills": "excel",
    "demand_count": "311"
  },
  {
    "skills": "tableau",
    "demand_count": "306"
  },
  {
    "skills": "dax",
    "demand_count": "304"
  }
]
*/
