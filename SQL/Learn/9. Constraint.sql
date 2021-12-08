# Mengakses suatu database
USE belajar_sql;

## Constraint
# Di MySQL, kita bisa menambahkan constraint untuk menjaga data di tabel tetap baik
# Constraint sangat bagus ditambahkan untuk menjaga terjadi validasi yang salah di program kita,
# sehingga data yang masuk ke database tetap akan terjaga
CREATE TABLE customers (
id INT NOT NULL AUTO_INCREMENT,
email VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100),
PRIMARY KEY (id),
UNIQUE KEY email_unique (email)
)ENGINE = InnoDB;

# Cek Constraint
DESC customers;

# Menghapus Unique Constraint
ALTER TABLE customers
DROP CONSTRAINT email_unique;

# Menambah Unique Constraint
ALTER TABLE customers
ADD CONSTRAINT email_unique UNIQUE (email);

INSERT INTO customers ( email, first_name, last_name)
VALUES ('eko@gmail.com', 'Eko', 'Kurnia');

SELECT * FROM customers;

INSERT INTO customers ( email, first_name, last_name)
VALUES ('kurnia@gmail.com', 'Eko', 'Kurnia');

CREATE TABLE products (
id VARCHAR(10) NOT NULL,
nama VARCHAR(100) NOT NULL,
deskripsi VARCHAR(100) ,
harga INT UNSIGNED NOT NULL,
jumlah INT UNSIGNED NOT NULL DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id),
CONSTRAINT price_check CHECK ( harga>= 1000)
) ENGINE innodb;

# Cek Constraint
SHOW CREATE TABLE products;

# Menambah/Menghapus Check Constraint
ALTER TABLE products
ADD CONSTRAINT price_check CHECK (harga >= 1000);
ALTER TABLE products
DROP CONSTRAINT price_check;

SELECT * FROM products;

INSERT INTO products (id, nama, harga, jumlah)
VALUES ('P016', 'Permen', 1000, 1000);

UPDATE products
SET harga = 500
WHERE id = 'P016'; #Tidak bisa