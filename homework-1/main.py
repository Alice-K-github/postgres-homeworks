"""Скрипт для заполнения данными таблиц в БД Postgres."""
import csv
import psycopg2


def importing_orders_1():
    with (open("homework-1/north_data/orders_data.csv", newline='')
          as csvfile):
        orders_1 = []
        filereader = csv.reader(csvfile, quotechar='|')
        for i in filereader:
            orders_1.append(i)
        print(orders_1)
        return orders_1


def importing_customers_2():
    with (open("homework-1/north_data/customers_data.csv", newline='')
          as csvfile):
        customers_2 = []
        filereader = csv.reader(csvfile, quotechar='|')
        for i in filereader:
            customers_2.append(i)
        return customers_2


def importing_employees_3():
    with (open("homework-1/north_data/employees_data.csv", newline='')
          as csvfile):
        employees_3 = []
        filereader = csv.reader(csvfile, quotechar='|')
        for i in filereader:
            employees_3.append(i)
        return employees_3


importing_orders_1()

with psycopg2.connect(host='localhost', database='north', user='postgres', password='AlisaKa145') as conn:
    with conn.cursor() as cur:

        cur.execute("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)")
        cur.execute('SELECT * FROM orders')

        rows = cur.fetchall()
        for row in rows:
            print(row)

conn.close()
