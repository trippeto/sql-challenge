-- Data Engineering
-- Use the information you have to create a table schema for each of the six CSV files.
-- Remember to specify data types, primary keys, foreign keys, and other constraints.

-- For the primary keys check to see if the column is unique, otherwise create a composite key.
-- Which takes to primary keys in order to uniquely identify a row.
-- Be sure to create tables in the correct order to handle foreign keys.

-- Import each CSV file into the corresponding SQL table. Note be sure to import the data in the same order 
-- that the tables were created and account for the headers when importing to avoid errors.

-- Building tables
CREATE TABLE Titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Employees (
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date VARCHAR NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL
);

CREATE TABLE Department_Employees (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR NOT NULL
);

CREATE TABLE Department_Managers (
    dept_no VARCHAR NOT NULL,
    emp_no INTEGER NOT NULL
);

-- Adding constraints for Primary and Foreign keys
ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Managers ADD CONSTRAINT fk_Department_Managers_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Managers ADD CONSTRAINT fk_Department_Managers_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

-- For viewing tables, columns and values
SELECT * FROM Titles;

SELECT * FROM Departments;

SELECT * FROM Employees;

SELECT * FROM Salaries;

SELECT * FROM Department_Employees;

SELECT * FROM Department_Managers;

