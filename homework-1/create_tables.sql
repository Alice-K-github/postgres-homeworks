-- SQL-команды для создания таблиц
create database north

create table employees
(
	employee_id int primary key,
	first_name text,
	last_name text,
	title text,
	birth_date data,
	notes text
);

create table customers
(
	customer_id text primary key,
	company_name text,
	contact_name text
);

create table orders
(
	order_id int primary key,
	customer_id text REFERENCES customers(customer_id) not null,
	employee_id int REFERENCES employees(employee_id) not null,
	order_date date,
	ship_city text,
);
