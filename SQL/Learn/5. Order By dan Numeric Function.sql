# Mengakses suatu database
USE belajar_sql;

# Melihat struktur suatu tabel
DESC products;

## Order By Clause
# ORDER BY clause digunakan untuk mengurutkan data berdasarkan kolom yang dipilih, dan jenis urutan (ASC atau DESC)
SELECT id, kategori, nama, harga 
FROM products
WHERE kategori IN ('Makanan', 'Minuman')
ORDER BY harga DESC, kategori;		# default ASC

## Limit Clause
# Kita bisa membatasi jumlah data yang diambil dalam SQL SELECT dengan LIMIT clause
# Selain membatasi jumlah data, kita juga bisa meng-skip sejumlah data yang tidak ingin kita lihat
SELECT id, kategori, nama, harga 
FROM products
WHERE kategori IN ('Makanan')
ORDER BY harga DESC
LIMIT 2;

SELECT * 
FROM products
WHERE harga > 0
ORDER BY id
LIMIT 0, 5;		# mulai dari data ke 1 dst hingga menghasilkan 5 data

SELECT * 
FROM products
WHERE harga > 0
ORDER BY id
LIMIT 5, 5;		# mulai dari data ke 6 dst hingga menghasilkan 5 data

## Numeric Function
SELECT id, harga DIV 1000 AS 'Harga dalam Ribuan'
FROM products;

SELECT id, SIN(harga)
FROM products;