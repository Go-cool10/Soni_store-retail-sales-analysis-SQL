📊 Sales Data Analysis Using SQL
Table of Contents
Project Overview
Dataset
Objectives
Technologies Used
Database Design
Key Features
Sample Queries
Setup Instructions
Conclusion
Contributing
License


Project Overview

This project demonstrates how SQL can be used for in-depth sales data analysis. Using a fictional retail sales dataset, the project covers various aspects of business intelligence, including customer behavior analysis and overall sales trends. The goal is to leverage SQL queries to extract insights that can drive strategic decisions in a retail setting.

Dataset

The dataset used in this project consist of one table:

Sales: Records of individual sales transactions, including the product, quantity, date, and customer.
Note: A sample dataset is available in the repository under /data/

Objectives

The primary objectives of this analysis are:

To evaluate sales performance by analyzing revenue, top-selling products, and sales growth over time.
To segment customers based on purchase category and average spend.
To analyze store performance and identify high-performing category of product.
To produce actionable insights that can inform strategic business decisions.

Technologies Used

SQL: Used for querying and analyzing data.
SQL Server: Database management system used to store and manipulate the data.
Google Sheets: Used for exporting data to visualize key findings.

Database Design

The relational database follows a normalized structure for efficiency:

Sales_table (Transaction_id, Sale_date,sale_time, Customer_id, Gender, age, Category, Quantiy, Price_per_unit, Cogs, Total_sale)

Key Features

1. Sales Performance Analysis
Track overall revenue and break it down by product categories.
Calculate key metrics such as Average Order Value (AOV) and Total Revenue per period.
2. Customer Segmentation
Group customers into segments based on category and gender.
Identify high-value customers and develop insights for personalized marketing.
3. Time-Series Sales Analysis
Perform Month-over-Month (MoM) and Year-over-Year (YoY) analysis to identify sales trends and growth patterns.

Sample Queries

Below are some examples of the SQL queries used in the project:

  Best selling month and its average sales in each year 

select * from 
(
    select avg(total_sale) as Average_sales,month (sale_date) as Month_ , year (sale_date) as Year_,
    rank()over(partition by year(sale_date) order by avg(total_sale) desc) as _Rank
    from Sales_Table
    group by month(sale_date), year (sale_date)
    ) as temp_table
where _rank =1


 Average age of the customer who purchased a beauty product 

 select avg(age) as Average_age_of_customer from Sales_Table where category= 'beauty'

bash
Copy code
git clone https://github.com/Go-cool10/sales-data-analysis-sql.git
Navigate to the project folder:

bash
Copy code
cd sales-data-analysis-sql
Import the dataset:

Load the SQL dump file (/data/sales_data.sql) into your PostgreSQL or MySQL database.
Alternatively, create the tables manually based on the schema provided in /schema.sql.
Execute the SQL queries provided in /queries/ to run the analysis.

Conclusion
This project showcases the power of SQL in performing detailed sales analysis in a retail context. From customer segmentation to store performance tracking, this analysis can help businesses make data-driven decisions.

Feel free to explore the SQL scripts and sample queries to gain insights into how data can be used to optimize sales operations.

Contributing
Contributions are welcome! Feel free to submit issues, fork the repository, or create pull requests to suggest improvements or new features.
