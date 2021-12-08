# Mengakses suatu database
USE belajar_sql;

## Full Text Search
# Full-Text Search memungkinkan kita bisa mencari sebagian kata di kolom dengan tipe data String
# Ini sangat cocok ketika pada kasus kita memang membutuhkan pencarian yang tidak hanya
# sekedar operasi = (equals, sama dengan)

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

# Menambah/Menghapus Full-Text Search
ALTER TABLE products
DROP INDEX product_search;

ALTER TABLE products
ADD FULLTEXT product_search (nama, deskripsi);

# Mode Full-Text Search
# MySQL menyediakan beberapa mode untuk melakukan pencarian di Full-Text Search

# 1. Natural Language, yaitu mencari seperti bahasa natural (per kata)
#SELECT * 
#FROM products 
#WHERE nama LIKE '%ayam%' OR deskripsi LIKE '%ayam%'; 

SELECT * FROM products
WHERE MATCH(nama, deskripsi)
	AGAINST('ayam' IN NATURAL LANGUAGE MODE);
    
# 2. Boolean, yaitu mencari dengan kemampuan mengandung kata (+) atau tidak mengandung kata (-) dan lain-lain
SELECT * FROM products
WHERE MATCH(nama, deskripsi)
	AGAINST('+mie -baso' IN BOOLEAN MODE);
    
# 3. Query Expansion, yaitu mencari seperti natural language, namun melakukan dua kali pencarian,
# pencarian pertama menggunakan natural language, pencarian kedua melakukan pencarian dari
# kedekatan hasil pertama, misal kita mencari kata “bakso”, lalu ternyata di dalam “bakso” ada kata
# “mie”, maka kemungkinan query kedua akan mencari kata “mie” juga
SELECT * FROM products
WHERE MATCH(nama, deskripsi)
	AGAINST('baso' WITH QUERY EXPANSION);