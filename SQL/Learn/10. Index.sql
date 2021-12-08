# Mengakses suatu database
USE belajar_sql;

## INDEX
# Secara default, MySQL akan menyimpan data di dalam disk seperti tabel biasanya 
# sehingga semakin besar data maka akan semakin lambat proses pencarian datanya
# Saat kita membuat index, MySQL akan menyimpan data dalam struktur data B-Tree 
# Kita bisa membuat lebih dari satu index di table, dan setiap kita membuat index, kita bisa membuat
# index untuk beberapa kolom sekaligus
# Index membuat proses pencarian dan query lebih cepat, tapi memperlambat proses manipulasi data
# Saat kita membuat PRIMARY KEY dan UNIQUE constraint, kita tidak perlu menambahkan lagi index karna sudah auto
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

# Menambahkan index
ALTER TABLE sellers
ADD INDEX name_index (name);

# Menghapus index
ALTER TABLE sellers
DROP INDEX name_index; 