MariaDB [(none)]> create database DBMS06
    -> ;
Query OK, 1 row affected (0.010 sec)

MariaDB [(none)]> use DBMS06;
Database changed
MariaDB [DBMS06]> create table maasiswa (
    -> NIM char(3) primary key,
    -> Nama varchar(25) not null,
    -> JK enum('L', 'P') not null,
    -> Alamat varchar(100) not null
    -> );
Query OK, 0 rows affected (0.040 sec)

MariaDB [DBMS06]> create table dosen (
    -> Kode_Dosen char(2) primary key,
    -> Nama_Dosen varchar(25) not null,
    -> Alamat varchar(100) not null
    -> );
Query OK, 0 rows affected (0.010 sec)

MariaDB [DBMS06]> create table matkul (
    -> Kode_MK char(7) primary key,
    -> Nama_MK varchar(30) not null
    -> SKS int not null,
    -> Kode_Dosen char(2) not null
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'int not null,
Kode_Dosen char(2) not null
)' at line 4
MariaDB [DBMS06]> create table matkul (
    -> Kode_MK char(7) primary key,
    -> Nama_MK varchar(30) not null
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 3
MariaDB [DBMS06]> create table matkul (
    -> Kode_MK char(7) primary key,
    -> Nama_MK varchar(30) not null,
    -> SKS int not null,
    -> Kode_Dosen char(2) not null
    -> );
Query OK, 0 rows affected (0.013 sec)

MariaDB [DBMS06]> create table ambil_mk (
    -> NIM char(3) not null,
    -> Kode_MK char(7) not null,
    -> foreign key(NIM) references mahasiswa(NIM),
    -> foreign key(Kode_MK) references matkul(Kode_MK)
    -> );
ERROR 1005 (HY000): Can't create table `dbms06`.`ambil_mk` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [DBMS06]> create table ambil_mk (
    -> NIM char(3) not null,
    -> Kode_MK char(7) not null,
    -> foreign key(NIM) references maasiswa(NIM),
    -> foreign key(Kode_MK) references matkul(Kode_MK)
    -> );
Query OK, 0 rows affected (0.016 sec)

MariaDB [DBMS06]> create table jurusan (
    -> Kode_Jurusan char(5) primary key,
    -> Nama_Jurusan varchar(25) not null,
    -> Kode_Dosen char(2) not null,
    -> foreign key(Kode_Dosen) references dosen(Kode_Dosen)
    -> );
Query OK, 0 rows affected (0.014 sec)

MariaDB [DBMS06]> insert into maasiswa values
    -> ('101', 'Arif', 'L', 'Kenangan')
    -> ;
Query OK, 1 row affected (0.020 sec)

MariaDB [DBMS06]> insert into maasiswa values
    -> ('102', 'Budi', 'L', 'JL. Jombang'),
    -> ('103', 'Wati', 'P', 'JL. Surabaya'),
    -> ('104', 'Ika', 'P', 'JL. Jombang'),
    -> ('105', 'Tono', 'L', 'JL. Jakarta'),
    -> ('106', 'Iwan', 'L', 'JL. Bandung'),
    -> ('107', 'Sari', 'P', 'JL. Malang')
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 8
MariaDB [DBMS06]> insert into maasiswa values
    -> ('102', 'Budi', 'L', 'JL. Jombang'),
    -> ('103', 'Wati', 'P', 'JL. Surabaya'),
    -> ('104', 'Ika', 'P', 'JL. Jombang'),
    -> ('105', 'Tono', 'L', 'JL. Jakarta'),
    -> ('106', 'Iwan', 'L', 'JL. Bandung'),
    -> ('107', 'Sari', 'P', 'JL. Malang')
    -> ;
Query OK, 6 rows affected (0.006 sec)
Records: 6  Duplicates: 0  Warnings: 0

MariaDB [DBMS06]> insert into dosen values
    -> ('10', 'Suharto', 'JL. Jombang'),
    -> ('11', 'Martono', 'JL. Kalpataru'),
    -> ('12', 'Rahmawati', 'JL. Jakarta'),
    -> ('13', 'Bambang', 'JL. Bandung'),
    -> ('14', 'Nurul', 'JL. Raya Tidar')
    -> ;
Query OK, 5 rows affected (0.007 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [DBMS06]> insert into matkul values
    -> ('PTI123', 'Grafika Multimedia', '3', '5', '12'),
    -> ('PTI333', 'Basis Data Terdistribusi', '3', '5', '10'),
    -> Ctrl-C -- exit!
Bye

c:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use DBMS06;
Database changed
MariaDB [DBMS06]> insert into matkul values
    -> ('PTI123', 'Grafika Multimedia', '3', '5', '12'),
    -> ('PTI333', 'Basis Data Terdistribusi', '3', '5', '10'),
    -> ('PTI447', 'Praktikum Basis Data', '1', '3', '11'),
    -> ('PTI777', 'Sistem Informasi', '2', '3', '99'),
    -> ('TIK123', 'Jaringan Komputer', '2', '5', '33'),
    -> ('TIK333', 'Sistem Operasi', '3', '5', '10'),
    -> ('TIK342', 'Praktikum Basis Data', '1', '3', '11')
    -> ;
ERROR 1136 (21S01): Column count doesn't match value count at row 1
MariaDB [DBMS06]> alter table matkul
    -> add semester int not null
    -> ;
Query OK, 0 rows affected (0.012 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [DBMS06]> insert into matkul values
    -> ('PTI123', 'Grafika Multimedia', '3', '12', '5'),
    -> ('PTI333', 'Basis Data Terdistribusi', '3', '10', '5'),
    -> ('PTI447', 'Praktikum Basis Data', '1', '11', '3'),
    -> ('PTI777', 'Sistem Informasi', '2', '99', '3'),
    -> ('TIK123', 'Jaringan Komputer', '2', '33', '5'),
    -> ('TIK333', 'Sistem Operasi', '3', '10', '5'),
    -> ('TIK342', 'Praktikum Basis Data', '1', '11', '3')
    -> ;
Query OK, 7 rows affected (0.007 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [DBMS06]> desc matkul
    -> ;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Kode_MK    | char(7)     | NO   | PRI | NULL    |       |
| Nama_MK    | varchar(30) | NO   |     | NULL    |       |
| SKS        | int(11)     | NO   |     | NULL    |       |
| Kode_Dosen | char(2)     | NO   |     | NULL    |       |
| semester   | int(11)     | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
5 rows in set (0.027 sec)

MariaDB [DBMS06]> insert into jurusan values
    -> ('TE, 'Teknik Elektro', '10'),
    '> ;
    '> ;
    '> Ctrl-C -- exit!
Bye

c:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 11
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use DBMS06
Database changed
MariaDB [DBMS06]> insert into jurusan values
    -> ('TE, 'Teknik Elektro', '10'),
    '> ('TE, 'Teknik Elektro', '10'),ByeCtrl-C -- exit!


c:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 12
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> desc matkul
    -> ;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> use DBMS06;
Database changed
MariaDB [DBMS06]> insert into jurusan values
    -> ('TE', 'Teknik Elektro', '10'),
    -> ('TM', 'Teknik Mesin', '13'),
    -> ('TS', 'Teknik Sipil', '12')
    -> ;
Query OK, 3 rows affected (0.010 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [DBMS06]> insert into ambil_mk values
    -> ('101', 'PTI447'),
    -> ('102', 'TIK333'),
    -> ('103', ''),;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 4
MariaDB [DBMS06]> insert into ambil_mk values
    -> ('101', 'PTI447'),
    -> ('103', 'TIK333'),
    -> ('104', 'PTI333'),
    -> ('104', 'PTI777'),
    -> ('105', 'PTI123'),
    -> ('107', 'PTI777')
    -> ;
Query OK, 6 rows affected (0.007 sec)
Records: 6  Duplicates: 0  Warnings: 0

MariaDB [DBMS06]> select *
    -> from maasiswa
    -> where Jenis_Kelamin =
    -> (select Jenis_Kelamin from maasiswa where nama = "Wati")
    -> ;
ERROR 1054 (42S22): Unknown column 'Jenis_Kelamin' in 'where clause'
MariaDB [DBMS06]> select *
    -> from maasiswa
    -> where JK =
    -> (select JK from maasiswa where nama = "Wati")
    -> ;
+-----+------+----+--------------+
| NIM | Nama | JK | Alamat       |
+-----+------+----+--------------+
| 103 | Wati | P  | JL. Surabaya |
| 104 | Ika  | P  | JL. Jombang  |
| 107 | Sari | P  | JL. Malang   |
+-----+------+----+--------------+
3 rows in set (0.010 sec)

MariaDB [DBMS06]> select d.Kode_Dosen, d.Nama_Dosen
    -> from dosen d
    -> where d.Kode_Dosen in
    -> (select Kode_Dosen from matkul)
    -> ;
+------------+------------+
| Kode_Dosen | Nama_Dosen |
+------------+------------+
| 10         | Suharto    |
| 11         | Martono    |
| 12         | Rahmawati  |
+------------+------------+
3 rows in set (0.008 sec)

MariaDB [DBMS06]> select *
    -> from matkul
    -> where SKS > any
    -> (select SKS from matkul
    -> where semester = 3)
    -> ;
+---------+--------------------------+-----+------------+----------+
| Kode_MK | Nama_MK                  | SKS | Kode_Dosen | semester |
+---------+--------------------------+-----+------------+----------+
| PTI123  | Grafika Multimedia       |   3 | 12         |        5 |
| PTI333  | Basis Data Terdistribusi |   3 | 10         |        5 |
| PTI777  | Sistem Informasi         |   2 | 99         |        3 |
| TIK123  | Jaringan Komputer        |   2 | 33         |        5 |
| TIK333  | Sistem Operasi           |   3 | 10         |        5 |
+---------+--------------------------+-----+------------+----------+
5 rows in set (0.010 sec)

MariaDB [DBMS06]> select *
    -> from matkul
    -> where SKS > all
    -> where semester = 3)
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'where semester = 3)' at line 4
MariaDB [DBMS06]> select *
    -> from matkul
    -> where SKS > all
    -> (select SKS from matkul
    -> where semester = 3)
    -> ;
+---------+--------------------------+-----+------------+----------+
| Kode_MK | Nama_MK                  | SKS | Kode_Dosen | semester |
+---------+--------------------------+-----+------------+----------+
| PTI123  | Grafika Multimedia       |   3 | 12         |        5 |
| PTI333  | Basis Data Terdistribusi |   3 | 10         |        5 |
| TIK333  | Sistem Operasi           |   3 | 10         |        5 |
+---------+--------------------------+-----+------------+----------+
3 rows in set (0.004 sec)

MariaDB [DBMS06]> select *
    -> from matkul m
    -> where exists
    -> (select * from ambil_mk a where m.kode_mk = a.kode_mk)
    -> ;
+---------+--------------------------+-----+------------+----------+
| Kode_MK | Nama_MK                  | SKS | Kode_Dosen | semester |
+---------+--------------------------+-----+------------+----------+
| PTI123  | Grafika Multimedia       |   3 | 12         |        5 |
| PTI333  | Basis Data Terdistribusi |   3 | 10         |        5 |
| PTI447  | Praktikum Basis Data     |   1 | 11         |        3 |
| PTI777  | Sistem Informasi         |   2 | 99         |        3 |
| TIK333  | Sistem Operasi           |   3 | 10         |        5 |
+---------+--------------------------+-----+------------+----------+
5 rows in set (0.005 sec)

MariaDB [DBMS06]> select *
    -> from matkul m
    -> where not exists
    -> (select * from ambil_mk a where m.kode_mk = a.kode_mk)
    -> ;
+---------+----------------------+-----+------------+----------+
| Kode_MK | Nama_MK              | SKS | Kode_Dosen | semester |
+---------+----------------------+-----+------------+----------+
| TIK123  | Jaringan Komputer    |   2 | 33         |        5 |
| TIK342  | Praktikum Basis Data |   1 | 11         |        3 |
+---------+----------------------+-----+------------+----------+
2 rows in set (0.032 sec)

MariaDB [DBMS06]>
