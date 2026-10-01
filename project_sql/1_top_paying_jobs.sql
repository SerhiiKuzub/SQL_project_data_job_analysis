-- ============================================================================
-- PROJECT: Top-Paying Data Analyst Jobs & Skill Demand Analysis
-- FILE: 1_top_paying_jobs.sql
-- PURPOSE: Identify the top 10 highest-paying remote Data Analyst roles,
--          including company details and salary values.
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
                                KEY INSIGHTS
===============================================================================

--- [ ENGLISH VERSION ] ---

This query retrieves the 10 highest-paying remote Data Analyst roles with non-null salary data.

- Salaries range from $63,782 to $74,835 per year, with an average of about $69,145.
- Delivery Hero has the highest salary in this result set at $74,835, followed by adidas ($73,795) and About You ($72,564).
- Several roles have more specific titles, including Product Data Analyst,
  Business Data Analyst, Data Analyst (Finance), and Data Quality Analyst.
- The results include Full-time, Part-time, and Internship positions.

Note: These results only reflect postings in this dataset that explicitly list an annual salary for remote 'Data Analyst' roles. They should not be generalized to the entire global job market.

--- [ UKRAINIAN VERSION ] ---

Запит вибирає 10 найвище оплачуваних віддалених вакансій Data Analyst із зазначеною річною зарплатою.

- Зарплати у вибраних вакансіях становлять від $63 782 до $74 835 на рік, а середня зарплата — близько $69 145.
- Найвищу компенсацію у цій вибірці має Delivery Hero ($74 835), за ним йдуть adidas ($73 795) та About You ($72 564).
- У ТОП-10 часто трапляються спеціалізовані позиції: Product Data Analyst (adidas, Allianz), Business Data Analyst (About You, Deutsche Bank), Data Analyst (Finance) (Wayfair, HelloFresh) та Data Quality Analyst (Personio, N26).
- До результатів увійшли вакансії з типами зайнятості Full-time, Part-time та Internship.

Примітка: Результати отримано виключно на основі вакансій із цього датасету, які містять вказаний річний дохід для віддалених Data Analyst ролей.
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