--Q1
select empolyees.emp_no as "employee number", 
	  last_name as "last name",
	  first_name as "first name",
	  sex,
	  salary
from empolyees
lEFT JOIN salaries
ON empolyees.emp_no = salaries.emp_no;

--Q2
select empolyees.emp_no as "employee number", 
	  last_name as "last name",
	  first_name as "first name",
	  DATE_PART('YEAR', hire_date) as hire_year
from empolyees
where DATE_PART('YEAR', hire_date) = 1986

--Q3 List the manager of each department along 
--with their department number, department name, 
--employee number, last name, and first name.

select  departments.dept_no, 
		departments.dept_name--,
		--dept_manager.emp_no 
from departments
left join dept_manager	on dept_manager.dept_no  = departments.dept_no
left join employees 	on dept_manager.emp_no  = employees.emp_no



--Q5
select first_name as "first name",
	   last_name as "last name",
	   sex
from empolyees
where first_name = 'Hercules'
and   last_name like 'B%'

































