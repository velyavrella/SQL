# Mengakses suatu database
USE belajar_sql;

# Melihat struktur suatu tabel
DESC products;

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

## Having Clause
# Kadang kita ingin melakukan filter terhadap data yang sudah kita grouping
# Untuk memfilter hasil aggregate function, kita harus menggunakan HAVING clause
SELECT kategori, 
	COUNT(id) AS total
FROM products
GROUP BY kategori
HAVING total>1;