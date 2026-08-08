/*
Business Question:
Which skills offer the best combination of high demand and high median salary
for remote Data Engineer roles in the United Kingdom?

Objectives:
- Identify the most valuable technical skills based on salary and demand.
- Calculate the median annual salary for each skill to represent the typical
  earning potential.
- Count the number of job postings requiring each skill.
- Filter out skills with fewer than 100 job postings to focus on widely
  sought-after technologies.
- Rank the remaining skills by median salary to highlight the highest-paying,
  in-demand skills.

Business Value:
This analysis helps job seekers, career changers, and learning professionals
prioritize skills that not only command competitive salaries but also appear
frequently in the UK remote job market. Using the median salary provides a
more reliable measure of typical earnings by reducing the influence of
extremely high or low salary outliers.
*/

select
  count(jpf.job_id) as total_jobs,
  round
   (median(jpf.salary_year_avg ),0)as median_salary,
  sd.skills
from skills_dim as sd 
inner join skills_job_dim as sjd 
on sd.skill_id=sjd.skill_id
inner join job_postings_fact as jpf
on sjd.job_id=jpf.job_id
where jpf.job_title_short='Data Engineer'
and jpf.job_work_from_home=True
and jpf.job_country='United Kingdom'
group by sd.skills
having  count(jpf.job_id)>100
order by  median_salary desc
limit 10;

/*
│ total_jobs │ median_salary │   skills   │
│   int64    │    double     │  varchar   │
├────────────┼───────────────┼────────────┤
│        187 │      135000.0 │ terraform  │
│        179 │      135000.0 │ sql server │
│        144 │      135000.0 │ go         │
│        149 │      135000.0 │ bigquery   │
│        301 │      134825.0 │ snowflake  │
│        151 │      131575.0 │ kubernetes │
│        921 │      131575.0 │ azure      │
│        195 │      131575.0 │ scala      │
│        317 │      131575.0 │ gcp        │
│        235 │      128150.0 │ java       │
└────────────┴───────────────┴────────────┘

Key Takeaways:

- Cloud and data platform skills dominate the highest-paying Data Engineer roles,
  with Azure, Snowflake, GCP, and BigQuery appearing among the top skills.

- Terraform achieved the highest median salary ($135,000), showing the value of
  infrastructure automation skills in the market.

- Azure had the highest demand with 921 job postings while maintaining a strong
  median salary ($131,575), highlighting its importance in UK remote Data
  Engineering roles.

- The results suggest that combining cloud, data warehousing, and programming
  skills can improve career opportunities and earning potential.
  */