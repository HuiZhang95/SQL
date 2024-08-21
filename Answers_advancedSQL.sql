DROP TABLE data_science_jobs;
/*
Manipulate tables Q1: 
Create a table named data_science_jobs that will hold information about job postings. 
Include the following columns: job_id (integer and primary key), job_title (text), 
company_name (text), and post_date (date).
*/

CREATE TABLE data_science_jobs(
    job_id INT PRIMARY KEY,
    job_title TEXT,
    company_name TEXT,
    post_date DATE
);

/*
Manipulate tables Q2: 
Insert three job postings into the data_science_jobs table. 
Make sure each job posting has a unique job_id, a job_title, 
a company_name, and a post_date.
*/

INSERT INTO data_science_jobs (job_id,job_title,company_name,post_date)
VALUES 
    (1, 'Data Scientist','Tech Innovations','January 1, 2023'),
    (2, 'Machine Learning Engineer','Data Driven Co','January 15, 2023'),
    (3, 'AI Specialist','Future Tech','February 1, 2023');

SELECT *
FROM data_science_jobs;


/*
Manipulate tables Q3: 
Alter the data_science_jobs table to add a new Boolean column 
(uses True or False values) named remote.
*/

ALTER TABLE data_science_jobs
ADD remote Boolean;

/*
Manipulate tables Q4: 
Rename the post_date column to posted_on from the data_science_job table.
*/

ALTER TABLE data_science_jobs
RENAME post_date TO posted_on;

/*
Manipulate tables Q5: 
Modify the remote column so that it defaults to FALSE in the data_science_job table .
*/
ALTER TABLE data_science_jobs
ALTER COLUMN remote SET DEFAULT FALSE;


/*
Manipulate tables Q6: 
Drop the company_name column from the data_science_jobs table.
*/
ALTER TABLE data_science_jobs
DROP COLUMN company_name;


/*
Manipulate tables Q7: 
Update the job posting with the job_id = 2 . 
Update the remote column for this job posting to TRUE in data_science_jobs.
*/
UPDATE data_science_jobs
SET remote = TRUE 
WHERE job_id = 2;

/*
Manipulate tables Q8: 
Drop the data_science_jobs table.
*/
DROP TABLE data_science_jobs;

/*
Data Functions Q1: 
Find the average salary both yearly (salary_year_avg) 
and hourly (salary_hour_avg) for job postings using the 
job_postings_fact table that were posted after June 1, 2023. 
Group the results by job schedule type. 
Order by the job_schedule_type in ascending order.
*/
SELECT *
FROM job_postings_fact;

SELECT 
    job_schedule_type,
    AVG(salary_year_avg)::INT AS salary_year_avg,
    AVG(salary_hour_avg)::INT AS salary_hour
FROM job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date)  > 2022 
    AND EXTRACT(MONTH FROM job_posted_date)>5
GROUP BY job_schedule_type
ORDER BY job_schedule_type ASC;


SELECT 
    job_schedule_type,
    AVG(salary_year_avg)::INT AS salary_year_avg,
    AVG(salary_hour_avg)::INT AS salary_hour
FROM job_postings_fact
WHERE 
    job_posted_date::DATE > '2023-06-01'
GROUP BY job_schedule_type
ORDER BY job_schedule_type ASC;

/*
Data Functions Q2: 
Count the number of job postings for each month in 2023, 
adjusting the job_posted_date to be in 'America/New_York' 
time zone before extracting the month. Assume the job_posted_date is stored in UTC. 
Group by and order by the month.
*/

SELECT
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
    COUNT(*) AS count
    
FROM job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY
    month
ORDER BY
    month;

/*
Data Functions Q3: 
Find companies (include company name) that have posted jobs offering health insurance, 
where these postings were made in the second quarter of 2023. 
Use date extraction to filter by quarter. 
And order by the job postings count from highest to lowest. 
*/
SELECT
    COUNT(job_postings.job_id) AS count,
    companies.name AS company_name
FROM job_postings_fact AS job_postings
LEFT JOIN company_dim AS companies
    ON job_postings.company_id = companies.company_id
WHERE 
    EXTRACT(quarter FROM job_postings.job_posted_date) = 2
    AND EXTRACT(YEAR FROM job_postings.job_posted_date) = 2023
    AND job_postings.job_health_insurance = TRUE
GROUP BY
    company_name
HAVING
    COUNT(job_postings.job_id) > 0
ORDER BY
    count DESC;


/*
Case expression Q1: 
From the job_postings_fact table, 
categorize the salaries from job postings that are data analyst jobs 
and who have a yearly salary information. Put salary into 3 different categories:

If the salary_year_avg is greater than $100,000 then return ‘high salary’.
If the salary_year_avg is between $60,000 and $99,999 return ‘Standard salary’.
If the salary_year_avg is below $60,000 return ‘Low salary’.
Also order from the highest to lowest salaries.
*/
SELECT
    salary_year_avg,
    Case
        WHEN salary_year_avg > 100000 THEN 'high salary'
        WHEN salary_year_avg between 60000 AND 99999 THEN 'Standard salary'
        WHEN salary_year_avg < 60000 THEN 'Low salary'
    END AS salary_category
FROM job_postings_fact 
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC;


/*
Case expression Q2: 
Count the number of unique companies that offer work from home (WFH) 
versus those requiring work to be on-site. 
Use the job_postings_fact table to count and compare the distinct companies 
based on their WFH policy (job_work_from_home).
*/
SELECT
    COUNT(distinct(company_id)) as company_distinct,
    CASE
        WHEN job_work_from_home = TRUE THEN 'work from home'
        WHEN job_work_from_home = FALSE THEN 'work on-site'
    END AS WFH
FROM job_postings_fact 
GROUP BY WFH;


SELECT 
    COUNT(DISTINCT CASE WHEN job_work_from_home = TRUE THEN company_id END) AS wfh_companies,
    COUNT(DISTINCT CASE WHEN job_work_from_home = FALSE THEN company_id END) AS non_wfh_companies
FROM job_postings_fact;

/*
Case expression Q3: 
Write a query that lists all job postings with their job_id, 
salary_year_avg, and two additional columns using CASE WHEN statements called: 
experience_level and remote_option. Use the job_postings_fact table.

For experience_level, 
categorize jobs based on keywords found in their titles (job_title) as 'Senior', 
'Lead/Manager', 'Junior/Entry', or 'Not Specified'. 
Assume that certain keywords in job titles 
(like "Senior", "Manager", "Lead", "Junior", or "Entry") can indicate the level of 
experience required. ILIKE should be used in place of LIKE for this.

NOTE: Use ILIKE in place of how you would normally use LIKE ; 
ILIKE is a command in SQL, specifically used in PostgreSQL. 
It performs a case-insensitive search, 
similar to the LIKE command but without sensitivity to case.

For remote_option, 
specify whether a job offers a remote option as either 'Yes' or 'No', 
based on job_work_from_home column.
*/
SELECT
    job_id, 
    salary_year_avg,
    CASE
        WHEN job_title ILIKE '%senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Lead%' THEN 'Lead/Manager'
        WHEN job_title ILIKE '%Manager%' THEN 'Lead/Manager'
        WHEN job_title ILIKE '%Junior%' THEN 'Junior/Entry'
        WHEN job_title ILIKE '%Entry%' THEN 'Junior/Entry'
        ELSE 'Not Specified'
    END AS experience_level,
    CASE
        WHEN job_work_from_home = TRUE THEN 'Yes'
        WHEN job_work_from_home = FALSE THEN 'No'
    END AS remote_option
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
ORDER BY job_id;

/*
subqueires Q1: 
Identify the top 5 skills that are most frequently mentioned in job postings. 
Use a subquery to find the skill IDs with the highest counts 
in the skills_job_dim table and 
then join this result with the skills_dim table to get the skill names.
*/
SELECT 
    countSkills.count_id,
    skills_dim.skills
FROM (
    SELECT 
        COUNT(skill_id) AS count_id,
        skill_id
    FROM skills_job_dim
    GROUP BY skill_id
) AS countSkills
LEFT JOIN skills_dim
    ON countSkills.skill_id = skills_dim.skill_id
ORDER BY countSkills.count_id DESC
LIMIT 5;


SELECT 
    skills_dim.skills
FROM (
    SELECT 
        COUNT(skill_id) AS count_id,
        skill_id
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY count_id DESC
    LIMIT 5
) AS countSkills
LEFT JOIN skills_dim
    ON countSkills.skill_id = skills_dim.skill_id
ORDER BY countSkills.count_id DESC;

/*
subqueires Q2: 
Determine the size category ('Small', 'Medium', or 'Large') for each company 
by first identifying the number of job postings they have. 

Use a subquery to calculate the total job postings per company. 

A company is considered 'Small' if it has less than 10 job postings, 
'Medium' if the number of job postings is between 10 and 50, 
and 'Large' if it has more than 50 job postings. 

Implement a subquery to aggregate job counts per company 
before classifying them based on size.
*/
SELECT
    job_info.company_id,
    company_dim.name,
    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        WHEN job_count > 50 THEN 'Large'
    END AS company_size
FROM(
    SELECT 
        company_id,
        COUNT(company_id) as job_count
    FROM job_postings_fact
    GROUP BY company_id
) AS job_info
LEFT JOIN company_dim
    ON job_info.company_id = company_dim.company_id
ORDER BY company_id;
    

/*
subqueires Q3: 
Find companies that offer an average salary above the overall average yearly salary
 of all job postings. Use subqueries to select companies with an average salary 
 higher than the overall average salary (which is another subquery).
*/

SELECT
    company_name,
    avg_salary
FROM(
    SELECT
        company_dim.name AS company_name,
        AVG(job_postings_fact.salary_year_avg) AS avg_salary
    FROM job_postings_fact
    LEFT JOIN company_dim
        ON  job_postings_fact.company_id = company_dim.company_id
    GROUP BY
        company_dim.name
) AS salary_info
WHERE
    avg_salary > (
        SELECT AVG(salary_year_avg)
        FROM job_postings_fact
        WHERE salary_year_avg IS NOT NULL
    )
ORDER BY
    company_name;


/*
CTEs Q1: 
Identify companies with the most diverse (unique) job titles. 
Use a CTE to count the number of unique job titles per company, 
then select companies with the highest diversity in job titles.
*/
WITH job_count AS (
    SELECT
        cd.name AS company_name,
        COUNT(DISTINCT jp.job_title) AS job_count1
    FROM job_postings_fact AS jp
    INNER JOIN company_dim AS cd
        ON  jp.company_id = cd.company_id
    GROUP BY
        cd.name
)

SELECT *
FROM job_count
ORDER BY job_count1 DESC
LIMIT 10;


/*
CTEs Q2: 
Explore job postings by listing job id, job titles, company names, 
and their average salary rates, while categorizing these salaries 
relative to the average in their respective countries. 

Include the month of the job posted date. Use CTEs, conditional logic, 
and date functions, to compare individual salaries with national averages.
*/
WITH avg_salary AS (
    SELECT 
        AVG(salary_hour_avg) AS salary_country,
        job_country
    FROM    
        job_postings_fact
    GROUP BY
        job_country
    ORDER BY
        salary_country
)

SELECT
    job_id,
    job_title,
    cp.name as company_name,
    salary_hour_avg,
    asa.salary_country,
    jp.job_country,
    EXTRACT(MONTH FROM jp.job_posted_date) AS monthInfo,
    CASE
        WHEN salary_hour_avg >= asa.salary_country THEN 'above average'
        ELSE 'below average'
    END AS salary_level
FROM job_postings_fact as jp
LEFT JOIN avg_salary AS asa
    ON jp.job_country = asa.job_country
LEFT JOIN company_dim as cp
    ON jp.company_id = cp.company_id
ORDER BY
    monthInfo DESC;


/*
CTEs Q3: 
Calculate the number of unique skills required by each company. 

Aim to quantify the unique skills required per company and identify 
which of these companies offer the highest average salary for positions 
necessitating at least one skill. For entities without skill-related job postings, 
list it as a zero skill requirement and a null salary. 

Use CTEs to separately assess the unique skill count and 
the maximum average salary offered by these companies.
*/
WITH skill_company AS (
    SELECT
        jp.company_id AS company_id,
        COUNT(DISTINCT sjd.skill_id) AS unique_skill
    FROM job_postings_fact AS jp
    LEFT JOIN skills_job_dim AS sjd
        ON jp.job_id = sjd.job_id
    GROUP BY
        jp.company_id
),

salary_company AS (
    SELECT
        jp.company_id AS company_id,
        cd.name AS company_name,
        MAX(salary_year_avg) AS avg_salary
    FROM job_postings_fact AS jp
    LEFT JOIN company_dim as cd
        ON jp.company_id = cd.company_id
    WHERE 
        jp.job_id in (
            SELECT job_id 
            FROM skills_job_dim
            )
    GROUP BY
        jp.company_id, cd.name
)


SELECT 
    avg_salary,
    company_name,
    skill_company.unique_skill
FROM salary_company
INNER JOIN skill_company
    ON skill_company.company_id = salary_company.company_id
ORDER BY company_name


-- ANSWER FROM THE WEBSITE
-- Counts the distinct skills required for each company's job posting
WITH required_skills AS (
  SELECT
    companies.company_id,
    COUNT(DISTINCT skills_to_job.skill_id) AS unique_skills_required
  FROM
    company_dim AS companies 
  LEFT JOIN job_postings_fact as job_postings ON companies.company_id = job_postings.company_id
  LEFT JOIN skills_job_dim as skills_to_job ON job_postings.job_id = skills_to_job.job_id
  GROUP BY
    companies.company_id
),
-- Gets the highest average yearly salary from the jobs that require at least one skills 
max_salary AS (
  SELECT
    job_postings.company_id,
    MAX(job_postings.salary_year_avg) AS highest_average_salary
  FROM
    job_postings_fact AS job_postings
  WHERE
    job_postings.job_id IN (SELECT job_id FROM skills_job_dim)
  GROUP BY
    job_postings.company_id
)
-- Joins 2 CTEs with table to get the query
SELECT
  companies.name,
  required_skills.unique_skills_required as unique_skills_required, --handle companies w/o any skills required
  max_salary.highest_average_salary
FROM
  company_dim AS companies
LEFT JOIN required_skills ON companies.company_id = required_skills.company_id
LEFT JOIN max_salary ON companies.company_id = max_salary.company_id
ORDER BY
	companies.name;



/*
UNION Operators Q1: 
Create a unified query that categorizes job postings into two groups: 
those with salary information (salary_year_avg or salary_hour_avg is not null) 
and those without it. 
Each job posting should be listed with its job_id, job_title, 
and an indicator of whether salary information is provided.
*/
(SELECT 
    job_id,
    job_title,
    'Yes' AS salary_info
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL OR salary_year_avg IS NOT NULL
)
UNION ALL

(SELECT 
    job_id,
    job_title,
    'NO' AS salary_info
FROM job_postings_fact
WHERE salary_hour_avg IS NULL AND salary_year_avg IS NULL
)
ORDER BY  job_id, salary_info



/*
UNION Operators Q2: 
Retrieve the job id, job title short, job location, job via, 
skill and skill type for each job posting from the first quarter 
(January to March). Using a subquery to combine job postings from the first quarter 
(these tables were created in the Advanced Section - 
Practice Problem 6 [include timestamp of Youtube video]) 
Only include postings with an average yearly salary greater than $70,000.
*/
-- For January
CREATE TABLE january_jobs AS 
	SELECT * 
	FROM job_postings_fact
	WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- For February
CREATE TABLE february_jobs AS 
	SELECT * 
	FROM job_postings_fact
	WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- For March
CREATE TABLE march_jobs AS 
	SELECT * 
	FROM job_postings_fact
	WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT *
FROM january_jobs

WITH first_quater_jobs AS (
(
SELECT 
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM january_jobs
)

UNION ALL

(
SELECT 
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM february_jobs
)

UNION ALL

(
SELECT 
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM march_jobs
)
)

SELECT 
    fqj.job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg,
    sd.skills AS skills,
    sd.type AS type
FROM first_quater_jobs as fqj
LEFT JOIN skills_job_dim as sjd
    ON fqj.job_id = sjd.job_id
LEFT JOIN skills_dim as sd 
    ON sjd.skill_id = sd.skill_id
WHERE salary_year_avg > 70000
ORDER BY
    fqj.job_id;


/*
UNION Operators Q3: 
Analyze the monthly demand for skills by counting the number of 
job postings for each skill in the first quarter (January to March), 
utilizing data from separate tables for each month. 
Ensure to include skills from all job postings across these months. 
The tables for the first quarter job postings were created in the Advanced Section - 
Practice Problem 6 [include timestamp of Youtube video].
*/
-- For January
CREATE TABLE january_jobs AS 
	SELECT * 
	FROM job_postings_fact
	WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- For February
CREATE TABLE february_jobs AS 
	SELECT * 
	FROM job_postings_fact
	WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- For March
CREATE TABLE march_jobs AS 
	SELECT * 
	FROM job_postings_fact
	WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT *
FROM january_jobs

WITH combined_data AS (
    SELECT 
        job_id, 
        '1' AS MonthInfo
    FROM january_jobs

    UNION ALL

    SELECT 
        job_id, 
        '2' AS MonthInfo
    FROM february_jobs

    UNION ALL

    SELECT 
        job_id,
        '3' AS MonthInfo
    FROM march_jobs
),

count_data AS (
SELECT 
    fqj.job_id,
    MonthInfo,
    sd.skills AS skills
FROM combined_data as fqj
LEFT JOIN skills_job_dim as sjd
    ON fqj.job_id = sjd.job_id
LEFT JOIN skills_dim as sd 
    ON sjd.skill_id = sd.skill_id
)

SELECT 
    skills,
    MonthInfo,
    COUNT(skills) as count_skills
FROM count_data
GROUP BY skills, MonthInfo
ORDER BY skills, MonthInfo


