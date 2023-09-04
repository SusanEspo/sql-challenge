--1. List the employee number, last name, first name, sex, and salary of each employee.
select empolyees.emp_no as "employee number", 
	  last_name as "last name",
	  first_name as "first name",
	  sex,
	  salary
from empolyees
lEFT JOIN salaries
ON empolyees.emp_no = salaries.emp_no;



--2. List the first name, last name, and hire date for the employees who were hired in 1986.
select empolyees.emp_no as "employee number", 
	  last_name as "last name",
	  first_name as "first name",
	  DATE_PART('YEAR', hire_date) as hire_year
from empolyees
where DATE_PART('YEAR', hire_date) = 1986

--README https://www.commandprompt.com/education/how-to-extract-year-from-date-in-postgresql/


--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
select 
	  departments.dept_name
	 ,dept_manager.dept_no
	 ,dept_manager.emp_no
	 ,empolyees.first_name
	 ,empolyees.emp_title_id 
from dept_manager
left join departments on dept_manager.dept_no= departments.dept_no
left join empolyees on empolyees.emp_no = dept_manager.emp_no
left join titles on titles.title_id = empolyees.emp_title_id 
where empolyees.emp_title_id  = 'm0001' -- manager id



--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

Select de.emp_no 
	 , de.dept_no
	 , e.last_name
	 ,e.first_name
	 ,d.dept_name
from dept_emp de
left join empolyees e	on e.emp_no = de.emp_no
left join departments d on d.dept_no = de.dept_no

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name as "first name",
	   last_name as "last name",
	   sex
from empolyees
where first_name = 'Hercules'
and   last_name like 'B%'

--6. List each employee in the Sales department, including their employee number, last name, and first name.
Select e.emp_no, e.last_name, e.first_name
from dept_emp m, empolyees e
where m.emp_no = e.emp_no
and m.dept_no in(
select dept_no
from departments d
where dept_name = 'Sales')
--README https://www.w3resource.com/sql/subqueries/understanding-sql-subqueries.php
--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.dept_no, dept_name, dept_emp.emp_no, last_name, first_name
from dept_emp 
left join empolyees e on e.emp_no = dept_emp.emp_no
left join departments d on d.dept_no = dept_emp.dept_no 
where dept_name in ('Development','Sales')
order by dept_name asc

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name , count(last_name ) as frequency
from empolyees
group by last_name
order by frequency desc