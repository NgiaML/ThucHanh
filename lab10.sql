--a.Thêm dữ liệu cho bảng Nhanvien:

INSERT INTO dbo.Nhanvien (manv, tennv, gioitinh, diachi, sodt, email, phong)
VALUES ('NV21', N'Nguyen Van Thanh', N'Nam', N'Ha Noi', '0987654321', 'nva@example.com', N'Kế toán')


--Thực hiện full backup:

BACKUP DATABASE QLBanhang TO DISK = 'D:\nghia\bk\QLBanhang.bak' WITH INIT
 --b. Thêm dữ liệu cho bảng NhanVien:

INSERT INTO dbo.Nhanvien (manv, tennv, gioitinh, diachi, sodt, email, phong)
VALUES ('NV22', N'Nguyen Van Nam', N'Nam', N'Ca Mau', '0987654452', 'ndn@example.com', N'Thủ kho')

--Thực hiện different backup:

BACKUP DATABASE QLBanhang TO DISK = 'D:\nghia\bk\QLBanhang_df.bak' WITH DIFFERENTIAL
--c. Thêm dữ liệu cho bảng Nhanvien:

INSERT INTO dbo.Nhanvien (manv, tennv, gioitinh, diachi, sodt, email, phong)
VALUES ('NV23', N'Nguyen Ngoc Lan', N'Nu', N'Bac Can', '0987654007', 'nnl@example.com', N'Thủ kho')

--Thực hiện log backup lần 1:

BACKUP LOG QLBanhang TO DISK = 'D:\nghia\bk\qlbh.trn' WITH INIT
--d. Thêm dữ liệu cho bảng Nhanvien:

INSERT INTO dbo.Nhanvien (manv, tennv, gioitinh, diachi, sodt, email, phong)
VALUES ('NV24', N'Truong Cong Danh', N'Nam', N'Long An', '0945488654', 'tcd@example.com', N'Kế Toán')

--Thực hiện log backup lần 2:

BACKUP LOG QLBanhang TO DISK = 'D:\nghia\bk\QLBanhanglog.trn' WITH INIT

--câu 2a--
DROP DATABASE QLBanhang

--Câu 2b--
RESTORE DATABASE QLBanhang FROM DISK = 'C:\bk\QLBanhang.bak' WITH STANDBY = 'C:\bk\QLBanhang_undo.bak'
