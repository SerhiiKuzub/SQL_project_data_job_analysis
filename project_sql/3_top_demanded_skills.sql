-- ============================================================================
-- PROJECT: Top-Paying Data Analyst Jobs & Skill Demand Analysis
-- FILE: 3_top_demanded_skills.sql
-- PURPOSE: Determine the top 10 most in-demand skills for Data Analysts
--          across all recorded job postings.
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
                                KEY INSIGHTS
===============================================================================

--- [ ENGLISH VERSION ] ---

This query measures overall skill frequency across all 'Data Analyst' postings in the dataset.

- SQL is the most requested skill by a wide margin, appearing in 1,519 postings.
- Python is second with 394 postings, closely followed by T-SQL (378) and R (351).
- Spreadsheets show consistent demand, with Excel and Sheets each listed in 311 postings (622 combined).
- MS Access is listed in 327 postings, and PowerPoint appears in 313 postings.
- Tableau is the most frequently requested BI tool in this result set (306 postings), while DAX appears in 304 postings.

Note: These counts are based solely on job postings where 'job_title_short' is 'Data Analyst' within this dataset.

--- [ UKRAINIAN VERSION ] ---

Запит підраховує загальну частоту згадувань навичок серед усіх вакансій із заголовком 'Data Analyst' у датасеті.

- SQL посідає перше місце за попитом із великим відривом — 1 519 вакансій.
- Python іде другим за частотою (394 вакансії), далі — T-SQL (378) та R (351).
- Електронні таблиці мають стабільний попит: Excel та Sheets присутні у 311 вакансіях кожна (сумарно 622).
- MS Access згадується у 327 вакансіях, а PowerPoint — у 313.
- Tableau є найпопулярнішим окремим BI-інструментом у цьому результаті (306 вакансій), а DAX згадується у 304 вакансіях.

Примітка: Підрахунки виконані виключно для вакансій зі значенням 'Data Analyst' у полі 'job_title_short' у межах цього датасету.
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