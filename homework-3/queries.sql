-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)

select customers.company_name as customer, employees.first_name || ' ' || employees.last_name as employee from orders
inner join customers using(customer_id)
inner join employees using(employee_id)
inner JOIN shippers ON orders.ship_via = shippers.shipper_id
where 'United Package' in (shippers.company_name)
and 'London' in (customers.city)
and 'London' in (employees.city)

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.

select product_name, units_in_stock, suppliers.contact_name, suppliers.phone  from products
inner join suppliers using(supplier_id)
inner join categories using (category_id)
where '0' in (products.discontinued) 
and units_in_stock < 25 
and ('Dairy Products' in (categories.category_name)
or 'Condiments' in (categories.category_name))
order by products.units_in_stock asc

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа

SELECT company_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders)

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.

select distinct product_name from products
where  '10' in (select quantity from order_details)

