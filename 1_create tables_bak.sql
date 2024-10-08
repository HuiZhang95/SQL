CREATE TABLE job_applied (
  job_id INT, 
  application_sent_date DATE,
	custom_resume BOOLEAN, 
	resume_file_name VARCHAR(255),
	cover_letter_sent BOOLEAN,
	cover_letter_file_name VARCHAR(255), 
  status VARCHAR(50) 
);


INSERT INTO job_applied (job_id, application_sent_date, custom_resume, resume_file_name, cover_letter_sent, cover_letter_file_name, status) VALUES
(1, '2024-02-01', TRUE, 'resume_01.pdf', TRUE, 'cover_letter_01.pdf', 'submitted'),
(2, '2024-02-02', FALSE, 'resume_02.pdf', FALSE, NULL, 'interview scheduled'),
(3, '2024-02-03', TRUE, 'resume_03.pdf', TRUE, 'cover_letter_03.pdf', 'ghosted'),
(4, '2024-02-04', TRUE, 'resume_04.pdf', FALSE, NULL, 'submitted'),
(5, '2024-02-05', FALSE, 'resume_05.pdf', TRUE, 'cover_letter_05.pdf', 'rejected');


SELECT *
FROM job_applied

ALTER TABLE job_applied
ADD contact VARCHAR(50);


UPDATE job_applied SET contact = 'Erlich Bachman' WHERE job_id = 1;
UPDATE job_applied SET contact = 'Dinesh Chugtai' WHERE job_id = 2;
UPDATE job_applied SET contact = 'Bertram Gilfoyle' WHERE job_id = 3;
UPDATE job_applied SET contact = 'Jian Yang' WHERE job_id = 4;
UPDATE job_applied SET contact = 'Big Head' WHERE job_id = 5;

