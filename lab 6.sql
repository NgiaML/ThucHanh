﻿--cau 1
CREATE FUNCTION xuattensanpham(@tenhsx nvarchar(30))
RETURNS @Bang table(
	masp nchar(10) PRIMARY KEY,
	mahangsx nchar(10),
	tensp nvarchar(20),
	soluong INT,
	mausac nvarchar(20),
	giaban money,
	donvitinh nchar(10),
	mota nvarchar(max)
)
AS 
BEGIN

	INSERT INTO @Bang SELECT Sanpham.* FROM Sanpham
					INNER JOIN Hangsx
					ON Hangsx.mahangsx = Sanpham.mahangsx
					WHERE Hangsx.tenhang = @tenhsx
	RETURN
END

SELECT * FROM xuattensanpham('OPPO')

-- cau 2
create function DanhSachSanPhamHangSXNhap(@ngaybatdau datetime, @ngayketthuc datetime)
returns @sanphamhangsx table(
tensp nvarchar(50),
tenhangsx nvarchar(50),
soluongN int,
dongiaN float
)
as
begin
insert into @sanphamhangsx
select sp.tensp, hsx.tenhang, np.soluongN, np.dongiaN
from Sanpham sp
inner join Hangsx hsx on sp.mahangsx = hsx.mahangsx
inner join Nhap np on sp.masp = np.masp
where np.ngaynhap between @ngaybatdau and @ngayketthuc
return
end
SELECT * FROM DanhSachSanPhamHangSXNhap('2022-01-01', '2022-03-31');
-- cau 3
CREATE FUNCTION sp_by_hangsx_soluong(@tenhangsx NVARCHAR(50), @luachon INT)
RETURNS @sanpham TABLE (
    masp INT,
    mahangsx INT,
    tensp NVARCHAR(50),
    soluong INT,
    mausac NVARCHAR(20),
    giaban FLOAT,
    donvitinh NVARCHAR(10),
    mota NVARCHAR(MAX)
)
AS
BEGIN
    IF @luachon = 0
    BEGIN
        INSERT INTO @sanpham
        SELECT masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota
        FROM Sanpham
        WHERE mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhangsx) AND soluong = 0
    END
    ELSE
    BEGIN
        INSERT INTO @sanpham
        SELECT masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota
        FROM Sanpham
        WHERE mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhangsx) AND soluong > 0
    END
    RETURN
END
SELECT * FROM sp_by_hangsx_soluong('Samsung', 1)

-- cau 4
CREATE FUNCTION nv_by_phong(@tenphong NVARCHAR(50))
RETURNS @nhanvien TABLE (
    manv INT,
    tennv NVARCHAR(50),
    gioitinh NVARCHAR(10),
    diachi NVARCHAR(100),
    sodt NVARCHAR(20),
    email NVARCHAR(50),
    phong NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO @nhanvien
    SELECT manv, tennv, gioitinh, diachi, sodt, email, phong
    FROM Nhanvien
    WHERE phong = @tenphong
    RETURN
END
SELECT * FROM nv_by_phong('Phòng Kế toán')
-- cau 5
CREATE FUNCTION DanhSachHangSXTheoDiaChi(@diaChi NVARCHAR(50))
RETURNS @hangSX TABLE (
    mahangsx INT,
    tenhang NVARCHAR(50),
    diachi NVARCHAR(50),
    sodt NVARCHAR(20),
    email NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO @hangSX
    SELECT mahangsx, tenhang, diachi, sodt, email
    FROM Hangsx
    WHERE diachi LIKE '%' + @diaChi + '%'

    RETURN
END
SELECT * FROM DanhSachHangSXTheoDiaChi('Hà Nội')
-- cau 6
CREATE FUNCTION DanhSachSanPhamVaHangSXDaXuat(@namX INT, @namY INT)
RETURNS @sanPhamHangSX TABLE (
    masp INT,
    tensp NVARCHAR(50),
    tenhang NVARCHAR(50),
    ngayxuat DATE,
    soluongX INT
)
AS
BEGIN
    INSERT INTO @sanPhamHangSX
    SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.ngayxuat, Xuat.soluongX
    FROM Sanpham
    JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
    JOIN Xuat ON Sanpham.masp = Xuat.masp
WHERE YEAR(Xuat.ngayxuat) BETWEEN @namX AND @namY

    RETURN
END
SELECT * FROM DanhSachSanPhamVaHangSXDaXuat(2021, 2022)
-- cau 7
CREATE FUNCTION sp_by_hangsx_soluong1(@tenhangsx NVARCHAR(50), @luachon INT)
RETURNS @sanpham TABLE (
    masp INT,
    mahangsx INT,
    tensp NVARCHAR(50),
    soluong INT,
    mausac NVARCHAR(20),
    giaban FLOAT,
    donvitinh NVARCHAR(10),
    mota NVARCHAR(MAX)
)
AS
BEGIN
    IF @luachon = 0
    BEGIN
        INSERT INTO @sanpham
        SELECT masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota
        FROM Sanpham
        WHERE mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhangsx) AND soluong = 0
    END
    ELSE
    BEGIN
        INSERT INTO @sanpham
        SELECT masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota
        FROM Sanpham
        WHERE mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhangsx) AND soluong > 0
    END
    RETURN
END

SELECT * FROM sp_by_hangsx_soluong1('Samsung', 1)

-- cau 8
CREATE FUNCTION dbo.DanhSachNhanVienDaNhapHang
(
    @ngayNhap DATE
)
RETURNS TABLE
AS
RETURN 
(
    SELECT 
        nv.manv, 
        nv.tennv, 
        nv.gioitinh, 
        nv.diachi, 
        nv.sodt, 
        nv.email, 
        nv.phong
    FROM 
        Nhanvien nv 
        JOIN Nhap n ON nv.manv = n.manv
    WHERE 
        n.ngaynhap = @ngayNhap
)
SELECT * FROM dbo.DanhSachNhanVienDaNhapHang('2022-02-15')

-- cau 9
CREATE FUNCTION GetProductsByPriceAndManufacturer
(
    @minPrice FLOAT,
    @maxPrice FLOAT,
    @manufacturer VARCHAR(50)
)
RETURNS @products TABLE
(
    masp VARCHAR(10),
    mahangsx VARCHAR(10),
    tensp NVARCHAR(50),
    soluong INT,
    mausac NVARCHAR(50),
    giaban FLOAT,
    donvitinh NVARCHAR(20),
    mota NVARCHAR(MAX)
)
AS
BEGIN
    INSERT INTO @products
    SELECT s.masp, s.mahangsx, s.tensp, s.soluong, s.mausac, s.giaban, s.donvitinh, s.mota
    FROM Sanpham s
    INNER JOIN Hangsx h ON s.mahangsx = h.mahangsx
    WHERE s.giaban >= @minPrice AND s.giaban <= @maxPrice AND h.tenhang = @manufacturer
    RETURN
END
SELECT * FROM GetProductsByPriceAndManufacturer(20, 100, 'Adidas')
-- cau 10

CREATE FUNCTION Lab6_C_10
(
)
RETURNS TABLE
AS
RETURN
(
    SELECT sp.Masp, sp.Tensp, sp.Mausac, sp.Giaban, sp.Donvitinh, sp.Mota, hs.Tenhang
    FROM Sanpham sp
    INNER JOIN Hangsx hs ON sp.Mahangsx = hs.Mahangsx
)
go

go
SELECT * FROM Lab6_C_10()
go