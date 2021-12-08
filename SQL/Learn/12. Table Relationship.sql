# Mengakses suatu database
USE belajar_sql;

# Table Relationship
# Kita bisa melakukan relasi dari satu tabel ke tabel lain.
# Saat membuat relasi tabel, biasanya kita akan membuat sebuah kolom sebagai referensi ke tabel lainnya
# Kolom referensi ini di MySQL dinamakan Foreign Key

# Membuat Table dengan Foreign Key
CREATE TABLE wishlist (
id INT NOT NULL AUTO_INCREMENT,
id_product VARCHAR(10) NOT NULL,
deskripsi TEXT,
PRIMARY KEY (id),
CONSTRAINT fk_wishlist_product
	FOREIGN KEY (id_product) REFERENCES products (id)
) ENGINE = InnoDB;

DESC wishlist;

# Menambah/Menghapus Foreign Key
# Mengubah Behavior Menghapus Relasi
ALTER TABLE wishlist
	DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
	ADD CONSTRAINT fk_wishlist_product
		FOREIGN KEY (id_product) REFERENCES products (id);
            
# Foreign key memastikan bahwa data yang kita masukkan ke kolom tersebut harus tersedia di tabel reference nya
# Selain itu saat kita menghapus data di tabel reference, MySQL akan mengecek apakah id nya
# digunakan di foreign key di tabel lain, jika digunakan, maka secara otomatis MySQL akan menolak
# proses delete data di tabel reference tersebut
# Kita bisa mengubah fitur ini jika kita mau, ada banyak hal yang bisa dilakukan ketika data berelasi
# dihapus, defaultnya memang akan ditolak (RESTRICT)
# Selain itu, ada CASCADE (dihapus/diupdate juga), NO ACTION (dibiarkan), dan SET NULL.

# Mengubah Behavior Menghapus Relasi
ALTER TABLE wishlist
	ADD CONSTRAINT fk_wishlist_product
		FOREIGN KEY (id_product) REFERENCES products (id)
			ON DELETE CASCADE ON UPDATE CASCADE;