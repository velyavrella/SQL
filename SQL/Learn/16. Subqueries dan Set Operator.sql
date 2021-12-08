# Mengakses suatu database
USE belajar_sql;

## Subqueries
# Melakukan Subquery di WHERE Clause
SELECT *
FROM products
WHERE harga > (SELECT AVG(harga) FROM products);

SELECT * FROM products;

# Melakukan Subquery di FROM Clause
SELECT MAX(cp.harga)
FROM (SELECT p.harga
	  FROM categories AS c
      INNER JOIN products AS p ON (c.id = p.id_kategori)) AS cp;
      
## Set Operator
# Operator Set adalah operasi antara hasil dari dua SELECT query.
# Ada banyak jenis operator Set, yaitu : UNION, UNION ALL, INTERSECT, dan MINUS

# Membuat Table Guest Book
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
# UNION adalah operasi menggabungkan dua buah SELECT query, dimana jika terdapat data yang
# duplikat, data duplikatnya akan dihapus dari hasil query 

# Melakukan Query UNION
SELECT DISTINCT email FROM customers
UNION
SELECT DISTINCT email FROM guestbooks;

## UNION ALL
# UNION ALL adalah operasi yang sama dengan UNION, namun data duplikat tetap akan
# ditampilkan di hasil query nya

# Melakukan Query UNION ALL
SELECT DISTINCT email FROM customers
UNION ALL
SELECT DISTINCT email FROM guestbooks;

SELECT e.email, COUNT(e.email) AS jumlah
FROM (SELECT c.email FROM customers AS c
UNION ALL
SELECT gb.email FROM guestbooks AS gb) AS e
GROUP BY e.email;

## Intersect (Irisan)
# INTERSECT adalah operasi menggabungkan dua query, namun yang diambil hanya data yang
# terdapat pada hasil query pertama dan query kedua
# Data nya muncul tidak dalam keadaan duplikat
# Sayangnya, MySQL tidak memiliki operator INTERSECT, dengan demikian untuk melakukan
# operasi INTERSECT, kita harus lakukan secara manual menggunakan JOIN atau SUBQUERY

# Melakukan Query INTERSECT
SELECT DISTINCT email
FROM customers
WHERE email IN (SELECT DISTINCT email FROM guestbooks);

SELECT DISTINCT c.email
FROM customers AS c
INNER JOIN guestbooks AS gb ON (gb.email = c.email);

## MINUS
# MINUS adalah operasi dimana query pertama akan dihilangkan oleh query kedua
# Artinya jika ada data di query pertama yang sama dengan data yang ada di query kedua, maka data
# tersebut akan dihapus dari hasil query MINUS
# Sayang nya, di MySQL juga tidak ada operator MINUS, namun hal ini bisa kita lakukan menggunakan JOIN

# Melakukan Query MINUS
SELECT DISTINCT c.email, gb.email 
FROM customers AS c
LEFT JOIN guestbooks AS gb ON (c.email = gb.email)
WHERE gb.email IS NULL;