-- Employee_Database_challenge
SELECT e.emp_no, e.first_name, e.last_name, l.title, l.from_date, l.to_date 
   INTO retirement_titles
   FROM employees as e
   LEFT JOIN titles as l
   ON e.emp_no = l.emp_no 
   WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
   ORDER BY e.emp_no ;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, Last_name, title
   INTO unique_titles
   FROM retirement_titles
   ORDER BY emp_no, to_date DESC;

-- Retiree count by title
SELECT COUNT (u.emp_no), u.title
   INTO retiring_titles
   FROM unique_titles as u
   GROUP BY u.title 
   ORDER by count DESC

   -- Deliverable 2
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date
   INTO tempe
   FROM employees as e ;
   
SELECT DISTINCT ON (d.emp_no) d.emp_no, d.from_date, d.to_date 
   INTO tempd
   FROM dept_emp as d   
   ORDER BY emp_no, to_date DESC;

SELECT DISTINCT ON (i.emp_no) i.emp_no, i.title
   INTO tempi
   FROM titles as i
   ORDER BY emp_no, to_date DESC; 
   
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, i.title 
   INTO mentorship_eligibilty
   FROM tempe as e 
   LEFT JOIN tempd as d 
   ON e.emp_no = d. emp_no 
   LEFT JOIN tempi as i
   ON e.emp_no = i. emp_no 
   WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')   
   ORDER BY emp_no ;

DROP TABLE tempd ;
DROP TABLE tempe ;
DROP TABLE tempi ;