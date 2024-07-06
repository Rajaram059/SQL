create database [SQL Assignment 1]
use [SQL Assignment 1]

  create table EMPLOYEE
  (
     Employee_id int primary key,
	 First_Name varchar(40),
	 Last_Name varchar(40),
	 Salary int,
	 Joining_date date,
	 Department varchar(20)
	 )

	    insert into EMPLOYEE
	          values (1,'Anika','Arora',100000,'2002-02-14 9:00:00','HR')
	    insert into EMPLOYEE
	          values (2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin')
		insert into EMPLOYEE
			  values (3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR')
		insert into EMPLOYEE
			  values (4,'Susanth','singh',500000,'2020-02-17 9:00:00','Admin')
		insert into EMPLOYEE
			  values (5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin')
		insert into EMPLOYEE
			  values (6,'Dheraj','Diwan',200000,'2011-06-19 9:00:00','Account')
		insert into EMPLOYEE
			  values (7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account')
        insert into EMPLOYEE
	          values (8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin')

			  select * from EMPLOYEE
   create table [Employee Bonus]
     (
	  Employee_ref_id int foreign key references employee(Employee_id),
	  Bonus_amount int,
	  Bonus_Date date
	  )

	  insert into [Employee Bonus]
	     values (1,5000,'2020-02-16')
	  
	  insert into [Employee Bonus]
	     values (2,3000,'2011-06-16')
		 
	  insert into [Employee Bonus]
	     values (3,4000,'2020-02-16')
		 
	  insert into [Employee Bonus]
	     values (1,4500,'2020-02-16')
		 
	  insert into [Employee Bonus]
	     values (2,3500,'2011-06-16')
		 
		 select * from [Employee Bonus]
		 
create table [Employee Title]
    (
	Employee_ref_id int,
	Employee_title varchar (20),
	Affective_Date date
	)

	  insert into [Employee Title]
	    values (1,'Manager','2016-02-20')
		
	  insert into [Employee Title]
	    values (2,'Executive','2016-06-11')
     insert into [Employee Title]
	    values (8,'Executive','2016-06-11')
	insert into [Employee Title]
	    values (5,'Manager','2016-06-11')
     insert into [Employee Title]
	    values (4,'Asst.Manager','2016-06-11')
     insert into [Employee Title]
	    values (7,'Executive','2016-06-11')
		insert into [Employee Title]
	    values (6,'lead','2016-06-11')
	insert into [Employee Title]
	    values (3,'lead','2016-06-11')
		select * from [Employee Title]

--1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.

     select First_Name as Employee_name from EMPLOYEE;
--2 Display “LAST_NAME” from Employee table in upper case.

      select UPPER(Last_Name) as last_name from EMPLOYEE;
--3 Display unique values of DEPARTMENT from EMPLOYEE table.

    select Distinct(Department) from EMPLOYEE;
--4 Display the first three characters of LAST_NAME from EMPLOYEE table.

    select SUBSTRING(Last_Name,1,3) as Name from EMPLOYEE
--5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.

    select Distinct len(Department) from EMPLOYEE
--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.
--a space char should separate them.

      select CONCAT(First_Name,' ',Last_Name) as Full_Name from EMPLOYEE
--7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.

      select * from EMPLOYEE
	  order by First_Name asc
--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
    
	 select * from EMPLOYEE
	  order by First_Name asc,Department desc;
--9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.

        select * from EMPLOYEE where First_Name = 'VEENA' or First_Name ='KARAN' 
--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
   
      select * from EMPLOYEE where Department = 'Admin'
--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.

         select * from EMPLOYEE where First_Name like 'V%' 
--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.

       select * from EMPLOYEE where Salary between 100000 and 500000
--13 Display details of the employees who have joined in Feb-2020.

       select * from EMPLOYEE 
	   where year(Joining_date) like 2020 and MONTH(Joining_date) = 2
--14 Display employee names with salaries >= 50000 and <= 100000.

      select * from EMPLOYEE
	  where Salary >= 50000 and Salary <= 10000	  
--16 DISPLAY details of the EMPLOYEES who are also Managers.

       select * from EMPLOYEE E
	   full outer join
	   [Employee Title] ET on E.Employee_id = ET.Employee_ref_id
	   where Employee_title = 'Manager';
--17 DISPLAY duplicate records having matching data in some fields of a table.

    select * from [Employee Title]
	group by [Employee_title],[Affective_Date],[Employee_ref_id];
--18 Display only odd rows from a table.

      select * from EMPLOYEE
	  where Employee_id in (select Employee_id from EMPLOYEE where Employee_id%2<>0) 
--19 Clone a new table from EMPLOYEE table.

  select * into empoloyee_clone from EMPLOYEE
 select * from empoloyee_clone
--20 DISPLAY the TOP 2 highest salary from a table.

      select top 2 * from EMPLOYEE
	  order by Salary desc
--21. DISPLAY the list of employees with the same salary.

   select * from EMPLOYEE 
   where Salary in (select Salary from EMPLOYEE e where Employee.Employee_id<>e.Employee_id)
--22 Display the second highest salary from a table.

      select * from EMPLOYEE
	  order by Salary desc
	  offset 1 row
	  fetch next 1 row only
--23 Display the first 50% records from a table.
  
      select top 50 PERCENT * from EMPLOYEE
--24. Display the departments that have less than 4 people in it.

      select Department,COUNT(Employee_id) as [No of employees] from Employee
	  group by Department
	  having COUNT(Employee_id) < 4
	 
--25. Display all departments along with the number of people in there.

     
      select Department,COUNT(Employee_id) as [No of employees] from Employee
	  group by Department
--26 Display the name of employees having the highest salary in each department.

     select CONCAT(First_Name,' ',Last_Name) as Name,Department,Salary from EMPLOYEE
	 where Salary in (select MAX(Salary) from EMPLOYEE group by Department )
--27 Display the names of employees who earn the highest salary.

     select CONCAT(First_Name,' ',Last_Name) as Name from EMPLOYEE
	 where Salary in (select MAX(Salary) from EMPLOYEE group by Department)       
--28 Diplay the average salaries for each department

      select AVG(salary) as Avg_salary from EMPLOYEE group by Department
--29 display the name of the employee who has got maximum bonus

     select CONCAT(First_Name,' ',Last_Name) as Name from EMPLOYEE E
	 join
	  [Employee Bonus] EB on EB.Employee_ref_id = E.Employee_id
	  where Bonus_amount in (select MAX(Bonus_amount) from [Employee Bonus])
--30 Display the first name and title of all the employees

           select First_Name,Employee_title from EMPLOYEE E
		   join
		   [Employee Title] ET on ET.Employee_ref_id = E.Employee_id
