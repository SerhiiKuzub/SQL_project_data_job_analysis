-- ============================================================================
-- PROJECT:
-- FILE: 
-- PURPOSE: 
-- ============================================================================

SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    company_dim.name AS company_name,
    job_postings_fact.job_location,
    job_postings_fact.job_schedule_type,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_posted_date
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
    "job_id": 1978,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Internship",
    "salary_year_avg": "74835.0",
    "job_posted_date": "2026-08-17 20:50:01",
    "company_name": "Delivery Hero"
  },
  {
    "job_id": 838,
    "job_title": "Product Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "73795.0",
    "job_posted_date": "2026-09-23 22:57:11",
    "company_name": "adidas"
  },
  {
    "job_id": 4027,
    "job_title": "Business Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Part-time",
    "salary_year_avg": "72564.0",
    "job_posted_date": "2026-09-07 02:08:19",
    "company_name": "About You"
  },
  {
    "job_id": 496,
    "job_title": "Business Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Internship",
    "salary_year_avg": "69384.0",
    "job_posted_date": "2026-08-30 09:53:43",
    "company_name": "Deutsche Bank"
  },
  {
    "job_id": 997,
    "job_title": "Data Analyst (Finance)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "68820.0",
    "job_posted_date": "2026-09-18 09:04:24",
    "company_name": "Wayfair Germany"
  },
  {
    "job_id": 1820,
    "job_title": "Product Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Internship",
    "salary_year_avg": "68162.0",
    "job_posted_date": "2026-09-03 07:40:01",
    "company_name": "Allianz"
  },
  {
    "job_id": 2064,
    "job_title": "Data Quality Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Internship",
    "salary_year_avg": "66926.0",
    "job_posted_date": "2026-09-02 04:08:44",
    "company_name": "Personio"
  },
  {
    "job_id": 1834,
    "job_title": "Data Analyst (Finance)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "66629.0",
    "job_posted_date": "2026-09-02 05:39:32",
    "company_name": "HelloFresh"
  },
  {
    "job_id": 2843,
    "job_title": "Business Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Internship",
    "salary_year_avg": "66550.0",
    "job_posted_date": "2026-09-21 08:37:44",
    "company_name": "Vistarion Consulting"
  },
  {
    "job_id": 4740,
    "job_title": "Data Quality Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "63782.0",
    "job_posted_date": "2026-09-23 07:36:56",
    "company_name": "N26"
  }
]
*/