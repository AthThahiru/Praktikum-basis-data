
MariaDB [(none)]> create database pinjam;
Query OK, 1 row affected (0.005 sec)

MariaDB [(none)]> use pinjam;
Database changed
MariaDB [pinjam]> create table mahasiswa (
    -> NIM char(9) primary key,
    -> Nama varchar(30) not null,
    -> alamat varchar(30) not null
    -> );
Query OK, 0 rows affected (0.025 sec)

MariaDB [pinjam]> create table peminjaman (
    -> id_peminjaman int primary key auto increment,
    -> NIM char(9) not null,
    -> Buku varchar(100) not null
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'auto increment,
NIM char(9) not null,
Buku varchar(100) not null
)' at line 2
MariaDB [pinjam]> create table peminjaman (
    -> id_peminjaman int primary key autoincrement,
    -> NIM char(9) not null,
    -> Buku varchar(100) not null
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '
NIM char(9) not null,
Buku varchar(100) not null
)' at line 2
MariaDB [pinjam]> create table peminjaman (
    -> id_peminjaman int primary key auto_increment,
    -> NIM char(9) not null,
    -> Buku varchar(100) not null
    -> );
Query OK, 0 rows affected (0.016 sec)

MariaDB [pinjam]> insert into mahasiswa values
    -> ('214002001', 'Budi', 'Bandung')
    -> ('214002002', 'Ahmad', 'Semarang')
    -> ('214002003', 'Andi', 'Jakarta')
    -> ('214002004', 'Joko', 'Padang')
    -> ('214002005', 'Rani', 'Jakarta')
    -> ('214002006', 'Kenta', 'Bandung')
    -> ('214002007', 'Indah', 'Semarang')
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '('214002002', 'Ahmad', 'Semarang')
('214002003', 'Andi', 'Jakarta')
('2140020...' at line 3
MariaDB [pinjam]> insert into mahasiswa values
    -> ('214002001', 'Budi', 'Bandung')
    -> ('214002002', 'Ahmad', 'Semarang')
    -> ('214002003', 'Andi', 'Jakarta')
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '('214002002', 'Ahmad', 'Semarang')
('214002003', 'Andi', 'Jakarta')' at line 3
MariaDB [pinjam]> insert into mahasiswa values
    -> ('214002001', 'Budi', 'Bandung'),
    -> ('214002002', 'Ahmad', 'Semarang'),
    -> ('214002003', 'Andi', 'Jakarta'),
    -> ('214002004', 'Joko', 'Padang'),
    -> ('214002005', 'Rani', 'Jakarta'),
    -> ('214002006', 'Kenta', 'Bandung'),
    -> ('214002007', 'Indah', 'Semarang')
    -> ;
Query OK, 7 rows affected (0.008 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [pinjam]> desc mahasiswa;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| NIM    | char(9)     | NO   | PRI | NULL    |       |
| Nama   | varchar(30) | NO   |     | NULL    |       |
| alamat | varchar(30) | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.012 sec)

MariaDB [pinjam]> select * from mahasiswa;
+-----------+-------+----------+
| NIM       | Nama  | alamat   |
+-----------+-------+----------+
| 214002001 | Budi  | Bandung  |
| 214002002 | Ahmad | Semarang |
| 214002003 | Andi  | Jakarta  |
| 214002004 | Joko  | Padang   |
| 214002005 | Rani  | Jakarta  |
| 214002006 | Kenta | Bandung  |
| 214002007 | Indah | Semarang |
+-----------+-------+----------+
7 rows in set (0.004 sec)

MariaDB [pinjam]> insert into peminjaman values
    -> ('1', '214002001', 'Buku Psikologi Klinis'),
    -> ('2', '214002002', 'Buku Biologi'),
    -> ('3', '214002003', 'Buku Kimia'),
    -> ('4', '214002005', 'Buku Teknik Kelistrikan'),
    -> ('5', '214002006', 'Buku Teknik Bangunan'),
    -> ('6', '214002010', 'Buku Dasar-dasar Pemrogaman'),
    -> ('7', '214002011', 'Buku Fisika')
    -> ;
Query OK, 7 rows affected (0.005 sec)
Records: 7  Duplicates: 0  Warnings: 0

MariaDB [pinjam]> select * from mahasiswa inner join peminjaman on mahasiswa.nim = peminjaman.nim ;
+-----------+-------+----------+---------------+-----------+-------------------------+
| NIM       | Nama  | alamat   | id_peminjaman | NIM       | Buku                    |
+-----------+-------+----------+---------------+-----------+-------------------------+
| 214002001 | Budi  | Bandung  |             1 | 214002001 | Buku Psikologi Klinis   |
| 214002002 | Ahmad | Semarang |             2 | 214002002 | Buku Biologi            |
| 214002003 | Andi  | Jakarta  |             3 | 214002003 | Buku Kimia              |
| 214002005 | Rani  | Jakarta  |             4 | 214002005 | Buku Teknik Kelistrikan |
| 214002006 | Kenta | Bandung  |             5 | 214002006 | Buku Teknik Bangunan    |
+-----------+-------+----------+---------------+-----------+-------------------------+
5 rows in set (0.005 sec)

MariaDB [pinjam]> select * from mahasiswa left join peminjaman on mahasiswa.
nim = peminjaman.nim ;
+-----------+-------+----------+---------------+-----------+-------------------------+
| NIM       | Nama  | alamat   | id_peminjaman | NIM       | Buku
         |
+-----------+-------+----------+---------------+-----------+-------------------------+
| 214002001 | Budi  | Bandung  |             1 | 214002001 | Buku Psikologi Klinis   |
| 214002002 | Ahmad | Semarang |             2 | 214002002 | Buku Biologi            |
| 214002003 | Andi  | Jakarta  |             3 | 214002003 | Buku Kimia              |
| 214002005 | Rani  | Jakarta  |             4 | 214002005 | Buku Teknik Kelistrikan |
| 214002006 | Kenta | Bandung  |             5 | 214002006 | Buku Teknik Bangunan    |
| 214002004 | Joko  | Padang   |          NULL | NULL      | NULL
         |
| 214002007 | Indah | Semarang |          NULL | NULL      | NULL
         |
+-----------+-------+----------+---------------+-----------+-------------------------+
7 rows in set (0.029 sec)

MariaDB [pinjam]> select * from mahasiswa right join peminjaman on mahasiswa
.nim = peminjaman.nim ;
+-----------+-------+----------+---------------+-----------+-----------------------------+
| NIM       | Nama  | alamat   | id_peminjaman | NIM       | Buku
             |
+-----------+-------+----------+---------------+-----------+-----------------------------+
| 214002001 | Budi  | Bandung  |             1 | 214002001 | Buku Psikologi Klinis       |
| 214002002 | Ahmad | Semarang |             2 | 214002002 | Buku Biologi                |
| 214002003 | Andi  | Jakarta  |             3 | 214002003 | Buku Kimia
             |
| 214002005 | Rani  | Jakarta  |             4 | 214002005 | Buku Teknik Kelistrikan     |
| 214002006 | Kenta | Bandung  |             5 | 214002006 | Buku Teknik Bangunan        |
| NULL      | NULL  | NULL     |             6 | 214002010 | Buku Dasar-dasar Pemrogaman |
| NULL      | NULL  | NULL     |             7 | 214002011 | Buku Fisika                 |
+-----------+-------+----------+---------------+-----------+-----------------------------+
7 rows in set (0.001 sec)

MariaDB [pinjam]> select * from mahasiswa left join peminjaman on mahasiswa.nim = peminjaman.nim
    -> union all
    -> select * from mahasiswa right join peminjaman on mahasiswa.nim = peminjaman.nim ;
+-----------+-------+----------+---------------+-----------+-----------------------------+
| NIM       | Nama  | alamat   | id_peminjaman | NIM       | Buku
             |
+-----------+-------+----------+---------------+-----------+-----------------------------+
| 214002001 | Budi  | Bandung  |             1 | 214002001 | Buku Psikologi Klinis       |
| 214002002 | Ahmad | Semarang |             2 | 214002002 | Buku Biologi                |
| 214002003 | Andi  | Jakarta  |             3 | 214002003 | Buku Kimia                  |
| 214002005 | Rani  | Jakarta  |             4 | 214002005 | Buku Teknik Kelistrikan     |
| 214002006 | Kenta | Bandung  |             5 | 214002006 | Buku Teknik Bangunan        |
| 214002004 | Joko  | Padang   |          NULL | NULL      | NULL
             |
| 214002007 | Indah | Semarang |          NULL | NULL      | NULL
             |
| 214002001 | Budi  | Bandung  |             1 | 214002001 | Buku Psikologi Klinis       |
| 214002002 | Ahmad | Semarang |             2 | 214002002 | Buku Biologi                |
| 214002003 | Andi  | Jakarta  |             3 | 214002003 | Buku Kimia
             |
| 214002005 | Rani  | Jakarta  |             4 | 214002005 | Buku Teknik Kelistrikan     |
| 214002006 | Kenta | Bandung  |             5 | 214002006 | Buku Teknik Bangunan        |
| NULL      | NULL  | NULL     |             6 | 214002010 | Buku Dasar-dasar Pemrogaman |
| NULL      | NULL             |             7 | 214002011 | Buku Fisika                 |
+-----------+-------+----------+---------------+-----------+-----------------------------+
14 rows in set (0.005 sec)

MariaDB [pinjam]> Ctrl-C -- exit!
Bye


MariaDB [(none)]> create database DBMS11_2420506044;
Query OK, 1 row affected (0.002 sec)

MariaDB [(none)]> use DBMS11_2420506044;
Database changed
MariaDB [DBMS11_2420506044]> create table TbPegawai (
    -> NIP varchar(5) primary key,
    -> Nama varchar(25),
    -> tgl_lahir date,
    -> Kota varchar(15),
    -> thn_masuk year(4),
    -> Gol int(1)
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 7
MariaDB [DBMS11_2420506044]> create table TbPegawai (
    -> NIP varchar(5) primary key,
    -> Nama varchar(25),
    -> tgl_lahir date,
    -> Kota varchar(15),
    -> thn_masuk year(4),
    -> Gol int(1)
    -> );
Query OK, 0 rows affected (0.011 sec)

MariaDB [DBMS11_2420506044]> insert into TbPegawai values
    -> ('001', 'Ahmad Burhanuddin', '1990-12-12', 'Bandung', '2010', '3'),
    -> ('002', 'Amin Imsyorry', '1989-12-02', 'Ciamis', '2009', '2'),
    -> ('003', 'Budhy Bungaox', '1989-01-20', 'Tasikmalaya', '2011', '4'),
    -> ('004', 'Zulkarnaen', '1991-02-20', 'Bandung', '2009', '1'),
    -> ('005', 'Dewi Sudewa', '1990-12-02', 'Bogor', '2009', '1'),
    -> ('006', 'Ina Nurlian', '1993-08-09', 'Sumedang', '2011', '4'),
    -> ('007', 'Cheppy Chardut', '1992-07-09', 'Garut', '2011', '4'),
    -> ('008', 'Dodong M', '1990-07-10', 'Bandung', '2010', '3'),
    -> ('009', 'Gandung P', '1990-06-25', 'Bogor', '2009', '2'),
    -> ('010', 'Agus Wisman', '1993-10-17', 'Garut', '2010', '3')
    -> ;
Query OK, 10 rows affected (0.006 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [DBMS11_2420506044]> create table TbGaji (
    -> Gol int(1) primary key,
    -> Gapok int(12)
    -> );
Query OK, 0 rows affected (0.013 sec)

MariaDB [DBMS11_2420506044]> insert into TbGaji values
    -> ('1', '1500000'),
    -> ('2', '2000000'),
    -> ('3', '3500000'),
    -> ('4', '5000000')
    -> ;
Query OK, 4 rows affected (0.006 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [DBMS11_2420506044]> alter table TbPegawai add
    -> constraint fk_gol
    -> foreign key (gol) references
    -> TbGaji(Gol)
    -> ;
Query OK, 10 rows affected (0.062 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [DBMS11_2420506044]> select * from TbPegawai inner join TbGaji on TbPegawai.gol = TbGaji.gol;
+-----+-------------------+------------+-------------+-----------+------+-----+---------+
| NIP | Nama              | tgl_lahir  | Kota        | thn_masuk | Gol  | Gol | Gapok   |
+-----+-------------------+------------+-------------+-----------+------+-----+---------+
| 004 | Zulkarnaen        | 1991-02-20 | Bandung     |      2009 |    1 |   1 | 1500000 |
| 005 | Dewi Sudewa       | 1990-12-02 | Bogor       |      2009 |    1 |   1 | 1500000 |
| 002 | Amin Imsyorry     | 1989-12-02 | Ciamis      |      2009 |    2 |   2 | 2000000 |
| 009 | Gandung P         | 1990-06-25 | Bogor       |      2009 |    2 |   2 | 2000000 |
| 001 | Ahmad Burhanuddin | 1990-12-12 | Bandung     |      2010 |    3 |   3 | 3500000 |
| 008 | Dodong M          | 1990-07-10 | Bandung     |      2010 |    3 |   3 | 3500000 |
| 010 | Agus Wisman       | 1993-10-17 | Garut       |      2010 |    3 |   3 | 3500000 |
| 003 | Budhy Bungaox     | 1989-01-20 | Tasikmalaya |      2011 |    4 |   4 | 5000000 |
| 006 | Ina Nurlian       | 1993-08-09 | Sumedang    |      2011 |    4 |   4 | 5000000 |
| 007 | Cheppy Chardut    | 1992-07-09 | Garut       |      2011 |    4 |   4 | 5000000 |
+-----+-------------------+------------+-------------+-----------+------+-----+---------+
10 rows in set (0.002 sec)

MariaDB [DBMS11_2420506044]> select * from TbPegawai left join TbGaji on TbPegawai.gol = TbGaji.gol;
+-----+-------------------+------------+-------------+-----------+------+------+---------+
| NIP | Nama              | tgl_lahir  | Kota        | thn_masuk | Gol  | Gol  | Gapok   |
+-----+-------------------+------------+-------------+-----------+------+------+---------+
| 001 | Ahmad Burhanuddin | 1990-12-12 | Bandung     |      2010 |    3 |    3 | 3500000 |
| 002 | Amin Imsyorry     | 1989-12-02 | Ciamis      |      2009 |    2 |    2 | 2000000 |
| 003 | Budhy Bungaox     | 1989-01-20 | Tasikmalaya |      2011 |    4 |    4 | 5000000 |
| 004 | Zulkarnaen        | 1991-02-20 | Bandung     |      2009 |    1 |    1 | 1500000 |
| 005 | Dewi Sudewa       | 1990-12-02 | Bogor       |      2009 |    1 |    1 | 1500000 |
| 006 | Ina Nurlian       | 1993-08-09 | Sumedang    |      2011 |    4 |    4 | 5000000 |
| 007 | Cheppy Chardut    | 1992-07-09 | Garut       |      2011 |    4 |    4 | 5000000 |
| 008 | Dodong M          | 1990-07-10 | Bandung     |      2010 |    3 |    3 | 3500000 |
| 009 | Gandung P         | 1990-06-25 | Bogor       |      2009 |    2 |    2 | 2000000 |
| 010 | Agus Wisman       | 1993-10-17 | Garut       |      2010 |    3 |    3 | 3500000 |
+-----+-------------------+------------+-------------+-----------+------+------+---------+
10 rows in set (0.001 sec)

MariaDB [DBMS11_2420506044]> select * from TbPegawai right join TbGaji on TbPegawai.gol = TbGaji.gol;
+------+-------------------+------------+-------------+-----------+------+-----+---------+
| NIP  | Nama              | tgl_lahir  | Kota        | thn_masuk | Gol  | Gol | Gapok   |
+------+-------------------+------------+-------------+-----------+------+-----+---------+
| 004  | Zulkarnaen        | 1991-02-20 | Bandung     |      2009 |    1 |   1 | 1500000 |
| 005  | Dewi Sudewa       | 1990-12-02 | Bogor       |      2009 |    1 |   1 | 1500000 |
| 002  | Amin Imsyorry     | 1989-12-02 | Ciamis      |      2009 |    2 |   2 | 2000000 |
| 009  | Gandung P         | 1990-06-25 | Bogor       |      2009 |    2 |   2 | 2000000 |
| 001  | Ahmad Burhanuddin | 1990-12-12 | Bandung     |      2010 |    3 |   3 | 3500000 |
| 008  | Dodong M          | 1990-07-10 | Bandung     |      2010 |    3 |   3 | 3500000 |
| 010  | Agus Wisman       | 1993-10-17 | Garut       |      2010 |    3 |   3 | 3500000 |
| 003  | Budhy Bungaox     | 1989-01-20 | Tasikmalaya |      2011 |    4 |   4 | 5000000 |
| 006  | Ina Nurlian       | 1993-08-09 | Sumedang    |      2011 |    4 |   4 | 5000000 |
| 007  | Cheppy Chardut    | 1992-07-09 | Garut       |      2011 |    4 |   4 | 5000000 |
+------+-------------------+------------+-------------+-----------+------+-----+---------+
10 rows in set (0.001 sec)

MariaDB [DBMS11_2420506044]> select * from TbPegawai left join TbGaji on TbPegawai.gol = TbGaji.gol
    -> union all
    -> select * from TbPegawai right join TbGaji on TbPegawai.gol = TbGaji.gol;
+------+-------------------+------------+-------------+-----------+------+------+---------+
| NIP  | Nama              | tgl_lahir  | Kota        | thn_masuk | Gol  | Gol  | Gapok   |
+------+-------------------+------------+-------------+-----------+------+------+---------+
| 001  | Ahmad Burhanuddin | 1990-12-12 | Bandung     |      2010 |    3 |    3 | 3500000 |
| 002  | Amin Imsyorry     | 1989-12-02 | Ciamis      |      2009 |    2 |    2 | 2000000 |
| 003  | Budhy Bungaox     | 1989-01-20 | Tasikmalaya |      2011 |    4 |    4 | 5000000 |
| 004  | Zulkarnaen        | 1991-02-20 | Bandung     |      2009 |    1 |    1 | 1500000 |
| 005  | Dewi Sudewa       | 1990-12-02 | Bogor       |      2009 |    1 |    1 | 1500000 |
| 006  | Ina Nurlian       | 1993-08-09 | Sumedang    |      2011 |    4 |    4 | 5000000 |
| 007  | Cheppy Chardut    | 1992-07-09 | Garut       |      2011 |    4 |    4 | 5000000 |
| 008  | Dodong M          | 1990-07-10 | Bandung     |      2010 |    3 |    3 | 3500000 |
| 009  | Gandung P         | 1990-06-25 | Bogor       |      2009 |    2 |    2 | 2000000 |
| 010  | Agus Wisman       | 1993-10-17 | Garut       |      2010 |    3 |    3 | 3500000 |
| 004  | Zulkarnaen        | 1991-02-20 | Bandung     |      2009 |    1 |    1 | 1500000 |
| 005  | Dewi Sudewa       | 1990-12-02 | Bogor       |      2009 |    1 |    1 | 1500000 |
| 002  | Amin Imsyorry     | 1989-12-02 | Ciamis      |      2009 |    2 |    2 | 2000000 |
| 009  | Gandung P         | 1990-06-25 | Bogor       |      2009 |    2 |    2 | 2000000 |
| 001  | Ahmad Burhanuddin | 1990-12-12 | Bandung     |      2010 |    3 |    3 | 3500000 |
| 008  | Dodong M          | 1990-07-10 | Bandung     |      2010 |    3 |    3 | 3500000 |
| 010  | Agus Wisman       | 1993-10-17 | Garut       |      2010 |    3 |    3 | 3500000 |
| 003  | Budhy Bungaox     | 1989-01-20 | Tasikmalaya |      2011 |    4 |    4 | 5000000 |
| 006  | Ina Nurlian       | 1993-08-09 | Sumedang    |      2011 |    4 |    4 | 5000000 |
| 007  | Cheppy Chardut    | 1992-07-09 | Garut       |      2011 |    4 |    4 | 5000000 |
+------+-------------------+------------+-------------+-----------+------+------+---------+
20 rows in set (0.002 sec)


MariaDB [DBMS11_2420506044]> Bye
Ctrl-C -- exit!
