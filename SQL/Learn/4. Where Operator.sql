# Mengakses suatu database
USE belajar_sql;

# Melihat struktur suatu tabel
DESC products;

# Where clause
SELECT id, nama, harga, jumlah 
FROM products
WHERE jumlah = 0;

# Mengubah Dengan Value di Kolom
UPDATE products
SET kategori = 'Makanan'
WHERE id = 'P001';
UPDATE products
SET kategori = 'Makanan', deskripsi = 'Mie Ayam Original + Ceker'
WHERE id = 'P003';

# Menghapus Data
DELETE FROM products
WHERE id = 'P009';

# AND dan OR Operator
SELECT * FROM products
WHERE jumlah > 100 AND harga > 10000;
SELECT * FROM products
WHERE jumlah > 500 OR harga > 20000;
SELECT * FROM products
WHERE (jumlah > 500 OR harga > 20000) AND kategori = 'Makanan';		# Prioritas dengan Kurung ()

# LIKE operator adalah operator yang bisa kita gunakan untuk mencari sebagian data dalam String
# Ini cocok sekali ketika kita hanya ingin mencari sebagian kata dalam String
# Operasi LIKE tidak case sensitive, jadi huruf besar dan kecil tidak akan berpengaruh
# Terdapat pula NOT LIKE
SELECT * 
FROM products
WHERE nama LIKE '%so%'; 

# Ada operator khusus untuk mencari data NULL, yaitu menggunakan NULL operator
# IS NULL, artinya mencari yang NULL
# IS NOT NULL, artinya mencari yang tidak NULL
SELECT * 
FROM products
WHERE deskripsi IS NULL;

SELECT * 
FROM products
WHERE deskripsi IS NOT NULL;

# Kadang kita ingin mencari data yang >= dan <= secara sekaligus
# Namun ada operator BETWEEN yang bisa kita gunakan agar lebih sederhana
# Untuk kebalikannya, kita bisa gunakan NOT BETWEEN
SELECT * 
FROM products
WHERE harga BETWEEN 10000 AND 20000;

# Operator IN adalah operator untuk melakukan pencarian sebuah kolom dengan beberapa nilai.
SELECT * 
FROM products
WHERE kategori IN ('Makanan', 'Minuman');