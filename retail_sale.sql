select *from  retail_sale limit 10;

-- CHECK NULL VALUES IN TABLE

-- UPDATE COLUMN NAME
ALTER TABLE retail_sale RENAME COLUMN ï»¿transactions_id to transaction_id;

SELECT *FROM  retail_sale WHERE 
transaction_id IS NULL
or sale_date is null
or sale_time is null
or customer_id is null
or gender  is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null

DELETE FROM  retail_sale WHERE 
transaction_id IS NULL
or sale_date is null
or sale_time is null
or customer_id is null
or gender  is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null

-- data exploration 
SELECT COUNT(*) as total_sale FROM retail_sale;

-- HOW MANY CUSTOMER WE HAVE unique?
SELECT count(distinct customer_id) as total_sales FROM retail_sale;

SELECT count(distinct category) as total_sales FROM retail_sale;

select distinct category from reatil_sale;

-- data analysis & business key problem & answer;

-- Q1. write a sql quary to retrive all column for sales made on '2022-11-05';
SELECT *FROM retail_sale where sale_date='2022-11-05';

-- Q2. write a sql quary to retrive all transactions where the category is "Clothing" and the quantity sold is more than 10 in month of nov-2022
SELECT category ,
SUM(quantiy) from retail_sale
where category="Clothing" 
and sale_date >='2022-11-01'
and sale_date <'2022-12-01'
group by 1;

-- Q3. write a sql quary to calculate the total sales(total_sale) for each category ?(Alias)
SELECT category,sum(total_sale) as net_sale, count(*) as total_orders from retail_sale
group by 1;

-- Q4. write the sql quary to find the average age of customer who purchases items from the "beauty" category
SELECT round(avg(age),0) as avg_age from retail_sale where category='Beauty'

-- Q5. write a sql quary to find all transaction where the total_sale is greater than >1000;

SELECT *FROM retail_sale where  total_sale>1000;

-- Q6. write a sql quary to find the total number of transactions (transaction_id) made by gender in each category.
SELECT category,
gender,
count(*) as total_trans
FROM retail_sale
group by category, gender
order by 2;

-- Q7. write sql quary to calculate the average sale for each month.find out best selling month in each year?
select year(sale_date) as year, 
month(sale_date) as month,
avg(total_sale) as avg_sale ,
ranK() over(
partition by year(sale_date) order by avg(total_sale) DESC) as rnk

from retail_sale
group by year(sale_date), month(sale_date) order by year,month DESC;


-- Q8. write sql qquary to find top 5 customer based on the highest total sale.
SELECT 
customer_id,sum(total_sale) as total_sales
FROM retail_sale
group by 1
order by 2 DESC limit 5;
 
 
--  Q9. write a sql quary to find the number of unique who purchased items from each category ?
SELECT category, count(customer_id) from retail_sale group by category;

-- Q10. write a sql quary to create each shift and number of orders(exam: afternoon 12 &17, evening >17 ?

SELECT *,
case when extract(hour from sale_time ) <12 THEN 'morning'
WHEN extract(hour from sale_time) between 12 AND 17 then 'afternoon'
else 'evening'
end as shift  
FROM retail_sale;

select extract(hour from current_time) 


-- END OF PROJECT
