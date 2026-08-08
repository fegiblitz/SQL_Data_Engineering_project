/*
Business Question:
What are the top 10 most in-demand skills for remote Data Engineer roles
located in the United Kingdom?

Objective:
- Identify the skills most frequently requested by employers.
- Focus only on remote Data Engineer job postings.
- Restrict the analysis to opportunities in the United Kingdom.
- Rank skills based on the number of job postings in which they appear.

Business Value:
This analysis helps aspiring Data Engineers understand which technical
skills are most valued in the UK remote job market, enabling them to
prioritize learning and improve their employability.
*/


select
  count(jpf.job_id) as total_jobs,
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
order by total_jobs desc
limit 10;

/*
┌────────────┬────────────┐
│ total_jobs │   skills   │
│   int64    │  varchar   │
├────────────┼────────────┤
│       1394 │ sql        │
│       1281 │ python     │
│        921 │ azure      │
│        807 │ aws        │
│        409 │ spark      │
│        370 │ databricks │
│        317 │ gcp        │
│        301 │ snowflake  │
│        298 │ airflow    │
│        280 │ power bi   │
└────────────┴────────────┘

Key Takeaways:

- SQL and Python are the most in-demand skills for remote Data Engineer roles,
  appearing in 1,394 and 1,281 job postings respectively.

- Cloud platforms are highly valued, with Azure, AWS, and GCP ranking among the
  top skills, showing the importance of cloud expertise in modern data
  engineering.

- Data engineering tools such as Spark, Databricks, Snowflake, and Airflow also
  have strong demand, highlighting the importance of data processing,
  warehousing, and workflow automation skills.

- The results suggest that building a strong foundation in SQL, Python, cloud
  platforms, and data engineering tools can improve employability in the UK
  remote Data Engineer market.
*/

