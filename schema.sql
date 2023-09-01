drop table empolyees;

CREATE TABLE empolyees(
    emp_no  INTEGER NOT NULL,
    emp_title_id varchar(10) NOT NULL,
	birth_date date,
	first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(20) NOT NULL,
	hire_date date,
    PRIMARY KEY (emp_no)
	);



select * from empolyees;
----
DROP TABLE titles;
 
CREATE TABLE titles (
    	title_id  VARCHAR(30) NOT NULL,
    	title VARCHAR(30) NOT NULL,
    	PRIMARY KEY (title_id)--, 
		--FOREIGN KEY (title_id) REFERENCES empolyees(emp_title_id)
		)
		;
select * from titles
------------
DROP TABLE salaries;		
		
CREATE TABLE salaries (
    	emp_no INTEGER NOT NULL,
    	salary INTEGER NOT NULL,
    	PRIMARY KEY (emp_no), 
		FOREIGN KEY (emp_no) REFERENCES empolyees(emp_no));
		
------------
DROP TABLE departments;		
		
CREATE TABLE departments (
    	dept_no VARCHAR(4) NOT NULL,
    	dept_name VARCHAR(30) NOT NULL,
    	PRIMARY KEY (dept_no)
		);
		
		
select * from departments;
------------	
DROP TABLE dept_emp		

CREATE TABLE dept_emp(
    	emp_no  INTEGER NOT NULL,
    	dept_no VARCHAR(10) NOT NULL,
    	PRIMARY KEY (emp_no, dept_no), 
		FOREIGN KEY (emp_no) REFERENCES empolyees(emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
		);
SELECT * FROM dept_emp;
------------------------	
DROP TABLE dept_manager;		

CREATE TABLE dept_manager(
    	dept_no VARCHAR(10)NOT NULL,
		emp_no  INTEGER NOT NULL,
    	PRIMARY KEY (dept_no,emp_no), 
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
		FOREIGN KEY (emp_no) REFERENCES empolyees(emp_no)
		);
		
select * from dept_manager;


		
		

		

		





CREATE TABLE animals_location (
  id SERIAL PRIMARY KEY,
  location VARCHAR(30) NOT NULL,
  animal_id INTEGER NOT NULL,
  FOREIGN KEY (animal_id) REFERENCES animals_all(id)

-- this table ref main table 
);