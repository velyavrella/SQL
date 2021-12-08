# Mengakses suatu database
USE belajar_sql;

# Menampilkan seluruh tabel
SHOW TABLES;

# MySQL memiliki berbagai cara melakukan pengolahan data, hal ini disebut Storage Engines.
# Saat ini, yang biasa dan populer digunakan adalah InnoDB
# Menampilkan seluruh engine
SHOW ENGINES;

# Membuat tabel baru
CREATE TABLE barang (
id INT,
nama VARCHAR(100),
harga INT,
jumlah INT
)
ENGINE innodb;

# Melihat struktur tabel
DESC barang;
SHOW CREATE TABLE barang;

## Update Table
# Menambahkan kolom baru
ALTER TABLE barang
ADD column nama_colomn TEXT;
ALTER TABLE barang
ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT current_timestamp;
ALTER TABLE barang
ADD kategori ENUM ('Makanan','Minuman','Lain-lain')		# ENUM adalah tipe data String yang bisa kita tentukan pilihan pilihannya
AFTER nama;

# Mengganti nama kolom
ALTER TABLE barang
RENAME column namee to nama;

# Menghapus kolom
ALTER TABLE barang
DROP column nama_colomn;

# Mengubah format suatu kolom
ALTER TABLE barang
MODIFY jumlah INT 
FIRST;
ALTER TABLE barang
MODIFY nama VARCHAR(100) 
AFTER jumlah;
ALTER TABLE barang
MODIFY id INT NOT NULL;
ALTER TABLE barang
MODIFY jumlah INT NOT NULL 
DEFAULT 0;

## Insert Data
INSERT INTO barang (id, nama)
VALUES (1, 'Apel');

# Menampilkan seluruh data pada suatu tabel
SELECT * FROM barang;

# Menghapus semua data pada tabel atau membuat ulang tabel
TRUNCATE barang;
# Menghapus tabel
DROP TABLE barang;