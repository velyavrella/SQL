# Mengakses suatu database
USE belajar_sql;

## One to One Relationship
# One to One relationship adalah relasi antar tabel yang paling sederhana
# Artinya tiap data di sebuah tabel hanya boleh berelasi ke maksimal 1 data di tabel lainnya
# Tidak boleh ada relasi lebih dari 1 data
# Contoh misal, kita membuat aplikasi toko online yang terdapat fitur wallet, dan 1 customer, cuma boleh punya 1 wallet

# Membuat One to One Relationship
# Kita bisa membuat kolom foreign key, lalu set kolom tersebut menggunakan UNIQUE KEY, hal ini
# dapat mencegah terjadi data di kolom tersebut agar tidak duplikat
# Atau cara lainnya, kita bisa membuat tabel dengan primary key yang sama, sehingga tidak butuh
# lagi kolom untuk FOREIGN KEY

# Membuat Table Wallet
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

SELECT * FROM wallet;

SELECT c.email, w.balance 
FROM wallet AS w
JOIN customers AS c ON (w.id_customer = c.id);

## One to Many Relationship
# One to many relationship adalah relasi antar tabel dimana satu data bisa digunakan lebih dari satu kali di tabel relasinya
# Contoh relasi antar tabel categories dan products, dimana satu category bisa digunakan oleh lebih
# dari satu product, yang artinya relasinya nya one category to many products
# Pembuatan relasi one to many sebenarnya sama dengan one to one, yang membedakan adalah, kita
# tidak perlu menggunakan UNIQUE KEY, karena datanya memang bisa berkali-kali ditambahkan di tabel relasi nya

# Membuat Table Category
CREATE TABLE categories (
	id VARCHAR(10) NOT NULL,
	nama VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC categories;

# Mengubah Tabel Product
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
# Many to Many adalah table relationship yang paling kompleks, dan kadang membingungkan untuk pemula
# Many to Many adalah relasi dimana ada relasi antara 2 tabel dimana table pertama bisa punya
# banyak relasi di table kedua, dan table kedua pun punya banyak relasi di table pertama
# Contoh relasi many to many adalah relasi antara produk dan penjualan, dimana setiap produk bisa
# dijual berkali kali, dan setiap penjualan bisa untuk lebih dari satu produk

# Membuat Table Relasi
# Tabel ini bertugas sebagai jembatan untuk menggabungkan relasi many to many
# Isi table ini akan ada id dari table pertama dan table kedua, dalam kasus ini adalah id_product dan id_order
# Dengan demikian, kita bisa menambahkan beberapa data ke dalam tabel relasi ini, sehingga berarti
# satu product bisa dijual beberapa kali di dalam table order, dan satu order bisa membeli lebih dari satu product

# Membuat Table Order
CREATE TABLE orders (
	id INT NOT NULL AUTO_INCREMENT,
    total INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC orders;

# Membuat Table Order Detail
# Tabel Relasi
CREATE TABLE orders_detail (
id_produk VARCHAR(10) NOT NULL,
id_order INT NOT NULL,
harga INT NOT NULL,
jumlah INT NOT NULL,
PRIMARY KEY (id_produk, id_order)
) ENGINE = InnoDB;

# Membuat Foreign Key
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

# Melihat Data Order, Detail dan Product-nya
SELECT *
FROM orders AS o
	JOIN orders_detail AS od ON (o.id = od.id_order)
    JOIN products AS p ON (od.id_produk = p.id);