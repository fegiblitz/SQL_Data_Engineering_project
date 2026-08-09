# Exploratory Data Analysis with SQL: Job Market Analysis

![photo](../Images/1_1_Project1_EDA.png)  

This SQL exploratory data analysis examines the UK Data Engineering job market, focusing on skill demand, salary trends, and optimal skills for remote Data Engineer roles Using real world job posting data.
**It demonstrates my ability to write analytical SQL, work with relational datasets, perform exploratory analysis, and translate data into actionable business insights.**

## Executive Summary

* **✅Project Scope:** Analysed UK remote Data Engineering job postings to understand skill demand and salary trends.
* **✅Data Modelling:** Worked across related fact and dimension tables using SQL joins to connect job postings, companies, and skills.
* **✅Analytics:** Used SQL aggregations, filtering, grouping, median salary analysis, and a custom optimal-skill score to evaluate demand versus earning potential.
* **✅Outcomes:** Identified the most in-demand and valuable Data Engineering skills, providing practical insights into career opportunities.
* **✅Insights:** Found strong demand for SQL, Python, and cloud technologies, while skills such as Terraform, AWS, and Airflow demonstrated strong earning potential.

If you've got a minute, review these:  
[`01_top_demanded_skills.sql`](01_top_demanded_skills.sql) -Demand analysis with multi-table joins  
[`02_highest_paying_skills.sql`](02_highest_paying_skills.sql)- Salary analysis with aggregations and joins  
[`03_optimal_skills.sql`](03_optimal_skills.sql)- Combined demand?salary query

## Problem & Context
The analysis seeks to answer the following business questions for job market analysts:

* 🏅 Which technical skills are most in demand for remote Data Engineer roles in the UK?

* 💰 Which Data Engineering skills are associated with the highest paid salaries?

* ⚖️ Which skills offer the best balance between job demand and salary pay?

* 🧩 Which technologies should aspiring Data Engineers prioritise to improve their employability and earning potential?

* 🔍 What insights can the job market provide for career development and skills planning?

The project analyses a data warehouse built using a star schema design, consisting of:
![data warehouse](../Images/1_2_Data_Warehouse.png)

* **Fact Table** – `job_postings_fact`: Contains the measurable job posting data, including job titles, salaries, locations, and work-from-home information.

* **Dimension Tables** – `company_dim` and `skills_dim`: Provide descriptive information about companies and technical skills associated with job postings.

* **Bridge Table** – `skills_job_dim`: Connects skills to job postings through skill_id and job_id, enabling analysis of the many-to-many relationship between jobs and skills.

By querying across these related tables, I uncovered insights into skill demand, salary trends, and optimal skills, identifying technologies that provide a strong balance between market demand and earning potential in the UK remote Data Engineering market.

## Tech Stack

* 🐤 **Query Engine:** DuckDB — for fast OLAP-style query and analysis of the data warehouse.

* 🎞️ **Language:** SQL — used for data exploration, transformation, aggregation, and analysis.

* 📊 **Data Model:** Star Schema — structured around fact, dimension, and bridge tables to support analytical queries.

* 🖥️ **Development:** VS Code — used as the development environment for writing, testing, and organising SQL queries + Terminal for DuckDB CLI

* 🎛️ **Version Control:** Git & GitHub — For versioned SQL scripts.

## Analysis Overview
### Query Structure
[`Top Demanded Skills`](01_top_demanded_skills.sql) -identifies the top 10 most indemand skills for remote data engineering job in the uk  
[`Top paying skills`](02_highest_paying_skills.sql)- Analyses the 10 most paying skills using salary and demand metrics  
[`Optimal skills`](03_optimal_skills.sql)- Calculate an optimal score using natural log of demand combined with median salary to find the most valuable skills to learn or prioritise as a data engineer.

### Key Insights

* 💡 **Skill Demand:** SQL and Python emerged as the most in-demand skills, while cloud platforms such as Azure, AWS, and GCP showed strong demand across UK remote Data Engineering roles.
* 💎 **Salary Potential:** Terraform, Airflow, Spark, and other specialised technologies demonstrated strong median salary potential.
* 🔑 **Optimal Skills:** The optimal skills analysis highlighted Terraform, Python, SQL, and AWS as strong choices when balancing market demand with earning potential.
* ⚙️ **Career Implication:** The findings suggest that combining core skills such as SQL and Python with cloud, orchestration, and infrastructure technologies can strengthen a Data Engineer’s career prospects.

## SQL skills demonstrated

###  Query Design & Optimisation

* **Complex Joins:** Multi_table joins, Joined `skills_dim`, `skills_job_dim`, and `job_postings_fact` to connect skills with individual job postings and their attributes.  

* **Aggregations:** Used `COUNT()`, `AVG()`, `MEDIAN()`, and `ROUND()` to analyse job demand and salary trends while controlling numerical precision.  

* **Filtering:** Applied `WHERE`, `HAVING`, and `IS NOT NULL` to filter by `job_title_short`, `job_work_from_home`, `job_country`, `salary_year_avg`, and `job posting counts`.  

* **Sorting & Limiting:** Used `ORDER BY` and `LIMIT` to rank results and identify the top 10 skills based on demand, salary, and optimal score.  

### Data Analysis Techniques

* **Grouping:** Used `GROUP BY` to analyse skills individually and compare job demand and salary metrics.  

* **Mathematical Functions:** Applied `LN()` to transform job demand and `ROUND()` to control numerical precision.
* **Conditional Logic:** Used conditional filtering with `WHERE` and boolean conditions such as `job_work_from_home = TRUE.`
* **Calculated Metrics:** Created derived measures such as `median_salary`, `log_total_jobs`, and the custom `optimal_score`.
* **HAVING Clauses:** Applied `HAVING` to filter grouped results, such as retaining skills with more than 100 job postings.
* **NULL Handling:** Used `IS NOT NULL` to exclude missing salary values from salary-based analysis.
