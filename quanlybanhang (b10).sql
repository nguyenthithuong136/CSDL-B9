-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 04, 2023 lúc 11:40 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlybanhang`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListEmployeesByGender` (IN `gender` VARCHAR(1))   BEGIN
    SELECT * 
    FROM nhanvien
    WHERE Phai = gender;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListItemsBySupplier` (IN `supplier_idParam` INT)   BEGIN
    -- Câu lệnh SQL để liệt kê danh sách mặt hàng theo nhà cung cấp được truyền vào
    SELECT mathang.MaMH, mathang.TenMH
    FROM mathang
    WHERE mathang.MaNCC = supplier_idParam;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListOrdersByDateRange` (IN `dateAParam` DATE, IN `dateBParam` DATE)   BEGIN
    -- Câu lệnh SQL để liệt kê danh sách đơn đặt hàng từ ngày A đến ngày B được truyền vào
    SELECT * 
    FROM dondathang
    WHERE NgayDH >= dateAParam AND NgayDH <= dateBParam;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListProductsByOrder` (IN `orderID` INT)   BEGIN
    -- Câu lệnh SQL để liệt kê danh sách mặt hàng theo mã đơn đặt hàng được truyền vào
    SELECT mathang.*
    FROM mathang
    JOIN chitietddh ON mathang.MaMH = chitietddh.MaMH
    WHERE chitietddh.MaDDH = orderID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Xem_TT_MatHang` ()   BEGIN
    SELECT MaMH, TenMH, DonViTinh, DonGia FROM MatHang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Xem_TT_MatHang_2or4` ()   BEGIN
    SELECT MatHang.MaNCC, TenNCC, MaMH, TenMH, DonViTinh, DonGia 
	FROM MatHang inner join NhaCungCap on MatHang.MaNCC = NhaCungCap.MaNCC
	WHERE MatHang.MaNCC IN (2, 4);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Xem_TT_MatHang_DG_62` ()   BEGIN
    SELECT MaMH, TenMH, DonViTinh, DonGia FROM MatHang WHERE DonGia >= 62;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Xem_TT_MatHang_TPHCM` ()   BEGIN
    SELECT MatHang.MaNCC, TenNCC, MaMH, TenMH, DonViTinh, DonGia 
	FROM MatHang inner join NhaCungCap on MatHang.MaNCC = NhaCungCap.MaNCC
	WHERE MatHang.MaNCC = "TP. HCM";
END$$

--
-- Các hàm
--
CREATE DEFINER=`root`@`localhost` FUNCTION `TinhTongDoanhThuTrongNam` (`nam` INT) RETURNS INT(11)  BEGIN
    DECLARE tong int;
    SELECT SUM(MatHang.DonGia * ChiTietDDH.SoLuong) INTO tong
    FROM DonDatHang
    JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
    JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE YEAR(DonDatHang.NgayDH)  = nam;
    RETURN tong;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `TongDoanhThu` () RETURNS INT(11)  BEGIN
    DECLARE tongdoanhthu INT;
    
    SELECT SUM(MatHang.DonGia * ChiTietDDH.SoLuong) INTO tongdoanhthu
    FROM DonDatHang
    JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
    JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE YEAR(DonDatHang.NgayDH) = 1997;
    
    RETURN tongdoanhthu;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `TongDoanhThuNV` (`MaNV` INT) RETURNS INT(11)  BEGIN
    DECLARE TDT_NV INT;
    SELECT SUM(SoLuong * MatHang.DonGia) into TDT_NV
	FROM ChiTietDDH inner join MatHang on ChiTietDDH.MaMH = MatHang.MaMH
	WHERE MaDDH IN (SELECT MaDDH FROM DonDatHang WHERE MaNV = @MaNV);
    RETURN TDT_NV;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `TongThanhTienDH` (`MaDDH` CHAR(5)) RETURNS INT(11)  BEGIN
    DECLARE TongThanhTien INT;
    SELECT SUM(SoLuong * MatHang.DonGia) into TongThanhTien 
	FROM ChiTietDDH inner join MatHang on ChiTietDDH.MaMH = MatHang.MaMH
	WHERE MaDDH = MaDDH;
    RETURN TongThanhTien;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chamcong`
--

CREATE TABLE `chamcong` (
  `Thang` tinyint(3) UNSIGNED NOT NULL,
  `Nam` smallint(5) UNSIGNED NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayCong` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chamcong`
--

INSERT INTO `chamcong` (`Thang`, `Nam`, `MaNV`, `NgayCong`) VALUES
(3, 2021, 2, 28),
(3, 2021, 6, 29),
(3, 2023, 1, 26),
(3, 2023, 3, 26),
(3, 2023, 4, 27),
(3, 2023, 5, 28),
(3, 2023, 7, 30),
(3, 2023, 8, 31),
(4, 2023, 9, 1),
(4, 2023, 10, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietddh`
--

CREATE TABLE `chitietddh` (
  `MaDDH` char(5) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `GiamGia` date DEFAULT '2002-07-15'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietddh`
--

INSERT INTO `chitietddh` (`MaDDH`, `MaMH`, `SoLuong`, `GiamGia`) VALUES
('DDH01', 1, 5, '2023-07-28'),
('DDH01', 2, 3, '2023-07-28'),
('DDH02', 3, 2, '2023-07-29'),
('DDH02', 4, 4, '2023-07-29'),
('DDH03', 5, 1, '2023-07-30'),
('DDH04', 6, 3, '2023-07-31'),
('DDH05', 7, 2, '2023-08-01'),
('DDH05', 8, 5, '2023-08-01'),
('DDH06', 8, 4, '2023-08-02'),
('DDH07', 1, 2, '2023-08-03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dondathang`
--

CREATE TABLE `dondathang` (
  `MaDDH` char(5) NOT NULL,
  `MaKH` varchar(10) NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayDH` date NOT NULL,
  `NgayGiao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dondathang`
--

INSERT INTO `dondathang` (`MaDDH`, `MaKH`, `MaNV`, `NgayDH`, `NgayGiao`) VALUES
('DDH01', 'VTP', 1, '2022-01-01', '2022-01-05'),
('DDH02', 'CODACO', 2, '2022-01-02', '2022-01-06'),
('DDH03', 'COTEC', 3, '2022-01-03', '2022-01-07'),
('DDH04', 'VITICO', 4, '2022-01-04', '2022-01-08'),
('DDH05', 'GIAY32', 5, '2022-01-05', '2022-01-09'),
('DDH06', 'VTP', 6, '1997-11-12', '1997-11-12'),
('DDH07', 'COTEC', 7, '1997-11-12', '1997-11-12'),
('DDH08', 'VITICO', 8, '2022-01-08', '2022-01-12'),
('DDH09', 'SAMACO', 9, '2022-01-09', '2022-01-13'),
('DDH10', 'COTEC', 10, '2022-01-10', '2022-01-14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donvi`
--

CREATE TABLE `donvi` (
  `MaDV` char(2) NOT NULL,
  `TenDV` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donvi`
--

INSERT INTO `donvi` (`MaDV`, `TenDV`) VALUES
('GD', 'Ban Giám Đốc'),
('KT', 'Kế Toán'),
('NV', 'Nghiệp Vụ'),
('TC', 'Tổ chức');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giaohang`
--

CREATE TABLE `giaohang` (
  `Ngay` date NOT NULL,
  `MaDDH` char(5) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `Soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` varchar(10) NOT NULL,
  `TenKH` varchar(40) NOT NULL DEFAULT '',
  `DiaChi` varchar(60) NOT NULL DEFAULT '',
  `DienThoai` varchar(11) NOT NULL DEFAULT '',
  `MaTP` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `DiaChi`, `DienThoai`, `MaTP`) VALUES
('CODACO', 'Cơ Khí Dân Dụng', '388 Hoà Hảo P5', '1757828', 'TP'),
('COTEC', 'Công Nghệ Mới', '388 Hoà Hảo P5', '7657657', 'CT'),
('DHP', 'Đại Hưng Phát', '388 Hoà Hảo P5', '6546565', 'NT'),
('GIAY32', 'Giày 32', '388 Hoà Hảo P5', '6565468', 'CT'),
('RUBIMEX', 'Công Nghiệp Cao Su', '388 Hoà Hảo P5', '2987912', 'NT'),
('SAMACO', 'SXKD Dịch vụ tổng hợp', '388 Hoà Hảo P5', '1987987', 'CT'),
('SAMECO', 'Cơ Khí Sài Gòn', '388 Hoà Hảo P5', '2397997', 'HN'),
('TRACODI', 'Đầu tư phát triển GTVT', '388 Hoà Hảo P5', '0976766', 'HP'),
('VITICO', 'Hoá Nhựa Vĩnh Tiến', '388 Hoà Hảo P5', '3987980', 'TP'),
('VTP', 'Vạn Hưng Phát', '388 Hoà Hảo P5', '3765768', 'HN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mathang`
--

CREATE TABLE `mathang` (
  `MaMH` int(11) NOT NULL,
  `TenMH` varchar(30) NOT NULL,
  `DonViTinh` varchar(20) NOT NULL DEFAULT '',
  `DonGia` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `HinhSP` text DEFAULT NULL,
  `MaNCC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `mathang`
--

INSERT INTO `mathang` (`MaMH`, `TenMH`, `DonViTinh`, `DonGia`, `HinhSP`, `MaNCC`) VALUES
(1, 'Rượu', 'Chai', 200, NULL, 7),
(2, 'Tiêu', 'Hộp', 0, NULL, 7),
(3, 'Bánh kem', 'Cái', 0, NULL, 3),
(4, 'Bơ', 'Kg', 0, NULL, 6),
(5, 'Bánh mì', 'Cái', 0, NULL, 3),
(6, 'Nem', 'Kg', 0, NULL, 1),
(7, 'Táo', 'Kg', 0, NULL, 4),
(8, 'Cá Hộp', 'Thùng', 10, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `MaNCC` int(11) NOT NULL,
  `TenNCC` varchar(30) NOT NULL,
  `DiaChi` varchar(60) NOT NULL DEFAULT '',
  `DienThoai` varchar(11) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`MaNCC`, `TenNCC`, `DiaChi`, `DienThoai`) VALUES
(1, 'CTY Đồ hộp Tân Bìn', 'TP.HCM', '123456'),
(2, 'CTY Rượu Bình Tân', 'TP.HCM', '0123456789'),
(3, 'CTY Đức Phát', 'TP.HCM', '0123456789'),
(4, 'CTY Rau Quả Việt Nam', 'Hà Nội', '0123456789'),
(5, 'CTY Thuỷ Sản Tiền Giang', 'Tiền Giang', '0123456789'),
(6, 'CTY VINAMLIK', 'TP.HCM', '0123456789'),
(7, 'CTY Nông Sản Lâm Đồng', 'Đà Lạt', '0123456789');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` int(11) NOT NULL,
  `HoLot` varchar(30) NOT NULL DEFAULT '',
  `TenNV` varchar(20) NOT NULL DEFAULT ' ',
  `Phai` enum('F','M') NOT NULL DEFAULT 'F',
  `LuongCB` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `NgayNViec` date NOT NULL,
  `DiaChiNV` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoaiNV` varchar(11) DEFAULT ' ',
  `HinhNV` text DEFAULT NULL,
  `MaDV` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `HoLot`, `TenNV`, `Phai`, `LuongCB`, `NgayNViec`, `DiaChiNV`, `DienThoaiNV`, `HinhNV`, `MaDV`) VALUES
(1, 'Nguyễn', 'Thương', 'F', 10000, '0000-00-00', 'Hà Nội', ' ', '', NULL),
(2, 'Nguyễn', 'Linh', 'F', 10000, '0000-00-00', 'Thanh Hóa', ' ', ' ', NULL),
(3, 'Phạm', 'Hạ', 'F', 20000, '0000-00-00', 'Bắc Giang', ' ', ' ', NULL),
(4, 'Phạm', 'Quang', 'M', 30000, '0000-00-00', 'Bắc Giang', ' ', ' ', NULL),
(5, 'Nguyễn', 'Lan', 'F', 10000, '0000-00-00', 'Hà Nội', ' ', ' ', NULL),
(6, 'Lê', 'Hoàng', 'M', 22000, '0000-00-00', 'Bắc Kạn', ' ', ' ', NULL),
(7, 'Phạm', 'Quân', 'M', 23000, '0000-00-00', 'Bắc Ninh', ' ', ' ', NULL),
(8, 'Nguyễn', 'Lan', 'F', 10000, '0000-00-00', 'Thái Nguyên', ' ', ' ', NULL),
(9, 'Lê', 'Hoà', 'M', 22000, '0000-00-00', 'Quảng Ninh', ' ', ' ', NULL),
(10, 'Trần', 'Quân', 'M', 23000, '0000-00-00', 'Thái Bình', ' ', ' ', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tinhtp`
--

CREATE TABLE `tinhtp` (
  `MaTP` char(2) NOT NULL,
  `TenTP` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tinhtp`
--

INSERT INTO `tinhtp` (`MaTP`, `TenTP`) VALUES
('CT', 'Cần Thơ'),
('HN', 'Hà Nội'),
('HP', 'Hải Phòng'),
('HU', 'Huế'),
('ND', 'Nam Định'),
('NT', 'Nha Trang'),
('TP', 'TP. Hồ Chí Minh'),
('VI', 'Vinh');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD PRIMARY KEY (`Thang`,`Nam`,`MaNV`),
  ADD KEY `FK_MaNV` (`MaNV`);

--
-- Chỉ mục cho bảng `chitietddh`
--
ALTER TABLE `chitietddh`
  ADD PRIMARY KEY (`MaDDH`,`MaMH`),
  ADD KEY `FK_MaMH` (`MaMH`);

--
-- Chỉ mục cho bảng `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`MaDDH`),
  ADD KEY `FK_MaNVV` (`MaNV`),
  ADD KEY `FK_KH` (`MaKH`);

--
-- Chỉ mục cho bảng `donvi`
--
ALTER TABLE `donvi`
  ADD PRIMARY KEY (`MaDV`),
  ADD UNIQUE KEY `TenDV` (`TenDV`);

--
-- Chỉ mục cho bảng `giaohang`
--
ALTER TABLE `giaohang`
  ADD KEY `MaDDH` (`MaDDH`),
  ADD KEY `MaMH` (`MaMH`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`),
  ADD UNIQUE KEY `TenKH` (`TenKH`),
  ADD KEY `FK_MaTP` (`MaTP`);

--
-- Chỉ mục cho bảng `mathang`
--
ALTER TABLE `mathang`
  ADD PRIMARY KEY (`MaMH`),
  ADD UNIQUE KEY `TenMH` (`TenMH`),
  ADD KEY `FK_MaNCC` (`MaNCC`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`MaNCC`),
  ADD UNIQUE KEY `TenNCC` (`TenNCC`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`),
  ADD KEY `FK_MaDV` (`MaDV`);

--
-- Chỉ mục cho bảng `tinhtp`
--
ALTER TABLE `tinhtp`
  ADD PRIMARY KEY (`MaTP`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `mathang`
--
ALTER TABLE `mathang`
  MODIFY `MaMH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `MaNCC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD CONSTRAINT `FK_MaNV` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Các ràng buộc cho bảng `chitietddh`
--
ALTER TABLE `chitietddh`
  ADD CONSTRAINT `FK_MaDDH` FOREIGN KEY (`MaDDH`) REFERENCES `dondathang` (`MaDDH`),
  ADD CONSTRAINT `FK_MaMH` FOREIGN KEY (`MaMH`) REFERENCES `mathang` (`MaMH`);

--
-- Các ràng buộc cho bảng `dondathang`
--
ALTER TABLE `dondathang`
  ADD CONSTRAINT `FK_KH` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `FK_MaNVV` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Các ràng buộc cho bảng `giaohang`
--
ALTER TABLE `giaohang`
  ADD CONSTRAINT `MaDDH` FOREIGN KEY (`MaDDH`) REFERENCES `chitietddh` (`MaDDH`),
  ADD CONSTRAINT `MaMH` FOREIGN KEY (`MaMH`) REFERENCES `chitietddh` (`MaMH`);

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `FK_MaTP` FOREIGN KEY (`MaTP`) REFERENCES `tinhtp` (`MaTP`);

--
-- Các ràng buộc cho bảng `mathang`
--
ALTER TABLE `mathang`
  ADD CONSTRAINT `FK_MaNCC` FOREIGN KEY (`MaNCC`) REFERENCES `nhacungcap` (`MaNCC`);

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `FK_MaDV` FOREIGN KEY (`MaDV`) REFERENCES `donvi` (`MaDV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
