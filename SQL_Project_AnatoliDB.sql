--==================================================================--
--=======================SQL_Project_Anatolii=======================--
--==================================================================--

SELECT * FROM employees;
-- 1.	Write a query to display the employee id, employee name (first name and last name) for all employees who earn more than the average salary. 
SELECT employee_id, first_name || ' ' || last_name AS employee_name FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2.	Write a query to display the employee name (first name and last name), employee id, and salary of all employees who report to Payam. 
SELECT e.first_name || ' ' || e.last_name AS employee_name, e.employee_id, e.salary FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
WHERE m.first_name = 'Payam';

-- 3.	Write a query to display the department number, name (first name and last name), job_id and department name for all employees in the Finance department.
SELECT e.department_id, first_name || ' ' || e.last_name AS name, e.job_id, d.department_name FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE department_name = 'Finance';

-- 4.	Write a query to display all the information of the employees whose salary is within the range of the smallest salary and 2500.
SELECT * FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees)
AND salary < 2500;

-- 5.	Write a SQL query to find the first name, last name, department, city, and state province for each employee.
SELECT first_name, last_name, department_name AS department, city, state_province AS "state province" FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

-- 6.	Write a SQL query to find all those employees who work in department ID 80 or 40. Return first name, last name, department number, and department name.
SELECT e.first_name, e.last_name, e.department_id AS "department number", d.department_name FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id = 80
OR e.department_id = 40;

-- 7.	Write a query to display the employee name (first name and last name) and hire date for all employees in the same department as Clara. Exclude Clara.
SELECT employee_id, first_name || ' ' || last_name AS employee_name, hire_date FROM employees
WHERE hire_date = (SELECT hire_date FROM employees WHERE first_name = 'Clara')
AND department_id = (SELECT department_id FROM employees WHERE first_name = 'Clara')
AND first_name <> 'Clara';

-- 8.	Write a query to display the employee number, name (first name and last name), and salary for all employees who earn more than the average salary and who work in a department with any employee with a J in their name.
SELECT employee_id AS "employee number", first_name || ' ' || last_name AS employee_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees WHERE first_name LIKE '%J%' OR first_name LIKE '%J%');

-- 9.	Write a SQL query to find those employees whose first name contains the letter ‘z’. Return first name, last name, department, city, and state province.
SELECT e.first_name, e.last_name, d.department_name AS department, l.city, l.state_province FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.first_name LIKE '%z%';

-- 10.	Write a SQL query to find all departments, including those without employees. Return first name, last name, department ID, department name.
SELECT e.first_name, e.last_name, d.department_id, d.department_name FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id;

-- 11.	Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is smaller than any salary of those employees whose job title is MK_MAN.
SELECT employee_id, first_name || ' ' || last_name AS name, job_id AS "job title" FROM employees
WHERE salary < (SELECT salary FROM employees WHERE job_id = 'MK_MAN');

-- 12.	Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is more than any salary of those employees whose job title is PU_MAN. Exclude job title PU_MAN.
SELECT employee_id, first_name || ' ' || last_name AS name, job_id AS "job title" FROM employees
WHERE salary > (SELECT salary FROM employees WHERE job_id = 'PU_MAN')
AND job_id <> 'PU_MAN';

-- 13.	Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is more than any average salary of any department.
SELECT employee_id, first_name || ' ' || last_name AS name, job_id AS "job title" FROM employees
WHERE salary > (SELECT MAX(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employees GROUP BY department_id));

-- 14.	Write a query to display the department id and the total salary for those departments which contains at least one employee.
SELECT department_id, SUM(salary) AS "total salary" FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 1;

-- 15.	Write a SQL query to find the employees who earn less than the employee of ID 182. Return first name, last name and salary.
SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT salary FROM employees WHERE employee_id = 182);

-- 16.	Write a SQL query to find the employees and their managers. Return the first name of the employee and manager.
SELECT e.first_name, m.first_name FROM employees e JOIN employees m
ON e.manager_id = m.employee_id;



SELECT * FROM employees; 