--1. Display the number of states present in the LocationTable. 
--margin should be greater than 100.
     from [fact]
     group by ProductId
     having avg(budget_margin)>100
     order by ProductId
as sales_rank from fact;

--17. Find the state wise profit and sales.


   select sales,sales*1.05 from fact
---20. Find the maximum profit along with the product ID and producttype.

   select max(profit),p.ProductId,Product_Type from fact f join Product p on f.ProductId=p.ProductId
--21. Create a stored procedure to fetch the result according to the product type
--from Product Table.
  
  create procedure ptype (@prod_type varchar(20))
  as 
  select * from Product
  where Product_Type = @prod_type
  go

  exec ptype @prod_type = 'coffee'

--22. Write a query by creating a condition in which if the total expenses is less than
--60 then it is a profit or else loss. 

select Total_expenses,IIF(total_expenses<60,'profit','loss') as status from fact

---23. Give the total weekly sales value with the date and product ID details. Use
--roll-up to pull the data in hierarchical order.

  select DATEPART(week,date) as weeknumber,productid,sum(sales) from fact
  group by ProductId,DATEPART(week,date) with rollup;

--24. Apply union and intersection operator on the tables which consist of
--attribute area code.

select Area_Code from Location
intersect
select area_code from fact
order by Area_Code

select Area_Code from Location
union
select Area_Code from fact
order by Area_Code
---25. Create a user-defined function for the product table to fetch a particular
--product type based upon the user�s preference. 

create function producttable(@product_type varchar(50))
returns table
 as
return
select * from Product
where product_type = @Product_Type

select * from producttable('tea')
---26. Change the product type from coffee to tea where product ID is 1 and undo
--it.

Being transaction 
update Product
set Product_Type='tea'
where ProductId=1

rollback transaction
---27. Display the date, product ID and sales where total expenses are
--between 100 to 200.

select date,Profit,Sales,Total_Expenses from fact
where Total_Expenses between 100 and 200;

---28. Delete the records in the Product Table for regular type.

delete from Product
where Type='regular'

---29. Display the ASCII value of the fifth character from the columnProduct.

select Product,ascii(SUBSTRING(product,5,1)) as char from Product
