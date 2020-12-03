# Pewlett-Hackard-Analysis

## Project Overview
The goal of this project is to prepare for the upcoming surge in eligible retirees by determining the number of retiring employees per title and identifying employees who may participate in the mentorship program. 

## Resources
* Data Sources: employees.csv, dept_emp.csv, titles.csv
* Software: PostgreSQL 11.1, pgAdmin 4

## Queries
* A query to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955.  
 
      SELECT e.emp_no, e.first_name, e.last_name, l.title, l.from_date, l.to_date
           INTO retirement_titles
           FROM employees as e
           LEFT JOIN titles as l
           ON e.emp_no = l.emp_no 
           WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
           ORDER BY e.emp_no ;    
      SELECT DISTINCT ON (emp_no) emp_no, first_name, Last_name, title
           INTO unique_titles
           FROM retirement_titles
           ORDER BY emp_no, to_date DESC;
      SELECT COUNT (u.emp_no), u.title
           INTO retiring_titles
           FROM unique_titles as u
           GROUP BY u.title 
           ORDER by count DESC

## Results 
The following represent major findings from our personnel analysis:

* The company will be hit hardest by the loss of experienced staff, as nearly two-thirds of potential retirees (64%) are senior staff or senior engineers.
* The group of potential retirees is split evenly between engineers and other staff (i.e., 50% in each group); the company will likely need to address deficiencies across the entire company.
* Employees eligible to participate in the mentorship program, roughly half are engineers (48%) roughly half are other staff (52%). Mentorships should be available in each department.  
* The majority of staff eligible to participate in the mentorship program (64%) are senior staff; the company should have ample staff with experience to mentor new employees.

## Summary
In sum, the company should have sufficient staff in key areas to address some of problems that may arise with a large number of employees retiring. Further analysis (queries) specific to (a) managerial and (b) departmental positions and leadership could enhance potential adjustments.  
