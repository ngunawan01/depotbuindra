drop database if exists afl2sem3;
create database afl2sem3;
use afl2sem3;

-- TABLE & DUMM DATA: LINE 8 - 97
-- VIEW: LINE 100 - 130

create table LIST_ITEM (
id_item varchar(6) primary key,
nama_item varchar(50),
jenis_item varchar(8),
harga_item int
);

insert into LIST_ITEM (id_item, nama_item, jenis_item, harga_item) 
values
( 'MA0001', 'Nasi Pecel', 'Makanan', '33000'),
( 'MA0002', 'Misua Ikan', 'Makanan', '48000'),
( 'MA0003', 'Misua', 'Makanan', '43000'),
( 'MA0004', 'Nasi Tim Ayam', 'Makanan', '35000'),
( 'MA0005', 'Nasi Semur Lidah', 'Makanan', '48000'),
( 'MA0006', 'Nasi Ayam Kalasan', 'Makanan', '38000'),
( 'MA0007', 'Nasi Bakmoi', 'Makanan', '33000'),
( 'MA0008', 'Nasi Campur', 'Makanan', '33000'),
( 'MA0009', 'Nasi Osek', 'Makanan', '33000'),
( 'MA0010', 'Nasi Kare Ayam', 'Makanan', '38000'),
( 'MA0011', 'Nasi Rawon', 'Makanan', '33000'),
( 'MA0012', 'Lontong Cap Go Meh', 'Makanan', '53000'),
( 'MA0013', 'Lontong Mie', 'Makanan', '25000'),
( 'MA0014', 'Nasi Ayam Geprek', 'Makanan', '28000'),
( 'MA0015', 'Dorang Penyet', 'Makanan', '53000'),
( 'MA0016', 'Gado-gado', 'Makanan', '28000'),
( 'MA0017', 'Tahu Telor', 'Makanan', '28000'),
( 'MA0018', 'Nasi Empal Kisi', 'Makanan', '33000'),
( 'MA0019', 'Nasi Babat', 'Makanan', '33000'),
( 'MA0020', 'Nasi Lidah', 'Makanan', '33000'),
( 'MA0021', 'Ayam Kalasan', 'Makanan', '28000'),
( 'MA0022', 'Rawon', 'Makanan', '43000'),
( 'MA0023', 'Bakmoi', 'Makanan', '43000'),

( 'MI0001', 'Alang-alang', 'Minuman', '13000'),
( 'MI0002', 'Aqua', 'Minuman', '8000'),
( 'MI0003', 'Teh', 'Minuman','8000'),
( 'MI0004', 'Soda Gembira', 'Minuman','20000'),
( 'MI0005', 'Honey Lemon Cui', 'Minuman','20000'),
( 'MI0006', 'Sari Kedelai', 'Minuman','13000'),
( 'MI0007', 'Kopi cream', 'Minuman','15000'),
( 'MI0008', 'Kopi O', 'Minuman','15000'),
( 'MI0009', 'Es jeruk manis', 'Minuman','20000'),
( 'MI0010', 'Cao', 'Minuman','13000'),

( 'SN0001', 'Kerupuk Putih', 'Snack', '5000'),
( 'SN0002', 'Kerupuk Udang', 'Snack', '10000'),
( 'SN0003', 'Kerupuk Ikan', 'Snack', '10000'),
( 'SN0004', 'Keripik Pisang', 'Snack', '40000'),
( 'SN0005', 'Keripik Thailand', 'Snack', '45000'),
( 'SN0006', 'Belinjo', 'Snack', '35000'),
( 'SN0007', 'Risoles', 'Snack', '7000'),
( 'SN0008', 'Tahu isi', 'Snack', '6000'),
( 'SN0009', 'Ote-ote', 'Snack', '8000'),
( 'SN0010', 'Kerupuk Warna', 'Snack', '5000'),
( 'SN0011', 'Lemper Ayam', 'Snack', '15000'),
( 'SN0012', 'Pisang Goreng', 'Snack', '9000'),
( 'SN0013', 'Keripik Mama Lita', 'Snack', '40000');

create table DTRANS (
id_nota varchar(12) references htrans(id_nota),
id_item varchar(6) references LIST_ITEM(id_item),
harga_item int,
jumlah_item int,
subtotal int
);

insert into DTRANS (id_nota, id_item, harga_item, jumlah_item, subtotal)
value
('171020230001', 'MA0001', '33000', '5', '165000'),
('171020230001', 'MA0002', '43000', '3', '129000'),
('171020230002', 'MA0001', '33000', '3', '99000'),
('171020230002', 'MA0002', '43000', '1', '43000')
;


create table HTRANS (
id_nota varchar(12) primary key,
id_karyawan varchar(8) references karyawan(id_karyawan),
tanggal_transaksi date,
nama_customer varchar(30),
nama_pegawai varchar(30),
meja_customer varchar(30),
harga_total int,
status_del varchar(1)
);

insert into HTRANS (id_nota, id_karyawan, tanggal_transaksi, nama_customer, nama_pegawai, meja_customer, harga_total,status_del)
value
('171020230001', 'KA0001', '2023-10-17', 'Marvel Brody', 'Wilbert','03', '450000','F'),
('171020230002', 'KA0002', '2023-10-17' , 'Theo Indomaret', 'Vivi','01', '142000','P')
;


create table KARYAWAN (
id_karyawan varchar(8) primary key,
username varchar(20) references userdata(username),
nama_lengkap varchar(70),
gender varchar(1),
peran char(20),
gaji_per_bulan int,
city varchar(20),
birthdate date,
nik varchar(20),
shift varchar(20),
address varchar(50)
);

insert into KARYAWAN (id_karyawan, username, nama_lengkap, gender, peran, gaji_per_bulan, city, birthdate, nik,shift, address)
value
('KA0001', 'Ngunawan01', 'Nathan Gunawan', 'P', 'Manager', 10000000,'Surabaya', '2003-12-17', '15928379832', 'Evening', 'street somewhere 342'),
('KA0002', 'JNugroho01', 'Josephine Nugroho', 'L', 'Kasir', '10000000','Jakarta', '1993-10-17', '273478942380', 'Morning', 'street somewhere 123')
;

create table USERDATA (
username varchar(20) primary key,
pasword varchar(32),
id_karyawan varchar(8) references karyawan(id_karyawan)
);

insert into USERDATA(username, pasword, id_karyawan) 
value 
('Ngunawan01', 'abcd1234' , 'KA0001'),
('JNugroho01', 'bcde2345', 'KA0002');

create table EXPENSE (
id_pengeluaran varchar(8),
nama_pengeluaran varchar(50),
jenis_pengeluaran varchar(20),
tanggal_pengeluaran date,
total_pengeluaran int,
status_del varchar(1)
);

insert into EXPENSE (id_pengeluaran, nama_pengeluaran, jenis_pengeluaran, tanggal_pengeluaran, total_pengeluaran,status_del)
value
('PE000001', 'barang belanjaaan', 'COGS', '2023-10-23', '400000','F'),
('PE000002', 'listrik bulan agustus 2023', 'Operational Cost', '2023-11-23', '2000000','F');


drop trigger if exists tInsKaryawan;
 delimiter //
 create trigger tInsKaryawan
 before insert
 on karyawan
 for each row
 begin
   set new.id_karyawan = fGenIdKaryawan();
end //
delimiter ;


drop function if exists fGenIdKaryawan;
DELIMITER $$
create function fGenIdKaryawan()
returns varchar(6) deterministic
begin
    declare output varchar(6);
    SELECT CONCAT('KA', LPAD(COALESCE(MAX(CAST(SUBSTRING(id_karyawan FROM 3) AS UNSIGNED)), 0) + 1, 4, '0')) into output
    from karyawan;
    return output;
END $$
DELIMITER ;


drop trigger if exists tInsMenu;
 delimiter //
 create trigger tInsMenu
 before insert
 on list_item
 for each row
 begin
  if new.jenis_item = 'Makanan' then set new.id_item = fGenIdMenuMakanan();
  elseif new.jenis_item = 'Minuman' then set new.id_item = fGenIdMenuMinuman();
  elseif new.jenis_item = 'Snack' then set new.id_item = fGenIdMenuSnack();
    end if;
end //
delimiter ;


drop function if exists fGenIdMenuMakanan;
DELIMITER $$
create function fGenIdMenuMakanan()
returns varchar(6) deterministic
begin
    declare output varchar(6);
    SELECT CONCAT('MA', LPAD(COALESCE(MAX(CAST(SUBSTRING(id_item FROM 3) AS UNSIGNED)), 0) + 1, 4, '0')) into output
    -- select concat('MA', coalesce(max(cast(substring(id_item from 3) as unsigned)), 0) + 1) into output
    from list_item;
    return output;
END $$
DELIMITER ;

drop function if exists fGenIdMenuMinuman;
DELIMITER $$
create function fGenIdMenuMinuman()
returns varchar(6) deterministic
begin
    declare output varchar(6);
    SELECT CONCAT('MI', LPAD(COALESCE(MAX(CAST(SUBSTRING(id_item FROM 3) AS UNSIGNED)), 0) + 1, 4, '0')) into output
    -- select concat('MI', coalesce(max(cast(substring(id_item from 3) as unsigned)), 0) + 1) into output
    from list_item;
    return output;
END $$
DELIMITER ;

drop function if exists fGenIdMenuSnack;
DELIMITER $$
create function fGenIdMenuSnack()
returns varchar(6) deterministic
begin
    declare output varchar(6);
    SELECT CONCAT('SN', LPAD(COALESCE(MAX(CAST(SUBSTRING(id_item FROM 3) AS UNSIGNED)), 0) + 1, 4, '0')) into output
    -- select concat('SN', coalesce(max(cast(substring(id_item from 3) as unsigned)), 0) + 1) into output
    from list_item;
    return output;
END $$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION fAutoGenIDPengeluaran()
RETURNS TEXT DETERMINISTIC
BEGIN
 Declare Result text;
 Declare bob int;
    select count(id_pengeluaran) into bob from expense;
    if bob < 9 then select concat("PE00000",count(id_pengeluaran)+1) into Result from expense;
    elseif bob < 99 then select concat("PE0000",count(id_pengeluaran)+1) into Result from expense;
    elseif bob < 999 then select concat("PE000",count(id_pengeluaran)+1) into Result from expense;
    elseif bob < 9999 then select concat("PE00",count(id_pengeluaran)+1) into Result from expense;
    elseif bob < 99999 then select concat("PE0",count(id_pengeluaran)+1) into Result from expense;
    else select concat("PE",count(id_pengeluaran)+1) into Result from expense;
    end if;
    RETURN Result;
END $$
DELIMITER ; 

delimiter $$
create trigger tAutoGenPengeluaranID
before insert
on expense
for each row
begin
 set new.id_pengeluaran = fAutoGenIDPengeluaran();
end $$
delimiter ;


delimiter $$
CREATE PROCEDURE pAmbilIDTerakhir()
BEGIN
    select id_nota
    from htrans
    where id_nota = (SELECT last_value(id_nota) over (PARTITION BY id_nota order by id_nota DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING )from htrans limit 1);
END $$
delimiter ;

delimiter $$
CREATE PROCEDURE pAmbilIDTerakhirEmployee()
BEGIN
    select id_karyawan
    from karyawan
    where id_karyawan = (SELECT last_value(id_karyawan) over (PARTITION BY id_karyawan order by id_karyawan DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING )from karyawan limit 1);
END $$
delimiter ;


DELIMITER $$
CREATE FUNCTION GenerateOrderID() RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
  DECLARE new_id VARCHAR(255);
  Declare Result text;
 Declare bob int;
    select count(id_nota) into bob from htrans WHERE id_nota LIKE CONCAT( DATE_FORMAT(NOW(), '%d%m%Y'), '%');
    if bob < 9 then select concat(DATE_FORMAT(NOW(), '%d%m%Y'),"000",count(id_nota)+1) into Result from htrans WHERE id_nota LIKE CONCAT( DATE_FORMAT(NOW(), '%d%m%Y'), '%');
    elseif bob < 99 then select concat(DATE_FORMAT(NOW(), '%d%m%Y'),"00",count(id_nota)+1) into Result from htrans WHERE id_nota LIKE CONCAT( DATE_FORMAT(NOW(), '%d%m%Y'), '%');
    elseif bob < 999 then select concat(DATE_FORMAT(NOW(), '%d%m%Y'),"0",count(id_nota)+1) into Result from htrans WHERE id_nota LIKE CONCAT( DATE_FORMAT(NOW(), '%d%m%Y'), '%');
    else select concat(DATE_FORMAT(NOW(), '%d%m%Y'),count(id_nota)+1) into Result from htrans WHERE id_nota LIKE CONCAT( DATE_FORMAT(NOW(), '%d%m%Y'), '%');
    end if;
    RETURN Result;
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER AutoHtransID
BEFORE INSERT ON htrans
FOR EACH ROW
BEGIN
  SET NEW.id_nota = GenerateOrderID();
END $$
DELIMITER ;


CREATE VIEW vLapPenjualan AS
SELECT
    DATE_FORMAT(tanggal_pengeluaran, '%Y-%m-%d') AS tanggal,
    SUM(total_pengeluaran) AS total_pengeluaran
FROM
    EXPENSE
WHERE
    tanggal_pengeluaran BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE()
GROUP BY
    tanggal
ORDER BY
    tanggal DESC;


CREATE VIEW v_totalcogs AS
SELECT
    DATE_FORMAT(tanggal_pengeluaran, '%Y-%m-%d') AS tanggal,
    SUM(total_pengeluaran) AS total_cogs
FROM
    EXPENSE
WHERE
    jenis_pengeluaran = 'COGS'
    AND tanggal_pengeluaran BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE()
GROUP BY
    tanggal
ORDER BY
    tanggal DESC;


CREATE VIEW v_totaloperationalcost AS
SELECT
    DATE_FORMAT(tanggal_pengeluaran, '%Y-%m-%d') AS tanggal,
    SUM(total_pengeluaran) AS total_operational_cost
FROM
    EXPENSE
WHERE
    jenis_pengeluaran = 'Operational Cost'
    AND tanggal_pengeluaran BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE()
GROUP BY
    tanggal
ORDER BY
    tanggal DESC;


CREATE VIEW v_pemasukan AS
SELECT
    DATE_FORMAT(tanggal_transaksi, '%Y-%m-%d') AS tanggal,
    SUM(harga_total) AS total_pemasukan
FROM
    HTRANS
WHERE
    tanggal_transaksi BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE()
GROUP BY
    tanggal
ORDER BY
    tanggal DESC;

CREATE VIEW v_keuntungan AS
SELECT
    DATE_FORMAT(tanggal_transaksi, '%Y-%m-%d') AS tanggal,
    SUM(harga_total) - COALESCE(SUM(total_pengeluaran), 0) AS total_keuntungan
FROM
    HTRANS
LEFT JOIN
    EXPENSE ON DATE_FORMAT(tanggal_transaksi, '%Y-%m-%d') = DATE_FORMAT(tanggal_pengeluaran, '%Y-%m-%d')
WHERE
    tanggal_transaksi BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE()
GROUP BY
    tanggal
ORDER BY
    tanggal DESC;

CREATE VIEW v_penjualanharian AS
SELECT
    DATE_FORMAT(tanggal_transaksi, '%Y-%m-%d') AS tanggal,
    SUM(harga_total) AS revenue_penjualan_harian
FROM
    HTRANS
GROUP BY
    tanggal
ORDER BY
    tanggal DESC;