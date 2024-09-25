use classicmodels;

-- Aliasing

select * from customers;

select customerName as FirstName from customers;

select customerName as NAME, contactLastName as CONTACT 
from customers;

select customerNumber as custNumber from customers;

-- Aliasing tables when performing joins
select c.customerName as NAME, o.orderNumber as ORDNUM
from customers as c
join orders as o on c.customerNumber = o.customerNumber;

-- Between and IN operator
select * from  products;

-- grab the vehicles whose prices are between 40 and 70
select productName, buyPrice
from products
where buyPrice between 40 and 70;

-- select the paymentDate and amount between 10,000 and 14,000 from payments
select * from payments;

select paymentDate, amount
from payments
where amount between 10000 and 14000;

-- IN operator
select * from products;
select productName, productLine
from products
where productLine in ('Classic Cars','Motorcycles');


-- WILDCARDS - pattern recognition
-- LIKE
-- % sign - match zer0 or more customers

select * from customers;

-- R___i
-- options, both (and, OR)
select customerName
from customers
where customerName like '%R___i%' or customerName like 'A%';

-- return the productName and buyprice that follows the following pattern, 1969 or end with  bike
select * from products;
select productName, buyprice
from products
where productName like '%1969%' or productName like '%bike';

-- To make this matches case sensitive
select customerName
from customers
where customerName like binary '%w%';


-- functions - aggregations
-- count the number of orders to date
select count(*) from orders;

-- total payments to date 
select sum(amount) as Total_Sales
from payments;

-- average amount
select avg(amount) as Average_Sales
from payments;

-- Maximum and min payments
select min(amount) as Min_Amount, max(amount) as Max_Amount
from payments;

-- Write a query that returns the avg, max, min buyprices of the products
select avg(buyPrice) as Avg_Bp, max(buyPrice) as Max_Bp, min(buyPrice) as Min_Bp
from products;

-- String functions
select * from customers;

-- Length of a string
select customerNumber, length(customerName)
from customers;

select customerName, upper(customerName) as UPP_Name,
lower(customerName) as LOW_Name
from customers;

-- concat
select concat(contactLastName,'  ',contactFirstName) as Full_Name
from customers;

-- Return a combo of city and postal code from the customers table
select concat(city,' ',postalCode) as Address
from customers;

select* from payments;

select paymentDate, year(paymentDate) as Year, month(paymentDate) as Month, day(paymentDate) as Day
from payments;

select paymentDate, amount
from payments
where paymentDate between '2004-01-01' and '2004-01-30';

-- Write a query to calculate the total payments made in the year 2004
select sum(amount) as Total_payments
from payments
where year(paymentDate) = 2004;


-- Case statements - conditional logic
select * from orders;

select distinct(status) from orders;

select orderNumber,
	case
		when status = 'Shipped' then 'Order Completed'
        when status = 'Resolved' then 'Order Completed'
        when status = 'Cancelled' then 'Order Completed'
        when status = 'On Hold' then 'Order Pending'
        when status = 'Disputed' then 'Order Pending'
        else "Order in Process"
	end as neworderstatus
from orders;




















