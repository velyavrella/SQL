# Mengakses suatu database
USE belajar_sql;

## Transaction
# Database transaction adalah fitur di DBMS dimana kita bisa memungkinan beberapa perintah
# dianggap menjadi sebuah kesatuan perintah yang kita sebut transaction
# Jika terdapat satu saja proses gagal di transaction, maka secara otomatis perintah-perintah
# sebelumnya akan dibatalkan
# Jika sebuah transaction sukses, maka semua perintah akan dipastikan sukses

# START TRANSACTION : Memulai proses transaksi, proses selanjutnya akan dianggap transaksi sampai perintah COMMIT atau ROLLBACK
# COMMIT : Menyimpan secara permanen seluruh proses transaksi
# ROLLBACK : Membatalkan secara permanen seluruh proses transaksi

# Perintah DDL (Data Definition Language) tidak bisa menggunakan fitur transaction
# DDL adalah perintah-perintah yang digunakan untuk merubah struktur, seperti membuat tabel,
# menambah kolom, menghapus tabel, menghapus database, dan sejenisnya
# Transaction hanya bisa dilakukan pada perintah DML (Data Manipulation Language), seperti operasi INSERT, UPDATE dan DELETE

START TRANSACTION;

INSERT INTO guestbooks ( email, title, content)
VALUES ('contoh@gmai.com', 'Contoh', 'Contoh'),
('contoh2@gmai.com', 'Contoh', 'Contoh'),
('contoh3@gmai.com', 'Contoh', 'Contoh') ;

SELECT * FROM guestbooks;

COMMIT; # Data baru tersimpan permanent

START TRANSACTION;

DELETE FROM guestbooks;
# di user lain tidak terdelete

ROLLBACK ; 
# membatalkan proses yang dilakukan setelah start transaction
