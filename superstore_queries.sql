select* from superstore_data123;

select sales from superstore_data123 fetch first 10 rows only;

select count(*) from superstore_data123;

select sum(to_number(replace(replace(replace(sales,'.',''),',','.'),'$',''))) as total_sales from superstore_data123;

select sum(to_number(replace(replace(replace(profit,'.',''),',','.'),'$',''))) as total_profit from superstore_data123;

select count (distinct order_id )as total_orders from superstore_data123;

select sum(quantity)as total_quantity from superstore_data123;

select region,sum(to_number(replace(replace(replace(sales,'.',''),',','.'),'$',''))) as total_sales from superstore_data123 group  by region;

select customer_name,sum(to_number(replace(replace(replace(sales,'.',''),',','.'),'$','')))as total_sales from superstore_data123 group by cutomer_name order by total_sales desc fetch first 5 rows only;

select category,sum(to_number(replace(replace(replace(profit,'.',''),',','.'),'$','')))as total_profit from superstore_data123 group by category order by total_profit desc;

select product_name,sum(to_number(replace(replace(replace(profit,'.',''),',','.'),'$',''))) as total_profit from superstore_data123 group by product_name having sum(to_number(replace(replace(replace(profit,'.',''),',','.'),'$','')))<0 order by total_profit;

alter table superstore_data123 add sales_clean number;

update superstore_data123 set sales_clean =(to_number(replace(replace(replace(sales,'.',''),',','.'),'$','')))
alter table superstore_data123 add profit_clean number;

update superstore_data123 set profit_clean =(to_number(replace(replace(replace(profit,'.',''),',','.'),'$','')))
select product_name, sum(sales_clean) as total_sales from superstore_data123 group by product_name order by total_sales desc fetch first 5 rows only;

select product_name,sum(profit_clean) as total_profit from superstore_data123 group by product_name order by total_profit desc fetch first 5 rows only;

select category ,sum(sales_clean) as total_sales,sum(profit_clean) as total_profit,(sum(profit_clean)/sum(sales_clean))*100 as profit_margin from superstore_data123 group by category order by profit_margin desc;

select sum(sales_clean)/count(order_id) as avg_order_value from superstore_data123;
select region,sum(profit_clean) as total_profit from superstore_data123 group by region order by total_profit desc fetch first 1 row only;

select customer_name,sum(profit_clean) as total_profit from superstore_data123 group by customer_name order by total_profit desc fetch first 1 row only;

select category, sum(quantity) as total_quantity from superstore_data123 group by category order by total_quantity desc fetch first 1 row only;
