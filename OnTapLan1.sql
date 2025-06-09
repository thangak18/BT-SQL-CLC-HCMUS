create database DB_QLDeTai_23127259

GO
use DB_QLDeTai_23127259
go

--Create table
create table GiaoVien(
    MaGv char(3) not null primary key,
    HoTen nvarchar(100),
    Luong float,
    Phai nvarchar(3) not null check (Phai in (N'Nam', N'Nữ')),
    NgSinh date,
    DiaChi nvarchar(100),
    Gvqlcm char(3),
    MaBm nvarchar(10)
)

create table Gv_Dt (
    MaGv char(3) not null,
    DienThoai varchar(11) not null,
    primary key(MaGv, DienThoai)
)

create table BoMon(
    MaBm nvarchar(10) not null primary key,
    TenBm nvarchar(50),
    Phong char(3),
    DienThoai nvarchar(11),
    TruongBm char(3),
    MaKhoa char(4),
    NgayNhanChuc date
)

create table Khoa(
    MaKhoa char(4) not null primary key,
    TenKhoa nvarchar(50),
    NamTl int,
    Phong char(3),
    DienThoai varchar(11),
    TruongKhoa char(3),
    NgayNhanChuc date
)

create table DeTai(
    MaDt char(3) not null primary key,
    TenDt nvarchar(50),
    CapQl  nvarchar(10),
    KinhPhi float,
    NgayBd date,
    NgayKt date,
    MaCd nvarchar(4),
    Gvcndt char(3)
)

create table ChuDe(
    MaCd nvarchar(4) not null primary key,
    TenCd nvarchar(50)
)

create table CongViec(
    MaDt char(3) not null,
    SoTt int not null,
    TenCv nvarchar(50),
    NgayBd date,
    NgayKt date,
    primary key(MaDt, SoTt)
)

create table ThamGiaDt (
    MaGv char(3) not null,
    MaDt char(3) not null,
    Stt int not null,
    PhuCap float,
    KetQua nvarchar(5),
    primary key(MaGv, MaDt, Stt)
)

create table NguoiThan (
    MaGv char(3) not null,
    Ten nvarchar(50) not null,
    NgSinh date,
    Phai nvarchar(3) check (Phai in (N'Nam', N'Nữ')),
    primary key(MaGv, Ten)
)

--FK
Alter table GiaoVien
    add constraint FK_GV
    foreign key (Gvqlcm)
    references GiaoVien(MaGv)

Alter table Khoa    
    add constraint FK_K
    foreign key (TruongKhoa)
    REFERENCES GiaoVien(MaGv)

Alter table BoMon
    add constraint FK_BM
    foreign key (TruongBm)
    REFERENCES GiaoVien(MaGv)

Alter table Gv_Dt
    add CONSTRAINT FK_GVDT
    foreign KEY (MaGv)
    REFERENCES GiaoVien(MaGv)

Alter table NguoiThan 
    add constraint FK_NT
    FOREIGN KEY (MaGv)
    REFERENCES GiaoVien(MaGv)

Alter table DeTai
    add CONSTRAINT FK_DT 
    FOREIGN key (Gvcndt)
    REFERENCES GiaoVien(MaGv)

Alter table ThamGiaDt
    add constraint FK_TGDT
    FOREIGN key (MaGv)
    REFERENCES GiaoVien(MaGv)

Alter table GiaoVien
    add constraint FK_GV1
    FOREIGN KEY (MaBm)
    REFERENCES BoMon(MaBm)

Alter table BoMon 
    add constraint FK_BM1
    FOREIGN key (MaKhoa)
    REFERENCES Khoa(MaKhoa)

Alter table ThamGiaDt
    add CONSTRAINT FK_TGDT1
    FOREIGN key (MaDt, Stt)
    REFERENCES CongViec(MaDt, Sott)

Alter table CongViec    
    add CONSTRAINT FK_CV1
    FOREIGN key (MaDt)
    REFERENCES DeTai(MaDt)

Alter table DeTai 
    add constraint FK_DT2
    FOREIGN key (MaCd)
    REFERENCES ChuDe (MaCd)

--Insert data
Insert into GiaoVien values ('001', N'Nguyễn Hoài An', 2000.0, N'Nam', '1973-02-15', N'25/3 Lạc Long Quân, Q.10, TP.HCM', Null, Null)
Insert into GiaoVien values ('002', N'Trần Trà Hương', 2500.0, N'Nữ', '1960-06-20', N'125 Trần Hưng Đạo, Q.1, TP.HCM', Null, Null)
Insert into GiaoVien values ('003', N'Nguyễn Ngọc Ánh', 2200.0, N'Nữ', '1975-05-11', N'12/21 Võ Văn Ngân Thủ Đức, TP.HCM', Null, Null)
Insert into GiaoVien values ('004', N'Trương Nam Sơn', 2300.0, N'Nam', '1959-06-20', N'215 Lý Thường Kiệt, TP.Biên Hoà', Null, Null)
Insert into GiaoVien values ('005', N'Lý Hoàng Hà', 2500.0, N'Nam', '1954-10-23', N'22/5 Nguyễn Xí, Q.Bình Thạnh, TP.HCM', Null, Null)
Insert into GiaoVien values ('006', N'Trần Bạch Tuyết', 1500.0, N'Nữ', '1980-05-20', N'127 Hùng Vương, TP.Mỹ Tho', Null, Null)
Insert into GiaoVien values ('007', N'Nguyễn An Trung', 2100.0, N'Nam', '1976-06-05', N'234 3/2, TP.Biên Hoà', Null, Null)
Insert into GiaoVien values ('008', N'Trần Trung Hiếu', 1800.0, N'Nam', '1977-08-06', N'22/11 Lý Thường Kiệt, TP.Mỹ Tho', Null, Null)
Insert into GiaoVien values ('009', N'Trần Hoàng Nam', 2000.0, N'Nam', '1975-11-22', N'234 Trần Não, An Phú, TP.HCM', Null, Null)
Insert into GiaoVien values ('010', N'Phạm Nam Thanh', 1500.0, N'Nam', '1980-12-12', N'221 Hùng Vương, Q.5, TP.HCM', Null, Null)

Insert into Khoa values ('CNTT', N'Công nghệ thông tin', 1995, 'B11', '0838123456', '002', '2005-02-20')
Insert into Khoa values ('HH', N'Hoá học', 1980, 'B41', '0838456456', '007', '2001-10-15')
Insert into Khoa values ('SH', N'Sinh học', 1980, 'B31', '0838454545', '004', '2000-10-11')
Insert into Khoa values ('VL', N'Vật ly', 1976, 'B21', '0838223223', '005', '2003-09-18')

Insert into BoMon values (N'CNTT', N'Công nghệ tri thức', 'B15', '0838126126', Null, 'CNTT', Null)
Insert into BoMon values (N'HHC', N'Hoá hữu cơ', 'B44', '838222222', Null, 'HH', Null)
Insert into BoMon values (N'HL', N'Hoá lý', 'B42', '0838878787', Null, 'HH', Null)
Insert into BoMon values (N'HPT', N'Hoá phân tích', 'B43', '0838777777', '007', 'HH', '2007-10-15')
Insert into BoMon values (N'HTTT', N'Hệ thống thông tin', 'B13', '0838125125', '002', 'CNTT', '2004-09-20')
Insert into BoMon values (N'MMT', N'Mạng máy tính', 'B16', '0838676767', '001', 'CNTT', '2005-05-15')
Insert into BoMon values (N'SH', N'Sinh hoá', 'B33', '0838898989', Null, 'SH', Null)
Insert into BoMon values (N'VLĐT', N'Vật lý điện tử', 'B15', '0838234234', Null, 'VL', Null)
Insert into BoMon values (N'VLƯD', N'Vật lý ứng dụng', 'B24', '0838454545', '005', 'VL', '2006-02-18')
Insert into BoMon values (N'VS', N'Vi sinh', 'B32', '0838909090', '004', 'SH', '2007-01-01')

Update GiaoVien set Gvqlcm = '002' where MaGv = '004'
Update GiaoVien set Gvqlcm = '004' where MaGv = '006'
Update GiaoVien set Gvqlcm = '007' where MaGv = '008'
Update GiaoVien set Gvqlcm = '001' where MaGv = '009'
Update GiaoVien set Gvqlcm = '007' where MaGv = '010'

Update GiaoVien set MaBm = N'MMT' where MaGv = '001'
Update GiaoVien set MaBm = N'HTTT' where MaGv = '002'
Update GiaoVien set MaBm = N'HTTT' where MaGv = '003'
Update GiaoVien set MaBm = N'VS' where MaGv = '004'
Update GiaoVien set MaBm = N'VLĐT' where MaGv = '005'
Update GiaoVien set MaBm = N'VS' where MaGv = '006'
Update GiaoVien set MaBm = N'HPT' where MaGv = '007'
Update GiaoVien set MaBm = N'HPT' where MaGv = '008'
Update GiaoVien set MaBm = N'MMT' where MaGv = '009'
Update GiaoVien set MaBm = N'HPT' where MaGv = '010'

Insert into Gv_Dt values ('001', '0838912112')
Insert into Gv_Dt values ('001', '0903123123')
Insert into Gv_Dt values ('002', '0913454545')
Insert into Gv_Dt values ('003', '0838121212')
Insert into Gv_Dt values ('003', '0903656565')
Insert into Gv_Dt values ('003', '0937125125')
Insert into Gv_Dt values ('006', '0937888888')
Insert into Gv_Dt values ('008', '0653717171')
Insert into Gv_Dt values ('008', '0913232323')

Insert into NguoiThan values ('001', N'Hùng', '1990-01-14', N'Nam')
Insert into NguoiThan values ('001', N'Thuỷ', '1994-12-08', N'Nữ')
Insert into NguoiThan values ('003', N'Hà', '1998-09-03', N'Nữ')
Insert into NguoiThan values ('003', N'Thu', '1998-09-03', N'Nữ')
Insert into NguoiThan values ('007', N'Mai', '2003-03-26', N'Nữ')
Insert into NguoiThan values ('007', N'Vy', '2000-02-14', N'Nữ')
Insert into NguoiThan values ('008', N'Nam', '1991-05-06', N'Nam')
Insert into NguoiThan values ('009', N'An', '1996-08-19', N'Nam')
Insert into NguoiThan values ('010', N'Nguyệt', '2006-01-14', N'Nữ')

Insert into ChuDe values (N'NCPT', N'Nghiên cứu phát triển')
Insert into ChuDe values (N'QLGD', N'Quản lý giáo dục')
Insert into ChuDe values (N'ƯDCN', N'Ứng dụng công nghệ')

Insert into DeTai values ('001', N'HTTT quản lý các trường ĐH', N'ĐHQG', 20.0, '2007-10-20', '2008-10-20', N'QLGD', '002')
Insert into DeTai values ('002', N'HTTT quản lý giáo dục cho một Khoa', N'Trường', 20.0, '2000-10-12', '2001-10-12', N'QLGD', '002')
Insert into DeTai values ('003', N'Nghiên cứu chế tạo sợi Nanô Platin', N'ĐHQG', 300.0, '2008-05-15', '2010-05-15', N'NCPT', '005')
Insert into DeTai values ('004', N'Tạo vật liệu sinh học bằng màng ối người', N'Nhà nước', 100.0, '2007-01-01', '2009-12-31', N'NCPT', '004')
Insert into DeTai values ('005', N'Ứng dụng hoá học xanh', N'Trường', 200.0, '2003-10-10', '2004-12-10', N'ƯDCN', '007')
Insert into DeTai values ('006', N'Nghiên cứu tế bào gốc', N'Nhà nước', 4000.0, '2006-10-20', '2009-10-20', N'NCPT', '004')
Insert into DeTai values ('007', N'HTTT quản lý thư viện ở các trường ĐH', N'Trường', 20.0, '2009-05-10', '2010-05-10', N'QLGD', '001')

Insert into CongViec values ('001', 1, N'Khởi tạo và Lập kế hoạch', '2007-10-20', '2008-12-10')
Insert into CongViec values ('001', 2, N'Xác định yêu cầu', '2008-12-21', '2008-03-21')
Insert into CongViec values ('001', 3, N'Phân tích hệ thống', '2008-03-22', '2008-05-22')
Insert into CongViec values ('001', 4, N'Thiết kế hệ thống', '2008-05-23', '2008-06-23')
Insert into CongViec values ('001', 5, N'Cài đặt thử nghiệm', '2008-06-24', '2008-10-20')
Insert into CongViec values ('002', 1, N'Khởi tạo và Lập kế hoạch', '2009-05-10', '2009-07-10')
Insert into CongViec values ('002', 2, N'Xác định yêu cầu', '2009-07-11', '2009-10-11')
Insert into CongViec values ('002', 3, N'Phân tích hệ thống', '2009-10-12', '2009-12-20')
Insert into CongViec values ('002', 4, N'Thiết kế hệ thống', '2009-12-21', '2010-03-22')
Insert into CongViec values ('002', 5, N'Cài đặt thử nghiệm', '2010-03-23', '2010-05-10')
Insert into CongViec values ('006', 1, N'Lấy mẫu', '2006-10-20', '2007-02-20')
Insert into CongViec values ('006', 2, N'Nuôi cấy', '2007-02-21', '2008-08-21')

Insert into ThamGiaDt values ('001', '002', 1, 0.0, Null)
Insert into ThamGiaDt values ('001', '002', 2, 2.0, Null)
Insert into ThamGiaDt values ('002', '001', 4, 2.0, N'Đạt')
Insert into ThamGiaDt values ('003', '001', 1, 1.0, N'Đạt')
Insert into ThamGiaDt values ('003', '001', 2, 0.0, N'Đạt')
Insert into ThamGiaDt values ('003', '001', 4, 1.0, N'Đạt')
Insert into ThamGiaDt values ('003', '002', 2, 0.0, Null)
Insert into ThamGiaDt values ('004', '006', 1, 0.0, N'Đạt')
Insert into ThamGiaDt values ('004', '006', 2, 1.0, N'Đạt')
Insert into ThamGiaDt values ('006', '006', 2, 1.5, N'Đạt')
Insert into ThamGiaDt values ('009', '002', 3, 0.5, Null)
Insert into ThamGiaDt values ('009', '002', 4, 1.5, Null)

--Q1
select HoTen, luong from GiaoVien where Phai like N'Nữ'

--Q2
select HoTen, luong * 1.1 as 'Lương mới tăng' from GiaoVien

--Q3
select MaGv from GiaoVien where HoTen like N'Nguyễn%'
union
select MaGv from GiaoVien, BoMon where GiaoVien.MaGv = BoMon.TruongBm and TruongBm is not null and year(NgayNhanChuc) > 1975

--Q4
select MaGv, HoTen from GiaoVien, BoMon, Khoa
where Khoa.TenKhoa = N'Công nghệ thông tin' and Khoa.MaKhoa = BoMon.MaKhoa and BoMon.MaBm = GiaoVien.MaBm

--Q5
select * from BoMon 
join GiaoVien on GiaoVien.MaGv = BoMon.TruongBm

--Q6
select gv.*, bm.* from BoMon bm, GiaoVien gv where bm.MaBm = gv.MaBm

--Q7
select dt.TenDt, gv.HoTen from DeTai dt, GiaoVien gv where dt.Gvcndt = gv.MaGv

--Q8
select gv.* from Khoa kh, GiaoVien gv where kh.TruongKhoa = gv.MaGv

--Q9
select gv.* from BoMon bm, ThamGiaDt tgdt, GiaoVien gv where (gv.MaBm = bm.MaBm and bm.TenBm = N'Vi sinh') and (gv.MaGv = tgdt.Magv and tgdt.MaDt = '006')

--Q10
select dt.MaDt, cd.TenCd, gv.HoTen, gv.NgSinh, gv.DiaChi from GiaoVien gv, DeTai dt, ChuDe cd, ThamGiaDt tgdt where cd.MaCd = dt.MaCd and tgdt.MaDt = dt.MaDt and tgdt.MaGv = gv.MaGv
and dt.CapQl = N'Thành phố'

--Q11
select gv.HoTen, gv1.HoTen from GiaoVien gv 
Join GiaoVien gv1 on gv.Gvqlcm = gv1.MaGv where gv.Gvqlcm is not null

--Q12
select gv.HoTen from GiaoVien gv 
Join GiaoVien gv1 on gv.Gvqlcm = gv1.MaGv
where gv1.HoTen = N'Nguyễn Thanh Tùng'

--Q13
select gv.HoTen from GiaoVien gv, BoMon bm where gv.MaBm = bm.MaBm and bm.TenBm = N'Hệ thống thông tin' and bm.TruongBm is not null

--Q14
select distinct gv.HoTen from GiaoVien gv, ChuDe cd, DeTai dt, ThamGiaDt tgdt where cd.TenCd = N'Quản lý giáo dục' and cd.MaCd = dt.MaCd and dt.MaDt = tgdt.MaDt and tgdt.MaGv = gv.Magv

--Q15
select cv.TenCv from CongViec cv, DeTai dt where dt.maDt = cv.MaDt and dt.TenDt = N'HTTT quản lý các trường ĐH' and month(cv.NgayBd) = 3 and year(cv.NgayBd) = 2008

--Q16
select gv.HoTen, gv.Gvqlcm as 'Người quản lý chuyên môn' from GiaoVien gv

--Q17
select * from CongViec where NgayBd between '2007-01-01'and '2007-08-01'

--Q18
select gv.HoTen from GiaoVien gv
Join GiaoVien gv1 on gv.MaBm = gv1.MaBm
where gv1.HoTen = N'Trần Trà Hương' and gv.MaGv <> gv1.maGv

--Q19
select gv.* from GiaoVien gv, BoMon bm, DeTai dt where (gv.MaBm = bm.MaBm and bm.MaBm is not null) and (gv.MaGv = dt.Gvcndt)

--Q20
select gv.* from GiaoVien gv, BoMon bm, Khoa kh where (gv.MaBm = Bm.MaBm and Bm.TruongBm = kh.TruongKhoa and bm.MaKhoa = kh.MaKhoa)

--Q21
Select distinct gv.HoTen from BoMon bm, DeTai dt, GiaoVien gv where gv.MaBm = Bm.MaBm and gv.MaGv = dt.Gvcndt

--Q22
select kh.TruongKhoa from Khoa kh, DeTai dt, BoMon bm, GiaoVien gv where kh.MaKhoa = bm.MaKhoa and bm.MaBm = gv.MaBm and gv.MaGv = dt.Gvcndt 

--Q23
select gv.MaGv from GiaoVien gv, BoMon bm, DeTai dt where (gv.MaBm = bm.MaBm and bm.TenBm = N'Hệ thống thông tin') and (gv.MaGv = dt.Gvcndt and dt.MaDt = '001')

--Q24
select gv.* from GiaoVien gv
Join GiaoVien gv1 on gv1.MaBm = gv.MaBm
where gv1.MaGv = '002'

--Q25
select gv.* from GiaoVien gv, BoMon bm where gv.MaBm = bm.MaBm and bm.TruongBm is not null

--Q26
select HoTen, luong from GiaoVien 
