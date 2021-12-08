# Mengakses suatu database
USE belajar_sql;

## LOCKING
# proses mengunci data karena diakses oleh banyak pengguna jika tidak akan terjadi 
# RACE CONDITION yaitu proses balapan ketika mengubah data yang sama

## Locking Record
# saat proses TRANSACTION lalu dilakukan proses perubahan data, data yg diubah otomatis di LOCK
# Locking akan membuat sebuah proses perubahan yang dilakukan oleh pihak lain akan diminta untuk menunggu
# Data akan di lock sampai dilakukan COMMIT atau ROLLBACK transaksi tersebut

#(buat 2 console) 

#user1

START TRANSACTION ;
SELECT * FROM guestbooks;

UPDATE guestbooks
SET title = 'Diubah Oleh User 1'
WHERE id = 9;

COMMIT;

#user2

START TRANSACTION ;

SELECT * FROM guestbooks; # belom berubah

UPDATE guestbooks
SET title = 'Diubah Oleh User 2'
WHERE id = 9; #Running ketika user1 sudah COMMIT
# Satu-satu dieksekusi, bergantian jika digunakan proses transaction

## Locking Record secara Manual 
# Jika kita ingin melakukan locking data secara manual
# Kita busa tambahkan perintah FOR UPDATE di belakang query SELECT

#user1

START TRANSACTION ;
SELECT * FROM products ;

SELECT * FROM products WHERE id = 'P001' FOR UPDATE;

UPDATE products
SET jumlah = jumlah - 10
WHERE id = 'P001' ;

COMMIT;
#user lain akan menunggu sampai proses transaksi user1 selesai menggunakan COMMIT

## Deadlock
# yaitu situasi ada 2 proses yang saling menunggu satu sama lain, 
# namun data yang ditunggu dua-duanya di lock oleh proses lainnya, 
# sehingga proses menunggunya ini tidak akan pernah selesai

## Locking Table
# MySQL mendukung proses locking terhadap sebuah tabel
# Jika kita me lock table, artinya satu seluruh data di tabel tersebut akan di lock
# ada 2 jenis yaitu 
# READ (hanya bisa read) dan WRITE (read dan bisa write (user lain tidak bisa keduanya))
# Setelah selesai melakukan lock table, kita bisa melakukan unlock dengan perintah : UNLOCK TABLES;

LOCK TABLES products READ;
LOCK TABLES products WRITE;

UNLOCK TABLES;

## Locking Instance
# Lock instance adalah perintah locking yang akan membuat perintah DDL (data definition language)
# akan diminta menunggu sampai proses unlock instance
# Biasanya proses locking instance ini terjadi ketika misal kita ingin melakukan backup data, agar
# tidak terjadi perubahan terhadap struktur tabel misalnya, kita bisa melakukan locking instance
# Setelah proses backup selesai, baru kita unlock lagi instance nya

# Untuk melakukan locking instance, kita bisa gunakan perintah :
LOCK INSTANCE FOR BACKUP;
# Untuk melakukan unlock instance, kita bisa gunakan perintah :
UNLOCK INSTANCE;