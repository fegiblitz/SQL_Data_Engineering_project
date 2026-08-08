/*
Business Question:
Which skills provide the best balance between market demand and salary for
remote Data Engineer roles?

Objectives:
- Identify skills that are both highly demanded and well paid.
- Calculate the median salary for each skill to represent typical earning
  potential.
- Measure market demand by counting the number of job postings for each skill.
- Apply a logarithmic transformation to job demand to reduce the influence of
  extremely common skills.
- Create an optimal score that combines salary and demand, allowing skills to
  be ranked based on their overall career value.

Business Value:
This analysis helps identify the most strategic skills to learn by considering
both earning potential and job availability, rather than focusing on salary or
demand alone.
*/

select
  -- count(jpf.*) as total_jobs,
  round
   (median(jpf.salary_year_avg ),0)as median_salary,
  sd.skills,
  round (
    LN(count(jpf.*)),1
    ) as log_total_jobs,
  round (
    median(jpf.salary_year_avg ) * LN(count(jpf.*))/1_000_000,2
    ) as optimal_score
from skills_dim as sd 
inner join skills_job_dim as sjd 
on sd.skill_id=sjd.skill_id
inner join job_postings_fact as jpf
on sjd.job_id=jpf.job_id
where jpf.job_title_short='Data Engineer'
and jpf.job_work_from_home=True
and jpf.salary_year_avg is not null
group by sd.skills
having  count(jpf.job_id)>100
order by optimal_score desc
limit 10;

/*

┌───────────────┬───────────┬────────────────┬───────────────┐
│ median_salary │  skills   │ log_total_jobs │ optimal_score │
│    double     │  varchar  │     double     │    double     │
├───────────────┼───────────┼────────────────┼───────────────┤
│      184000.0 │ terraform │            5.3 │          0.97 │
│      135000.0 │ python    │            7.0 │          0.95 │
│      130000.0 │ sql       │            7.0 │          0.91 │
│      137320.0 │ aws       │            6.7 │          0.91 │
│      150000.0 │ airflow   │            6.0 │          0.89 │
│      140000.0 │ spark     │            6.2 │          0.87 │
│      145000.0 │ kafka     │            5.7 │          0.82 │
│      135500.0 │ snowflake │            6.1 │          0.82 │
│      128000.0 │ azure     │            6.2 │          0.79 │
│      135000.0 │ java      │            5.7 │          0.77 │


Key Takeaways:

- Terraform achieved the highest optimal score, driven by the highest median
  salary while maintaining strong market demand.

- Python and SQL remain among the most valuable skills, combining high salaries
  with the strongest job demand, making them essential for aspiring Data
  Engineers.

- Cloud and big data technologies such as AWS, Spark, Snowflake, Azure, and
  Kafka continue to rank highly, reinforcing their importance in modern data
  engineering roles.

- Overall, the optimal score shows that the most valuable skills are those that
  balance competitive salaries with consistent demand in the job market.
*/