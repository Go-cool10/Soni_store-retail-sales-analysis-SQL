select * from Sales_table
top50

alter table sales_table 
 add constraint  pk_01 primary key (transactions_id)

 sp_help sales_table
 

select count(*) as total_record from sales_table

/* Data Cleaning */
-- hecking for null values in the table for consistency

select * from sales_table
where
transactions_id is null
or 
sale_date is null
or
sale_time is null
or
customer_id is null
or 
gender is null
or
age is null
or
category is null
or 
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null

-- Deleting rows with null values.

delete from sales_table 
where
transactions_id is null
or 
sale_date is null
or
sale_time is null
or
customer_id is null
or 
gender is null
or
age is null
or
category is null
or 
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null


--Data exploration
/* Finding total number of sales */

select count(transactions_id) as Total_no_of_sales from Sales_Table

/* Finding the total number of business customers */

select  count( distinct customer_id)  as Total_customer from Sales_Table

/* Finding the various product categories of the business */ 

select distinct(category) from sales_table

-- Data analysis to answer key business problems 
/* Retrive all the sales made on 2022-11-05 */

select* from Sales_Table
where sale_date = '2022-11-05'
order by sale_time

/*Retrive the sales for clothing category in the month of november,2022. Sale quantity should be more than 3  */
 
 select * from sales_table where 
 category= 'clothing'
 and
 year(sale_date)= '2022'
 and 
 month(sale_date)= '11'
 and 
 quantiy>3

 /* Finding the total sales of each category  */ 

 select category, sum(total_sale) as TotalSale, count(total_sale) as Total_number_of_sale  from sales_table 
 group by category
 order by TotalSale desc

 /* Finding Average age of the customer who purchased a beauty product  */

 select avg(age) as Average_age_of_customer from Sales_Table where category= 'beauty'


 /* Retrieving all the transactions with a sale amount greater than 1000  */ 

 select * from Sales_Table where total_sale > 1000
 order by total_sale desc

 /*  Find the number of transcation made by each gender for each category */

select count(transactions_id) as Number_of_transaction, category,gender from Sales_Table
group by gender,category

/*  Retrieve best selling month and its average sales in each year */

select * from 
(
    select avg(total_sale) as Average_sales,month (sale_date) as Month_ , year (sale_date) as Year_,
    rank()over(partition by year(sale_date) order by avg(total_sale) desc) as _Rank
    from Sales_Table
    group by month(sale_date), year (sale_date)
    ) as temp_table
where _rank =1

/* Find the top 5 customer based on highest total sales */

select top 5 customer_id, sum(total_sale) as Total_sale_amount from sales_table
group by customer_id
order by 2 desc

/* Retrieve the number of unique customers who purchased items from each category*/

select  count(distinct customer_id) as Number_of_customer, category from sales_table
group by category

/* Create shifts i.e; morning < 12 pm, afternoon between 12 and 17  and night >17  and find number of order placed in each shift */


with hourly_sales
as 
(
select sale_time,
case
when sale_time<'12:00' then 'Morning'
when sale_time between '12:00' and '17:00' then 'Afternoon'
when sale_time > '17:00' then 'Night'
else 'Invalid'
end as Shifts,
transactions_id
from sales_table
)
select  Shifts, count(transactions_id) as Number_of_orders
from hourly_sales
group by Shifts
order by 2 desc


--End of Project














