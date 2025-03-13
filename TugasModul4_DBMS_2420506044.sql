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





MariaDB [(none)]> create database kampus;
Query OK, 1 row affected (0.002 sec)

MariaDB [(none)]> use kampus;
Database changed
MariaDB [kampus]> create table Mahasiswa (
    ->
    -> NPM char(10) not null primary key,
    -> Nama varchar(25) not null,
    -> Jurusan varchar(25) not null
    -> );
Query OK, 0 rows affected (0.021 sec)

MariaDB [kampus]> create table mata_kuliah (
    -> Kode_MK varchar(7) not null primary key,
    -> Mata_Kuliah varchar(20) not null,
    -> SKS int not null
    -> );
Query OK, 0 rows affected (0.010 sec)

MariaDB [kampus]> create table nilai (
    -> ID int auto_increment primary key,
    -> NPM char(10) not null,
    -> Kode_MK varchar(7) not null,
    -> Nilai int not null,
    -> foreign key (NPM) references Mahasiswa(NPM),
    -> foreign key (Kode_MK) references mata_kuliah(Kode_MK)
    -> );
Query OK, 0 rows affected (0.015 sec)

MariaDB [kampus]> show tables;
+------------------+
| Tables_in_kampus |
+------------------+
| mahasiswa        |
| mata_kuliah      |
| nilai            |
+------------------+
3 rows in set (0.001 sec)

MariaDB [kampus]> desc mahasiswa;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| NPM     | char(10)    | NO   | PRI | NULL    |       |
| Nama    | varchar(25) | NO   |     | NULL    |       |
| Jurusan | varchar(25) | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.007 sec)

MariaDB [kampus]> desc mata_kuliah;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Kode_MK     | varchar(7)  | NO   | PRI | NULL    |       |
| Mata_Kuliah | varchar(20) | NO   |     | NULL    |       |
| SKS         | int(11)     | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.007 sec)

MariaDB [kampus]> desc nilai;
+---------+------------+------+-----+---------+----------------+
| Field   | Type       | Null | Key | Default | Extra          |
+---------+------------+------+-----+---------+----------------+
| ID      | int(11)    | NO   | PRI | NULL    | auto_increment |
| NPM     | char(10)   | NO   | MUL | NULL    |                |
| Kode_MK | varchar(7) | NO   | MUL | NULL    |                |
| Nilai   | int(11)    | NO   |     | NULL    |                |
+---------+------------+------+-----+---------+----------------+
4 rows in set (0.006 sec)

MariaDB [kampus]> insert into mahasiswa values
    -> ('2420506041', 'Andre Setya', 'Teknik Industri'),
    -> ('2420506056', 'Noman Aljabar', 'Teknik Industri'),
    -> ('2420506086', 'Nation de Vandeburg', 'Teknik Sipil'),
    -> ('2420506077', 'Nadhim Makaron', 'Teknik Elektro'),
    -> ('2420506025', 'Santoso Luffy', 'Teknik Mekatronika'),
    -> ('2420506089', 'Raden Pancamas', 'Fisipol'),
    -> ('2420506088', 'Sheila Rahayu', 'Fisipol')
    -> ;
Query OK, 7 rows affected (0.005 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [kampus]> insert into mahasiswa values
    -> ('2420506064', 'Reza Gunawanu', 'Fisipol'),
    -> ('2420506075', 'Marsha Wanpis', 'FEB'),
    -> ('2420506022', 'Leornado Leona', 'FEB'),
    -> ('2420506021', 'Andresa Lenata', 'Faperta'),
    -> ('2420506015', 'Erik Hiwana', 'Pariwisata'),
    -> ('2420506013', 'Daniel Parakas', 'Pariwisata'),
    -> ('2420506011', 'Luxville Leornado', 'Pariwisata')
    -> ;
Query OK, 7 rows affected (0.007 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [kampus]> select * from mahasiswa;
+------------+---------------------+--------------------+
| NPM        | Nama                | Jurusan            |
+------------+---------------------+--------------------+
| 2420506011 | Luxville Leornado   | Pariwisata         |
| 2420506013 | Daniel Parakas      | Pariwisata         |
| 2420506015 | Erik Hiwana         | Pariwisata         |
| 2420506021 | Andresa Lenata      | Faperta            |
| 2420506022 | Leornado Leona      | FEB                |
| 2420506025 | Santoso Luffy       | Teknik Mekatronika |
| 2420506041 | Andre Setya         | Teknik Industri    |
| 2420506056 | Noman Aljabar       | Teknik Industri    |
| 2420506064 | Reza Gunawanu       | Fisipol            |
| 2420506075 | Marsha Wanpis       | FEB                |
| 2420506077 | Nadhim Makaron      | Teknik Elektro     |
| 2420506086 | Nation de Vandeburg | Teknik Sipil       |
| 2420506088 | Sheila Rahayu       | Fisipol            |
| 2420506089 | Raden Pancamas      | Fisipol            |
+------------+---------------------+--------------------+
14 rows in set (0.001 sec)

MariaDB [kampus]> insert into mata_kuliah values
    -> ('A098W12', 'Matematika Diskrit', '3'),
    -> ('A044w12', 'Matematika Dasar', '2'),
    -> ('A041S11', 'Kalkulus', '3'),
    -> ('A011E10', 'Fisika Dasar', '2'),
    -> ('A011E09', 'Kimia', '1'),
    -> ('A009R01', 'Bahasa Inggris', '2'),
    -> ('A010E05', 'Pancasila', '2')
    -> ;
Query OK, 7 rows affected (0.007 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [kampus]>
MariaDB [kampus]> select * from mata_kuliah;
+---------+--------------------+-----+
| Kode_MK | Mata_Kuliah        | SKS |
+---------+--------------------+-----+
| A009R01 | Bahasa Inggris     |   2 |
| A010E05 | Pancasila          |   2 |
| A011E09 | Kimia              |   1 |
| A011E10 | Fisika Dasar       |   2 |
| A041S11 | Kalkulus           |   3 |
| A044w12 | Matematika Dasar   |   2 |
| A098W12 | Matematika Diskrit |   3 |
+---------+--------------------+-----+
7 rows in set (0.001 sec)

MariaDB [kampus]> insert into nilai values
    -> ('1', '2420506011', 'A009R01', '90'),
    -> ('2', '2420506013', 'A009R01', '95'),
    -> ('3', '2420506015', 'A009R01', '80'),
    -> ('4', '2420506021', 'A011E09', '80'),
    -> ('5', '2420506021', 'A010E05', '90'),
    -> ('6', '2420506022', 'A009R01', '98'),
    -> ('7', '2420506022', 'A044w12', '80'),
    -> ('8', '2420506025', 'A098W12', '87'),
    -> ('9', '2420506025', 'A041S11', '95'),
    -> ('10', '2420506041', 'A041S11', '97'),
    -> ('11', '2420506041', 'A044w12', '90'),
    -> ('11', '2420506056', 'A041S11', '98'),
    -> ('12', '2420506056', 'A041S11', '98'),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 14
MariaDB [kampus]> insert into nilai values
    -> ('1', '2420506011', 'A009R01', '90'),
    -> ('2', '2420506013', 'A009R01', '95'),
    -> ('3', '2420506015', 'A009R01', '80'),
    -> ('4', '2420506021', 'A011E09', '80'),
    -> ('5', '2420506021', 'A010E05', '90'),
    -> ('6', '2420506022', 'A009R01', '98'),
    -> ('7', '2420506022', 'A044w12', '80'),
    -> ('8', '2420506025', 'A098W12', '87'),
    -> ('9', '2420506025', 'A041S11', '95'),
    -> ('10', '2420506041', 'A041S11', '97'),
    -> ('11', '2420506041', 'A044w12', '90'),
    -> ('12', '2420506056', 'A041S11', '98'),
    -> ('13', '2420506056', 'A041S11', '98'),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 14
MariaDB [kampus]> insert into nilai values
    -> ('1', '2420506011', 'A009R01', '90'),
    -> ('2', '2420506013', 'A009R01', '95'),
    -> ('3', '2420506015', 'A009R01', '80'),
    -> ('4', '2420506021', 'A011E09', '80'),
    -> ('5', '2420506021', 'A010E05', '90'),
    -> ('6', '2420506022', 'A009R01', '98'),
    -> ('7', '2420506022', 'A044w12', '80'),
    -> ('8', '2420506025', 'A098W12', '87'),
    -> ('9', '2420506025', 'A041S11', '95'),
    -> ('10', '2420506041', 'A041S11', '97'),
    -> ('11', '2420506041', 'A044w12', '90'),
    -> ('12', '2420506056', 'A041S11', '98'),
    -> ('13', '2420506056', 'A044w12', '90'),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 14
MariaDB [kampus]> insert into nilai values
    -> ('1', '2420506011', 'A009R01', '90'),
    -> ('2', '2420506013', 'A009R01', '95'),
    -> ('3', '2420506015', 'A009R01', '80'),
    -> ('4', '2420506021', 'A011E09', '80'),
    -> ('5', '2420506021', 'A010E05', '90'),
    -> ('6', '2420506022', 'A009R01', '98'),
    -> ('7', '2420506022', 'A044w12', '80'),
    -> ('8', '2420506025', 'A098W12', '87'),
    -> ('9', '2420506025', 'A041S11', '95'),
    -> ('10', '2420506041', 'A041S11', '97'),
    -> ('11', '2420506041', 'A044w12', '90'),
    -> ('12', '2420506056', 'A041S11', '98'),
    -> ('13', '2420506056', 'A044w12', '90')
    -> ;
Query OK, 13 rows affected (0.007 sec)
Records: 13  Duplicates: 0  Warnings: 0

MariaDB [kampus]> ('14', '2420506064', 'A010W05', '87'),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''14', '2420506064', 'A010W05', '87'),' at line 1
MariaDB [kampus]> insert into nilai values
    -> ('14', '2420506064', 'A010W05', '87'),
    -> ('15', '2420506075', 'A009R01', '79'),
    -> ('16', '2420506077', 'A011E10', '98'),
    -> ('17', '2420506086', 'A010W05', '91'),
    -> ('18', '2420506088', 'A010W05', '87'),
    -> ('19', '2420506089', 'A010W05', '98')
    -> ;
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`kampus`.`nilai`, CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`Kode_MK`) REFERENCES `mata_kuliah` (`Kode_MK`))
MariaDB [kampus]> insert into nilai values
    -> ('14', '2420506064', 'A010W05', '87'),
    -> ('15', '2420506075', 'A009R01', '79'),
    -> ('16', '2420506077', 'A011E10', '98'),
    -> ('17', '2420506086', 'A010W05', '91'),
    -> ('18', '2420506088', 'A010W05', '87'),
    -> ('19', '2420506089', 'A010W05', '98')
    -> ;
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`kampus`.`nilai`, CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`Kode_MK`) REFERENCES `mata_kuliah` (`Kode_MK`))
MariaDB [kampus]> insert into nilai values
    -> ('14', '2420506064', 'A010E05', '87'),
    -> ('15', '2420506075', 'A009R01', '79'),
    -> ('16', '2420506077', 'A011E10', '98'),
    -> ('17', '2420506086', 'A010E05', '91'),
    -> ('18', '2420506088', 'A010E05', '87'),
    -> ('19', '2420506089', 'A010E05', '98')
    -> ;
Query OK, 6 rows affected (0.006 sec)
Records: 6  Duplicates: 0  Warnings: 0

MariaDB [kampus]> select * from nilai;
+----+------------+---------+-------+
| ID | NPM        | Kode_MK | Nilai |
+----+------------+---------+-------+
|  1 | 2420506011 | A009R01 |    90 |
|  2 | 2420506013 | A009R01 |    95 |
|  3 | 2420506015 | A009R01 |    80 |
|  4 | 2420506021 | A011E09 |    80 |
|  5 | 2420506021 | A010E05 |    90 |
|  6 | 2420506022 | A009R01 |    98 |
|  7 | 2420506022 | A044w12 |    80 |
|  8 | 2420506025 | A098W12 |    87 |
|  9 | 2420506025 | A041S11 |    95 |
| 10 | 2420506041 | A041S11 |    97 |
| 11 | 2420506041 | A044w12 |    90 |
| 12 | 2420506056 | A041S11 |    98 |
| 13 | 2420506056 | A044w12 |    90 |
| 14 | 2420506064 | A010E05 |    87 |
| 15 | 2420506075 | A009R01 |    79 |
| 16 | 2420506077 | A011E10 |    98 |
| 17 | 2420506086 | A010E05 |    91 |
| 18 | 2420506088 | A010E05 |    87 |
| 19 | 2420506089 | A010E05 |    98 |
+----+------------+---------+-------+
19 rows in set (0.001 sec)

MariaDB [kampus]> select jurusan, count(*) as jumlah_mahasiswa from group by
 jurusan;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'group by jurusan' at line 1
MariaDB [kampus]> select jurusan, count(*) as jumlah_mahasiswa from Mahasiswa group by jurusan;
+--------------------+------------------+
| jurusan            | jumlah_mahasiswa |
+--------------------+------------------+
| Faperta            |                1 |
| FEB                |                2 |
| Fisipol            |                3 |
| Pariwisata         |                3 |
| Teknik Elektro     |                1 |
| Teknik Industri    |                2 |
| Teknik Mekatronika |                1 |
| Teknik Sipil       |                1 |
+--------------------+------------------+
8 rows in set (0.001 sec)

MariaDB [kampus]> select
    -> (select nama from Mahasiswa where mahasiswa.NPM = n.npm) as Nama,
    -> (select Nama_MK from mata_kuliah where mata_kuliah.Kode_MK = n.kode_m
k) as Nama_MK,
    -> n.nilai
    -> from nilai as n
    -> where n.nilai = (select max(nilai) from nilai where Kode_MK = n.kode_
mk)
    -> ;
ERROR 1247 (42S22): Reference 'Nama_MK' not supported (forward reference in item list)
MariaDB [kampus]> select
    -> (select nama from Mahasiswa where mahasiswa.NPM = n.npm) as Nama,
    -> (select Mata_Kuliah from mata_kuliah where mata_kuliah.Kode_MK = n.ko
de_mk) as Nama_MK,
    -> n.nilai
    -> from nilai as n
    -> where n.nilai = (select max(nilai) from nilai where Kode_MK = n.kode_
mk)
    -> ;
+----------------+--------------------+-------+
| Nama           | Nama_MK            | nilai |
+----------------+--------------------+-------+
| Andresa Lenata | Kimia              |    80 |
| Leornado Leona | Bahasa Inggris     |    98 |
| Santoso Luffy  | Matematika Diskrit |    87 |
| Andre Setya    | Matematika Dasar   |    90 |
| Noman Aljabar  | Kalkulus           |    98 |
| Noman Aljabar  | Matematika Dasar   |    90 |
| Nadhim Makaron | Fisika Dasar       |    98 |
| Raden Pancamas | Pancasila          |    98 |
+----------------+--------------------+-------+
8 rows in set (0.003 sec)

MariaDB [kampus]> select
    -> (select nama from Mahasiswa where mahasiswa.NPM = n.npm) as Nama,
    -> count(n.kode_mk) as jumlah_matkul
    -> from nilai as n
    -> group by n.npm
    -> ;
+---------------------+---------------+
| Nama                | jumlah_matkul |
+---------------------+---------------+
| Luxville Leornado   |             1 |
| Daniel Parakas      |             1 |
| Erik Hiwana         |             1 |
| Andresa Lenata      |             2 |
| Leornado Leona      |             2 |
| Santoso Luffy       |             2 |
| Andre Setya         |             2 |
| Noman Aljabar       |             2 |
| Reza Gunawanu       |             1 |
| Marsha Wanpis       |             1 |
| Nadhim Makaron      |             1 |
| Nation de Vandeburg |             1 |
| Sheila Rahayu       |             1 |
| Raden Pancamas      |             1 |
+---------------------+---------------+
14 rows in set (0.004 sec)

MariaDB [kampus]>
