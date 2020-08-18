-- For viewing tables, columns and values
SELECT * FROM Titles;

SELECT * FROM Departments;

SELECT * FROM Employees;

SELECT * FROM Salaries;

SELECT * FROM Department_Employees;

SELECT * FROM Department_Managers;

-- Data Analysis
-- Once you have a complete database, do the following:

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
  	salaries.salary
FROM employees
INNER JOIN salaries ON
	employees.emp_no = salaries.emp_no; 

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no,
	departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM employees
INNER JOIN department_managers ON
	employees.emp_no = department_managers.emp_no
INNER JOIN departments ON
	departments.dept_no = department_managers.dept_no;

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM employees
INNER JOIN department_employees ON
	employees.emp_no = department_employees.emp_no
INNER JOIN departments ON
	departments.dept_no = department_employees.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN department_employees ON
	employees.emp_no = department_employees.emp_no
INNER JOIN departments ON
	departments.dept_no = department_employees.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN department_employees ON
	employees.emp_no = department_employees.emp_no
INNER JOIN departments ON
	departments.dept_no = department_employees.dept_no
WHERE dept_name = 'Sales'
	OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(*) FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;

-- Bonus (Optional):
-- As you examine the data, you are overcome with a creeping suspicion that the dataset is fake.
-- You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee.
-- To confirm your hunch, you decide to take the following steps to generate a visualization of the data,
-- with which you will confront your boss:

-- Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all,
-- trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started.
-- Be sure to make any necessary modifications for your username, password, host, port, and database name:

FROM sqlalchemy IMPORT create_engine
engine = create_engine('postgresql://localhost:5432/sql-challenge')
CONNECTION = engine.connect()

-- Consult SQLAlchemy documentation for more information.

-- If using a password, do not upload your password to your GitHub repository.
-- See https://www.youtube.com/watch?v=2uaTPmNvH0I and https://help.github.com/en/github/using-git/ignoring-files
-- for more information.

-- Create a histogram to visualize the most common salary ranges for employees.

-- Create a bar chart of average salary by title.

-- Epilogue:
-- Evidence in hand, you march into your boss's office and present the visualization. With a sly grin,
-- your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number."
-- You look down at your badge to see that your employee ID number is 499942.

SELECT * FROM employees
WHERE emp_no = 499942;