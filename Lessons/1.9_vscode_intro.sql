SELECT * 
from information_schema.tables
where table_catalog ='data_jobs';

select cd.name,jpf.job_title_short, 
jpf.job_country, jpf.salary_year_avg,jpf.search_location,
jpf.job_location 
from job_postings_fact as jpf
left join company_dim as cd
on jpf.company_id =cd.company_id
where jpf.salary_year_avg >= 200_000
order by jpf.salary_year_avg desc
limit 100;

select cd.name,
jpf.job_title_short,
jpf.salary_year_avg,
jpf.job_country,
jpf.job_location 
from job_postings_fact as jpf
left join company_dim as cd
on jpf.company_id =cd.company_id
where jpf.job_title_short like '%Data Engineer%' and 
jpf.salary_year_avg >= 150000
order by jpf.salary_year_avg desc
limit 10;

SELECT
    cd.name,
    jpf.job_title_short,
    jpf.salary_year_avg,
    jpf.job_location,
    jpf.search_location
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = TRUE
  AND jpf.salary_year_avg IS NOT NULL
ORDER BY jpf.salary_year_avg DESC
LIMIT 10;

#task 2
select 
cd.name,
count(jpf.job_id) as total_postings,
from job_postings_fact as jpf
left join company_dim as cd
on jpf.company_id=cd.company_id
group by cd.name
order by total_postings desc
limit 10;

#task3

select
job_title_short, 
round(avg(salary_year_avg),2) as AVG_sal
from job_postings_fact
where salary_year_avg is not null
group by  all
order by AVG_sal desc
limit 10;

#task4
select
cd.name as company_name,
count(jpf.job_id) as total_postings
from job_postings_fact as jpf
left join company_dim as cd
on jpf.company_id=cd.company_id
group by company_name
having total_postings >=100
order by total_postings desc
limit 10;

#task 5
select
sd.skills, 
count(sjd.job_id) as total_postings
from skills_dim as sd
left join  skills_job_dim as sjd
on sd.skill_id=sjd.skill_id
group by all
order by total_postings desc
limit 10;

#task 6
select
sd.skills,
round(avg(jpf.salary_year_avg),2) as AVG_sal
from skills_dim as sd
left join skills_job_dim as sjd
on sd.skill_id=sjd.skill_id
left join job_postings_fact as jpf
on sjd.job_id= jpf.job_id
where jpf.salary_year_avg is not null
group by all
order by AVG_sal desc
limit 10;

#task7
SELECT
    cd.name
FROM company_dim AS cd
LEFT JOIN job_postings_fact AS jpf
    ON cd.company_id = jpf.company_id
WHERE jpf.job_id IS NULL;


#task8
select
job_country,
count(job_id) as total_postings,
round(avg(salary_year_avg),2) as AVG_sal
from job_postings_fact
where  salary_year_avg is not null
group by all
order by total_postings desc
limit 10;

#task9
select
cd.name as company_name,
round(avg(jpf.salary_year_avg),2)as AVG_sal,
count(jpf.job_id) as total_postings
from job_postings_fact as jpf
left join company_dim as cd
on jpf.company_id=cd.company_id
group by company_name
having total_postings >=5
order by AVG_sal desc
limit 10;

#task 10

select
sd.skills as skills,
count(jpf.job_id) as total_postings
from skills_dim as sd
left join skills_job_dim as sjd
on sd.skill_id=sjd.skill_id
left join job_postings_fact as jpf
on sjd.job_id=jpf.job_id
where jpf.job_title_short like '%Data Engineer%'
group by skills
order by total_postings desc
limit 10;

SELECT *
FROM information_schema.columns
WHERE table_name = 'patient_encounters';
