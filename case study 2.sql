CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB1 (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)

--1. List all the employee details.
  
  select * from EMPLOYEE
  
--2. List all the department details.
  
   select * from DEPARTMENT

--3. List all job details.

    select * from JOB

--4. List all the locations.
select * from LOCATION
      

--5. List out the First Name, Last Name, Salary, Commission for allEmployees.

      select FIRST_NAME, LAST_NAME, Salary, COMM from EMPLOYEE

--6. List out the Employee ID, Last Name, Department ID for all employeesandalias
--    Employee ID as "ID of the Employee", Last Name as "Name of theEmployee", Department ID as "Dep_id".

  
     select EMPLOYEE_ID as [ID of the Employee],LAST_NAME as [Name of theEmployee],
	 DEPARTMENT_ID as[Dep_id] from EMPLOYEE

--7. List out the annual salary of the employees with their names only

select CONCAT(first_name,' ',middle_name,' ',last_name) as names,salary*12 as [annual salary]
  from EMPLOYEE

----WHERE Condition:
--1. List the details about "Smith".
  
     select * from EMPLOYEE where LAST_NAME = 'smith';
	 
--2. List out the employees who are working in department 20.

         select * from EMPLOYEE where DEPARTMENT_ID=20
		 
--3. List out the employees who are earning salaries between 3000and4500.

         select * from EMPLOYEE where SALARY between 3000 and 4500;
--4. List out the employees who are working in department 10 or 20.
 
       select * from EMPLOYEE where DEPARTMENT_ID = 10 or DEPARTMENT_ID = 20;
--5. Find out the employees who are not working in department 10 or 30. 

      select * from EMPLOYEE where DEPARTMENT_ID <> 10 or DEPARTMENT_ID <> 30;
--6. List out the employees whose name starts with 'S'.

      select *  from EMPLOYEE where LAST_NAME like 's____';   
--7. List out the employees whose name starts with 'S' and ends with 'H'.

       select * from EMPLOYEE where LAST_NAME like 's%H';
--8. List out the employees whose name length is 4 and start with 'S'.

       select * from EMPLOYEE where LAST_NAME = 's%' and len(LAST_NAME) = 4;
--9. List out employees who are working in department 10 and draw salaries more than 3500.

      select * from EMPLOYEE where DEPARTMENT_ID = 30 and SALARY > 2000;
--10. List out the employees who are not receiving commission.

     select * from EMPLOYEE where COMM is null;
--ORDER BY Clause:
--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.

         select EMPLOYEE_ID,LAST_NAME from EMPLOYEE 
		 order by EMPLOYEE_ID asc;
--2. List out the Employee ID and Name in descending order based onsalary.

            select EMPLOYEE_ID,FIRST_NAME,SALARY from EMPLOYEE
			order by SALARY,FIRST_NAME desc;
--3. List out the employee details according to their Last Name in ascending-order.

        select * from EMPLOYEE order by LAST_NAME asc;
--4. List out the employee details according to their Last Name in ascending order 
--and then Department ID in descending order. 

           select * from EMPLOYEE order by LAST_NAME asc,DEPARTMENT_ID desc
--GROUP BY and HAVING Clause:
--1. How many employees are in different departments in the organization?

       select DEPARTMENT_ID,COUNT(*) as empolycount from EMPLOYEE
	   group by DEPARTMENT_ID
--2. List out the department wise maximum salary, minimum salary and average salary
--of the employees. 

       select  DEPARTMENT_ID,MAX(salary) as maximum_salary,MIN(salary) as minimum_salary,AVG(salary) as
	    average_salary from EMPLOYEE group by DEPARTMENT_ID;
--3. List out the job wise maximum salary, minimum salary and averagesalary of the employees. 

         select  JOB_ID,MAX(salary) as maximum_salary,MIN(salary) as minimum_salary,AVG(salary) as
	    average_salary from EMPLOYEE group by JOB_ID;
--4. List out the number of employees who joined each month in ascending order.
 
      select count(EMPLOYEE_ID) as No_of_employee,datename(MONTH,HIRE_DATE) as month from EMPLOYEE
	  group by datename(MONTH,HIRE_DATE);
--5. List out the number of employees for each month and year in ascending 
--order based on the year and month.
       select count(EMPLOYEE_ID) as No_of_employee,DATENAME(month,HIRE_DATE) as month,YEAR(HIRE_DATE) as year 
	   from EMPLOYEE group by datename(MONTH,HIRE_DATE),YEAR(HIRE_DATE)
	   order by datename(MONTH,HIRE_DATE),YEAR(HIRE_DATE);
--6. List out the Department ID having at least four employees.

       select count(EMPLOYEE_ID) as COUNT_EMPLOYEE_ID,DEPARTMENT_ID  from EMPLOYEE
	   group by DEPARTMENT_ID 
	   having COUNT(EMPLOYEE_ID)>= 4;
--7. How many employees joined in the month of January?
    
	  select COUNT(EMPLOYEE_ID) as COUNT_EMPLOYEE_ID,MONTH(HIRE_DATE) as month 
	  from EMPLOYEE group by MONTH(HIRE_DATE)
	  having MONTH(HIRE_DATE) = 4;
--8. How many employees joined in the month of January orSeptember?

      select COUNT(EMPLOYEE_ID) as COUNT_EMPLOYEE_ID,MONTH(HIRE_DATE) as month 
	  from EMPLOYEE group by MONTH(HIRE_DATE)
	  having MONTH(HIRE_DATE) in (4,9);
           
--9. How many employees joined in 1985?

      select COUNT(EMPLOYEE_id) as COUNT_EMPLOYEE_ID from EMPLOYEE
	  group by YEAR(HIRE_DATE)
	   having YEAR(HIRE_DATE) = 1985;
--10. How many employees joined each month in 1985?

      select COUNT(EMPLOYEE_id) as COUNT_EMPLOYEE_ID,DATENAME(month,HIRE_DATE) as month
	  from EMPLOYEE
	  group by YEAR(HIRE_DATE),DATENAME(month,HIRE_DATE)
	   having YEAR(HIRE_DATE) = 1985;
--11. How many employees joined in March 1985?
      
      select COUNT(EMPLOYEE_id) as COUNT_EMPLOYEE_ID,DATENAME(month,HIRE_DATE) as month
	  from EMPLOYEE
	  group by YEAR(HIRE_DATE),DATENAME(month,HIRE_DATE)
	   having YEAR(HIRE_DATE) = 1985 and DATENAME(month,HIRE_DATE) = 'march';
--12. Which is the Department ID having greater than or equal to 3 employees 
--joining in April 1985?

      select DEPARTMENT_ID from EMPLOYEE 
	  group by YEAR(HIRE_DATE),DATENAME(month,HIRE_DATE),DEPARTMENT_ID
	   having YEAR(HIRE_DATE) = 1985 and DATENAME(month,HIRE_DATE) = 'june'
	   and COUNT(EMPLOYEE_ID) >= 1;        

--Joins:
--1. List out employees with their department names.

   select * from EMPLOYEE E
   join
   DEPARTMENT D on E.DEPARTMENT_ID = D.Department_Id 
--2. Display employees with their designations.

         select CONCAT(FIRST_NAME,' ',MIDDLE_NAME,' ',LAST_NAME) as Name,DESIGNATION from EMPLOYEE E
		  join
		  JOB J on J.JOB_ID = E.JOB_ID;
--3. Display the employees with their department names and regional groups.

    select CONCAT(FIRST_NAME,' ',MIDDLE_NAME,' ',LAST_NAME) as Name,D.Name,L.city from EMPLOYEE E
	join
	DEPARTMENT D on E.DEPARTMENT_ID = D.Department_Id
	join
	LOCATION L on D.Location_Id = L.Location_ID;
--4. How many employees are working in different departments? Display with department names.

     select COUNT(EMPLOYEE_ID) as employees,D.Name from EMPLOYEE E 
	 join
	 DEPARTMENT D on E.department_id = D.department_id
	 group by D.Name;
--5. How many employees are working in the sales department?

     select COUNT(EMPLOYEE_ID) as employees,D.Name from EMPLOYEE E 
	 join
	 DEPARTMENT D on E.department_id = D.department_id
	 where Name like 'sales'
	 group by D.Name;
--6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order.

    select D.Name,COUNT(E.FIRST_NAME) as employees from DEPARTMENT D
	join 
	EMPLOYEE E on D.Department_Id = E.DEPARTMENT_ID
	group by D.Name
	having COUNT(E.FIRST_NAME) >= 5
	order by D.Name asc;
--7. How many jobs are there in the organization? Display with designations.

     select count(FIRST_NAME) as [NO.OF JOBS],J.DESIGNATION from EMPLOYEE E
	  join
	  JOB J on E.JOB_ID = J.JOB_ID
	  group by J.DESIGNATION
--8. How many employees are working in "New York"?

     select COUNT(E.EMPLOYEE_ID) as employees from EMPLOYEE E
	 join 
	 DEPARTMENT D on D.Department_Id = E.Department_Id
	 join
	 LOCATION L on D.Location_Id = L.Location_ID
	 where L.City = 'New York'
--9. Display the employee details with salary grades. Use conditional statement to create a grade column. 

     select *,case
	                when salary > 2000 then 'A'
					when salary between 1000 and 2000 then 'B'
					else 'c'
					end as grades from EMPLOYEE;
--10. List out the number of employees grade wise. Use conditional statement to create a grade column. 

     select case
	                when salary > 2000 then 'A'
					when salary between 1000 and 2000 then 'B'
					else 'c'
					end as grades,COUNT(EMPLOYEE_ID) as employee from EMPLOYEE
					group by case		           
	                when salary > 2000 then 'A'
					when salary between 1000 and 2000 then 'B'
					else 'c'
					end 
--11.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary. 

            
     select case
	                when salary > 2000 then 'A'
					when salary between 1000 and 2000 then 'B'
					else 'c'
					end as grades,COUNT(EMPLOYEE_ID) as employee from EMPLOYEE
					where SALARY between 2000 and 5000
					group by case
						when salary > 2000 then 'A'
					when salary between 1000 and 2000 then 'B'
					else 'c'
					end 
--12. Display all employees in sales or operation departments.
     
	   select * from EMPLOYEE E
	   join
	   DEPARTMENT D on E.DEPARTMENT_ID = D.Department_Id
	   where   D.Name = 'sales' or D.Name = 'operation'
--SET Operators:
--1. List out the distinct jobs in sales and accounting departments.
 

		 select designation from Job
	where Job_ID = (select Job_ID from employee where department_id in (select department_id from department where Name ='Sales'))
	union
	select designation from Job
	where Job_ID = (select Job_ID from employee where department_id in (select department_id from department where Name ='Accounting'))
 
--2. List out all the jobs in sales and accounting departments. 

        		 select designation from Job
	where Job_ID = (select Job_ID from employee where department_id in (select department_id from department where Name ='Sales'))
	union all
	select designation from Job
	where Job_ID = (select Job_ID from employee where department_id in (select department_id from department where Name ='Accounting'))
          
--3. List out the common jobs in research and accounting departments in ascending order.

        		 select designation from Job
	where Job_ID in (select Job_ID from employee where department_id in (select department_id from department where Name ='research'))
	intersect
	select designation from Job
	where Job_ID in (select Job_ID from employee where department_id in (select department_id from department where Name ='Accounting'))
     
--Subqueries:
--1. Display the employees list who got the maximum salary.

     select * from EMPLOYEE
	 where SALARY in (select MAX(SALARY) from EMPLOYEE)
--2. Display the employees who are working in the sales department.
    	 
     select * from EMPLOYEE
	 where DEPARTMENT_ID in (select DEPARTMENT_ID from DEPARTMENT where Name = 'sales')
--3. Display the employees who are working as 'Clerk'.

      select * from EMPLOYEE E
	  join
	  JOB J on j.JOB_ID = E.JOB_ID
        where J.DESIGNATION = 'clerk'
--4. Display the list of employees who are living in "New York".

        select * from EMPLOYEE E 
		join 
		DEPARTMENT D on E.DEPARTMENT_ID = D.Department_Id
		join 
		LOCATION L on L.Location_ID = D.Location_Id
		where city = 'new york'
--5. Find out the number of employees working in the sales department.

      select COUNT(EMPLOYEE_ID) as [Number of employees] from EMPLOYEE E
	  join 
	  DEPARTMENT D on D.Department_Id = E.DEPARTMENT_ID
	  where D.Name = 'sales'
--6. Update the salaries of employees who are working as clerks on the basis of 10%.

        update EMPLOYEE
		set SALARY = SALARY*1.10
		where JOB_ID in (select JOB_ID from JOB where DESIGNATION = 'clerk')
		select * from EMPLOYEE
--7. Delete the employees who are working in the accounting department.
 
        delete EMPLOYEE
		where DEPARTMENT_ID in (select DEPARTMENT_ID from DEPARTMENT where Name = 'Accounting')
		select * from EMPLOYEE
--8. Display the second highest salary drawing employee details.

        select * from EMPLOYEE
		order by SALARY desc
		offset 1 row
		fetch next 1 row only
--9. Display the nth highest salary drawing employee details.

        select * from EMPLOYEE
		order by SALARY desc;
--10. List out the employees who earn more than every employee in department 30.

        select * from EMPLOYEE
		where SALARY > (select MAX(SALARY) from EMPLOYEE where DEPARTMENT_ID = 30)
--11. List out the employees who earn more than the lowest salary in department.Find out whose department has no employees. 


		select * from EMPLOYEE
		where SALARY > (select MIN(SALARY) from EMPLOYEE)
		
		select d.Department_Id,D.Name from department d
		left outer join employee e
		on
		d.Department_Id=e.department_id
		where e.department_id is null


--12. Find out which department has no employees.

        select d.Department_Id,D.Name from department d
		left outer join employee e
		on
		d.Department_Id=e.department_id
		where e.department_id is null
  
--13. Find out the employees who earn greater than the average salary for their department.

    select * from EMPLOYEE
	  where SALARY > (select AVG(SALARY) from EMPLOYEE );

	  select * from EMPLOYEE
SELECT firs_name NTILE() OVER (ORDER by salary) from employee
SELECT <col_name> NTILE(2) OVER (ORDER by <col_name>) from table
SELECT NTILE() <col_name> OVER (ORDER by <col_name>) from table
SELECT NTILE() <col_name> OVER (ORDER by <col_name>) from table