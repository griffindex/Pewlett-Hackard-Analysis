-- Deliverable 1: The Number of Retiring Employees by Title.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
-- Create retirement_titles table to make retirement_titles.csv
INTO retirement_titles
FROM employees AS e
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Remove duplicate employees using DISTINCT ON and make unique_titles.csv table
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.first_name,
    rt.last_name,
    rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no, to_date DESC;

-- Create a retiring titles table to make retiring_titles.csv
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;


-- Deliverable 2: The Employees Eligible for the Mentorship Program
--  Create a mentorship_eligibilty table to make mentorship_eligibilty.csv
SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
			INNER JOIN titles AS t
				ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;


-- Analysis Results Queries
SELECT COUNT (*)
FROM retirement_titles;
-- 133,776

SELECT *
FROM unique_titles;

SELECT COUNT (*)
FROM unique_titles;
-- 90,398

SELECT *
FROM retiring_titles;

SELECT *
FROM mentorship_eligibilty;

SELECT COUNT (*)
FROM mentorship_eligibilty;
-- 1549

-- Create table of counts by titles in mentorship_eligibilty
SELECT COUNT(me.emp_no), me.title
FROM mentorship_eligibilty as me
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Create unique titles list that includes department
SELECT DISTINCT ON(ut.emp_no) ut.emp_no,
	ut.first_name, ut.last_name, ut.title, di.dept_name
-- INTO unique_titles_dept
FROM unique_titles AS ut
	INNER JOIN dept_info AS di
		ON (ut.emp_no = di.emp_no);

-- Create table of counts by department name in unique_title_dept
SELECT COUNT(utd.emp_no), utd.dept_name
FROM unique_titles_dept as utd
GROUP BY dept_name
ORDER BY COUNT(dept_name) DESC;


-- __________________________________________ --

SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
-- INTO mentorship_eligibilty_expanded
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
			INNER JOIN titles AS t
				ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1960-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

-- Create table of overlap between mentorship_eligibilty & unique_titles
SELECT DISTINCT ON(ut.emp_no) ut.emp_no,
	ut.first_name, ut.last_name, ut.title
-- INTO unique_titles_dept
FROM unique_titles AS ut
	INNER JOIN mentorship_eligibilty_expanded AS me
		ON (ut.emp_no = me.emp_no);
