# Mengakses suatu database
USE belajar_sql;

## Jenis-jenis JOIN
# (INNER, LEFT, RIGHT, CROSS)

INSERT INTO categories (id, nama)
VALUES ('C004','Oleh-oleh'),
		('C005','Gadget');
        
INSERT INTO products (id, nama, harga, jumlah)
VALUES ('X001', 'X Satu', 1000, 1000),
		('X002', 'X Dua', 1000, 1000),
		('X003', 'X Tiga', 1000, 1000);

SELECT * FROM products;

# INNER JOIN (irisan) (DEFAULT)
SELECT * FROM categories AS c
INNER JOIN products AS p ON (c.id = p.id_kategori);

## LEFT JOIN
# LEFT JOIN adalah mekanisme JOIN seperti INNER JOIN, namun semua data di table pertama akan diambil juga
# Jika ada yang tidak memiliki relasi di table kedua, maka hasilnya akan NULL
SELECT * FROM categories AS c
LEFT JOIN products AS p ON (c.id = p.id_kategori);
 
## RIGHT JOIN
# RIGHT JOIN adalah mekanisme JOIN seperti INNER JOIN, namun semua data di table kedua akan diambil juga
# Jika ada yang tidak memiliki relasi di table pertama, maka hasilnya akan NULL
SELECT * FROM categories AS c
RIGHT JOIN products AS p ON (c.id = p.id_kategori);

## CROSS JOIN
# CROSS JOIN adalah melakukan join dengan cara mengkalikan data di tabel pertama dengan dada di table kedua
# Artinya jika ada 5 data di tabel pertama, dan 5 data di tabel kedua, akan menghasilkan 25 kombinasi data (5 x 5)
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