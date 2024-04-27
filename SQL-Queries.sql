 /*CREATE TABLE Studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )

INSERT INTO Studies values
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA ',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000);

select * from Studies

CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)


INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);


 select * from Software


 CREATE TABLE Programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)

INSERT INTO Programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800),
('QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

select * from Programmer */


--*********************************************************************************************************************

--1. Find out the selling cost average for packages developed in Pascal.	

 select Avg(scost) as 'selling cost average'  from software
  where DEVELOPIN='pascal';

--*********************************************************************************************************************

--2. Display the names and ages of all programmers.

  SELECT PNAME, DATEDIFF (year,DOB,GETDATE()) AS age FROM Programmer; 

--*********************************************************************************************************************

--3. Display the names of those who have done the DAP Course.
 
  select pname from Studies where COURSE = 'dap';
 
 --************************************************************************************************************************

 --4. Display the names and date of birth of all programmers born in January.

   select pname,dob from Programmer where MONTH(dob)=1;
   
--****************************************************************************************************************************

--5. What is the highest number of copies sold by a package?

  select max(sold) as Highest_copies from Software ;

--***********************************************************************************************************

--6. Display lowest course fee.

  select MIN(course_fee) as lowest_fee from Studies;
 
 --*********************************************************************************************************

 --7. How many programmers have done the PGDCA Course?

   select COUNT(pname) from Studies where COURSE = 'PGDCA';

--*************************************************************************************************

 --8. How much revenue has been earned through sales of packages developed in C?

  select sum(scost) as revenue_by_c from Software where DEVELOPIN='c';

--****************************************************************************************************

--9. Display the details of the software developed by Ramesh.

select * from Software where pname='ramesh';


--**********************************************************************************************

--10. How many programmers studied at Sabhari?

 select COUNT(pname) as PSS from Studies where INSTITUTE='Sabhari';

--************************************************************************************************************

--11. Display details of packages whose sales crossed the 2000 mark.

select *,SCOST*SOLD as sales from Software where SCOST*sold<2000;

--************************************************************************************************************

--12. Display the details of packages for which development costs have been recovered.

   select *,(SCOST*sold-DCOST*sold) as recovered_cost from Software where SCOST*sold > DCOST*sold;

--**************************************************************************************************************

--13. What is the cost of the costliest software development in Basic?


 select max(dcost) as CSD from Software where DEVELOPIN='basic';


--**************************************************************************************************************

--14. How many packages have been developed in dBase?

  select COUNT(TITLE) as dbase_count from Software where DEVELOPIN = 'dbase'; 
  
--**************************************************************************************************************

--15. How many programmers studied in Pragathi?
  
  select COUNT(pname) as PSP from Studies where institute='Pragathi';

--**************************************************************************************************************

--16. How many programmers paid 5000 to 10000 for their course?

 select COUNT(PNAME) PPC from Studies where COURSE_FEE between 5000 and 10000; 

--**************************************************************************************************************

--17. What is the average course fee?

  select AVG(course_fee) as 'Avg' from Studies;

--**************************************************************************************************************

--18. Display the details of the programmers knowing C.
 
  select *  from programmer where PROF1 = 'C' or PROF2 = 'C';


--*********************************************************************************************

--19. How many programmers know either COBOL or Pascal?

 select COUNT(pname) as p_count from Programmer where  PROF1='pascal' or PROF2='cobol' or PROF1='cobol' or PROF2='pascal';
                                                                                               
--***************************************************************************************************

--20. How many programmers don’t know Pascal and C?

    select count(pname) p_count from Programmer 
	 where PROF2 not like 'c' and PROF1 not like 'c' and PROF2 not like 'pascal'
	 and PROF1 not like 'pascal';

--***************************************************************************************************
		 
--21. How old is the oldest male programmer?
  
    select top 1 DATEDIFF (year,DOB,GETDATE()) as op from Programmer 
     where GENDER = 'm'
     order by DATEDIFF (year,DOB,GETDATE()) desc
    
--***************************************************************************************************

--22. What is the average age of female programmers?

   select AVG(DATEDIFF (year,DOB,GETDATE())) as avg_female from Programmer 
     where GENDER ='f';
  
--***************************************************************************************************
 
--23. Calculate the experience in years for each programmer and display with

 -- their names in descending order.

       select pname,DATEDIFF (year,DOJ,GETDATE()) as experience_years from Programmer 
	  order by DATEDIFF (year,DOJ,GETDATE()) desc;

--***************************************************************************************************

--24. Who are the programmers who celebrate their birthdays during the 
--  current month?
   
    select pname from Programmer where MONTH(dob) = 8;
    
--***************************************************************************************************

--25. How many female programmers are there?

   select count(gender) as fp_count from Programmer where gender ='f';
   
--***************************************************************************************************

--26. What are the languages studied by male programmers?

   select prof1,prof2 from Programmer where GENDER='m'
   
--***************************************************************************************************

--27. What is the average salary?

   select AVG(salary) as avg_salary from Programmer;
   
--***************************************************************************************************

--28. How many people draw a salary between 2000 to 4000?

    select count(pname) as cp from Programmer where SALARY between 2000 and 4000;
   
--***************************************************************************************************

--29. Display the details of those who don’t know Clipper, COBOL or Pascal.
   
    select * from Programmer where PROF1 <>  'clipper' 
	 and PROF2 <> 'clipper'  and PROF1 <> 'cobol' 
	 and PROF2 <> 'cobol' and prof1 <> 'pascal' 
	 and PROF2 <>'pascal';

--***************************************************************************************************

--30. Display the cost of packages developed by each programmer.

   select pname,TITLE,sum(dcost) as CP from Software group by PNAME,TITLE;

--**************************************************************************************************

--31. Display the sales value of the packages developed by each programmer.

  select pname,TITLE,sum(scost*sold) as sales from Software group by PNAME,TITLE;

--****************************************************************************************************

--32. Display the number of packages sold by each programmer.

 select COUNT(sold) as p_sold from Software group by PNAME;

--******************************************************************************************************

--33. Display the sales cost of the packages developed by each programmer language wise.

  select DEVELOPIN,sum(SCOST) as sales_cost from Software group by DEVELOPIN;

--******************************************************************************************************

--34. Display each language name with the average development cost,average selling cost
--and average price per copy.

 select DEVELOPIN,avg(dcost) as ADC ,avg(scost) as 'ASC' ,avg(scost) as APC 
 from software group by DEVELOPIN; 

--********************************************************************************************************

--35. Display each programmer’s name and the costliest and cheapest packages developed by him or her.

select pname, max(DEVELOPIN) as costliest,max(DCOST),MIN(DEVELOPIN) as cheapest,min(DCOST) 
from Software group by PNAME;

--**************************************************************************************************************

--36. Display each institute’s name with the number of courses and the average cost per course.


  select INSTITUTE,count(COURSE) as No_of_courses,Avg(COURSE_FEE) as avg_per_course from Studies group by INSTITUTE;

--*********************************************************************************************************** 

--37. Display each institute’s name with the number of students.

  select INSTITUTE,COUNT(PNAME) as No_of_students from Studies group by INSTITUTE;

--************************************************************************************************************

--38. Display names of male and female programmers along with their genders.

  select PNAME,GENDER from Programmer order by GENDER desc;

--**********************************************************************************************************

--39. Display the name of programmers and their packages.
 
   select PNAME,SALARY from Programmer order by salary desc;
   
--*************************************************************************************************************

--40. Display the number of packages in each language except C and C++.
  
  select count(TITLE) as No_of_packages from Software where DEVELOPIN <> 'c' and DEVELOPIN <>'cpp';

--************************************************************************************************************

--41. Display the number of packages in each language for which development cost is less than 1000.
  
  select DEVELOPIN,count(TITLE) as No_of_packages from Software where DCOST < 1000  group by DEVELOPIN;

--***************************************************************************************************************

--42. Display the average difference between SCOST and DCOST for each package.
  
  select DEVELOPIN,avg(SCOST-DCOST),TITLE from Software group by DEVELOPIN,TITLE; 
 
--****************************************************************************************************************

--43. Display the total SCOST, DCOST and the amount to be recovered for
 --each programmer whose cost has not yet been recovered.
 
  select SCOST*sold as Total_SCOST,DCOST*SOLD as Total_DCOST,(SCOST*sold-DCOST*sold) Not_recovered 
     from Software where  DCOST*sold < SCOST*sold;

--************************************************************************************************************************

--44. Display the highest, lowest and average salaries for those earning more than 2000.
 
	 select max(SALARY) as Highest,MIN(SALARY) as Lowest,avg(SALARY) as Average from Programmer 
	  where SALARY > 2000;

--**********************************************************************************************************
 
--45. Who is the highest paid C programmer?
  
   select top 1 PNAME from Software where DEVELOPIN='c' order by DCOST desc;

--**************************************************************************************************************  

--46. Who is the highest paid female COBOL programmer?

   select top 1 PNAME from Programmer where PROF1 ='cobol' or PROF2='cobol'  and GENDER='f'; 
    
--**************************************************************************************************************

--47. Display the names of the highest paid programmers for each language.
 
with Highsal as
(select s.developin as [Language] ,s.pname as Pname,p.salary as Sal ,
row_number() over(partition by s.developin order by p.salary desc) as rownumber
from Software as S
inner join Programmer as P
on
S.PNAME=P.PNAME)
select Language,Pname,Sal from Highsal where rownumber =1


--****************************************************************************************************************************

--48. Who is the least experienced programmer?
   
	  select top 1 pname,DATEDIFF (year,DOJ,GETDATE()) as least_experience_years from Programmer 
	  order by DATEDIFF (year,DOJ,GETDATE()) asc;
	  
--****************************************************************************************************************************

--49. Who is the most experienced male programmer knowing PASCAL?
     	   
	   select top 1 pname,PROF1,PROF2,GENDER,DATEDIFF (year,DOJ,GETDATE()) as least_experience_years from Programmer 
	   where PROF1='pascal' or PROF2='pascal' and GENDER='m'
	   order by DATEDIFF (year,DOJ,GETDATE()) desc;

--******************************************************************************************************************,******
	  
--50. Which language is known by only one programmer?

 SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1
 HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1
 UNION 
 SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1;

--******************************************************************************************************************,******
--51. Who is the above programmer referred in 50?
 
  SELECT PNAME,DATEDIFF(YEAR,DOB,GETDATE()) as Age FROM Programmer
  WHERE DATEDIFF(YEAR,DOB,GETDATE()) between 50 and 60
  order by DATEDIFF(YEAR,DOB,GETDATE())
    
--***************************************************************************************************************************

--52. Who is the youngest programmer knowing dBase?
 
    select top 1 PNAME,(DATEDIFF(YEAR,DOB,GETDATE())) as age,PROF1,PROF2 from Programmer
	 where PROF1='dbase' or PROF2='dbase'
	 order by DATEDIFF(YEAR,DOB,GETDATE()) asc

--***************************************************************************************************************************

--53. Which female programmer earning more than 3000 does not know C, C++, Oracle or dBase?

	  select pname,salary,GENDER,prof1,prof2 from Programmer
	  where GENDER='f' and SALARY>3000 and PROF1 <> 'c' and PROF1 <>'cpp' and PROF1 <> 'oracle'
	  and PROF1 <>'dbase' and PROF2 <> 'c' and PROF2 <>'cpp' and PROF2 <> 'oracle'and PROF2 <>'dbase'
	  group by GENDER,PNAME,SALARY,PROF1,PROF2;

--*******************************************************************************************************

--54. Which institute has the most number of students?

	 select top 1 institute,COUNT(PNAME) as No_of_students from Studies group by INSTITUTE
	   order by No_of_students desc;

--********************************************************************************************************

--55. What is the costliest course?
  
	  select top 1 COURSE,MAX(COURSE_FEE) as COURSE_FEE from Studies group by COURSE 
	  order by COURSE_FEE desc;

--******************************************************************************************************

--56. Which course has been done by the most number of students?

   	 select top 1 COURSE,COUNT(PNAME) as No_of_students from Studies group by COURSE 
	 order by No_of_students desc;

--******************************************************************************************************

--57. Which institute conducts the costliest course?
    
	  select top 1 COURSE,INSTITUTE,MAX(COURSE_FEE) as COURSE_FEE from Studies 
	  group by COURSE,INSTITUTE 
	  order by COURSE_FEE desc;

--*************************************************************************************************************

--58. Display the name of the institute and the course which has below average course fee.

		 select INSTITUTE,COURSE,COURSE_FEE from Studies 
		 where (select AVG(course_fee) from Studies) > COURSE_FEE
		 group by COURSE,INSTITUTE,COURSE_FEE
		 order by COURSE_FEE desc;

--*****************************************************************************************************

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the average fee.
  
     select COURSE from Studies 
 	 where COURSE_FEE < ( select AVG(course_fee) + 1000 from Studies)
	 and course_fee > (select AVG(course_fee) - 1000 from Studies);

--*********************************************************************************************************

--60. Which package has the highest development cost?

    select top 1 TITLE,DEVELOPIN,DCOST as COST from Software 
	group by DEVELOPIN,TITLE,DCOST
	order by DCOST desc;

--*********************************************************************************************************

--61. Which course has below average number of students?
     
	 select COURSE,count(PNAME) as No_of_students from Studies
	 where (select COUNT(PNAME) from Studies) < (select AVG(No_of_students) from 
	(select COURSE,count(PNAME) as No_of_students from Studies group by COURSE)as course_count)
     group by COURSE
	 order by No_of_students desc;

--**************************************************************************************************************

--62. Which package has the lowest selling cost?
    
	 select top 1 TITLE,Developin,scost from Software
	 group by DEVELOPIN,TITLE,SCOST
	 order by SCOST asc;

--***********************************************************************************************************

--63. Who developed the package that has sold the least number of copies?
   
     select top 1 TITLE,SOLD from Software
	 group by TITLE,developin,sold
	 order by SOLD asc;

--***********************************************************************************************************

--64. Which language has been used to develop the package which has the highest sales amount?

    select top 1 DEVELOPIN,TITLE,MAX(DCOST) as d_cost from Software
	group by DEVELOPIN,TITLE
	order by d_cost desc;

--******************************************************************************************************************

--65. How many copies of the package that has the least difference between
--development and selling cost were sold?

	  select top 1 TITLE,SOLD,((DCOST*sold) -(SCOST*SOLD)) as diff_amount from Software
	   order by diff_amount asc;

--*********************************************************************************************************************

--66. Which is the costliest package developed in Pascal?

      select top 1 TITLE,MAX(DCOST)as Amount from Software where DEVELOPIN='pascal'
	  group by TITLE
	  order by Amount desc

--***********************************************************************************************************

--67. Which language was used to develop the most number of packages?

    select top 1 TITLE,count(DEVELOPIN) as COUNT from Software group by TITLE
	order by count desc; 
--*************************************************************************************************************
--68. Which programmer has developed the highest number of packages?

       select top 1 PNAME,count(TITLE) as No_of_packages  from Software
	   group by PNAME
	   order by No_of_packages desc;
--*****************************************************************************************************************
--69. Who is the author of the costliest package?

       select top 1 PNAME,TITLE from Software
	   order by DCOST desc;
--******************************************************************************************************************
--70. Display the names of the packages which have sold less than the average 
--number of copies.

        select TITLE,SOLD  from Software where SOLD < ( select Avg(sold) from Software)
--******************************************************************************************************************
--71. Who are the authors of the packages which have recovered more than
--double the development cost?
    SELECT  distinct PNAME, Developin 
      FROM SOFTWARE 
     WHERE SOLD*SCOST > 2*DCOST

--*****************************************************************************************************
--72. Display the programmer names and the cheapest packages developed by them in 
--each language.
 
SELECT PNAME,DEVELOPIN ,Title,DCOST
FROM SOFTWARE 
WHERE Dcost in (select min(Dcost) from software
group by Developin);
--****************************************************************************************************************************8
--73. Display the language used by each programmer to develop the highest
--selling and lowest selling package.

SELECT PNAME, DEVELOPIN,DCOST FROM SOFTWARE 
WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
union
SELECT PNAME, DEVELOPIN,DCOST FROM SOFTWARE 
WHERE SOLD IN (SELECT min(SOLD) FROM SOFTWARE GROUP BY PNAME)
--****************************************************************************************************************************************
--74. Who is the youngest male programmer born in 1965?

      SELECT top 1 PNAME,min(month(DOB)) as dob FROM Programmer
	  where YEAR(DOB) = 1965 and GENDER = 'm'
	  group by PNAME,DOB
	  order by DOB asc;
--******************************************************************************************************************************************
--75. Who is the oldest female programmer who joined in 1992?

      SELECT top 1 PNAME,year(DOB) as age FROM Programmer
	  where YEAR(DOJ) = 1992 and GENDER = 'f'
	  group by PNAME,DOB
	  order by DOB desc;
--***************************************************************************************************************************
--76. In which year was the most number of programmers born?

			 select top 1 YEAR(DOB) as age,COUNT(YEAR(DOB)) as count from Programmer
			 group by year(DOB)
			 order by COUNT(*) desc;
--************************************************************************************************************************
--77. In which month did the most number of programmers join?

     select top 3 month(DOB) as month,COUNT(month(DOB)) as count from Programmer
			 group by month(DOB)
			 order by COUNT(*) desc;
--*******************************************************************************************************************************
--78. In which language are most of the programmer’s proficient?

	   select top 2 PROF1,PROF2,COUNT(PNAME) as count from Programmer
	   group by PROF1,PROF2
	   order by count desc;
--******************************************************************************************************************
--79. Who are the male programmers earning below the average salary of female programmers?

     select PNAME,SALARY,GENDER from Programmer 
	 where gender like 'm' and SALARY < (select avg(SALARY) from Programmer where GENDER like 'f')
--*******************************************************************************************************************
--80. Who are the female programmers earning more than the highest paid?

       SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY > (SELECT(MAX(SALARY)) FROM PROGRAMMER WHERE GENDER = 'M');
--*****************************************************************************************************************************
--81. Which language has been stated as the proficiency by most of the programmers?

      select top 2 PROF1,PROF2,COUNT(PNAME) as count from Programmer
	  group by PROF1,PROF2 
	  order by count desc;
--**************************************************************************************************************************************       
--82. Display the details of those who are drawing the same salary.
       
Select * From PROGRAMMER 
Where Salary = any (Select Salary From PROGRAMMER 
Group by Salary
Having Count(PNAME ) > 1)
order by Salary asc;
--*********************************************************************************************************************************************
--83. Display the details of the software developed by the male programmers earning more than 3000.

     select * from Software S join Programmer P on S.PNAME = P.PNAME 
	 where GENDER = 'M' and SALARY > 3000
--*************************************************************************************************************************************************
--84. Display the details of the packages developed in Pascal by the female programmers.
     
	   select * from Software S join Programmer P on P.PNAME = S.PNAME
	   where GENDER = 'f' and DEVELOPIN = 'pascal';
--************************************************************************************************************************************
--85. Display the details of the programmers who joined before 1990.
      
	   select * from Programmer 
	   where YEAR(DOJ) < 1990; 
--*************************************************************************************************************************
--86. Display the details of the software developed in C by the female programmers at Pragathi.
                 
			select * from Studies S join Software SO on S.PNAME = SO.PNAME join Programmer P on P.PNAME = S.PNAME
			where DEVELOPIN = 'c' and INSTITUTE = 'pragathi' and GENDER = 'f'
--*************************************************************************************************************************		
--87. Display the number of packages, number of copies sold and sales value of each programmer institute wise.

      select SO.PNAME,COUNT(TITLE) as [Number of packages],COUNT(SOLD) as [Number of copies],SUM(SOLD*SCOST) as [sales value] 
	  from Software SO join Studies S on SO.PNAME = S.PNAME
	  group by SO.PNAME;
--*******************************************************************************************************************************
--88. Display the details of the software developed in dBase by male programmers who belong 
--to the institute in which the most number of programmers studied.
      
	  select * from Software S join Studies St on S.PNAME = St.PNAME join Programmer P on P.PNAME = S.PNAME   
	  where DEVELOPIN = 'dbase' and GENDER = 'M' 
    AND st.INSTITUTE = (
        SELECT TOP 1 INSTITUTE
        FROM Studies
        GROUP BY INSTITUTE
        ORDER BY COUNT(*) DESC)
--************************************************************************************************************************************
--89. Display the details of the software developed by the male programmers born before 1965 
--and female programmers born after 1975.

        select * from Software S join Programmer P on S.PNAME = P.PNAME
		where (YEAR(DOJ) < 1965 and GENDER ='M') or (YEAR(DOJ) > 1975 and GENDER = 'F')
--*********************************************************************************************************************************		
--90. Display the details of the software that has been developed in the language which is neither the 
--first nor the second proficiency of the programmers.

      select S.* from Software S
	  join 
	  Programmer P on S.PNAME = P.PNAME
	  where DEVELOPIN <> PROF1 and DEVELOPIN <> PROF2 
--*************************************************************************************************************************************8	 
--91. Display the details of the software developed by the male students at Sabhari.

        select S.* from Software S 
		join
		Studies St on  S.PNAME = St.PNAME
		join 
		Programmer P on P.PNAME = S.PNAME
		where GENDER = 'M' and INSTITUTE = 'sabhari';
--*****************************************************************************************************************************
--92. Display the names of the programmers who have not developed any packages.

         select pname from Programmer
          where PNAME not in (select PNAME from Software);
--**********************************************************************************************************************
--93. What is the total cost of the software developed by the programmers of Apple?

    select sum(SOLD*DCOST) as cost from Software S
	join
	 Studies St on S.PNAME = St.PNAME
	 where INSTITUTE = 'Apple'; 
--*************************************************************************************************************************
--94. Who are the programmers who joined on the same day?

     select a.PNAME,a.DOJ from Programmer a,Programmer b
	  where a.DOJ = b.DOJ and a.PNAME <> b.PNAME;
--**************************************************************************************************************************
--95. Who are the programmers who have the same Prof2?

       select a.PNAME,a.PROF2 from Programmer a,Programmer b
	  where a.PROF2 = b.PROF2 and a.PNAME <> b.PNAME
	  group by a.PROF2,a.PNAME;
--*************************************************************************************************************************************
--96. Display the total sales value of the software institute wise.

     select St.INSTITUTE,sum(sold*scost) as [total sales] from Software S,Studies St
	 where St.PNAME = S.PNAME
	 group by St.INSTITUTE;
--***************************************************************************************************************************
--97. In which institute does the person who developed the costliest package study?

          select St.INSTITUTE,S.DCOST from Studies St
		  join
		  Software S on St.PNAME = S.PNAME
		  group by INSTITUTE,DCOST
		  having DCOST = (select MAX(DCOST) from Software);
--**************************************************************************************************************************
--98. Which language listed in Prof1, Prof2 has not been used to develop any package?

				 select PROF1,PROF2 from Programmer
				 where PROF1 not in (select DEVELOPIN from Software) or 
				 PROF2 not in (select DEVELOPIN from Software)
--***********************************************************************************************************************
--99. How much does the person who developed the highest selling package earn and--what course did he/she undergo?   select S.PNAME,St.COURSE,S.DCOST,P.SALARY from Software S   join   Studies St on S.PNAME = St.PNAME   join    Programmer P on P.PNAME = S.PNAME   where S.SCOST = (select MAX(SCOST) from Software)--*************************************************************************************************************************************--100. What is the average salary for those whose software sales is more than 50,000?

    select AVG(SALARY) as sal from Programmer P
	join
	Software S on P.PNAME = S.PNAME
	where (SOLD*SCOST) > 50000
--********************************************************************************************************************************************	
--101. How many packages were developed by students who studied in institutes that charge the lowest course fee?
     
	 	 select St.PNAME,COUNT(TITLE) as Package,MIN(St.COURSE_FEE) as [lowest course fee] from Software S 
		 join
		 Studies St on S.PNAME = St.PNAME
		 group by St.PNAME,COURSE_FEE
		 having min(COURSE_FEE) in (select MIN(COURSE_FEE) from studies)
--************************************************************************************************************************************************		 
--102. How many packages were developed by the person who developed the cheapest package? Where did he/she study?
 
       select COUNT(TITLE) as packages,MIN(DCOST) as [cheapest package],St.INSTITUTE from Software S 
	   join 
	   Studies St on S.PNAME = St.PNAME
	   group by St.INSTITUTE
	   having MIN(DCOST) = (select MIN(DCOST) from Software)
--***************************************************************************************************************************************
--103. How many packages were developed by female programmers earning more than the highest paid male programmer?
   
		 select COUNT(TITLE) as packages,S.PNAME from Software S
		 join
		 Programmer P on S.PNAME = P.PNAME
		 where GENDER = 'f' 
		 group by S.PNAME,p.SALARY
		  having SALARY  > (select Max(SALARY) from Programmer P join Software S on S.PNAME = P.PNAME where GENDER = 'M')
--***************************************************************************************************************************************
--104. How many packages are developed by the most experienced programmers from BDPS?
      
	  select count(TITLE) as packages,MAX(DATEDIFF (year,DOJ,GETDATE())) as experience_years from Software S
	  join
	  Programmer P on S.PNAME = P.PNAME
	  join 
	  Studies St on P.PNAME = St.PNAME
	  where INSTITUTE = 'BDPS'
	  group by DOJ
--*****************************************************************************************************************************************
--105. List the programmers (from the software table) and the institutes they studied at.
       
	   select S.PNAME,INSTITUTE from Software S
	   join
	   Studies St on S.PNAME = St.PNAME
	   group by S.PNAME,St.INSTITUTE
--****************************************************************************************************************************************
--106. List each PROF with the number of programmers having that PROF and the number of the packages in that PROF.
       
	   
       select distinct PP.PROF1,PP.PROF2,COUNT(P.PNAME) as [Number of programmers],COUNT(TITLE) as [No.of package] from Programmer PP
	    join 
	    Programmer P on P.PNAME = PP.PNAME
	     join 
       Software S on S.PNAME = P.PNAME 
	   group by Pp.PROF2,pp.PROF1

--*********************************************************************************************************************************************	  
--107. List the programmer names (from the programmer table) and the number of packages each has developed.

      select P.PNAME,COUNT(TITLE) as packages from Programmer P
	  join
	  Software S on S.PNAME = P.PNAME
	  group by P.PNAME














































































































