C:\Users\hp>CD C:\xampp\mysql\bin

C:\xampp\mysql\bin>mysql -u root  -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE DATABASE toko_aththahiru;
Query OK, 1 row affected (0.015 sec)

MariaDB [(none)]> USE toko_aththahiru;
Database changed
MariaDB [toko_aththahiru]> CREATE TABLE products (
    -> product_id INT PRIMARY KEY AUTO_INCREMENT,
    -> product_name VARCHAR(100),
    -> category VARCHAR(50),
    -> price DECIMAL(10, 2)
    -> );
Query OK, 0 rows affected (0.037 sec)

MariaDB [toko_aththahiru]> INSERT INTO products (product_id, product_name, category, price) VALUES
    -> ('12346', 'Smartphone B', 'Electronics', 800.00),
    -> ('12347', 'Tablet C', 'Electronics', 500.00),
    -> ('12348', 'Shirt D', 'Clothing', 25.00),
    -> ('12349', 'Jeans E', 'Clothing', 45.00),
    -> ('12350', 'Shoes F', 'Clothing', 60.00),
    -> ('12351', 'Book G', 'Books', 15.00),
    -> ('12352', 'Notebook H', 'Books', 10.00),
    -> ('12353', 'Pen I', 'Stationery', 2.00),
    -> ('12354', 'Pencil J', 'Stationery', 1.50);
Query OK, 9 rows affected (0.019 sec)
Records: 9  Duplicates: 0  Warnings: 0

MariaDB [toko_aththahiru]> select * from products;
+------------+--------------+-------------+---------+
| product_id | product_name | category    | price   |
+------------+--------------+-------------+---------+
|      12345 | Laptop A     | Electronics | 1200.00 |
|      12346 | Smartphone B | Electronics |  800.00 |
|      12347 | Tablet C     | Electronics |  500.00 |
|      12348 | Shirt D      | Clothing    |   25.00 |
|      12349 | Jeans E      | Clothing    |   45.00 |
|      12350 | Shoes F      | Clothing    |   60.00 |
|      12351 | Book G       | Books       |   15.00 |
|      12352 | Notebook H   | Books       |   10.00 |
|      12353 | Pen I        | Stationery  |    2.00 |
|      12354 | Pencil J     | Stationery  |    1.50 |
+------------+--------------+-------------+---------+
10 rows in set (0.013 sec)

MariaDB [toko_aththahiru]> SELECT COUNT(*) AS total_products FROM products;
+----------------+
| total_products |
+----------------+
|             10 |
+----------------+
1 row in set (0.016 sec)

MariaDB [toko_aththahiru]> SELECT SUM(price) AS total_price FROM products;
+-------------+
| total_price |
+-------------+
|     2658.50 |
+-------------+
1 row in set (0.013 sec)

MariaDB [toko_aththahiru]> SELECT AVG(price) AS average_price FROM products;
+---------------+
| average_price |
+---------------+
|    265.850000 |
+---------------+
1 row in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT MIN(price) AS cheapest_product, MAX(price) AS most_expensive_product FROM products;
+------------------+------------------------+
| cheapest_product | most_expensive_product |
+------------------+------------------------+
|             1.50 |                1200.00 |
+------------------+------------------------+
1 row in set (0.003 sec)

MariaDB [toko_aththahiru]> SELECT * FROM products WHERE price > 50;
+------------+--------------+-------------+---------+
| product_id | product_name | category    | price   |
+------------+--------------+-------------+---------+
|      12345 | Laptop A     | Electronics | 1200.00 |
|      12346 | Smartphone B | Electronics |  800.00 |
|      12347 | Tablet C     | Electronics |  500.00 |
|      12350 | Shoes F      | Clothing    |   60.00 |
+------------+--------------+-------------+---------+
4 rows in set (0.014 sec)

MariaDB [toko_aththahiru]> SELECT * FROM products WHERE category = 'Electronics';
+------------+--------------+-------------+---------+
| product_id | product_name | category    | price   |
+------------+--------------+-------------+---------+
|      12345 | Laptop A     | Electronics | 1200.00 |
|      12346 | Smartphone B | Electronics |  800.00 |
|      12347 | Tablet C     | Electronics |  500.00 |
+------------+--------------+-------------+---------+
3 rows in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT * FROM products WHERE price BETWEEN 20 AND 100;
+------------+--------------+----------+-------+
| product_id | product_name | category | price |
+------------+--------------+----------+-------+
|      12348 | Shirt D      | Clothing | 25.00 |
|      12349 | Jeans E      | Clothing | 45.00 |
|      12350 | Shoes F      | Clothing | 60.00 |
+------------+--------------+----------+-------+
3 rows in set (0.015 sec)

MariaDB [toko_aththahiru]> SELECT * FROM products WHERE product_name LIKE 'S%';
+------------+--------------+-------------+--------+
| product_id | product_name | category    | price  |
+------------+--------------+-------------+--------+
|      12346 | Smartphone B | Electronics | 800.00 |
|      12348 | Shirt D      | Clothing    |  25.00 |
|      12350 | Shoes F      | Clothing    |  60.00 |
+------------+--------------+-------------+--------+
3 rows in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT category, COUNT(*) AS total_products
    -> FROM products
    -> GROUP BY category;
+-------------+----------------+
| category    | total_products |
+-------------+----------------+
| Books       |              2 |
| Clothing    |              3 |
| Electronics |              3 |
| Stationery  |              2 |
+-------------+----------------+
4 rows in set (0.003 sec)

MariaDB [toko_aththahiru]> SELECT category, AVG(price) AS average_price
    -> FROM products
    -> GROUP BY category;
+-------------+---------------+
| category    | average_price |
+-------------+---------------+
| Books       |     12.500000 |
| Clothing    |     43.333333 |
| Electronics |    833.333333 |
| Stationery  |      1.750000 |
+-------------+---------------+
4 rows in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT category, AVG(price) AS average_price
    -> FROM products
    -> GROUP BY category
    -> HAVING AVG(price) > 100;
+-------------+---------------+
| category    | average_price |
+-------------+---------------+
| Electronics |    833.333333 |
+-------------+---------------+
1 row in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT category, COUNT(*) AS total_products
    -> FROM products
    -> GROUP BY category
    -> HAVING COUNT(*) > 2;
+-------------+----------------+
| category    | total_products |
+-------------+----------------+
| Clothing    |              3 |
| Electronics |              3 |
+-------------+----------------+
2 rows in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT SUM(price) AS total_price
    -> FROM products
    -> WHERE category = 'Electronics';
+-------------+
| total_price |
+-------------+
|     2500.00 |
+-------------+
1 row in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT category, SUM(price) AS total_price
    -> FROM products
    -> GROUP BY category
    -> HAVING SUM(price) > 1000;
+-------------+-------------+
| category    | total_price |
+-------------+-------------+
| Electronics |     2500.00 |
+-------------+-------------+
1 row in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT category, MAX(price) AS max_price
    -> FROM products
    -> GROUP BY category;
+-------------+-----------+
| category    | max_price |
+-------------+-----------+
| Books       |     15.00 |
| Clothing    |     60.00 |
| Electronics |   1200.00 |
| Stationery  |      2.00 |
+-------------+-----------+
4 rows in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT category, MIN(price) AS cheapest_product FROM products GROUP BY category;
+-------------+------------------+
| category    | cheapest_product |
+-------------+------------------+
| Books       |            10.00 |
| Clothing    |            25.00 |
| Electronics |           500.00 |
| Stationery  |             1.50 |
+-------------+------------------+
4 rows in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT category FROM products WHERE price > 500;
+-------------+
| category    |
+-------------+
| Electronics |
| Electronics |
+-------------+
2 rows in set (0.001 sec)

MariaDB [toko_aththahiru]> SELECT category, COUNT(*) AS total_produk, SUM(price) AS total_price
    -> FROM products
    -> GROUP BY category
    -> HAVING COUNT(*) > 1;
+-------------+--------------+-------------+
| category    | total_produk | total_price |
+-------------+--------------+-------------+
| Books       |            2 |       25.00 |
| Clothing    |            3 |      130.00 |
| Electronics |            3 |     2500.00 |
| Stationery  |            2 |        3.50 |
+-------------+--------------+-------------+
4 rows in set (0.001 sec)
