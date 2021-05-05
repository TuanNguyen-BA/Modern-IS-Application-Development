
use master;

CREATE DATABASE QL_GiaoThong
GO

USE QL_GiaoThong
GO

-- 1. CREATE TABLES

CREATE TABLE ConNguoi
(
	Ma int identity primary key,
	HoTen nvarchar(100),
	CMND char(9),
	DiaChi nvarchar(100),
	NgaySinh date
)
GO

CREATE TABLE ChuXe
(
	MaCX int identity primary key,
	SoLanNopPhat int
)
GO

CREATE TABLE CanBo
(
	MaCB int identity primary key,
	ChucVu nvarchar(50),
	DiaPhuongCongTac nvarchar (100)
)
GO



CREATE TABLE BangLai
(
	MaBL int identity primary key,
	NguoiSoHuu int, --*
	NgayCap date,
	NoiCap nvarchar(100),
	Hang varchar(5),
)
GO

CREATE TABLE LichSuViPham
(
	Ma int identity primary key,
	LoiVP nvarchar(100),
	NgayVP date,
	SoTienDongPhat float,
	MaCB int,
	MaCX int
)
GO

CREATE TABLE Xe
(
	Ma int identity primary key,
	BienSo varchar(10) unique,
	DacDiem nvarchar(100),
	SoKmDaDi float,
	MaLoai int,
	NguoiSoHuu int
)
GO

CREATE TABLE LoaiXe
(
	Ma int identity primary key,
	TenLoai nvarchar(100)
)
GO

CREATE TABLE LichSuHanhTrinh
(
	Ma int identity primary key,
	NoiDi nvarchar(50),
	NoiDen nvarchar(50),
	SoKm float,
	MaXe int
)
GO

CREATE TABLE Duong
(
	Ma int identity primary key,
	TenDuong nvarchar(50),
	Quan nvarchar(20),
	ThanhPho nvarchar(50),
	TinhTrang nvarchar(20),
)
GO

CREATE TABLE Luat
(
	Ma int identity primary key,
	TenLuat nvarchar(50),
	NoiDung nvarchar(100),
	NgayCoHieuLuc date
)
GO

CREATE TABLE LichHen
(
	Ma int identity primary key,
	Ngay date,
	Gio time,
	MucDich nvarchar(100),
	TinhTrang nvarchar(100),
	MaCX int,
	NguoiLapLich int
)
GO

CREATE TABLE ThuePhi
(
	Ma int identity primary key,
	TenThue nvarchar(100),
	TienNop float,
	HanChotPhaiNop date,
	NoiDongTien nvarchar(100),
	TinhTrang nvarchar(20),
	MaCX int --*
)
GO

-- 2. CREATE FOREIGN KEYS

--a.
ALTER TABLE ChuXe
ADD CONSTRAINT CX_CN_FK
FOREIGN KEY (MaCX)
REFERENCES ConNguoi(Ma)
GO

--b.
ALTER TABLE CanBo
ADD CONSTRAINT CB_CN_FK
FOREIGN KEY (MaCB)
REFERENCES ConNguoi(Ma)
GO

--c.
ALTER TABLE BangLai
ADD CONSTRAINT BL_CN_FK
FOREIGN KEY (MaBL)
REFERENCES ConNguoi(Ma)
GO

--d.
ALTER TABLE LichSuViPham
ADD CONSTRAINT LSVP_CB_FK
FOREIGN KEY (MaCB)
REFERENCES ConNguoi(Ma)
GO

--e.
ALTER TABLE LichSuViPham
ADD CONSTRAINT LSVP_CX_FK
FOREIGN KEY (MaCX)
REFERENCES ConNguoi(Ma)
GO

--f.
ALTER TABLE Xe
ADD CONSTRAINT Xe_LoaiXe_FK
FOREIGN KEY (MaLoai)
REFERENCES LoaiXe(Ma)
GO

--g.
ALTER TABLE Xe
ADD CONSTRAINT Xe_NguoiSoHuu_FK
FOREIGN KEY (NguoiSoHuu)
REFERENCES ConNguoi(Ma)
GO

--h.
ALTER TABLE LichSuHanhTrinh
ADD CONSTRAINT LSHT_Xe_FK
FOREIGN KEY (MaXe)
REFERENCES Xe(Ma)
GO

--i.
ALTER TABLE LichHen
ADD CONSTRAINT LH_ChuXe_FK
FOREIGN KEY (MaCX)
REFERENCES ConNguoi(Ma)
GO

--k.
ALTER TABLE LichHen
ADD CONSTRAINT LH_NguoiLapLich_FK
FOREIGN KEY (NguoiLapLich)
REFERENCES ConNguoi(Ma)
GO

--l.
ALTER TABLE ThuePhi
ADD CONSTRAINT ThuePhi_ChuXe_FK
FOREIGN KEY (MaCX)
REFERENCES ConNguoi(Ma)
GO