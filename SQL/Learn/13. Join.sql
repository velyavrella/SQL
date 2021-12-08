# Mengakses suatu database
USE belajar_sql;

## JOIN
# MySQL mendukung query SELECT langsung ke beberapa tabel secara sekaligus dengan melakukan JOIN

# Melakukan JOIN Table
SELECT * FROM wishlist
JOIN products ON ( wishlist.id_product = products.id);

SELECT p.id AS id_wishlist, 
		p.nama AS product_name, 
        w.deskripsi AS wishlist_description 
FROM wishlist AS w
JOIN products AS p ON ( w.id_product = p.id);

DESC customers;

# Membuat Relasi ke Table Customers
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

# Melakukan JOIN Multiple Table
SELECT c.email, p.id, p.nama, w.deskripsi
FROM wishlist AS w
JOIN products AS p ON (p.id = w.id_product)
JOIN customers AS c ON (c.id = w.id_customer);