## DATABASE
show databases;
CREATE DATABASE belajar_sql;
use belajar_sql;

## TABLE
show tables;
show engines;
CREATE TABLE barang (
id INT,
nama VARCHAR(100),
harga INT,
jumlah INT
)
ENGINE innodb;
DROP TABLE barang;
DESC barang;

## Update Table
ALTER TABLE barang
ADD column nama_colomn TEXT;

ALTER TABLE barang
RENAME column namee to nama;
ALTER TABLE barang
DROP column nama_colomn;
ALTER TABLE barang
MODIFY jumlah INT FIRST;
ALTER TABLE barang
MODIFY nama VARCHAR(100) AFTER jumlah;
ALTER TABLE barang
MODIFY id INT NOT NULL;

ALTER TABLE barang
MODIFY jumlah INT NOT NULL DEFAULT 0;

ALTER TABLE barang
ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT current_timestamp;

## Insert Data
INSERT INTO barang (id, nama)
VALUES (1, 'Apel');

SELECT * FROM barang;

TRUNCATE barang;
DROP TABLE products;

CREATE TABLE products (
id VARCHAR(10) NOT NULL,
nama VARCHAR(100) NOT NULL,
deskripsi VARCHAR(100) ,
harga INT UNSIGNED NOT NULL,
jumlah INT UNSIGNED NOT NULL DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE innodb;

SHOW TABLES;
DESC products;

INSERT INTO products (id, nama, harga, jumlah)
VALUES ('P001', 'Mie Ayam Original', 15000, 100);

SELECT * FROM products;

INSERT INTO products (id, nama, deskripsi, harga, jumlah)
VALUES ('P002', 'Mie Ayam Baso', 'Mie Ayam Original + Baso', 20000, 100);

INSERT INTO products (id, nama, harga, jumlah)
VALUES ('P003', 'Mie Ayam Ceker', 20000, 100),
('P004', 'Mie Ayam Spesial', 25000, 100),
('P005', 'Mie Ayam Yamin', 15000, 100);

## Select Data
SELECT * FROM products;
SELECT id, nama, harga, jumlah FROM products;

## Primary Key
ALTER TABLE products
ADD PRIMARY KEY (id);

DESC products;

## Where Clause
SELECT id, nama, harga, jumlah 
FROM products
WHERE jumlah = 0;

SELECT id, nama, harga, jumlah 
FROM products
WHERE harga = 15000;

## Update Data
ALTER TABLE products
ADD kategori ENUM ('Makanan','Minuman','Lain-lain')
AFTER nama;

UPDATE products
SET kategori = 'Makanan'
WHERE id = 'P001';

UPDATE products
SET kategori = 'Makanan', deskripsi = 'Mie Ayam Original + Ceker'
WHERE id = 'P003';

UPDATE products
SET harga = harga + 5000
WHERE id = 'P003';

INSERT INTO products (id, nama, harga, jumlah)
VALUES ('P009', 'Mie Ayam Ceker', 20000, 100);
SELECT * FROM products;

## Delete Data
DELETE FROM products
WHERE id = 'P009';

## Alias
SELECT p.id AS 'Kode Produk', p.nama AS 'Nama Produk' FROM products AS p;

INSERT INTO products (id, nama, kategori, harga, jumlah)
VALUES ('P006', 'Bakso Rusuk', 'Makanan', 25000, 200),
('P007', 'Es Jeruk', 'Minuman', 10000, 300),
('P008', 'Es Campur', 'Minuman', 15000, 500),
('P009', 'Es Teh Manis', 'Minuman', 5000, 400),
('P010', 'Kerupuk', 'Lain-lain', 2500, 1000),
('P011', 'Kerupuk Udang', 'Lain-lain', 10000, 300),
('P012', 'Es Krim', 'Lain-lain', 25000, 200),
('P013', 'Mie Ayam Jamur', 'Makanan', 20000, 50),
('P014', 'Bakso Telor', 'Makanan', 20000, 150),
('P015', 'Bakso Jando', 'Makanan', 25000, 300);

## Where Operator
UPDATE products
SET harga = 25000
WHERE id = 'P010';

SELECT * FROM products
WHERE jumlah > 100;

SELECT * FROM products
WHERE kategori != 'Makanan';

SELECT * FROM products
WHERE jumlah > 100 AND harga > 10000;

SELECT * FROM products
WHERE jumlah > 500 OR harga > 20000;

SELECT * FROM products
WHERE (jumlah > 500 OR harga > 20000) AND kategori = 'Makanan';

SELECT * 
FROM products
WHERE nama LIKE '%so%'; 

SELECT * 
FROM products
WHERE deskripsi IS NULL;

SELECT * 
FROM products
WHERE deskripsi IS NOT NULL;

SELECT * 
FROM products
WHERE harga BETWEEN 10000 AND 20000;

SELECT * 
FROM products
WHERE kategori IN ('Makanan', 'Minuman');

## Order By Clause
SELECT id, kategori, nama, harga 
FROM products
WHERE kategori IN ('Makanan', 'Minuman')
ORDER BY harga DESC, kategori;

## Limit Clause
SELECT id, kategori, nama, harga 
FROM products
WHERE kategori IN ('Makanan')
ORDER BY harga DESC
LIMIT 2;

SELECT * 
FROM products
WHERE harga > 0
ORDER BY id
LIMIT 0, 5;

SELECT * 
FROM products
WHERE harga > 0
ORDER BY id
LIMIT 5, 5;

## Select Distinct Data
SELECT DISTINCT kategori FROM products;

## Numeric Function
SELECT id, harga DIV 1000 AS 'Harga dalam Ribuan'
FROM products;

SELECT id, SIN(harga)
FROM products;

## Auto Increment
CREATE TABLE admin (
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC admin;

INSERT INTO admin (first_name, last_name)
VALUES ('Eko', 'Khannedy'),
('Budi', 'Nugraha'),
('Joko', 'Morro'); 

SELECT * FROM admin;
DELETE FROM admin
WHERE id = 3;

INSERT INTO admin (first_name, last_name)
VALUES ('Joko', 'Morro');

SELECT LAST_INSERT_ID();

INSERT INTO admin (first_name, last_name)
VALUES ('Rully', 'Hidayat');

## String Function
SELECT id, LOWER(nama) AS 'Nama Lower', LENGTH(nama) AS 'Panjang Nama'
FROM products;

## Date and Time Function
SELECT id,
	EXTRACT(YEAR FROM created_at) AS Year,
    EXTRACT(MONTH FROM created_at) AS Month
FROM products;

SELECT id, YEAR(created_at), MONTH(created_at)
FROM products;

## Flow Control Function
SELECT id,
	CASE kategori
    WHEN 'Makanan' THEN 'Enak'
    WHEN 'Minuman' THEN 'Segar'
    ELSE 'Apa itu?'
    END AS 'Kategori'
FROM products;

SELECT id, harga,
	IF (harga <= 15000, 'Murah',
		IF (harga <= 20000,'Mahal','Mahal Banget')
        ) AS 'Mahal?'
FROM products;
      
SELECT id, harga, IFNULL(deskripsi,'Kosong')
FROM products;

## Aggregate Function
SELECT COUNT(id) AS 'Total Product' FROM products;
SELECT AVG(harga) AS 'Rata-rata Harga Product' FROM products;  
SELECT MAX(harga) AS 'Product Termahal', id, nama FROM products;    

## Grouping
SELECT kategori, 
	COUNT(id) AS 'Total Product'
FROM products
GROUP BY kategori;

SELECT kategori, 
	MAX(harga) AS 'Product Termahal'
FROM products
GROUP BY kategori;

## Having Clause (Filter untuk hasil aggregate)
SELECT kategori, 
	COUNT(id) AS total
FROM products
GROUP BY kategori
HAVING total>1;

## Constraint
CREATE TABLE customers (
id INT NOT NULL AUTO_INCREMENT,
email VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100),
PRIMARY KEY (id),
UNIQUE KEY email_unique (email)
)ENGINE = InnoDB;
DESC customers;

ALTER TABLE customers
DROP CONSTRAINT email_unique;

ALTER TABLE customers
ADD CONSTRAINT email_unique UNIQUE (email);

INSERT INTO customers ( email, first_name, last_name)
VALUES ('eko@gmail.com', 'Eko', 'Kurnia');
SELECT * FROM customers;

INSERT INTO customers ( email, first_name, last_name)
VALUES ('kurnia@gmail.com', 'Eko', 'Kurnia');

## Check Constraint
DESC products;

#CREATE TABLE products (
#id VARCHAR(10) NOT NULL,
#nama VARCHAR(100) NOT NULL,
#deskripsi VARCHAR(100) ,
#harga INT UNSIGNED NOT NULL,
#jumlah INT UNSIGNED NOT NULL DEFAULT 0,
#created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
#PRIMARY KEY (id),
#CONSTRAINT price_check CHECK ( harga>= 1000)
#) ENGINE innodb;

ALTER TABLE products
ADD CONSTRAINT price_check CHECK (harga >= 1000);

SHOW CREATE TABLE products;

INSERT INTO products (id, nama, kategori, harga, jumlah)
VALUES ('P016', 'Permen', 'Lain-lain', 1000, 1000);

UPDATE products
SET harga = 500
WHERE id = 'P016'; #Tidak bisa

## INDEX
CREATE TABLE sellers (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
name2 VARCHAR(100),
name3 VARCHAR(100),
email VARCHAR(100),
PRIMARY KEY (id),
UNIQUE KEY email_unique(email),
INDEX name_index(name),
INDEX name2_index(name2),
INDEX name3_index(name2),
INDEX name1_name2_name3_index (name, name2, name3) # Jika sudah ada indeks ini, indeks di atas tidak perlu
) ENGINE = InnoDB;

SHOW CREATE TABLE sellers;

SELECT * FROM sellers
WHERE name = 'X';

SELECT * FROM sellers
WHERE name = 'X' AND name2 = 'X';

SELECT * FROM sellers
WHERE name2 = 'X' AND name3 = 'X'; # Gak Cepet, Gakan Kena Index

ALTER TABLE sellers
DROP INDEX name_index; # Tidak Perlu

## Full Text Search

#CREATE TABLE products (
#id VARCHAR(10) NOT NULL,
#nama VARCHAR(100) NOT NULL,
#deskripsi VARCHAR(100) ,
#harga INT UNSIGNED NOT NULL,
#jumlah INT UNSIGNED NOT NULL DEFAULT 0,
#created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
#PRIMARY KEY (id),
#FULLTEXT product_search (nama, deskripsi)
#) ENGINE innodb;

ALTER TABLE products
DROP INDEX product_search;

ALTER TABLE products
ADD FULLTEXT product_search (nama, deskripsi);

## Natural Language Mode
#SELECT * 
#FROM products 
#WHERE nama LIKE '%ayam%' OR deskripsi LIKE '%ayam%'; 

SELECT * FROM products
WHERE MATCH(nama, deskripsi)
	AGAINST('ayam' IN NATURAL LANGUAGE MODE);
    
## Boolean Mode 
SELECT * FROM products
WHERE MATCH(nama, deskripsi)
	AGAINST('+mie -baso' IN BOOLEAN MODE);
    
## Query Expansion Mode
SELECT * FROM products
WHERE MATCH(nama, deskripsi)
	AGAINST('baso' WITH QUERY EXPANSION);
    
## Table Relationship
# Foreign Key
CREATE TABLE wishlist (
id INT NOT NULL AUTO_INCREMENT,
id_product VARCHAR(10) NOT NULL,
deskripsi TEXT,
PRIMARY KEY (id),
CONSTRAINT fk_wishlist_product
	FOREIGN KEY (id_product) REFERENCES products (id)
) ENGINE = InnoDB;

DESC wishlist;

INSERT INTO wishlist (id_product, deskripsi)
VALUES ('P001', 'Makanan Kesukaan');

INSERT INTO wishlist (id_product, deskripsi)
VALUES ('SALAH', 'Makanan Kesukaan'); # Tidak bisa

#Tidak bisa menghapus data yang reference di tabel lain
DELETE FROM products
WHERE id = 'P001'; #RESTRICT (Default Behavior Foreign Key)

# Mengubah Behavior Menghapus Relasi
ALTER TABLE wishlist
	DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
	ADD CONSTRAINT fk_wishlist_product
		FOREIGN KEY (id_product) REFERENCES products (id)
			ON DELETE CASCADE ON UPDATE CASCADE;
SHOW CREATE TABLE wishlist;

INSERT INTO products (id, nama, kategori, harga, jumlah)
VALUES ('PXXX', 'Contoh', 'Lain-lain', 1000, 1000);

INSERT INTO wishlist (id_product, deskripsi)
VALUES ('PXXX', 'Makanan Kesukaan');

DELETE FROM products
WHERE id = 'PXXX'; # Data hilang di kedua tabel

## JOIN
SELECT * FROM wishlist
JOIN products ON ( wishlist.id_product = products.id);

SELECT p.id AS id_wishlist, 
		p.nama AS product_name, 
        w.deskripsi AS wishlist_description 
FROM wishlist AS w
JOIN products AS p ON ( w.id_product = p.id);

DESC customers;

ALTER TABLE wishlist
ADD id_customer INT;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_customers
	FOREIGN KEY (id_customer) REFERENCES customers(id);

SELECT * FROM customers;
SELECT * FROM wishlist;

UPDATE wishlist
SET id_customer = 1
WHERE id = 1;

# Join lebih dari 2 tabel
SELECT c.email, p.id, p.nama, w.deskripsi
FROM wishlist AS w
JOIN products AS p ON (p.id = w.id_product)
JOIN customers AS c ON (c.id = w.id_customer);

## One to One Relationship
# Tidak voleh ada relasi lebih dari 1 data
# Contoh 1 customer 1 wallet

CREATE TABLE wallet (
	id INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY fk_id_customer_unique (id_customer),
    CONSTRAINT fk_wallet_customer
		FOREIGN KEY (id_customer) REFERENCES customers(id)
) ENGINE = InnoDB;

DESC wallet;
SELECT * FROM customers;

INSERT INTO wallet (id_customer)
VALUES (1), (3);

SELECT c.email, w.balance 
FROM wallet AS w
JOIN customers AS c ON (w.id_customer = c.id);

## One to Many Relationship
# Contoh kategori dan product

CREATE TABLE categories (
	id VARCHAR(10) NOT NULL,
	nama VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC categories;

ALTER TABLE products
	ADD id_kategori VARCHAR(100);
    
ALTER TABLE products
	ADD CONSTRAINT fk_product_category
		FOREIGN KEY (id_kategori) REFERENCES categories(id);
        
SHOW CREATE TABLE products;
SELECT * FROM products;

INSERT INTO categories (id,nama)
VALUES ('C001','Makanan'),
		('C002','Minuman'),
        ('C003','Lain-lain');
        
UPDATE products
SET id_kategori = 'C001'
WHERE id IN ('P001','P002','P003','P004','P005','P006','P013','P014','P015');
UPDATE products
SET id_kategori = 'C002'
WHERE id IN ('P007','P008','P009');
UPDATE products
SET id_kategori = 'C003'
WHERE id IN ('P010','P011','P012','P016');

SELECT p.id, p.nama, c.nama
FROM products AS p
JOIN categories AS c ON (c.id = p.id_kategori);

## Many to Many Relationship
# Contoh antara tabel produk dan penjualan, dimana
# setiap produk bisa dijual berkali-kali dan setiap penjualan
# bisa untuk beberapa produk
# Buat 1 Tabel sebagai penghubung

CREATE TABLE orders (
	id INT NOT NULL AUTO_INCREMENT,
    total INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC orders;

# Tabel Relasi
CREATE TABLE orders_detail (
id_produk VARCHAR(10) NOT NULL,
id_order INT NOT NULL,
harga INT NOT NULL,
jumlah INT NOT NULL,
PRIMARY KEY (id_produk, id_order)
) ENGINE = InnoDB;

ALTER TABLE orders_detail
	ADD CONSTRAINT fk_orders_detail_product
		FOREIGN KEY (id_produk) REFERENCES products(id);
        
ALTER TABLE orders_detail
	ADD CONSTRAINT fk_orders_detail_order
		FOREIGN KEY (id_order) REFERENCES orders(id);
        
SHOW CREATE TABLE orders_detail;

INSERT INTO orders (total)
VALUES (50000); 

SELECT * FROM orders;

INSERT INTO orders_detail (id_produk, id_order, harga, jumlah)
VALUES ('P001', 1, 25000, 1),
('P002', 1, 25000, 1);

INSERT INTO orders_detail (id_produk, id_order, harga, jumlah)
VALUES ('P003', 2, 25000, 1),
('P004', 2, 25000, 1);

INSERT INTO orders_detail (id_produk, id_order, harga, jumlah)
VALUES ('P001', 3, 25000, 1),
('P003', 3, 25000, 1);

SELECT * FROM orders_detail;

SELECT *
FROM orders AS o
	JOIN orders_detail AS od ON (o.id = od.id_order)
    JOIN products AS p ON (od.id_produk = p.id);

## Jenis-jenis JOIN
# (INNER, LEFT, RIGHT, CROSS)

# INNER JOIN (irisan) (DEFAULT)

SELECT * FROM products;

INSERT INTO categories (id, nama)
VALUES ('C004','Oleh-oleh'),
		('C005','Gadget');
        
INSERT INTO products (id, nama, harga, jumlah)
VALUES ('X001', 'X Satu', 1000, 1000),
		('X002', 'X Dua', 1000, 1000),
		('X003', 'X Tiga', 1000, 1000);

SELECT * FROM categories AS c
INNER JOIN products AS p ON (c.id = p.id_kategori);

## LEFT JOIN
SELECT * FROM categories AS c
LEFT JOIN products AS p ON (c.id = p.id_kategori);
 
## RIGHT JOIN
SELECT * FROM categories AS c
RIGHT JOIN products AS p ON (c.id = p.id_kategori);

## CROSS JOIN
# Mengkalikan data di table pertama dengan data di table kedua
# Tidak Ada relasi
SELECT * FROM categories
CROSS JOIN products;

# Membuat Tabel Perkalian
CREATE TABLE numbers (
id INT NOT NULL,
PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO numbers (id)
VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

SELECT n1.id AS 'Numbers 1', n2.id AS 'Numbers 2', (n1.id*n2.id) AS Times 
FROM numbers AS n1
CROSS JOIN numbers AS n2
ORDER BY n1.id, n2.id;

## Subqueries
# WHERE
SELECT *
FROM products
WHERE harga > (SELECT AVG(harga) FROM products);

SELECT * FROM products;

# FROM
SELECT MAX(cp.harga)
FROM (SELECT p.harga
	  FROM categories AS c
      INNER JOIN products AS p ON (c.id = p.id_kategori)) AS cp;
      
## Set Operator
CREATE TABLE guestbooks (
	id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    PRIMARY KEY (id)
    ) ENGINE = InnoDB;
    
INSERT INTO guestbooks (email, title, content)
VALUES ('guest@gmail.com', 'Hello','Hello'),
	   ('guest2@gmail.com', 'Hello','Hello'),
       ('guest3@gmail.com', 'Hello','Hello'),
       ('eko@gmail.com', 'Hello','Hello'),
       ('eko@gmail.com', 'Hello','Hello'),
       ('eko@gmail.com', 'Hello','Hello');

SELECT * FROM guestbooks;

# UNION 
# data duplikat dihapus
SELECT DISTINCT email FROM customers
UNION
SELECT DISTINCT email FROM guestbooks;

## UNION ALL
# Data duplikat tidak dihapus
SELECT DISTINCT email FROM customers
UNION ALL
SELECT DISTINCT email FROM guestbooks;

SELECT e.email, COUNT(e.email) AS jumlah
FROM (SELECT c.email FROM customers AS c
UNION ALL
SELECT gb.email FROM guestbooks AS gb) AS e
GROUP BY e.email;

## Intersect (Irisan)
# MYSQL tidak ada
SELECT DISTINCT email
FROM customers
WHERE email IN (SELECT DISTINCT email FROM guestbooks);

SELECT DISTINCT c.email
FROM customers AS c
INNER JOIN guestbooks AS gb ON (gb.email = c.email);

## MINUS
# query pertama dikurang query kedua
SELECT DISTINCT c.email, gb.email 
FROM customers AS c
LEFT JOIN guestbooks AS gb ON (c.email = gb.email)
WHERE gb.email IS NULL;

## Transaction
START TRANSACTION;

INSERT INTO guestbooks ( email, title, content)
VALUES ('contoh@gmai.com', 'Contoh', 'Contoh'),
('contoh2@gmai.com', 'Contoh', 'Contoh'),
('contoh3@gmai.com', 'Contoh', 'Contoh') ;

SELECT * FROM guestbooks;

COMMIT; #Data baru tersimpan permanent

START TRANSACTION;

DELETE FROM guestbooks;
# di user lain tidak terdelete

ROLLBACK ; 
# membatalkan proses yang dilakukan setelah start transaction

# Yang tidak bisa menggunakan transaction
# DDL (perintah untuk merubah struktur seperti membuat tabel, menambah kolom, menghapus tabel, database) tidak bisa menggunakan fitur transaction
# Transaction hanya vusa pada perintah DML ( seperti INSERT, UPDATE, dan DELETE)

## LOCKING
# proses mengunci data karena diakses oleh banyak pengguna jika tidak akan terjadi RACE CONDITION yaitu proses balapan ketika mengubah data yang sama

# Locking Record
# saat proses TRANSACTION lalu dilakukan proses perubahan data, data yg diubah otomatis di LOCK
# Locking akan membuat sebuah proses perubahan yang dilakukan oleh pihak lain akan diminta untuk menunggu
# Data akan di lock sampai dilakukan COMMIT atau ROLLBACK transaksi tersebut

#(buat 2 console) 

#user1

START TRANSACTION ;
SELECT * FROM guestbooks;

UPDATE guestbooks
SET title = 'Diubah Oleh User 1'
WHERE id = 9;

COMMIT;

#user2

START TRANSACTION ;

SELECT * FROM guestbooks; # belom berubah

UPDATE guestbooks
SET title = 'Diubah Oleh User 2'
WHERE id = 9; #Running ketika user1 sudah COMMIT
# Satu-satu dieksekusi, bergantian jika digunakan proses transaction

## Locking Record secara Manual 
#Jika kita ingin melakukan locking data secara manual
# Kita busa tambahkan perintah FOR UPDATE di belakang query SELECT

#user1

START TRANSACTION ;
SELECT * FROM products ;

SELECT * FROM products WHERE id = 'P001' FOR UPDATE;

UPDATE products
SET jumlah = jumlah - 10
WHERE id = 'P001' ;

COMMIT;
#user lain akan menunggu sampai proses transaksi user1 selesai menggunakan COMMIT

## Deadlock
# yaitu situasi ada 2 proses yang saling menunggu satu sama lain, 
# namun data yang ditunggu dua-duanya di lock oleh proses lainnya, 
# sehingga proses menunggunya ini tidak akan pernah selesai

## Locking Table
# ada 2 jenis yaitu 
# READ (hanya bisa read) dan WRITE (read dan bisa write (user lain tidak bisa keduanya))

LOCK TABLES products READ;
LOCK TABLES products WRITE;

UNLOCK TABLES;

## Locking Instance
# yaitu perintah locking yang akan meminta perintal DDL untuk menunggu sampai proses unlock instance

LOCK INSTANCE FOR BACKUP;
UNLOCK INSTANCE;

## User Management
# Membuat/Menghapus User
CREATE USER 'eko'@'localhost';
CREATE USER 'khannedy'@'%'; # bisa diakses dari manapun

DROP USER 'eko'@'localhost';
DROP USER 'khannedy'@'%';

# Menambahkan/Menghapus Hak Akses
GRANT SELECT ON belajar_sql.* TO 'eko'@'localhost'; # * artinya semua tabel
GRANT SELECT, INSERT, UPDATE, DELETE ON belajar_sql.* TO 'khannedy'@'%';

SHOW GRANTS FOR 'eko'@'localhost'; # Melihat Hak Akses User
SHOW GRANTS FOR 'khannedy'@'%';

REVOKE SELECT ON belajar_sql.* FROM 'eko'@'localhost'; # Menghapus Hak Akses User
REVOKE SELECT, INSERT, UPDATE, DELETE ON belajar_sql.* FROM 'khannedy'@'%';

# Mengubah Password untuk User
SET PASSWORD FOR 'eko'@'localhost' = 'rahasia';
SET PASSWORD FOR 'khannedy'@'%' = 'rahasia';

## Backup Database
# MySQL menyediakan apk untuk melakukan backup data yaitu mysqldump
# mysqldump belajar_mysql --user root --password --result-file=/Users/khannedy/Desktop/backup.sql

## Restore Database
# Bisa menggunakan apk MySQL Client atau dengan perintah SOURCE di MySQL

# Melakukan Import Database
# mysql --user=root --password belajar_mysql_import < Users/khannedy/Desktop/belajar_mysql.sql

CREATE DATABASE belajar_mysql_import;

USE belajar_mysql_import;

# SOURCE /Users/khannedy/Desktop/belajar_mysql.sql

# SHOW TABLES belajar_mysql_import;
