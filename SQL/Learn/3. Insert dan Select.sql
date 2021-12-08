# Mengakses suatu database
USE belajar_sql;

# Membuat tabel baru
CREATE TABLE products (
id VARCHAR(10) NOT NULL,
nama VARCHAR(100) NOT NULL,
deskripsi VARCHAR(100) ,
harga INT UNSIGNED NOT NULL,
jumlah INT UNSIGNED NOT NULL DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE innodb;

# Melihat struktur suatu tabel
DESC products;

# Menginput data pada tabel
INSERT INTO products (id, nama, harga, jumlah)
VALUES ('P001', 'Mie Ayam Original', 15000, 100);
INSERT INTO products (id, nama, deskripsi, harga, jumlah)
VALUES ('P002', 'Mie Ayam Baso', 'Mie Ayam Original + Baso', 20000, 100);

# Memasukkan Beberapa Data Sekaligus
INSERT INTO products (id, nama, harga, jumlah)
VALUES ('P003', 'Mie Ayam Ceker', 20000, 100),
('P004', 'Mie Ayam Spesial', 25000, 100),
('P005', 'Mie Ayam Yamin', 15000, 100);

# Alias
SELECT p.id AS 'Kode Produk', p.nama AS 'Nama Produk' FROM products AS p;

SELECT * FROM products;

# Menampilkan seluruh data pada tabel
SELECT * FROM products;

# Menampilkan beberapa kolom pada tabel
SELECT id, nama, harga, jumlah FROM products;

## Select Distinct Data
# Jika kita ingin menghilangkan data-data duplikat , kita bisa menggunakan SELECT dengan
# tambahan DISTINCT sebelum nama kolom nya
SELECT DISTINCT kategori FROM products;

# Primary key adalah sebuah kolom yang kita tunjuk sebagai id dari tabel tersebut
# Primary key adalah identitas untuk tiap baris data di dalam tabel
# Primary key harus unik, tidak boleh ada data dengan primary key yang sama

# Menentukan primary key
CREATE TABLE products (
id VARCHAR(10) NOT NULL,
nama VARCHAR(100) NOT NULL,
deskripsi VARCHAR(100) ,
harga INT UNSIGNED NOT NULL,
jumlah INT UNSIGNED NOT NULL DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)
) ENGINE innodb;

ALTER TABLE products
ADD PRIMARY KEY (id);
DESC products;