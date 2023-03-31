create view cau1
as
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'

create view cau2
as
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
ORDER BY Sanpham.giaban DESC offset 0 rows;

create view cau3
as
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung'

create view cau4
as
SELECT * FROM nhanvien
WHERE gioitinh = 'Nữ' AND phong = 'Kế toán'

create view cau5
as
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Nhap.soluongN, Nhap.dongiaN, Nhap.soluongN*Nhap.dongiaN AS tiennhap, Sanpham.mausac, Sanpham.donvitinh, Nhap.ngaynhap, Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
ORDER BY Nhap.sohdn ASC offset 0 rows;

create view cau6
as
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, Nhanvien.tennv, Nhanvien.phong
FROM Xuat
JOIN Sanpham ON Xuat.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC offset 0 rows;

create view cau7
as
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Nhap.soluongN, Nhap.dongiaN, Nhap.ngaynhap, Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE YEAR(Nhap.ngaynhap) = 2017 AND Hangsx.tenhang = 'samsung';

create view cau8
as
SELECT TOP 10 Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, Nhanvien.tennv, Nhanvien.phong
FROM Xuat
JOIN Sanpham ON Xuat.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE YEAR(Xuat.ngayxuat) = 2018;

create view cau9
as
SELECT TOP 10 tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;

create view cau10
as
SELECT Sanpham.*
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND giaban BETWEEN 100000 AND 500000;

create view cau11
as
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018

create view cau12
as
SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'

create view cau13
as
SELECT TOP 1 sohdn, ngaynhap
FROM Nhap
WHERE YEAR(ngaynhap) = 2018
ORDER BY soluongN*dongiaN DESC;

create view cau14
as
SELECT TOP 10 masp, SUM(soluongN) as TongSoLuongN
FROM Nhap
WHERE YEAR(ngaynhap) = 2019
GROUP BY masp
ORDER BY TongSoLuongN DESC;

create view cau15
as
SELECT Sanpham.masp, tensp
FROM Sanpham 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE Hangsx.tenhang = 'Samsung' AND Nhap.manv = 'NV01';

create view cau16
as
SELECT sohdn, Nhap.masp, soluongN, ngaynhap
FROM Nhap
JOIN Xuat ON Nhap.sohdn = Xuat.sohdx
WHERE Nhap.masp = 'SP02' AND Xuat.manv = 'NV02';

create view cau17
as
SELECT Xuat.manv, tennv
FROM Nhanvien
JOIN Xuat ON Nhanvien.manv = Xuat.manv
WHERE Xuat.masp = 'SP02' AND Xuat.ngayxuat = '2020-02-03';


---------------------------View lab3-------------------------------
-- Câu 1:Thống kê số loại sản phẩm của mỗi hãng sản xuất:
create view c1
as
SELECT Hangsx.mahangsx, Hangsx.tenhang, COUNT(Sanpham.masp) AS SoLoaiSanPham
FROM Hangsx
LEFT JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.mahangsx, Hangsx.tenhang;

-- Câu 2:Thống kê tổng tiền nhập của mỗi sản phẩm trong năm 2018:
create view c2
as
SELECT Sanpham.masp, Sanpham.tensp, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Sanpham
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Sanpham.masp, Sanpham.tensp;

-- Câu 3:Thống kê các sản phẩm có tổng số lượng xuất năm 2018 là lớn hơn 10.000 sản phẩm của hãng Samsung:
create view c3
as
SELECT Sanpham.masp, Sanpham.tensp, SUM(Xuat.soluongX) AS TongSoLuongXuat
FROM Sanpham
INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
WHERE YEAR(Xuat.ngayxuat) = 2018 AND Sanpham.mahangsx = 'SAMSUNG' 
GROUP BY Sanpham.masp, Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000;

-- Câu 4:Thống kê số lượng nhân viên nam của mỗi phòng ban:
create view c4
as
SELECT Nhanvien.phong, COUNT(*) AS SoLuongNhanVienNam
FROM Nhanvien
WHERE Nhanvien.gioitinh = N'Nam'
GROUP BY Nhanvien.phong;

-- Câu 5: Thống kê tổng số lượng nhập của mỗi hãng sản xuất trong năm 2018.
create view c5
as
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) AS TongSoLuongNhap
FROM Hangsx
INNER JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Hangsx.tenhang

-- Câu 6:Hãy thống kê xem tổng lượng tiền xuất của mỗi nhân viên trong năm 2018 là bao nhiêu.
create view c6
as
SELECT Nhanvien.tennv, SUM(Xuat.soluongX * Sanpham.giaban) AS TongTienXuat
FROM Nhanvien
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = 2018
GROUP BY Nhanvien.tennv

-- Câu 7:Hãy đưa ra tổng tiền nhập của mỗi nhân viên trong tháng 8 – năm 2018 có tổng giá trị lớn hơn 100.000.
create view c7
as
SELECT Nhanvien.tennv, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Nhanvien
INNER JOIN Nhap ON Nhanvien.manv = Nhap.manv
WHERE YEAR(Nhap.ngaynhap) = 2018 AND MONTH(Nhap.ngaynhap) = 8
GROUP BY Nhanvien.tennv
HAVING SUM(Nhap.soluongN * Nhap.dongiaN) > 100000

-- Câu 8:Hãy đưa ra danh sách các sản phẩm đã nhập nhưng chưa xuất bao giờ.
create view c8
as
SELECT Sanpham.masp, Sanpham.tensp, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
LEFT JOIN Xuat ON Sanpham.masp = Xuat.masp
WHERE Xuat.masp IS NULL

-- Câu 9:Hãy đưa ra danh sách các sản phẩm đã nhập năm 2018 và đã xuất năm 2018.
create view c9
as
SELECT Sanpham.masp, Sanpham.tensp, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
WHERE YEAR(Nhap.ngaynhap) = 2018 AND YEAR(Xuat.ngayxuat) = 2018

-- Câu 10:Hãy đưa ra danh sách các nhân viên vừa nhập vừa xuất.
create view c10
as
SELECT Nhanvien.manv, Nhanvien.tennv
FROM Nhanvien
INNER JOIN Nhap ON Nhanvien.manv = Nhap.manv
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv

-- Câu 11:Hãy đưa ra danh sách các nhân viên không tham gia việc nhập và xuất.
create view TH4bai311 as
SELECT Nhanvien.*, Nhap.masp, Nhap.ngaynhap, Nhap.sohdn, Nhap.soluongN, Nhap.dongiaN,
Xuat.ngayxuat, Xuat.sohdx, Xuat.soluongX
FROM Nhanvien
LEFT JOIN Nhap ON Nhanvien.manv = Nhap.manv
LEFT JOIN Xuat ON Nhanvien.manv = Xuat.manv
WHERE Nhap.manv IS NULL AND Xuat.manv IS NULL;