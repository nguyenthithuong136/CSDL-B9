-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 29, 2023 lúc 11:47 AM
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
(1, 2023, 1, 22),
(1, 2023, 2, 20),
(1, 2023, 3, 25),
(1, 2023, 4, 23),
(1, 2023, 5, 21),
(1, 2023, 6, 18),
(1, 2023, 7, 24),
(1, 2023, 8, 26),
(1, 2023, 9, 19),
(1, 2023, 10, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietddh`
--

CREATE TABLE `chitietddh` (
  `MaDDH` char(5) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `GiamGia` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietddh`
--

INSERT INTO `chitietddh` (`MaDDH`, `MaMH`, `SoLuong`, `GiamGia`) VALUES
('DDH01', 1, 5, 0.2),
('DDH01', 2, 3, 0.1),
('DDH02', 3, 2, 0.5),
('DDH02', 4, 4, 0.3),
('DDH03', 5, 1, 0.4),
('DDH04', 6, 3, 0.1),
('DDH05', 7, 2, 0.6),
('DDH05', 8, 5, 0.3),
('DDH06', 9, 4, 0.5),
('DDH07', 10, 2, 0.4);

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
('DDH01', 'CODACO', 1, '2023-07-28', '2023-08-02'),
('DDH02', 'COTEC', 2, '2023-07-29', '2023-08-03'),
('DDH03', 'VITICO', 3, '2023-07-30', '2023-08-04'),
('DDH04', 'GIAY32', 4, '2023-07-31', '2023-08-05'),
('DDH05', 'SAMECO', 5, '2023-08-01', '2023-08-06'),
('DDH06', 'DHP', 6, '2023-08-02', '2023-08-07'),
('DDH07', 'SAMECO', 7, '2023-08-03', '2023-08-08'),
('DDH08', 'DHP', 8, '2023-08-04', '2023-08-09'),
('DDH09', 'VITICO', 9, '2023-08-05', '2023-08-10'),
('DDH10', 'VTP', 10, '2023-08-06', '2023-08-11');

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
('TC', 'Tổ Chức');

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

--
-- Đang đổ dữ liệu cho bảng `giaohang`
--

INSERT INTO `giaohang` (`Ngay`, `MaDDH`, `MaMH`, `Soluong`) VALUES
('2023-08-02', 'DDH01', 1, 5),
('2023-08-02', 'DDH01', 2, 3),
('2023-08-03', 'DDH02', 3, 2),
('2023-08-03', 'DDH02', 4, 4),
('2023-08-04', 'DDH03', 5, 1),
('2023-08-05', 'DDH04', 6, 3),
('2023-08-06', 'DDH05', 7, 2),
('2023-08-06', 'DDH05', 8, 5),
('2023-08-07', 'DDH06', 9, 4),
('2023-08-08', 'DDH07', 10, 2);

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
(1, 'Rượu', 'Chai', 100, '', 7),
(2, 'Tiêu', 'Hộp', 20, '', 7),
(3, 'Bánh kem', 'Cái', 65, '', 3),
(4, 'Bơ', 'Kg', 200, '', 6),
(5, 'Bánh mì', 'Cái', 500, '', 3),
(6, 'Nem', 'Kg', 30, '', 1),
(7, 'Táo', 'Kg', 30, '', 4),
(8, 'Cá Hộp', 'Thùng', 600, '', 1);

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
  `HoLot` varchar(30) NOT NULL DEFAULT ' ',
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
(1, 'Nguyen', 'Van A', 'M', 15000000, '2023-07-27', 'Ha Noi', '0987654321', '', NULL),
(2, 'Le', 'Thi B', 'F', 12000000, '2023-07-26', 'Ho Chi Minh', '0123456789', '', NULL),
(3, 'Tran', 'Van C', 'M', 18000000, '2023-07-25', 'Da Nang', '0909090909', '', NULL),
(4, 'Pham', 'Thi D', 'F', 14000000, '2023-07-24', 'Hai Phong', '0912345678', '', NULL),
(5, 'Hoang', 'Van E', 'M', 20000000, '2023-07-23', 'Can Tho', '0888888888', '', NULL),
(6, 'Vo', 'Thi F', 'F', 13000000, '2023-07-22', 'Bac Ninh', '0977777777', '', NULL),
(7, 'Dang', 'Van G', 'M', 16000000, '2023-07-21', 'Hue', '0955555555', '', NULL),
(8, 'Bui', 'Thi H', 'F', 17000000, '2023-07-20', 'Vinh', '0944444444', '', NULL),
(9, 'Truong', 'Van I', 'M', 19000000, '2023-07-19', 'Phu Tho', '0933333333', '', NULL),
(10, 'Nguyen', 'Thi J', 'F', 11000000, '2023-07-18', 'Thai Nguyen', '0922222222', '', NULL),
(11, 'Nguyen', 'Thi K', 'F', 12500000, '2023-07-17', 'Quang Ninh', '0911111111', '', NULL),
(12, 'Le', 'Van L', 'M', 18000000, '2023-07-16', 'Hai Duong', '0922222222', '', NULL),
(13, 'Tran', 'Thi M', 'F', 13500000, '2023-07-15', 'Nam Dinh', '0933333333', '', NULL),
(14, 'Pham', 'Van N', 'M', 21000000, '2023-07-14', 'Ninh Binh', '0944444444', '', NULL),
(15, 'Hoang', 'Thi O', 'F', 16000000, '2023-07-13', 'Thanh Hoa', '0955555555', '', NULL),
(16, 'Vo', 'Van P', 'M', 19000000, '2023-07-12', 'Nghe An', '0966666666', '', NULL),
(17, 'Dang', 'Thi Q', 'F', 14000000, '2023-07-11', 'Ha Tinh', '0977777777', '', NULL),
(18, 'Bui', 'Van R', 'M', 20000000, '2023-07-10', 'Quang Binh', '0988888888', '', NULL),
(19, 'Truong', 'Thi S', 'F', 15000000, '2023-07-09', 'Quang Tri', '0999999999', '', NULL),
(20, 'Nguyen', 'Van T', 'M', 17000000, '2023-07-08', 'Thua Thien-Hue', '0900000000', '', NULL);

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
('TP', 'TP.Hồ Chí Minh'),
('VI', 'Vinh');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD PRIMARY KEY (`Thang`,`Nam`,`MaNV`),
  ADD KEY `FK_chamcong_nhanvien` (`MaNV`);

--
-- Chỉ mục cho bảng `chitietddh`
--
ALTER TABLE `chitietddh`
  ADD PRIMARY KEY (`MaDDH`,`MaMH`),
  ADD KEY `FK_chitietddh_mathang` (`MaMH`);

--
-- Chỉ mục cho bảng `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`MaDDH`),
  ADD KEY `FK_dondathang_khachhang` (`MaKH`),
  ADD KEY `FK_dondathang_nhanvien` (`MaNV`);

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
  ADD KEY `FK_khachhang_tinhtp` (`MaTP`);

--
-- Chỉ mục cho bảng `mathang`
--
ALTER TABLE `mathang`
  ADD PRIMARY KEY (`MaMH`),
  ADD UNIQUE KEY `TenMH` (`TenMH`),
  ADD KEY `FK_mathang_nhacungcap` (`MaNCC`);

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
  ADD KEY `FK_nhanvien_donvi` (`MaDV`);

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
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD CONSTRAINT `FK_chamcong_nhanvien` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Các ràng buộc cho bảng `dondathang`
--
ALTER TABLE `dondathang`
  ADD CONSTRAINT `FK_dondathang_khachhang` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `FK_dondathang_nhanvien` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

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
  ADD CONSTRAINT `FK_khachhang_tinhtp` FOREIGN KEY (`MaTP`) REFERENCES `tinhtp` (`MaTP`);

--
-- Các ràng buộc cho bảng `mathang`
--
ALTER TABLE `mathang`
  ADD CONSTRAINT `FK_mathang_nhacungcap` FOREIGN KEY (`MaNCC`) REFERENCES `nhacungcap` (`MaNCC`);

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `FK_nhanvien_donvi` FOREIGN KEY (`MaDV`) REFERENCES `donvi` (`MaDV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
