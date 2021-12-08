# Mengakses suatu database
USE belajar_sql;

# Melihat struktur suatu tabel
DESC products;

## Flow Control Function
# MySQL memiliki fitur flow control function
# Ini mirip IF ELSE di bahasa pemrograman
SELECT id,
	CASE kategori
    WHEN 'Makanan' THEN 'Enak'
    WHEN 'Minuman' THEN 'Segar'
    ELSE 'Apa itu?'
    END AS 'Kategori'
FROM products;

SELECT id, harga,
	IF (harga <= 15000, 'Murah',
		IF (harga <= 20000,'Mahal','Mahal Banget')
        ) AS 'Mahal?'
FROM products;
      
SELECT id, harga, IFNULL(deskripsi,'Kosong')
FROM products;