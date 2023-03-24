use classicmodels;

select * from customers;
select count(*) from customers;
select * from customers limit5;

select * from employees;
select count(*) from employees;
select * from employees where jobtitle='sales rep';
select * from employees where jobtitle='vp sales';

select * from offices;
select count(country) from offices;
select * from offices where country='USA';
select * from offices where country not in('usa');

select * from orderdetails;
select count(*) from orderdetails;

select * from orders;
select * from orders where comments is not null;
select * from orders where comments is null;
select * from orders where status='shipped';
select * from orders where status='disputed';
select * from orders where status='in process';
select * from orders where status='on hold';

select * from payments;
select count(*) from payments;

select * from productlines;
select count(*) from productlines;

select * from products;
select count(*) from products;
select * from products where productline='classic cars';
select * from products where productline='motorcycles';
select * from products where productline='Trucks and buses';
select * from products where productline='planes';
select * from products where productline='trains';
select * from products where productline='ships';
select * from products where productline='vintage cars';


#query to find payments from customers
select * from customers;
select * from payments;
select p.amount, p.paymentdate, c.customernumber from customers as c
join payments as p
on c.customernumber = p.customernumber
where country='usa';


#query to find job titles available in office
select * from employees;
select * from offices;
select e.employeenumber, e.jobtitle,o.state,o.country,o.territory from employees as e
join offices as o
on e.officecode=o.officecode;


#query to find comments on ordera
select * from orders;
select * from orderdetails;
select o.ordernumber, o.customernumber,o.status, o.comments,od.quantityordered from orders as o
join orderdetails as od
on o.ordernumber=od.ordernumber
where o.comments is not null;


#query to find total sales and number of orders
select * from orders;
select * from payments;
select year(o.orderdate) as years, sum(p.amount) as sales,
count(o.status) as num_of_orders from orders as o
join payments as p 
on o.customernumber=p.customernumber
where o.status='shipped';


# query to fetch top 5 customers
select * from customers;
select * from payments;
select c.customernumber, c.customername, p.amount from customers as c
join payments as p
on c.customernumber = p.customernumber
order by amount desc
limit 5;

