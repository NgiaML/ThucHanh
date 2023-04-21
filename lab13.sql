-- Tao CSDL
CREATE DATABASE QLCHTB;
-- Tạo bảng NhaCungCap:
 Create table Nhacungcap(
MaNCC char(10) primary key,
TenNCC nvarchar(30) ,
DiaChi nvarchar(40) ,
DienThoai varchar(15) ,
Email nvarchar(30) ,
Fax varchar(20) 
 )
-- Tạo bảng LoaiSP:
Create table LoaiSP(
MaLoaiSP char(10) primary key,
TenLoaiSP nvarchar(30) 
) 
-- Tạo bảng DonGia:
Create table DonGia(
MaDG char(10) primary key,
NgayCapNhat datetime ,
GiaGoc money ,
GiaBan money ,
ThueGTGT float,
KhongSuDung bit
) 
-- Tạo bảng PhieuBaoHanh:
Create table PhieuBaoHanh(
MaPhieuBH char(10) primary key,
NgayBatDau datetime ,
NgayKetThuc datetime 
) 
-- Tạo bảng SanPham:
Create table SanPham(
MaSP char(10) primary key,
MaNCC char(10) references NhaCungCap(MaNCC),
TenSP nvarchar(30) ,
MaLoaiSP char(10) references LoaiSP(MaLoaiSP),
DonViTinh varchar(20) ,
TonKho int ,
MaPhieuBH char(10) references PhieuBaoHanh,
MaDG char(10) references DonGia(MaDG),
NuocSX varchar(20) 
) 
-- Tạo bảng KhachHang:
Create table KhachHang(
MaKH char(10) primary key,
TenKH nvarchar(30) ,
DiaChi nvarchar(50) , 
SDT varchar(20)
) 
-- Tạo bảng NhanVien:
Create table NhanVien(
MaNV char(10) primary key,
TenNV nvarchar(30) ,
DiaChi nvarchar(50) ,
SDT varchar(20) 
) 
-- Tạo bảng PhieuNhap:
Create table PhieuNhap(
MaPhieuNhap char(10) primary key,
NgayNhap datetime ,
MaNCC char(10) references NhaCungCap(MaNCC),
MaNV char(10) references NhanVien(MaNV)
) 
-- Tạo bảng ChiTietNhap
Create table ChiTietNhap(
MaPhieuNhap char(10) references PhieuNhap(MaPhieunhap),
MaSP char(10) references SanPham (MaSP),
SoLuong int,
Constraint PK_ChiTietNhap  primary key (MaPhieuNhap,MaSP)
) 
-- Tạo bảng PhieuXuat:
Create table PhieuXuat(
MaPhieuXuat char(10) primary key,
NgayXuat datetime ,
MaKH char(10) references KhachHang(MaKH),
MaNV char(10) references NhanVien(MaNV)
)
-- Tạo bảng ChiTietXuat:
Create table ChiTieTXuat(
MaPhieuXuat char(10) references PhieuXuat(MaPhieuXuat),
MaSP char(10) references SanPham(MaSP),
SoLuong int,
Constraint PK_ChiTietXuat primary key (MaPhieuXuat,MaSP)
) 
-- Tạo bảng DonDatHang:
Create table DonDatHang(
MaDDH char(10) primary key,
NgayLap datetime ,
MaKH char(10) references KhachHang,
NgayGiaoHang datetime ,
NoiGiaoHang nvarchar(40)
) 
-- Tạo bảng ChiTietDDH:
Create table ChiTietDDH(
MaDDH char(10) references DonDatHang(MaDDH),
MaSP char(10) references SanPham(MaSP),
SoLuong int,
Constraint PK_ChiTietDDH primary key(MaDDH,MaSP)
) 
-- Tạo bảng HoaDonBan:
Create table HoaDonBan(
SoHoaDon char(10) primary key,
MaKH char(10) references KhachHang(MaKH),
NgayLap datetime ,
TongTien money 
) 
-- Tạo bảng ChiTietHD
Create table ChiTietHD(
SoHoaDon char(10) references HoaDonBan(SoHoaDon),
MaSP char(10) references SanPham(MaSP),
GiaBan money,
SoLuong int,
Constraint PK_ChitietHD primary key(SoHoaDon,MaSP)
)
-- Tạo bảng PhieuThanhToan:
Create table PhieuThanhToan(
MaPTT char(10) primary key,
NgayTT datetime ,
SoTienTT money 
) 
-- Tạo bảng ChiTietTT:
Create table ChiTietTT(
MaPTT char(10) references PhieuthanhToan(MaPTT),
SoHoaDon char(10) references HoaDonBan(SoHoaDon),
SoTienNo money,
Constraint PK_ChiTietTT primary key(MaPTT,SoHoaDon)
) 

------NHAP DU LIEU------
 --NhaCungCap (MaNCC , TenNCC , DiaChi , DienThoai , Email , Fax)
 Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax)
Values('LG','Cong Ty LG','Quan 12, TPHCM','0969199286','LG@gmail.com',' ')
 Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax)
Values('Toshiba','Cong Ty Toshiba','Quan 10, TP HCM','0313586479','Toshiba@gmail.com',' ')
 Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax)
Values('HP','Cong Ty Hoa Phat','Hai Ba Trung, Ha Noi','0969199286','HP@gmail.com',' ')
 Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax)
Values('CGG','Cong Ty CanGuGu','Tan Binh, TP HCM','0998866888','CGG@gmail.com',' ')
 Insert into NhaCungCap(MaNCC,TenNCC,DiaChi,DienThoai,Email,Fax)
Values('HiTaChi','Tap Doan HiTaChi','Binh Duong','0918866385','HiTaChi@gmail.com',' ')

select * from NhaCungCap

--LoaiSP (MaLoai , TenLoai)
Insert into LoaiSP(MaLoaiSP, TenLoaiSP)
 Values('DH','Dieu Hoa')
Insert into LoaiSP(MaLoaiSP, TenLoaiSP)
 Values('TL','Tu Lanh')
Insert into LoaiSP(MaLoaiSP, TenLoaiSP)
 Values('TV','TiVi')
Insert into LoaiSP(MaLoaiSP, TenLoaiSP)
 Values('MHB','May Hut Bui')
Insert into LoaiSP(MaLoaiSP,TenLoaiSP)
 Values('MG','May Giat')
Insert into LoaiSP(MaLoaiSP,TenLoaiSP)
 Values('MLN','May Loc Nuoc')

 select * from LoaiSP

 Insert into DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT, KhongSuDung)
 Values('DG1','20220515','900000','1000000','0.01','0')
 Insert into 
DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
 Values('DG2','20211221','800000','1000000','0.01','0')
 Insert into 
DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
 Values('DG3','20230130','700000','1000000','0','0')
 Insert into 
DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
 Values('DG4','20230201','600000','1000000','0','0')
 Insert into 
DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
 Values('DG5','20230123','850000','1000000','0','0')
 Insert into 
DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
 Values('DG6','20191219','850000','1000000','0','0')
 Insert into 
DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
 Values('DG7','20200301','850000','1000000','0','0')
 Insert into 
DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
 Values('DG8','20210801','850000','1000000','0','0')
 Insert into 
DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
 Values('DG9','20220621','850000','1000000','0','0')
 Insert into 
DonGia(MaDG,NgayCapNhat,GiaGoc,GiaBan,ThueGTGT,KhongSuDung)
 Values('DG10','20211212','850000','1000000','0','0')

 select * from DonGia

  --PhieuBaoHanh( MaBH , NgayBatDau , NgayKetThuc)
Insert into PhieuBaoHanh(MaPhieuBH,NgayBatDau,NgayKetThuc)
 Values('MBH1','20230325','20250325')
Insert into PhieuBaoHanh(MaPhieuBH,NgayBatDau,NgayKetThuc)
 Values('MBH2','20230415','20250415')
Insert into PhieuBaoHanh(MaPhieuBH,NgayBatDau,NgayKetThuc)
 Values('MBH3','20230127','20250127')
Insert into PhieuBaoHanh(MaPhieuBH,NgayBatDau,NgayKetThuc)
 Values('MBH4','20220820','20240820')
Insert into PhieuBaoHanh(MaPhieuBH,NgayBatDau,NgayKetThuc)
 Values('MBH5','20220512','20240512')
Insert into PhieuBaoHanh(MaPhieuBH,NgayBatDau,NgayKetThuc)
 Values('MBH6','20220712','20240712')
Insert into PhieuBaoHanh(MaPhieuBH,NgayBatDau,NgayKetThuc)
 Values('MBH7','20230418','20240418')
Insert into PhieuBaoHanh(MaPhieuBH,NgayBatDau,NgayKetThuc)
 Values('MBH8','20220722','20250722')
Insert into PhieuBaoHanh(MaPhieuBH,NgayBatDau,NgayKetThuc)
 Values('MBH9','20220730','20230730')
Insert into PhieuBaoHanh(MaPhieuBH,NgayBatDau,NgayKetThuc)
 Values('MBH10','20230112','20240112')

 select * from PhieuBaoHanh

  --SanPham (MaSP , TenSP , MaNCC , NuocSX , DonViTinh , SoLuong , MaDG,MaPhieuBH)
 Insert into SanPham(MaSP,TenSp,MaNCC,MaLoaiSP,NuocSX,DonViTinh,TonKho,MaDG,MaPhieuBH)
Values('DH1','Dieu Hoa BD','LG','DH','Korea','Chiec','50','DG1','MBH1')
Insert into SanPham(MaSP,TenSp,MaNCC,MaLoaiSP,NuocSX,DonViTinh,TonKho,MaDG,MaPhieuBH)
Values('DH2','Dieu Hoa XL','Toshiba','DH','Korea','Chiec','50','DG2','MBH2')
Insert into SanPham(MaSP,TenSp,MaNCC,MaLoaiSP,NuocSX,DonViTinh,TonKho,MaDG,MaPhieuBH)
Values('TL1','Tu Lanh 20L','Toshiba','TL','Japan','Chiec','50','DG3','MBH3')
Insert into SanPham(MaSP,TenSp,MaNCC,MaLoaiSP,NuocSX,DonViTinh,TonKho,MaDG,MaPhieuBH)
Values('TL2','Tu Lanh 30L','Toshiba','TL','Japan','Chiec','50','DG4','MBH4')
 Insert into SanPham(MaSP,TenSp,MaNCC,MaLoaiSP,NuocSX,DonViTinh,TonKho,MaDG,MaPhieuBH)
Values('TV1','Ti Vi Thuong','LG','TV','Korea','Chiec','50','DG5','MBH5')
 Insert into SanPham(MaSP,TenSp,MaNCC,MaLoaiSP,NuocSX,DonViTinh,TonKho,MaDG,MaPhieuBH)
Values('TV2','Ti Vi 50inch','LG','TV','Korea','Chiec','50','DG6','MBH6')
 Insert into SanPham(MaSP,TenSp,MaNCC,MaLoaiSP,NuocSX,DonViTinh,TonKho,MaDG,MaPhieuBH)
Values('MLN1','May Loc Nuoc','CGG','MLN','Viet Nam','Chiec','50','DG7','MBH7')
 Insert into SanPham(MaSP,TenSp,MaNCC,MaLoaiSP,NuocSX,DonViTinh,TonKho,MaDG,MaPhieuBH)
Values('MG1','May Giat','LG','MG','Korea','Chiec','50','DG8','MBH8')
 Insert into SanPham(MaSP,TenSp,MaNCC,MaLoaiSP,NuocSX,DonViTinh,TonKho,MaDG,MaPhieuBH)
Values('MG2','May Giat Sieu Sach','LG','MG','Korea','Chiec','50','DG9','MBH9')
Insert into SanPham(MaSP,TenSp,MaNCC,MaLoaiSP,NuocSX,DonViTinh,TonKho,MaDG,MaPhieuBH)
Values('MHB1','May Hut Bui','HiTaChi','MHB','Japan','Chiec','50','DG10','MBH10')

select * from SanPham

 --KhachHang (MaKH , TenKH , DiaChi , SDT)
 Insert into KhachHang(MaKH,TenKH,DiaChi,SDT)
Values('KH1','Truong Huu Thang','Tan Binh, TPHCM','0969199568')
 Insert into KhachHang(MaKH,TenKH,DiaChi,SDT)
Values('KH2','Tran Van Truong','Can Giuoc, Long An','0322199564')
 Insert into KhachHang(MaKH,TenKH,DiaChi,SDT)
Values('KH3','Truong Bao Ngoc','Di An, Binh Duong','0383258697')
 Insert into KhachHang(MaKH,TenKH,DiaChi,SDT)
Values('KH4','Hoang Thuy Linh','Quan 5, TPHCM','0969696969')
 Insert into KhachHang(MaKH,TenKH,DiaChi,SDT)
Values('KH5','Tran An Khang','Quan 7, TPHCM','0763193548')
 Insert into KhachHang(MaKH,TenKH,DiaChi,SDT)
Values('KH6','Nguyen Mai Linh','Quan 4, TPHCM','0797193384')
 Insert into KhachHang(MaKH,TenKH,DiaChi,SDT)
Values('KH7','Nguyen Kim Anh','Quan 10, TPHCM','0966193845')
 Insert into KhachHang(MaKH,TenKH,DiaChi,SDT)
Values('KH8','Nguyen Minh Khanh','Can Duoc, Long An','0967993518')
 Insert into KhachHang(MaKH,TenKH,DiaChi,SDT)
Values('KH9','Tran Quoc Manh','Go Cong, Tien Giang','0969193349')
 Insert into KhachHang(MaKH,TenKH,DiaChi,SDT)
Values('KH10','Nguyen Quoc Tien','Quan 8, TPHCM','0967297558')

select * from KhachHang

--NhanVien(MaNV , TenNV , DiaChi , SDT )
Insert into NhanVien(MaNV,TenNV,DiaChi,SDT)
 Values('NV1','Truong My Uyen','Quan 4, TPHCM','0767856426')
Insert into NhanVien(MaNV,TenNV,DiaChi,SDT)
 Values('NV2','Nguyen My Linh','Quan 8, TPHCM','0367452329')
Insert into NhanVien(MaNV,TenNV,DiaChi,SDT)
 Values('NV3','Truong Long','Quan 2, TPHCM','0782967269')
Insert into NhanVien(MaNV,TenNV,DiaChi,SDT)
 Values('NV4','Dang Nhat Tien','Quan 7, TPHCM','0378668219')
Insert into NhanVien(MaNV,TenNV,DiaChi,SDT)
 Values('NV5','Hoang Hai Dang','Nhon Trach, Dong Nai','0348366329')
Insert into NhanVien(MaNV,TenNV,DiaChi,SDT)
 Values('NV6','Truong Van Thanh','Can Giuoc, Long An','0764131425')
Insert into NhanVien(MaNV,TenNV,DiaChi,SDT)
 Values('NV7','Chu Van Manh','Can Giuoc, Long An','0748135425')
Insert into NhanVien(MaNV,TenNV,DiaChi,SDT)
 Values('NV8','Duong Thanh tuyen','Thu Duc, TPHCM','0983361216')
Insert into NhanVien(MaNV,TenNV,DiaChi,SDT)
 Values('NV9','Vu Van Khanh','Di An, Binh Duong','0348356525')
Insert into NhanVien(MaNV,TenNV,DiaChi,SDT)
 Values('NV10','Nguyen Thi Thuy','Quan 4, TPHCM','0945337423')

 select * from NhanVien

  --PhieuNhap (MaPhieuNhap , NgayNhap , MaNCC , MaNV)
 Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV)
Values('PN1','20230101','LG','NV1')
 Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV)
Values('PN2','20230101','Toshiba','NV2')
 Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV)
Values('PN3','20230101','LG','NV3')
 Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV)
Values('PN4','20230101','HP','NV4')
 Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV)
Values('PN5','20230101','CGG','NV5')
 Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV)
Values('PN6','20230101','LG','NV6')
 Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV)
Values('PN7','20230101','CGG','NV7')
 Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV)
Values('PN8','20230101','HiTaChi','NV8')
 Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV)
Values('PN9','20230101','HiTaChi','NV9')
 Insert into PhieuNhap(MaPhieuNhap,NgayNhap,MaNCC,MaNV)
Values('PN10','20230101','LG','NV10')

select * from PhieuNhap

 --ChiTietNhap (MaSP , MaPhieuNhap , SoLuong)
 Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
Values('DH1','PN1','50')
 Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
Values('DH2','PN2','50')
 Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
Values('TL1','PN3','50')
 Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
Values('TL2','PN4','50')
 Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
Values('TV1','PN5','50')
 Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
Values('TV2','PN6','50')
 Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
Values('MG1','PN7','50')
 Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
Values('MG2','PN8','50')
 Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
Values('MHB1','PN9','50')
 Insert into ChiTietNhap(MaSP,MaPhieuNhap,SoLuong)
Values('MLN1','PN10','50')

select * from ChiTietNhap

--PhieuXuat (MaPhieuXuat , NgayXuat , MaKH , MaNV)
 Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV)
Values('PX1','20230325','KH1','NV1')
 Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV)
Values('PX2','20230415','KH2','NV2')
 Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV)
Values('PX3','20230127','KH3','NV3')
 Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV)
Values('PX4','20230420','KH4','NV4')
 Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV)
Values('PX5','20230412','KH5','NV5')
 Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV)
Values('PX6','20230412','KH5','NV5')
 Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV)
Values('PX7','20230418','KH6','NV6')
 Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV)
Values('PX8','20230422','KH5','NV5')
 Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV)
Values('PX9','20230420','KH4','NV5')
 Insert into PhieuXuat(MaPhieuXuat,NgayXuat,MaKH,MaNV)
Values('PX10','20230312','KH5','NV9')

select * from PhieuXuat

 --ChiTietXuat (MaSP , MaPhieuXuat , SoLuong)
Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
Values('DH1','PX1','5')
Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
Values('DH2','PX2','7')
Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
Values('TL1','PX3','3')
Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
Values('TL2','PX4','5')
Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
Values('TV1','PX5','29')
Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
Values('TV2','PX6','21')
Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
Values('MG1','PX7','42')
Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
Values('MG2','PX8','32')
Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
Values('MLN1','PX9','20')
Insert into ChiTietXuat(MaSP,MaPhieuXuat,SoLuong)
Values('MHB1','PX10','12')

select * from ChiTietXuat

 --DonDatHang (MaDDH , MaKH , NgayLap , NgayGiaoHang , NoiGiaoHang)
 Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiaoHang,NoiGiaoHang)
Values('DDH1','KH1','2023-02-03','2023-03-25','Tan Binh, TPHCM')
 Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiaoHang,NoiGiaoHang)
Values('DDH2','KH2','2023-01-03','2023-03-15','Can Giuoc, Long An')
 Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiaoHang,NoiGiaoHang)
Values('DDH3','KH3','2023-01-05','2023-03-27','Di An, Binh Duong')
 Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiaoHang,NoiGiaoHang)
Values('DDH4','KH4','2023-04-03','2023-04-20','Quan 5, TPHCM')
 Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiaoHang,NoiGiaoHang)
Values('DDH5','KH5','2023-02-18','2023-04-12','Quan 7, TPHCM')
 Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiaoHang,NoiGiaoHang)
Values('DDH6','KH6','2023-02-18','2023-03-12','Quan 4, TPHCM')
 Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiaoHang,NoiGiaoHang)
Values('DDH7','KH7','2023-02-18','2023-04-18','Quan 10, TPHCM')
 Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiaoHang,NoiGiaoHang)
Values('DDH8','KH8','2023-02-18','2023-03-22','Can Duoc, Long An')
 Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiaoHang,NoiGiaoHang)
Values('DDH9','KH9','2023-02-18','2023-03-30','Go Cong, Tien Giang')
 Insert into DonDatHang(MaDDH,MaKH,NgayLap,NgayGiaoHang,NoiGiaoHang)
Values('DDH10','KH10','2023-02-18','2023-03-12','Quan 8, TPHCM')

select * from DonDatHang

 --ChiTietDDH (MaDDH , MaSP , SoLuong)
 Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
Values('DDH1','DH1','5')
 Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
Values('DDH2','DH2','7')
 Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
Values('DDH3','TL1','3')
 Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
Values('DDH4','TL2','5')
 Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
Values('DDH5','TV1','29')
 Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
Values('DDH6','TV2','21')
 Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
Values('DDH7','MG1','42')
 Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
Values('DDH8','MG2','32')
 Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
Values('DDH9','MLN1','20')
 Insert into ChiTietDDH(MaDDH,MaSP,SoLuong)
Values('DDH10','MHB1','12')

select * from ChiTietDDH

--HoaDonBan (SoHoaDon, MaNV,MaKH , NgayLap , TongTien)
 Insert into HoaDonBan(SoHoaDon,MaKH,NgayLap,TongTien)
Values('HDB1','KH1','2023-03-25','500000')
 Insert into HoaDonBan(SoHoaDon,MaKH,NgayLap,TongTien)
Values('HDB2','KH2','2023-04-15','10000000')
 Insert into HoaDonBan(SoHoaDon,MaKH,NgayLap,TongTien)
Values('HDB3','KH3','2024-01-27','5000000')
 Insert into HoaDonBan(SoHoaDon,MaKH,NgayLap,TongTien)
Values('HDB4','KH4','2023-04-20','8000000')
 Insert into HoaDonBan(SoHoaDon,MaKH,NgayLap,TongTien)
Values('HDB5','KH5','2023-04-12','3000000')
 Insert into HoaDonBan(SoHoaDon,MaKH,NgayLap,TongTien)
Values('HDB6','KH6','2023-04-12','2000000')
 Insert into HoaDonBan(SoHoaDon,MaKH,NgayLap,TongTien)
Values('HDB7','KH7','2023-04-18','3000000')
 Insert into HoaDonBan(SoHoaDon,MaKH,NgayLap,TongTien)
Values('HDB8','KH8','2023-03-22','7000000')
 Insert into HoaDonBan(SoHoaDon,MaKH,NgayLap,TongTien)
Values('HDB9','KH9','2023-03-30','9000000')
 Insert into HoaDonBan(SoHoaDon,MaKH,NgayLap,TongTien)
Values('HDB10','KH10','2023-04-12','13000000')

select * from HoaDonBan

--ChiTietHD ( MaSP , SoHoaDon , GiaBan , SoLuong)
 Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
Values('DH1','HD1','5000000','5')
 Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
Values('DH2','HD2','10000000','10')
 Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
Values('TL1','HD3','5000000','5')
 Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
Values('TL2','HD4','8000000','8')
 Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
Values('TV1','HD5','3000000','3')
 Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
Values('TV2','HD6','2000000','2')
 Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
Values('MG1','HD7','3000000','3')
 Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
Values('MG2','HD8','7000000','7')
 Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
Values('MLN1','HD9','9000000','9')
 Insert into ChiTietHD(MaSP,SoHoaDon,GiaBan,SoLuong)
Values('MHB1','HD10','13000000','13')
--PhieuThanhToan (MaPTT , NgayTT , SoTienTT)
 Insert into PhieuThanhToan(MaPTT, NgayTT,SoTienTT)
 Values('PTT1','2023-03-25','5000000')
 Insert into PhieuThanhToan(MaPTT, NgayTT,SoTienTT)
 Values('PTT2','2023-04-15','7000000')
 Insert into PhieuThanhToan(MaPTT, NgayTT,SoTienTT)
 Values('PTT3','2023-01-27','3000000')
 Insert into PhieuThanhToan(MaPTT, NgayTT,SoTienTT)
 Values('PTT4','2023-04-20','5000000')
 Insert into PhieuThanhToan(MaPTT, NgayTT,SoTienTT)
 Values('PTT5','2023-04-12','29000000')
 Insert into PhieuThanhToan(MaPTT, NgayTT,SoTienTT)
 Values('PTT6','2023-04-12','21000000')
 Insert into PhieuThanhToan(MaPTT, NgayTT,SoTienTT)
 Values('PTT7','2023-04-18','42000000')
 Insert into PhieuThanhToan(MaPTT, NgayTT,SoTienTT)
 Values('PTT8','2023-03-22','32000000')
 Insert into PhieuThanhToan(MaPTT, NgayTT,SoTienTT)
 Values('PTT9','2023-03-30','20000000')
 Insert into PhieuThanhToan(MaPTT, NgayTT,SoTienTT)
 Values('PTT10','2023-01-12','12000000')

 select * from PhieuThanhToan

 --ChiTietTT ( MaPTT , SoHoaDon , SoTienNo )
 Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo)
Values('PTT1','HDB1','')
 Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo)
Values('PTT2','HDB2','')
 Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo)
Values('PTT3','HDB3','')
 Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo)
Values('PTT4','HDB4','')
 Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo)
Values('PTT5','HDB5','')
 Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo)
Values('PTT6','HDB6','')
 Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo)
Values('PTT7','HDB7','')
 Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo)
Values('PTT8','HDB8','')
 Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo)
Values('PTT9','HDB9','')
 Insert into ChiTietTT(MaPTT,SoHoaDon,SoTienNo)
Values('PTT10','HDB10','')

select * from ChiTietTT

UPDATE SanPham
SET TenSP = N' Dieu Hoa Binh Dan',
	MaNCC = N'Toshiba'
WHERE MaSP = 'DH1'

select * from NhanVien

UPDATE KhachHang
SET TenKH = N'Tran Trung Dung',
	SDT = N'0965462581'
WHERE MaKH = 'KH1'
select * from KhachHang

UPDATE NhanVien
SET TenNV = N'Do Hung Dung',
	SDT = N'0352147896'
WHERE MaNV = 'NV1'
Select * from NhanVien
--Tạo store procedure để thêm mới Khách

CREATE PROCEDURE ThemKhach
	@MaKH CHAR(10),
	@TenKH NVARCHAR(30),
	@DiaChi NVARCHAR(50),
	@SDT NVARCHAR(20)

AS
BEGIN
	INSERT INTO KhachHang
	(
		MaKH,
		TenKH,
		DiaChi,
		SDT
	)
	VALUES(
		-- Giá trị
		@MaKH,
		@TenKH,
		@DiaChi,
		@SDT
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END
--Thêm mới một khách hàng:
EXEC ThemKhach 'KH11', 'Nguyen Tran Long', 'TPHCM','0325861287'
Select * from KhachHang
--Tạo procedure UPDATE thông tin khách hàng
CREATE PROCEDURE SuaKhach
	@MaKH CHAR(10),
	@TenKH NVARCHAR(30),
	@DiaChi NVARCHAR(50),
	@SDT NVARCHAR(20)

AS
BEGIN
	UPDATE KhachHang
	SET
		TenKH = @TenKH,
		DiaChi = @DiaChi,
		SDT = @SDT
	WHERE MaKH = @MaKH;
	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END

--Sửa thông tin một khách hàng:
EXEC SuaKhach 'KH11', 'Dang Thanh Long', 'Binh Duong', '0965123654'
select * from KhachHang
--tạo procedure để xóa 1 khách hàng

CREATE PROCEDURE XoaKhach 
    @MaKH CHAR(10)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM KhachHang WHERE MaKH = @MaKH)
    BEGIN
        RETURN 1;
    END

    BEGIN TRANSACTION;

    -- Xóa dữ liệu trong bảng KHACH
    DELETE FROM KhachHang WHERE MaKH = @MaKH;

    COMMIT TRANSACTION;

    RETURN 0;
END

--Xóa 1 khách hàng:
EXEC XoaKhach 'KH11'
select * from KhachHang


CREATE PROCEDURE ThemSP
	@MaSP CHAR(10),
	@MaNCC CHAR(10),
	@TenSP NVARCHAR(30),
	@MaLoaiSP CHAR(10),
	@DonViTinh NVARCHAR(20),
	@TonKho INT,
	@MaPhieuBH CHAR(10),
	@MaDG CHAR(10),
	@NuocSX NVARCHAR(20)
AS
BEGIN
	INSERT INTO SanPham
	(
		MaSP,
		MaNCC,
		TenSP,
		MaLoaiSP,
		DonViTinh,
		TonKho,
		MaPhieuBH,
		MaDG,
		NuocSX
	)
	VALUES(
		-- Giá trị
		@MaSP,
		@MaNCC,
		@TenSP,
		@MaLoaiSP,
		@DonViTinh,
		@TonKho,
		@MaPhieuBH,
		@MaDG,
		@NuocSX
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END
--Thêm 1 sản phẩm mới:
EXEC ThemSP 'DH3', 'LG', 'Dieu Hoa TN', 'DH', 'chiec', '30','MBH1','DG1','Japan'
select * from SanPham
CREATE PROCEDURE SuaSP
	@MaSP CHAR(10),
	@MaNCC CHAR(10),
	@TenSP NVARCHAR(30),
	@MaLoaiSP CHAR(10),
	@DonViTinh NVARCHAR(20),
	@TonKho INT,
	@MaPhieuBH CHAR(10),
	@MaDG CHAR(10),
	@NuocSX NVARCHAR(20)

AS
BEGIN

	UPDATE SanPham
	SET
		MaNCC = @MaNCC,
		TenSP = @TenSP,
		MaLoaiSP = @MaLoaiSP,
		DonViTinh = @DonViTinh,
		TonKho = @TonKho,
		MaPhieuBH = @MaPhieuBH,
		MaDG = @MaDG,
		NuocSX = @NuocSX
	WHERE MaSP = @MaSP;
	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

--Sửa 1 sản phẩm:
EXEC SuaSP 'DH3','Toshiba', 'Dieu Hoa Tiet Kiem', 'DH', 'chiec', '40','MBH3','DG4','Japan'
select * from SanPham

CREATE PROCEDURE XoaSP
    @MaSP CHAR(10)
    
AS
BEGIN
    -- Kiểm tra xem masp đã tồn tại trong bảng sanpham chưa
    IF NOT EXISTS (SELECT * FROM SanPham WHERE MaSP = @MaSP)
    BEGIN
        RETURN 1;
    END

    BEGIN TRANSACTION;

	-- Xóa dữ liệu
    DELETE FROM SanPham WHERE MaSP = @MaSP;

    COMMIT TRANSACTION;

    RETURN 0;
END

--Xóa 1 sản phẩm:
EXEC XoaSP 'DH3'
select * from SanPham

CREATE PROCEDURE ThemLoaiSP
	@MaLoaiSP CHAR(10),
	@TenLoaiSP NVARCHAR(30)

AS
BEGIN
	INSERT INTO LoaiSP
	(
		MaLoaiSP,
		TenLoaiSP
	)
	VALUES(
		-- Giá trị
		@MaLoaiSP,
		@TenLoaiSP
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

--Thêm 1 loại sản phẩm:
EXEC ThemLoaiSP 'MRC', N'May rua chen'
select * from LoaiSP

CREATE PROCEDURE SuaLoaiSP
	@MaLoaiSP CHAR(10),
	@TenLoaiSP NVARCHAR(30)

AS
BEGIN
	UPDATE LoaiSP
	SET
		TenLoaiSP = @TenLoaiSP
	WHERE MaLoaiSP = @MaLoaiSp;
	--kiểm tra xem đã sua thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

--Sửa 1 loại sản phẩm:
EXEC SuaLoaiSP 'MRC', N'Noi com dien'
select * from LoaiSP


CREATE PROCEDURE XoaLoaiSp
    @MaLoaiSP CHAR(10)
AS
BEGIN
    -- Kiểm tra xem maloaihang đã tồn tại trong bảng LoaiSP hay chưa
    IF NOT EXISTS (SELECT * FROM LoaiSP WHERE MaLoaiSP = @MaLoaiSP)
    BEGIN
        RETURN 1;
    END

    BEGIN TRANSACTION;

    -- Xóa dữ liệu trong bảng LoaiSP
    DELETE FROM LoaiSP WHERE MaLoaiSP = @MaLoaiSP;

    COMMIT TRANSACTION;

    RETURN 0;
END

--Xóa 1 loại sản phẩm:
EXEC XoaLoaiSP 'MRC'
select * from LoaiSP

CREATE PROCEDURE ThemNV
	@MaNV CHAR(10),
	@TenNV NVARCHAR(30),
	@DiaChi NVARCHAR(50),
	@SDT NVARCHAR(20)

AS
BEGIN
	INSERT INTO NhanVien
	(
		MaNV,
		TenNV,
		DiaChi,
		SDT
	)
	VALUES(
		-- Giá trị
		@MaNV,
		@TenNV,
		@DiaChi,
		@SDT
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

--Thêm 1 nhân viên:
EXEC ThemNV 'NV11', 'Nguyen Tran Long', 'TPHCM','0325861287'
select * from NhanVien
CREATE PROCEDURE SuaNV
	@MaNV CHAR(10),
	@TenNV NVARCHAR(30),
	@DiaChi NVARCHAR(50),
	@SDT NVARCHAR(20)

AS
BEGIN
	UPDATE NhanVien
	SET
		TenNV = @TenNV,
		DiaChi = @DiaChi,
		SDT = @SDT
	WHERE MaNV = @MaNV;
	--kiểm tra xem đã sửa thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

--Sửa 1 nhân viên:
EXEC SuaNV 'NV11', 'Dang Thanh Long', 'Binh Duong', '0965123654'
select * from NhanVien


CREATE PROCEDURE XoaNV
    @MaNV CHAR(10)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM NhanVien WHERE MaNV = @MaNv)
    BEGIN
        RETURN 1;
    END

    BEGIN TRANSACTION;

    -- Xóa dữ liệu trong bảng NhanVien
    DELETE FROM NhanVien WHERE MaNV = @MaNV;

    COMMIT TRANSACTION;

    RETURN 0;
END

--Xóa 1 nhân viên:
EXEC XoaNV'NV11'

select * from NhanVien




-- View thống kê những sản phẩm hết hạn bảo hành:
create view SPHetHanBH
AS
select S.MaSP,S.TenSP
From SanPham S inner join PhieuBaoHanh P on S.MaPhieuBH=P.MaPhieuBH
where P.NgayKetThuc < GETDATE()

-- View thống kê sản phẩm bán chạy nhất:
Create view BanChayNhat
AS
Select top 1 with ties S.MaSP,S.TenSP,Sum(SoLuong) Tong
From SanPham S inner join ChiTietXuat C on S.MaSP=C.MaSP
Group by S.MaSP,S.TenSP
Order by Tong DESC
select * from BanChayNhat

--tạo procedure để xóa 1 khách hàng

CREATE PROCEDURE XoaKhach 
    @MaKH CHAR(10)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM KhachHang WHERE MaKH = @MaKH)
    BEGIN
        RETURN 1;
    END

    BEGIN TRANSACTION;

    -- Xóa dữ liệu trong bảng KHACH
    DELETE FROM KhachHang WHERE MaKH = @MaKH;

    COMMIT TRANSACTION;

    RETURN 0;
END

--Xóa 1 khách hàng:
EXEC XoaKhach 'KH11'

--Tạo hàm đọc danh sách sản phẩm theo mã loại sản phẩm

CREATE FUNCTION DanhsachSP(@MaLoaiSP NVARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM SanPham
    WHERE CONVERT(CHAR(10), MaLoaiSP) = @MaLoaiSP
)
GO
--Gọi hàm
SELECT * FROM DanhsachSP('DH')

--Khi thêm 1 chi tiết phiếu xuất thì số lượng tồn kho giảm đi:
create trigger Trgxuat
on ChiTietXuat
for insert
as
begin
update SanPham set SanPham.TonKho = SanPham.TonKho -
inserted.SoLuong
From SanPham inner join inserted on SanPham.MaSP =
inserted.MaSP
End