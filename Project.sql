--a. Get all the details from the person table including email ID, phone
--number and phone number type

  select P.*,E.EmailAddress,[PhoneNumber],PN.[Name] from [Person].[Person] P
  inner join
  [Person].[EmailAddress] E on P.businessentityID = E.businessentityID 
  inner join
  [Person].[PersonPhone] PP on E.BusinessEntityID = PP.BusinessEntityID
  inner join
  [Person].[PhoneNumberType] PN on PP.PhoneNumberTypeID = PN.PhoneNumberTypeID
--b. Get the details of the sales header order made in May 2011.

    select* from [Sales].[SalesOrderHeader] where YEAR(OrderDate) = 2011 and MONTH(OrderDate) = 5
--c. Get the details of the sales details order made in the month of May 2011
       
	   select * from [Sales].[SalesOrderDetail] SO
	   inner join
	    [Sales].[SalesOrderHeader] SH on SO.SalesOrderID = SH.SalesOrderID
		where YEAR(OrderDate) = 2011 and MONTH(OrderDate) = 5
--d. Get the total sales made in May 2011

	   select sum(SO.LineTotal) as [Total sales] from [Sales].[SalesOrderDetail] SO
	   inner join
	    [Sales].[SalesOrderHeader] SH on SO.SalesOrderID = SH.SalesOrderID
			where YEAR(OrderDate) = 2011 and MONTH(OrderDate) = 5	
--e. Get the total sales made in the year 2011 by month order by increasing sales

	   select sum(SO.LineTotal) as [Total sales],MONTH(OrderDate) as Month from [Sales].[SalesOrderDetail] SO
	   inner join
	    [Sales].[SalesOrderHeader] SH on SO.SalesOrderID = SH.SalesOrderID
			where YEAR(OrderDate) = 2011
			group by MONTH(OrderDate)
			order by [Total sales]
--f. Get the total sales made to the customer with FirstName='Gustavo'and LastName ='Achong'
    
		select SUM(LINETOTAL) AS TOTALSALES, YEAR(ORDERDATE) AS YEAROFSALES, FIRSTNAME, 
		LASTNAME FROM [Sales].[SalesOrderDetail] SD INNER JOIN [Sales].[SalesOrderHeader] SH ON
		SD.SalesOrderID = SH.SalesOrderID INNER JOIN SALES.Customer C ON 
		SH.CustomerID = C.CustomerID INNER JOIN [Person].[Person] P ON
		C.PersonID = P.BusinessEntityID
		WHERE LASTNAME = 'ACHONG' AND FIRSTNAME = 'GUSTAVO'
		GROUP BY YEAR(ORDERDATE), FIRSTNAME, LASTNAME