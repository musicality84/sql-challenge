SELECT e.emp_no AS employee_number,
	e.first_name,
	e.last_name,
	e.sex,
	s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
	e.emp_no=s.emp_no;
	
SELECT first_name,
	last_name,
	hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;

SELECT m.emp_no AS employee_number,
	e.first_name,
	e.last_name,
	m.dept_no AS department_number,
	d.dept_name AS department_name
FROM dept_manager AS m
INNER JOIN employees AS e ON
	e.emp_no=m.emp_no
INNER JOIN departments AS d ON
	m.dept_no=d.dept_no;
	
SELECT e.emp_no AS employee_number,
	e.first_name,
	e.last_name,
	de.dept_no AS department_number,
	d.dept_name AS department_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
	e.emp_no=de.emp_no
INNER JOIN departments AS d ON
	de.dept_no=d.dept_no;
	
SELECT first_name,
	last_name,
	sex
FROM employees
WHERE first_name='Hercules'
	AND last_name LIKE 'B%';

SELECT emp_no AS sales_employee_number,
	first_name,
	last_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

SELECT e.emp_no AS employee_number,
	e.first_name,
	e.last_name,
	d.dept_name AS department_name
FROM employees as e
INNER JOIN dept_emp AS de ON
	e.emp_no=de.emp_no
INNER JOIN departments AS d ON
	d.dept_no=de.dept_no
WHERE d.dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales' OR dept_name = 'Development'
	);
	
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;