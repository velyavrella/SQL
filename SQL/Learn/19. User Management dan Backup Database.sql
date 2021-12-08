# Mengakses suatu database
USE belajar_sql;

## User Management
# Membuat/Menghapus User
CREATE USER 'eko'@'localhost';
CREATE USER 'khannedy'@'%'; # bisa diakses dari manapun

DROP USER 'eko'@'localhost';
DROP USER 'khannedy'@'%';

# Menambahkan/Menghapus Hak Akses
GRANT SELECT ON belajar_sql.* TO 'eko'@'localhost'; # * artinya semua tabel
GRANT SELECT, INSERT, UPDATE, DELETE ON belajar_sql.* TO 'khannedy'@'%';

SHOW GRANTS FOR 'eko'@'localhost'; # Melihat Hak Akses User
SHOW GRANTS FOR 'khannedy'@'%';

REVOKE SELECT ON belajar_sql.* FROM 'eko'@'localhost'; # Menghapus Hak Akses User
REVOKE SELECT, INSERT, UPDATE, DELETE ON belajar_sql.* FROM 'khannedy'@'%';

# Mengubah Password untuk User
SET PASSWORD FOR 'eko'@'localhost' = 'rahasia';
SET PASSWORD FOR 'khannedy'@'%' = 'rahasia';

## Backup Database
# MySQL menyediakan apk untuk melakukan backup data yaitu mysqldump
# mysqldump belajar_mysql --user root --password --result-file=/Users/khannedy/Desktop/backup.sql

## Restore Database
# Bisa menggunakan apk MySQL Client atau dengan perintah SOURCE di MySQL

# Melakukan Import Database
# mysql --user=root --password belajar_mysql_import < Users/khannedy/Desktop/belajar_mysql.sql

CREATE DATABASE belajar_mysql_import;

USE belajar_mysql_import;

# SOURCE /Users/khannedy/Desktop/belajar_mysql.sql

# SHOW TABLES belajar_mysql_import;