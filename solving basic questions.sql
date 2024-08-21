/* -- Basic Q1: in the job_postings_fact table get the columns job_id, job_title_short , job_location , and job_via columns. 
And order it in ascending order by job_location. */ 

SELECT	
		job_id, 
		job_title_short, 
        job_location, 
        job_via 
FROM 
		job_postings_fact
ORDER BY 
		job_location ASC;

/* -- Basic Q2: In the job_postings_fact table get the columns job_id, job_title_short , job_location , and job_via columns. 
And order it in descending order by job_title_short. */ 

SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via 
FROM job_postings_fact
ORDER BY job_location DESC;

/* -- Basic Q3 Look at only the first 10 entries for a query in the job_postings_fact table that returns job_id, job_title_short, job_location, job_via columns. 
Order by the job_location in ascending order.  */ 

SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via 
FROM 	job_postings_fact
ORDER BY 
		job_location ASC
LIMIT 10;

-- Basic Q4: Get the unique job locations in the job_postings_fact table. Return the results in alphabetical order. 
SELECT 
	DISTINCT job_location AS loc_new
FROM job_postings_fact
ORDER BY loc_new;

/* -- Basic Q5: In the job_postings_fact table get the columns job_id, job_title_short , job_location , job_via , and salary_year_avg columns. 
Order by job_id in ascending order. And only look at rows where job_title_short is ‘Data Engineer’. */ 
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	job_title_short = 'Data Engineer'
ORDER BY 
		job_id ASC;

/* -- Comparisons Q1: In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Order by job_id in ascending order. Only return rows where the job location is in ‘Tampa, FL’. */ 
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	job_location = 'Tampa, FL'
ORDER BY 
		job_id ASC;
        
/* -- Comparsons Q2: In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, salary_year_avg, and job_schedule_type columns. 
Order by job_id in ascending order. Only return ‘Full-time’ jobs. */ 
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg, 
        job_schedule_type
FROM 	job_postings_fact
WHERE	job_schedule_type = 'Full-time'
ORDER BY 
		job_id ASC;
        
/* -- Comparsons Q3: In the job_postings_fact table get the job_id, job_title_short, job_location, job_via,  job_schedule_type, and salary_year_avg columns. 
Order by job_id in ascending order. Only look at jobs that are not ‘Part-time’ jobs. */ 
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg, 
        job_schedule_type
FROM 	job_postings_fact
WHERE	NOT job_schedule_type LIKE '%Part-time%'
ORDER BY 
		job_id ASC;
        
/* -- Comparisons Q4: In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Order by job_id in ascending order. Only look at jobs that are not posted ‘via LinkedIn’.*/ 
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg, 
        job_schedule_type
FROM 	job_postings_fact
WHERE	job_via <> 'via LinkedIn'
ORDER BY 
		job_id ASC;

        
/* -- Comparisons Q5: In the job_postings_fact table only get jobs that have an average yearly salary of $65,000 or greater. 
Also get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Order by job_id in ascending order. */ 

SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	salary_year_avg >= 65000
ORDER BY 
		job_id ASC;


/* -- Comparisons Q6: In the job_postings_fact table only get jobs that have an average yearly salary greater than $55,000. 
Also get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Order by job_id in ascending order.*/
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	salary_year_avg > 55000
ORDER BY 
		job_id ASC;
        

/* -- Comparisons Q7: In the job_postings_fact table only get jobs that have an average yearly salary less than $110,000. 
Also return the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Order by job_id in ascending order.*/
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	salary_year_avg < 110000
ORDER BY 
		job_id ASC;
        
/* -- Comparisons Q8: In the job_postings_fact table only get jobs that have an average yearly salary less than or equal to $150,000. 
Also return the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Order by job_id in ascending order. */
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	salary_year_avg <= 150000
ORDER BY 
		job_id ASC;

/* -- Comparisons Q9: Return only Data Engineer’ jobs located within the ‘United States’ from the job_postings_fact table. 
Also, get the job_id, job_title_short, job_country, job_via and salary_year_avg columns. Order by job_id in ascending order.*/ 

SELECT	job_id, 
		job_title_short, 
        job_country, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	job_title_short = 'Data Engineer' AND job_country = 'United States'
ORDER BY 
		job_id ASC;
        
        
/* -- Comparisons Q10: In the job_postings_fact table let’s look at jobs that are either ‘Full-Time’ or ‘Contractor’ jobs. 
And return the job_id, job_title_short, job_location, job_via, salary_year_avg, and job_schedule_type columns. Order by job_id in ascending order.*/ 
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg,
        job_schedule_type
FROM 	job_postings_fact
WHERE	job_schedule_type = 'Full-time' OR job_schedule_type = 'Contractor'
ORDER BY 
		job_id ASC;       
        
        
/* -- Comparisons Q11-12: Only return jobs with a salary between (inclusive) $50,000 and $70,000 from the job_postings_fact table. 
And get the job_id, job_title_short, job_location, job_via and salary_year_avg columns. Order by job_id in ascending order.*/ 
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	salary_year_avg BETWEEN 50000 AND 70000
ORDER BY 
		job_id ASC;   
        
        
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	salary_year_avg >= 50000 AND salary_year_avg <= 70000
ORDER BY 
		job_id ASC;  
        
        
        
/* -- Comparisons Q13: Return job_title_short that are ‘Data Scientist’ or ‘Business Analyst’ roles from the job_postings_facttable. 
Also, return the job_id, job_title_short, job_location, job_via and salary_year_avg columns. Order by job_id in ascending order.*/ 
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	job_title_short = 'Data Scientist' OR job_title_short = 'Business Analyst'
ORDER BY 
		job_id ASC;  
        

/* -- Comparisons Q14: Return job_title_short that are ‘Data Analyst’, ‘Data Scientist’ or ‘Business Analyst’ roles from the job_postings_fact table using the IN operator. 
Also, return the job_id, job_title_short, job_location, job_via and salary_year_avg columns. Order by job_id in ascending order.*/ 
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	job_title_short IN ('Data Scientist', 'Data Analyst', 'Business Analyst')
ORDER BY 
		job_id ASC; 
        
        
/* -- Comparisons Q15: In the job_postings_fact table look at Data Analyst jobs whose average yearly salary range is between $50,000 and $75,000. 
Return the job_id, job_title_short, job_location and salary_year_avg. Order by job_id in ascending order.*/ 
SELECT	job_id, 
		job_title_short, 
        job_location,  
        salary_year_avg
FROM 	job_postings_fact
WHERE	job_title_short = 'Data Analyst' AND salary_year_avg BETWEEN 50000 AND 75000
ORDER BY 
		job_id ASC; 


/* -- Comparisons Q16: In the job_postings_fact table look at Data Analyst and Business Analyst jobs whose average yearly salary range is greater than $75,000. 
Return the job_id, job_title_short, job_location, salary_year_avg, and job_schedule_type. Order by job_id in ascending order. */
SELECT	job_id, 
		job_title_short, 
        job_location, 
        job_via, 
        salary_year_avg
FROM 	job_postings_fact
WHERE	job_title_short IN ('Data Analyst', 'Business Analyst') AND salary_year_avg > 75000
ORDER BY 
		job_id ASC; 


/* -- Wildcards Q1: In the company_dim table, find all company names that include ‘Tech’ immediately followed by any single character. 
(e.g., "Lego Techs" or "Mario SuperTech.") Return only the name column and return it in ascending order by the company name. */
SELECT	name
FROM 	company_dim
WHERE	name LIKE '%Tech_'
ORDER BY 
		name ASC;


/* -- Wildcards Q2: Find all job postings in the job_postings_fact where the job_title includes "Engineer" in it with ONLY one character followed after the term. 
Get the job_id , job_title, and job_posted_date. Order by job_id in ascending order. */ 
SELECT	job_id, 
		job_title, 
        job_posted_date
FROM 	job_postings_fact
WHERE	job_title LIKE '%Engineer_'
ORDER BY 
		job_id ASC; 


/* -- Wildcards Q3: Identify job postings in the job_postings_fact table where the job_title contains the pattern "a_a" anywhere in the title. 
Return the job_id and job_title columns. Order by job_id in ascending order. */ 
SELECT	job_id, 
		job_title
FROM 	job_postings_fact
WHERE	job_title LIKE '%a_a%'
ORDER BY 
		job_id ASC; 


/* -- Alias Q1: From the job_postings_fact return the following columns: 
job_id, job_title_short , job_location, job_via, job_posted_date, and salary_year_avg. 
Also, rename the following: job_via to job_posted_site and salary_year_avg to avg_yearly_salary. Order by job_id in ascending order. */ 

SELECT	job_id, 
		job_title_short,
        job_location,
        job_via AS job_posted_site,
        salary_year_avg AS avg_yearly_salary
FROM 	job_postings_fact
ORDER BY 
		job_id ASC; 

/* -- Operations Q1: In the invoices_fact table add the hours_spent to the hours_rate and rename this new column to added_value. 
Order by activity_id in ascending order. 
(This is calculating the total pay based on a particular activity_id.) 
SELECT	hours_spent + hours_rate AS added_value, 
		activity_id
FROM 	invoices_fact
ORDER BY 
		activity_id ASC; 
        
        
 -- Operations Q2: In the invoices_fact table divide the hours_spent by the hours_rate and rename this column to efficiency_ratio. 
Return the activity_id as well. Order by activity_id in ascending order.  
SELECT	hours_spent / hours_rate AS efficiency_ratio, 
		activity_id
FROM 	invoices_fact
ORDER BY 
		activity_id ASC; 
      
      
 -- Operations Q3: In the invoices_fact tables subtract the hours_rate from the hours_spent and 
rename this new column to estimate_budget. Return the activity_id column as well. 
Order by activity_id in ascending order.  
SELECT	hours_spent - hours_rate AS estimate_budget, 
		activity_id
FROM 	invoices_fact
ORDER BY 
		activity_id ASC;         


 -- Operations Q4: In the invoices_fact table multiply the hours_spent by hours_rate and then add a fixed fee of $10. 
Rename this new column to adjusted_cost. Also return the activity_id. Order by activity_id in ascending order.  
SELECT	activity_id,
        hours_spent * hours_rate + 10 AS adjusted_cost
		
FROM 	invoices_fact
ORDER BY 
		activity_id ASC; 

*/ 


-- Aggregation Q1: In the job_postings_fact table count the total number of job postings that offer health insurance.

SELECT COUNT(job_health_insurance)
FROM job_postings_fact
GROUP BY job_health_insurance
HAVING job_health_insurance = 1;

SELECT COUNT(job_health_insurance)
FROM job_postings_fact
WHERE job_health_insurance = 1;

/* -- Aggregation Q2: In the job_postings_fact table count the number of job postings available for each country. 
Return job_country and the job count. Order by job_country in ascending order. */
SELECT	COUNT(job_country) AS job_count,
	 	job_country
FROM job_postings_fact
GROUP BY job_country
ORDER BY job_country ASC;


/* -- Aggregation Q3: In the job_postings_fact table calculate the total sum of the average yearly salary (salary_year_avg)
for all job postings that are marked as fully remote and divide it by the total count of salary_year_avg. 
To get the total average yearly salary for fully remote jobs. 
Ensure to only include job postings where a yearly salary is specified (salary_year_avg IS NOT NULL).*/ 
SELECT * 
FROM job_postings_fact;


SELECT	SUM(salary_year_avg)/COUNT(salary_year_avg) AS job_count
FROM 	job_postings_fact
WHERE 	job_work_from_home = 1 AND salary_year_avg IS NOT NULL;



/* -- Aggregation Q4: In the job_postings_fact table find the minimum and maximum yearly salaries (salary_year_avg) 
offered for job postings in locations that include ‘San Francisco’ in the location title. 
The query should return two columns: one for the minimum yearly salary and one for the maximum yearly salary, 
considering only job postings that specify a yearly salary (salary_year_avg IS NOT NULL).*/ 


SELECT	MIN(salary_year_avg) AS min_salary,
	 	MAX(salary_year_avg) AS max_salary
FROM 	job_postings_fact
WHERE 	job_location LIKE '%San Francisco%' AND salary_year_avg IS NOT NULL;


/* -- Aggregation Q5: In the job_postings_fact table, determine the average yearly salaries (salary_year_avg) 
for ‘Data Scientist’ job postings, using the job_title_short column. Your query should return one column for the average yearly salary. 
Only include jobs that have a yearly salary (salary_year_avg IS NOT NULL).*/ 

SELECT	AVG(salary_year_avg) AS avg_salary
FROM 	job_postings_fact
WHERE 	job_title_short = 'Data Scientist' AND salary_year_avg IS NOT NULL;

/* -- Aggregation Q6: Using the job_postings_fact table find the average, minimum, and maximum salary range for 
each job_title_short. Only include job titles with more than 1,000 job postings and group data by job_title_short . 
Order by job_title_short in ascending order.*/ 

SELECT
	job_title_short,
	AVG(salary_year_avg) AS avg_salary, 
    MAX(salary_year_avg) AS max_salary, 
    MIN(salary_year_avg) AS min_salary
        
FROM
	job_postings_fact

GROUP BY 
	job_title_short
    
HAVING
	COUNT(job_title_short) > 1000
    
ORDER BY
	job_title_short ASC;
        

/* -- Aggregation Q7: In the job_postings_fact table list countries along with their average yearly salary (salary_year_avg) 
for job postings, where the average yearly salary exceeds $100,000. 
Group the results by job_country. 
Only get job postings where there is an average yearly salary included (salary_year_avg IS NOT NULL).*/         
SELECT
	job_country,
	AVG(salary_year_avg) AS avg_salary
        
FROM
	job_postings_fact
    
WHERE
	salary_year_avg IS NOT NULL

GROUP BY 
	job_country
    
HAVING
	avg_salary > 100000;


/* -- Aggregation Q8: In the job_postings_fact table count the number of job postings for each location (job_location)
that do NOT offer remote work. Display the location and the count of non-remote job postings, 
and order the results by the count in descending order. 
Show locations where the average salary for non-remote jobs is above $70,000.*/ 


SELECT
	job_location,
	AVG(salary_year_avg) AS avg_salary,
    COUNT(job_id) AS count_job
        
FROM
	job_postings_fact
    
WHERE
	job_work_from_home = 0 AND job_location <> 'Anywhere'
    
GROUP BY 
	job_location
    
HAVING 
	avg_salary > 70000
    
ORDER BY 
	count_job DESC;



/* -- Null values Q1: We’re going to check that all skills that do not have a category assigned to it. 
Get all skills from the skills_dim table that don’t have a type (aka this type column is null). 
Return the skill_id and skills.*/ 

SELECT * 
FROM skills_dim;

SELECT
	skill_id,
    skills
FROM
	skills_dim
WHERE 
	type IS NOT NULL;


/* -- Null values Q2: Identify all job postings that have neither an annual average salary (salary_year_avg) nor an hourly average salary (salary_hour_avg)
in the job_postings_fact table. Return the job_id, job_title, salary_year_avg, salary_hour_avg 
This can be useful to look at postings where there’s no compensation. Order by job_id in ascending order.*/ 

SELECT	
	job_id, 
    job_title, 
    salary_hour_avg,
    salary_year_avg
    
FROM
	job_postings_fact
    
WHERE	
	(salary_hour_avg IS NULL) 
    AND (salary_year_avg IS NULL)
ORDER BY
	job_id ASC;


/* -- Joins Q1: Retrieve a list of job titles (job_title from the job_posting_fact table) with their corresponding company names (name from the company_dim table). 
Also, get the job_id, job_location, and job_posted_date. Only return job postings that have the ‘Data Scientist' as the job title (job_title_short). 
Order by the job posted date in descending order.*/

SELECT	
	j.job_id, 
    j.job_title, 
    j.job_location, 
    j.job_posted_date, 
    c.name
    
FROM
	job_postings_fact AS j 
LEFT JOIN company_dim AS c 
	ON c.company_id = j.company_id
    
WHERE 
	j.job_title_short = 'Data Scientist'
    
ORDER BY
	j.job_posted_date DESC;

/* -- Joins Q2: Fetch all job postings, including their job_id, job_title and the names of the skills required (skills); 
even if no skills are listed for a job. Ensure that the job is located in ‘New York’ and offers health insurance. 
Use the job_postings_fact, skills_job_dim, and skills_dim tables. Order by job_id in descending order.*/ 

SELECT	
	j.job_id, 
    j.job_title,  
    s.skills
    
FROM
	job_postings_fact AS j 
    
INNER JOIN skills_job_dim AS sj ON sj.job_id = j.job_id
INNER JOIN skills_dim AS s ON s.skill_id = sj.skill_id

WHERE j.job_location = 'New York' AND j.job_health_insurance = 1

ORDER BY
	j.job_id DESC;



/* -- Joins Q3: Identify the top skills required for jobs that offer remote work 
and have an average yearly salary above $100,000. 
Return the skill name (skills) and the number of job postings that mention each skill, 
ordered by the number of job postings in descending order.*/ 

SELECT	 
    s.skills, 
    COUNT(s.skills) AS count_s
    
FROM
	job_postings_fact AS j 
    
INNER JOIN skills_job_dim AS sj ON sj.job_id = j.job_id
INNER JOIN skills_dim AS s ON s.skill_id = sj.skill_id

WHERE 
	j.job_work_from_home = 1 AND j.salary_year_avg > 100000

GROUP BY
	s.skills

ORDER BY
	count_s DESC;






