CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	PRIMARY KEY (emp_no)
);
	
SELECT *
FROM employees
LIMIT 5;

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL
);

SELECT *
FROM salaries
LIMIT 5;

CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT *
FROM titles
LIMIT 5;

ALTER TABLE employees ADD CONSTRAINT "fk_titles_title_id" 
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);
	
ALTER TABLE salaries ADD CONSTRAINT "pk_salaries_emp_no" 
	PRIMARY KEY (emp_no);

CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

SELECT *
FROM departments
LIMIT 5;

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT *
FROM dept_emp
LIMIT 5;

ALTER TABLE dept_emp ADD CONSTRAINT "pk_dept_emp_emp_no" 
	PRIMARY KEY (emp_no, dept_no);

CREATE TABLE dept_manager(
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM dept_manager
LIMIT 5;

ALTER TABLE dept_manager ADD CONSTRAINT "pk_dept_manager_emp_no" 
	PRIMARY KEY (emp_no);