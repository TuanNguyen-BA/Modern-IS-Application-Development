
--- Tao bang:
CREATE TABLE ChiTiet
(
	Ma int identity primary key,
	TieuDe nvarchar(200),
	NoiDung nvarchar(max),
	LanXem int,
	NgayDang date,
	IDBanTin int
)
GO

CREATE TABLE BanTin
(
	Ma int identity primary key,
	NoiDung nvarchar(50)
)
GO

CREATE TABLE DangNhap
(
	Ma int identity primary key,
	UserName nvarchar(50),
	_PassWord nvarchar(50)
)
GO

ALTER TABLE ChiTiet
ADD CONSTRAINT ChiTiet_BanTin_FK
FOREIGN KEY (IDBanTin)
REFERENCES BanTin(Ma)
GO

---Them thong tin:

INSERT INTO BanTin(NoiDung)
VALUES 
	(N'Tin tức giao thông'),
	(N'Thông tin xe'),
	(N'Luật giao thông'),
	(N'Danh sách xe')
GO

INSERT INTO DangNhap(UserName, _PassWord)
VALUES 
	('Tuan', '123456'),
	('Admin', '654321')
GO

SELECT * FROM DangNhap;
GO
------------------------------------------------------------------

-- Select, insert, update, delete 'BanTin'

CREATE PROC BanTin_Insert
(@noiDung nvarchar(50))
AS
BEGIN
	INSERT INTO BanTin(NoiDung) VALUES (@noiDung)
END
GO

select * from BanTin;

CREATE PROC BanTin_Update
(@noiDung nvarchar(50), @ma int)
AS
BEGIN
	UPDATE BanTin SET NoiDung = @noiDung WHERE Ma = @ma
END
GO

CREATE PROC BanTin_Delete
(@ma int)
AS
BEGIN
	DELETE FROM BanTin WHERE Ma = @ma
END
GO

ALTER PROC BanTin_SelectAll
AS
BEGIN
	SELECT * FROM BanTin
END
GO

CREATE PROC BanTin_SelectID
(@ma int)
AS
BEGIN
	SELECT * FROM BanTin WHERE Ma = @Ma
END
GO

-- Select, insert, update, delete 'ChiTiet'

CREATE PROC ChiTiet_SelectAll
AS
BEGIN
	SELECT * FROM ChiTiet
END
GO

CREATE PROC ChiTiet_SelectMa
(@ma int)
AS
BEGIN
	SELECT * FROM ChiTiet WHERE Ma = @ma
END
GO

CREATE PROC ChiTiet_SelectIDBanTin
(@idBanTin int)
AS
BEGIN
	SELECT * FROM ChiTiet WHERE IDBanTin = @idBanTin
END
GO

CREATE PROC ChiTiet_Insert
(@tieuDe nvarchar(200), @noiDung nvarchar(max), @ngayDang date, @idBanTin int)
AS
BEGIN
	INSERT INTO ChiTiet(TieuDe, NoiDung, NgayDang, IDBanTin)
	VALUES (@tieuDe, @noiDung, @ngayDang, @idBanTin)
END
GO

CREATE PROC ChiTiet_Update
(@tieuDe nvarchar(200), @noiDung nvarchar(max), @ma int)
AS
BEGIN
	UPDATE ChiTiet
	SET TieuDe = @tieuDe, NoiDung = @noiDung
	WHERE Ma = @ma
END
GO

CREATE PROC ChiTiet_Delete
(@ma int)
AS
BEGIN
	DELETE FROM ChiTiet
	WHERE Ma = @ma
END
GO

CREATE PROC ChiTiet_SLXem
(@lanXem int, @ma int)
AS
BEGIN
	UPDATE ChiTiet
	SET LanXem = @lanXem
	WHERE Ma = @ma
END
GO

-- Select, insert, update, delete 'DangNhap'
CREATE PROC DangNhap_Insert
(@userName nvarchar(50), @pw nvarchar(50))
AS
BEGIN
	INSERT INTO DangNhap(UserName, _PassWord) VALUES (@userName, @pw)
END
GO

CREATE PROC DangNhap_Update
(@userName nvarchar(50), @pw nvarchar(50))
AS
BEGIN
	UPDATE DangNhap SET _PassWord = @pw WHERE UserName = @userName
END
GO

CREATE PROC DangNhap_Delete
(@userName nvarchar(50))
AS
BEGIN
	DELETE FROM DangNhap WHERE UserName = @userName
END
GO

CREATE PROC DangNhap_SelectAll
AS
BEGIN
	SELECT * FROM DangNhap
END
GO

ALTER PROC DangNhap_Search
(@userName nvarchar(50), @pw nvarchar(50))
AS
BEGIN
	SELECT * FROM DangNhap WHERE UserName = @userName AND _PassWord = @pw
END
GO

exec DangNhap_Search 'Tuan', '123456'

------------------------------------------------------------------------------------

ALTER PROC ChiTiet_SelectHome
AS
BEGIN
	SELECT top 10 * FROM ChiTiet
	ORDER BY Ma DESC
END
GO

ALTER PROC ChiTiet_SelectRandom
(
	@Ma int
)
AS
BEGIN
	SELECT TOP 5 * FROM ChiTiet --TABLESAMPLE (5 ROWS)
END
GO

CREATE PROC ChiTiet_LanXem
(
	@Ma int,
	@lanXem int output
)
AS
BEGIN
	SELECT @lanXem = LanXem FROM ChiTiet WHERE Ma = @Ma
END
GO

ALTER PROC ChiTiet_SelectID
(
	@Ma int
)
AS
BEGIN
	SELECT * FROM ChiTiet WHERE Ma = @Ma
END
GO

select * from BanTin
GO

------------------------------------------------------------------------------------

--ALTER TABLE Luat
--ALTER COLUMN NoiDung nvarchar(max)
--GO

--ALTER TABLE Luat
--ALTER COLUMN TenLuat nvarchar(200)
--GO

-- XE, LUẬT
select * from Luat
GO
CREATE PROC Luat_Insert
(@ten nvarchar(100), @noiDung nvarchar(max), @ngayHL date)
AS
BEGIN
	INSERT INTO Luat(TenLuat, NoiDung, NgayCoHieuLuc) VALUES (@ten, @noiDung, @ngayHL)
END
GO

select * from ConNguoi;
INSERT INTO ConNguoi(HoTen, CMND, DiaChi, NgaySinh)
VALUES	(N'Tuân', '215488700', N'227 Nguyễn Văn Cừ, Q5, TP.HCM', '20201010'),
		(N'Hy', '415233456', N'100 Nguyễn Thị Thập, Q7, TP.HCM', '20201010'),
		(N'Việt', '212222700', N'153 Lê Văn Việt, Q9, TP.HCM', '20201010')
GO

UPDATE CONNGUOI
SET NGAYSINH = '19990101'
GO

select * from ChuXe;
INSERT INTO ChuXe (SoLanNopPhat)
VALUES	('0'),
		('1'),
		('5')
GO

SELECT * FROM XE;
GO
SELECT * FROM ConNguoi
GO

INSERT INTO XE(BienSo, DacDiem, SoKmDaDi, MaLoai, NguoiSoHuu)
VALUES	('77N351612', N'SH 150i 2021 Phanh ABS', '20000', 3, 1),
		('51A141611', N'Lexus ES250 4 chỗ', '100', 1, 1),
		('59A000009', N'Jeek New Dibao Phanh Đĩa', '150', 4, 1),
		('59A000888', N'Honda Mono', '150', 4, 1),
		('59A800007', N'Dibao Jeek One', '150', 4, 1),

		('61A321612', N'Mercedes Benz GLC300 4 chỗ', '198', 1, 2),
		('61A311612', N'Range Rover 4 chỗ', '2012', 1, 2),
		('51A301614', N'Vinfast LUX SA2.0 4 chỗ', '50', 1, 2),
		('59A391614', N'Yamaha Xe máy Mx King', '15', 3, 2),
		('59A391000', N'Honda Vario 125', '19', 3, 2),

		('92A381614', N'Range Rover Evoque', '20000', 1, 3),
		('92B371618', N'Sportbike Honda CBR 600', '20000', 2, 3),
		('51C361600', N'Naked bike Yamaha FZ6', '20000', 2, 3),
		('51C001600', N'BMW K 1600 GTL​', '2900', 2, 3),
		('29C361080', N'Touring Honda Gold Wing', '20000', 2, 3)
GO

SELECT * FROM LoaiXe;
UPDATE LoaiXe
SET TenLoai = N'Xe máy điện' WHERE Ma = 4

INSERT INTO LoaiXe(TenLoai)
VALUES	(N'Ô tô'),
		(N'Mô tô'),
		(N'Xe máy'),
		(N'Xe máy điện')
GO

CREATE PROC Xe_SelectAll
AS
BEGIN
	SELECT Xe.BienSo, Xe.DacDiem, Xe.SoKmDaDi, LoaiXe.TenLoai, ConNguoi.HoTen, ConNguoi.DiaChi
	FROM Xe, ConNguoi, LoaiXe WHERE Xe.MaLoai = LoaiXe.Ma and Xe.NguoiSoHuu = ConNguoi.Ma
END
GO

CREATE PROC Xe_Search
(@bienSo varchar(20))
AS
BEGIN
	SELECT Xe.BienSo, Xe.DacDiem, Xe.SoKmDaDi, LoaiXe.TenLoai, ConNguoi.HoTen, ConNguoi.DiaChi
	FROM Xe, ConNguoi, LoaiXe WHERE Xe.BienSo = @bienSo and Xe.MaLoai = LoaiXe.Ma and Xe.NguoiSoHuu = ConNguoi.Ma
END
GO