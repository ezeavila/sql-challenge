CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR	
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR
);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT
);

CREATE TABLE employees (
	emp_no INT, 
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

SELECT * from departments

-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01-01-86' and '12-31-86';

-- List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
WHERE employees.emp_no IN
(
  SELECT emp_no
  FROM dept_manager
  );

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no

-- List first name, last name, and sex 
-- for employees whose first name is "Hercules" and last names begin with "B."

SELECT emp_no, first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
WHERE dept_emp.emp_no IN
(
	SELECT dept_emp.emp_no
  	FROM departments
	INNER JOIN dept_emp ON
	dept_emp.dept_no=departments.dept_no
		WHERE dept_name = 'Sales'
	)

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
WHERE dept_emp.emp_no IN
(
	SELECT dept_emp.emp_no
  	FROM departments
	INNER JOIN dept_emp ON
	dept_emp.dept_no=departments.dept_no
		WHERE dept_name = 'Sales' OR dept_name = 'Development'
	)

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name

Select last_name, COUNT(emp_no)
 From   employees
 Group By last_name
 ORDER BY COUNT(emp_no) DESC;




