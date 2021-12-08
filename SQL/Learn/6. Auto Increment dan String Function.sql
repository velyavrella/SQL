# Mengakses suatu database
USE belajar_sql;

## Auto Increment
# Kadang kita butuh angka yang berurut untuk membuat primary key, misal 1, 2, 3, dan seterusnya.
# Dengan menggunakan auto increment, kita tidak perlu lalu memasukkan data primary key, ini akan
# otomatis dibuat oleh MySQL
CREATE TABLE admin (
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
) ENGINE = InnoDB;

# Melihat struktur suatu tabel
DESC admin;

# Melihat id terakhir
SELECT LAST_INSERT_ID();

# Menginput data pada tabel
INSERT INTO admin (first_name, last_name)
VALUES ('Eko', 'Khannedy'),
('Budi', 'Nugraha'),
('Joko', 'Morro'); 

## String Function
SELECT id, LOWER(nama) AS 'Nama Lower', LENGTH(nama) AS 'Panjang Nama'
FROM products;

## Date and Time Function
SELECT id, YEAR(created_at) AS Year, MONTH(created_at) AS Month
FROM products;