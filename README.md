# Data Analyst Job Market: SQL Analysis

I wanted to know what a data analyst job in Ukraine and nearby Europe asks for: which skills show up everywhere, which ones come with higher pay, and where those two overlap. So I built a dataset of job postings, loaded it into PostgreSQL and answered five questions with plain SQL, no BI tools and no pandas.

This is my first portfolio project. The dataset is partly AI-generated (details in the Data section), and the project has other flaws too. I list them at the bottom instead of hiding them. The point of the project is the method: schema, loading, joins, aggregations and checking my own results.

## Questions

1. What are the top-paying remote Data Analyst jobs?
2. What skills do those jobs ask for?
3. Which skills are the most in demand?
4. Which skills come with the highest average salary?
5. Which skills are worth learning first (demand and pay together)?

Each question is one file in `project_sql/`: the query, a short write-up in English and Ukrainian, and the raw output at the bottom.

## Data

I could not find a ready-made dataset for Ukraine and nearby countries, so I built one with Claude (an AI assistant). I asked it to cover the Ukrainian, German and Polish markets, with the job boards that are used there (Djinni, Rabota.ua, Pracuj.pl, StepStone, LinkedIn and others), and I allowed it to generate part of the records to fill the gaps.

What that means for you as a reader:

- **This is not a clean scrape of real postings.** Part of the data is generated, and I cannot say exactly which rows. Treat every number below as a result for this dataset, not as a fact about the job market.
- The structure follows the well-known four-table job postings schema, so the same queries should run on a real dataset without changes. That is the plan for version 2.

What is in it:

- 5,000 postings dated 15 Aug to 25 Sep 2026, in three countries: Ukraine, Germany, Poland
- 1,652 of them are `Data Analyst` postings, and only 376 of those list a salary
- 133 companies, 259 skills

Four tables: `job_postings_fact`, `company_dim`, `skills_dim` and `skills_job_dim` (a link table between jobs and skills). The CSV files are in [`csv_files/`](csv_files/), about 1.4 MB in total, so you can clone the repo and load them right away.

## Repository

```
csv_files/                  the four CSV files
sql_load/
  1_create_database.sql     creates the data_job database
  2_create_tables.sql       tables and keys
  3_load_data.sql           loads the CSV files
project_sql/
  1_top_paying_jobs.sql
  2_top_paying_job_skills.sql
  3_top_demanded_skills.sql
  4_top_paying_skills.sql
  5_optimal_skills.sql
```

## How to run

1. Install PostgreSQL and clone this repo.
2. Run the scripts from `sql_load/` in order.
3. Check the paths in `3_load_data.sql`. `COPY` is read by the database server, so the path must point to the CSV files in a place PostgreSQL can reach. If the load fails, use absolute paths.
4. Run any query from `project_sql/`.

## Findings

**1. Top-paying remote jobs.** The ten best-paid postings run from $63,782 to $74,835 a year, about $69,145 on average. Delivery Hero is first ($74,835), then adidas ($73,795) and About You ($72,564). Look at the job types though: five of the ten are internships and one is part-time. I would not read this list as "what a good analyst earns".

**2. Skills behind those jobs.** SQL is in all 10. Python is in 5, R in 3, T-SQL in 3, PostgreSQL in 3. Spreadsheets appear in 4 (3 as `spreadsheet`, 1 as `sheets`). Looker and Alteryx show up twice each.

**3. Most in-demand skills.** Across all Data Analyst postings, SQL has 1,519 mentions. Python is next with 394, then T-SQL (378), R (351) and MS Access (327). After SQL the gap closes fast: places 2 to 10 sit between 304 and 394, and Excel, Sheets, PowerPoint, Tableau and DAX are all about 300.

**4. Skills and salary.** Highest averages: Jira ($43,702), PostgreSQL ($42,869), Python ($41,905), Confluence ($40,890), Git ($40,740). Slack is last in the top 25 at $23,523. This query has no minimum number of postings, so tools like Jira and Confluence are probably averages over a handful of jobs. Query 5 fixes that.

**5. What to learn first.** Skills with at least 11 postings (remote, salary listed):

| Skill | Postings | Avg salary |
|---|---|---|
| PostgreSQL | 13 | $42,869 |
| Python | 31 | $41,905 |
| Spreadsheet | 23 | $40,509 |
| Qlik | 19 | $40,053 |
| Power BI | 23 | $37,371 |
| T-SQL | 31 | $37,240 |
| SQL | 107 | $36,322 |
| Tableau | 21 | $33,030 |

SQL is the baseline: by far the most postings, with pay close to the middle. Python and PostgreSQL are where the average goes up. Among BI tools, Power BI and Qlik come out ahead of Tableau in this data. My order: SQL and Excel first, then Python and PostgreSQL, then one BI tool.

## What I got wrong

- **"Remote" means two different things in this project.** Queries 1 and 2 filter `job_location = 'Anywhere'`, queries 4 and 5 use `job_work_from_home = TRUE`. I found this late and checked it with a small query (it is at the bottom of `4_top_paying_skills.sql`): among Data Analyst postings, 218 are `Anywhere`, 287 more have the home-office flag but a specific city, and 1,147 are neither. So queries 1 and 2 only see 218 of the 505 remote postings, and their top 10 would probably change with the wider filter. I left it as is. Fixing it is the first thing I would do in version 2.
- **Query 3 counts every Data Analyst posting,** not only remote ones with a salary. Its numbers are not comparable to queries 4 and 5.
- **Few postings list a salary,** so the samples are small (13 to 107 per skill in query 5).
- **A posting with ten skills counts toward all ten averages.** The skill averages overlap and do not isolate the effect of one skill.
- **The salary field looks unreliable.** Internships in the top 10 is the clearest sign, and generated values are the likely reason.
- **Part of the data is generated** (see Data), and the period is only about six weeks. None of this should be generalized to the real market.

## What I took from it

- Joining through a link table (`skills_job_dim`) and keeping the counts straight.
- Writing query 5 two ways, with CTEs and with `HAVING`, and getting the same result.
- Checking my own conclusions against the output. Writing "top paying" in a title does not make the list reliable.
- Building a dataset and writing down where it is weak, before anyone asks.

## Next version

- Replace the dataset with a larger, fully real one and rerun the same queries.
- Use one definition of "remote" in all five queries and rerun them.
- Add visualizations in Power BI or Python.

## Contact

Serhii Kuzub
- LinkedIn: [https://www.linkedin.com/in/serhii-kuzub/](https://www.linkedin.com/in/serhii-kuzub/)
- Telegram: [https://t.me/serhiikuzub](https://t.me/serhiikuzub)