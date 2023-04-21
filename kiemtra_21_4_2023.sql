--cau 1
CREATE TABLE Ton(
	MaVT NVARCHAR(10) not null PRIMARY KEY,
	TenVT NVARCHAR(30) not null,
	SoLuongT INT
)

CREATE TABLE Nhap(
	SoHDN NVARCHAR(10) not null,
	MaVT NVARCHAR(10) not null,
	SoLuongN INT not null,
	DonGiaN MONEY,
	NgayN DATETIME,
	CONSTRAINT Nhap_Ton FOREIGN KEY(MaVT) REFERENCES Ton(MaVT),
	CONSTRAINT Nhap_Pri_Key PRIMARY KEY (SoHDN, MaVT)
)

CREATE TABLE Xuat(
	SoHDX NVARCHAR(10) not null,
	MaVT NVARCHAR(10) not null,
	SoLuongX INT not null,
	DonGiaX MONEY,
	NgayX DATETIME,
	CONSTRAINT Xuat_Ton FOREIGN KEY(MaVT) REFERENCES Ton(MaVT),
	CONSTRAINT Xuat_Pri_Key PRIMARY KEY(SoHDX, MaVT)
)

INSERT INTO Ton
VALUES ('VT0001',N'Ống đồng',100),
		('VT0002',N'Ống thép Xịn',0),
		('VT0003',N'Ống thép D8',200),
		('VT0004',N'Thép lá cao cấp',50)

INSERT INTO Nhap
VALUES('HDN01','VT0001', 380, 50000, '1/20/2022'),
		('HDN01','VT0002', 100, 18000, '1/20/2022'),
		('HDN02','VT0003', 150, 30000, '2/1/2022')

INSERT INTO Xuat
VALUES('HDX01','VT0001', 10, 55000, '4/3/2023'),
		('HDX01','VT0002', 52, 22000, '4/3/2023'),
		('HDX02','VT0003', 50, 56000, '5/12/2023')

select * from Nhap
select * from Xuat
select * from Ton
--cau 2

CREATE FUNCTION TKTB(@MaVT nvarchar(20), @NgayX date)
RETURNS TABLE
AS
RETURN
SELECT Ton.MaVT, Ton.TenVT, SUM(Xuat.SoLuongX * Xuat.DonGiaX) AS Tienban
FROM Xuat
INNER JOIN Ton ON Xuat.MaVT = Ton.MaVT
WHERE Ton.MaVT = @MaVT AND Xuat.NgayX = @NgayX
GROUP BY Ton.MaVT, Ton.TenVT

SELECT * FROM TKTB('VT0001', '4/3/2023')

--cau 3--
--Tao ham Thong ke tong tien nhap theo ma vt
CREATE FUNCTION TKTTN(@MaVT nvarchar(20), @NgayN date)
RETURNS TABLE
AS
RETURN
SELECT Ton.MaVT, Ton.TenVT, SUM(Nhap.SoLuongN * Nhap.DonGiaN) AS Tiennhap
FROM Nhap
INNER JOIN Ton ON Nhap.MaVT = Ton.MaVT
WHERE Ton.MaVT = @MaVT AND Nhap.NgayN = @NgayN
GROUP BY Ton.MaVT, Ton.TenVT

SELECT * FROM TKTTN('VT0001', '1/20/2022')

-- Câu 4
CREATE TRIGGER trgNhap
ON Nhap
FOR INSERT
AS
BEGIN
    DECLARE @MaVT nvarchar(10)
    DECLARE @SoLuongN int

    SELECT @MaVT = MaVT, @SoLuongN = SoLuongN
    FROM inserted

    IF EXISTS(SELECT 1 FROM Ton WHERE MaVT = @MaVT)
    BEGIN
        UPDATE Ton SET SoLuongT = SoLuongT + @SoLuongN WHERE MaVT = @MaVT
    END
    ELSE
    BEGIN
        ROLLBACK TRAN
        RAISERROR ('Mã VT chưa có mặt trong bảng Ton', 16, 1)
    END
END
INSERT INTO Nhap (SoHDN, MaVT, SoLuongN, DonGiaN, NgayN) VALUES ('HDN004', 'VT0001', 10, 55000, '4/20/2023');
select * from Ton