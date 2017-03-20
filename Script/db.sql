USE [master]
GO
/****** Object:  Database [QLNHBuffet]    Script Date: 2/17/2017 5:59:38 PM ******/
CREATE DATABASE [QLNHBuffet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNHBuffet', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLNHBuffet.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLNHBuffet_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLNHBuffet_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLNHBuffet] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNHBuffet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNHBuffet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNHBuffet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNHBuffet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNHBuffet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNHBuffet] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNHBuffet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNHBuffet] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLNHBuffet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNHBuffet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNHBuffet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNHBuffet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNHBuffet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNHBuffet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNHBuffet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNHBuffet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNHBuffet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLNHBuffet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNHBuffet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNHBuffet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNHBuffet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNHBuffet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNHBuffet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNHBuffet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNHBuffet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLNHBuffet] SET  MULTI_USER 
GO
ALTER DATABASE [QLNHBuffet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNHBuffet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNHBuffet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNHBuffet] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLNHBuffet]
GO
/****** Object:  Table [dbo].[BoPhan]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoPhan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaBP] [nchar](10) NULL,
	[TenBP] [nvarchar](50) NULL,
	[PhuCap] [float] NULL,
	[TruongBP] [int] NULL,
	[PhuCapTruongBP] [float] NULL,
 CONSTRAINT [PK_BoPhan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CaLam]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaLam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaCL] [nchar](10) NULL,
	[TenCL] [nvarchar](50) NULL,
	[Ngay] [datetime] NULL,
	[GioBatDau] [datetime] NULL,
	[GioKetThuc] [datetime] NULL,
	[MaBepTruong] [int] NULL,
 CONSTRAINT [PK_CaLam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaCTDH] [nchar](10) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[ThoiDiemGiao] [datetime] NULL,
	[DatChatLuong] [bit] NULL,
	[TienBoiThuong] [money] NULL,
	[MaDH] [int] NULL,
	[MaNL] [int] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NULL,
	[MaDV] [int] NULL,
	[SoLuong] [int] NULL,
	[Tien] [money] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieuNhapKho]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhapKho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaCTPNK] [nchar](10) NULL,
	[SoLuong] [float] NULL,
	[MaNL] [int] NULL,
	[MaPNK] [int] NULL,
 CONSTRAINT [PK_ChiTietPhieuNhapKho] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieuXuatKho]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuXuatKho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaCTPXK] [nchar](10) NULL,
	[SoLuong] [float] NULL,
	[MaNL] [int] NULL,
	[MaPXK] [int] NULL,
 CONSTRAINT [PK_ChiTietPhieuXuatKho] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieuYeuCau]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuYeuCau](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaCTPYC] [nchar](10) NULL,
	[SoLuong] [float] NULL,
	[NgayYeuCauGiao] [datetime] NULL,
	[MaNL] [int] NULL,
	[MaPYC] [int] NULL,
 CONSTRAINT [PK_ChiTietPhieuYeuCau] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhuTrachMonAnTrongCaLam]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhuTrachMonAnTrongCaLam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaCTPTMACL] [nchar](10) NULL,
	[MaCL] [int] NULL,
	[MaMA] [int] NULL,
	[MaNVPhuTrachChinh] [int] NULL,
 CONSTRAINT [PK_ChiTietPhuTrachMonAnTrongCaLam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaDV] [nchar](10) NULL,
	[TenDV] [nvarchar](50) NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoiTuong]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTuong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaDT] [nchar](10) NULL,
	[TenDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_DoiTuong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaDH] [nchar](10) NULL,
	[TongTien] [money] NULL,
	[MaNCC] [int] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [nchar](10) NULL,
	[TongTien] [money] NULL,
	[NgayLap] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nchar](10) NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [text] NULL,
	[CMND] [nchar](10) NULL,
	[SoDienThoai] [nchar](30) NULL,
	[NgaySinh] [date] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LichNghiPhep]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichNghiPhep](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaLNP] [nchar](10) NULL,
	[MaCL] [int] NULL,
	[MaNVNghiPhep] [int] NULL,
	[MaNVLamThay] [int] NULL,
 CONSTRAINT [PK_LichNghiPhep] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LichPhanCongTaiQuay]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichPhanCongTaiQuay](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaLPCTQ] [nchar](10) NULL,
	[MaCL] [int] NULL,
	[MaQ] [int] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_LichPhanCongTaiQuay] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiMonAn]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMonAn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaLMA] [nchar](10) NULL,
	[TenLMA] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiMonAn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiNguyenLieu]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNguyenLieu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaLNL] [nchar](10) NULL,
	[TenLNL] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiNguyenLieu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiVe]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiVe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaLV] [nchar](10) NULL,
	[TenLV] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiVe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiVoucher]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiVoucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaLV] [nchar](10) NULL,
	[TenLV] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiVoucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonAn]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonAn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaMA] [nchar](10) NULL,
	[TenMA] [nvarchar](50) NULL,
	[ThoiGianCheBien] [float] NULL,
	[MaLMA] [int] NULL,
	[MaQ] [int] NULL,
 CONSTRAINT [PK_MonAn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguyenLieu]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaNL] [nchar](10) NULL,
	[TenNL] [nvarchar](50) NULL,
	[HanSuDung] [datetime] NULL,
	[SoLuongTonKho] [float] NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[MaLNL] [int] NULL,
 CONSTRAINT [PK_NguyenLieu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguyenLieu_MonAn]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieu_MonAn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaNL] [int] NULL,
	[MaMA] [int] NULL,
	[SoLuong] [float] NULL,
	[DonViTinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguyenLieu_MonAn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [nchar](10) NULL,
	[TenNCC] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nchar](10) NULL,
	[TenNV] [nvarchar](50) NULL,
	[MaBP] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhapKho]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapKho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaPNK] [nchar](10) NULL,
	[NgayLap] [datetime] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_PhieuNhapKho] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuXuatKho]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuatKho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaPXK] [nchar](10) NULL,
	[NgayLap] [datetime] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_PhieuXuatKho] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuYeuCau]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuYeuCau](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaPYC] [nchar](10) NULL,
	[NgayLap] [datetime] NULL,
	[TinhTrang] [bit] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_PhieuYeuCau] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhuTrach_MonAnTrongCaLam]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuTrach_MonAnTrongCaLam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaCTPTMACL] [int] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_PhuTrach_MonAnTrongCaLam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quay]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quay](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaQ] [nchar](10) NULL,
	[TenQ] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quay] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TheKhachHangThanThiet]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheKhachHangThanThiet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaTKHTT] [nchar](10) NULL,
	[NgayThanhLapThe] [datetime] NULL,
	[DiemTichLuy] [int] NULL,
	[LanSuDungCuoi] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_TheKhachHangThanThiet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThucDon]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThucDon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaTD] [nchar](10) NULL,
	[NgayApDung] [datetime] NULL,
	[NgayNgungApDung] [datetime] NULL,
 CONSTRAINT [PK_ThucDon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThucDon_MonAn]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThucDon_MonAn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaTD] [int] NULL,
	[MaMA] [int] NULL,
	[NgayNau] [datetime] NULL,
	[SoLuongPhanAnDuTinhNau] [int] NULL,
 CONSTRAINT [PK_ThucDon_MonAn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ve]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaV] [nchar](10) NULL,
	[HanSuDung] [datetime] NULL,
	[GiaTien] [money] NULL,
	[MaLV] [int] NULL,
	[MaDT] [int] NULL,
 CONSTRAINT [PK_Ve] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 2/17/2017 5:59:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaV] [nchar](10) NULL,
	[GiaTien] [money] NULL,
	[ThoiGianBatDau] [datetime] NULL,
	[ThoiGianKetThuc] [datetime] NULL,
	[MaLV] [int] NULL,
	[MaDV] [int] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[BoPhan]  WITH CHECK ADD  CONSTRAINT [FK_BoPhan_NhanVien] FOREIGN KEY([TruongBP])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[BoPhan] CHECK CONSTRAINT [FK_BoPhan_NhanVien]
GO
ALTER TABLE [dbo].[CaLam]  WITH CHECK ADD  CONSTRAINT [FK_CaLam_NhanVien] FOREIGN KEY([MaBepTruong])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[CaLam] CHECK CONSTRAINT [FK_CaLam_NhanVien]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([id])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_NguyenLieu] FOREIGN KEY([MaNL])
REFERENCES [dbo].[NguyenLieu] ([id])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_NguyenLieu]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_DichVu] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DichVu] ([id])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_DichVu]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([id])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhapKho_NguyenLieu] FOREIGN KEY([MaNL])
REFERENCES [dbo].[NguyenLieu] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapKho] CHECK CONSTRAINT [FK_ChiTietPhieuNhapKho_NguyenLieu]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhapKho_PhieuNhapKho] FOREIGN KEY([MaPNK])
REFERENCES [dbo].[PhieuNhapKho] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapKho] CHECK CONSTRAINT [FK_ChiTietPhieuNhapKho_PhieuNhapKho]
GO
ALTER TABLE [dbo].[ChiTietPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuXuatKho_NguyenLieu] FOREIGN KEY([MaNL])
REFERENCES [dbo].[NguyenLieu] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhieuXuatKho] CHECK CONSTRAINT [FK_ChiTietPhieuXuatKho_NguyenLieu]
GO
ALTER TABLE [dbo].[ChiTietPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuXuatKho_PhieuXuatKho] FOREIGN KEY([MaPXK])
REFERENCES [dbo].[PhieuXuatKho] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhieuXuatKho] CHECK CONSTRAINT [FK_ChiTietPhieuXuatKho_PhieuXuatKho]
GO
ALTER TABLE [dbo].[ChiTietPhieuYeuCau]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuYeuCau_NguyenLieu] FOREIGN KEY([MaNL])
REFERENCES [dbo].[NguyenLieu] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhieuYeuCau] CHECK CONSTRAINT [FK_ChiTietPhieuYeuCau_NguyenLieu]
GO
ALTER TABLE [dbo].[ChiTietPhieuYeuCau]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuYeuCau_PhieuYeuCau] FOREIGN KEY([MaPYC])
REFERENCES [dbo].[PhieuYeuCau] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhieuYeuCau] CHECK CONSTRAINT [FK_ChiTietPhieuYeuCau_PhieuYeuCau]
GO
ALTER TABLE [dbo].[ChiTietPhuTrachMonAnTrongCaLam]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhuTrachMonAnTrongCaLam_CaLam] FOREIGN KEY([MaCL])
REFERENCES [dbo].[CaLam] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhuTrachMonAnTrongCaLam] CHECK CONSTRAINT [FK_ChiTietPhuTrachMonAnTrongCaLam_CaLam]
GO
ALTER TABLE [dbo].[ChiTietPhuTrachMonAnTrongCaLam]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhuTrachMonAnTrongCaLam_MonAn] FOREIGN KEY([MaMA])
REFERENCES [dbo].[MonAn] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhuTrachMonAnTrongCaLam] CHECK CONSTRAINT [FK_ChiTietPhuTrachMonAnTrongCaLam_MonAn]
GO
ALTER TABLE [dbo].[ChiTietPhuTrachMonAnTrongCaLam]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhuTrachMonAnTrongCaLam_NhanVien] FOREIGN KEY([MaNVPhuTrachChinh])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhuTrachMonAnTrongCaLam] CHECK CONSTRAINT [FK_ChiTietPhuTrachMonAnTrongCaLam_NhanVien]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NhaCungCap]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([id])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[LichNghiPhep]  WITH CHECK ADD  CONSTRAINT [FK_LichNghiPhep_CaLam] FOREIGN KEY([MaCL])
REFERENCES [dbo].[CaLam] ([id])
GO
ALTER TABLE [dbo].[LichNghiPhep] CHECK CONSTRAINT [FK_LichNghiPhep_CaLam]
GO
ALTER TABLE [dbo].[LichNghiPhep]  WITH CHECK ADD  CONSTRAINT [FK_LichNghiPhep_NhanVien] FOREIGN KEY([MaNVLamThay])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[LichNghiPhep] CHECK CONSTRAINT [FK_LichNghiPhep_NhanVien]
GO
ALTER TABLE [dbo].[LichNghiPhep]  WITH CHECK ADD  CONSTRAINT [FK_LichNghiPhep_NhanVien1] FOREIGN KEY([MaNVNghiPhep])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[LichNghiPhep] CHECK CONSTRAINT [FK_LichNghiPhep_NhanVien1]
GO
ALTER TABLE [dbo].[LichPhanCongTaiQuay]  WITH CHECK ADD  CONSTRAINT [FK_LichPhanCongTaiQuay_CaLam] FOREIGN KEY([MaCL])
REFERENCES [dbo].[CaLam] ([id])
GO
ALTER TABLE [dbo].[LichPhanCongTaiQuay] CHECK CONSTRAINT [FK_LichPhanCongTaiQuay_CaLam]
GO
ALTER TABLE [dbo].[LichPhanCongTaiQuay]  WITH CHECK ADD  CONSTRAINT [FK_LichPhanCongTaiQuay_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[LichPhanCongTaiQuay] CHECK CONSTRAINT [FK_LichPhanCongTaiQuay_NhanVien]
GO
ALTER TABLE [dbo].[LichPhanCongTaiQuay]  WITH CHECK ADD  CONSTRAINT [FK_LichPhanCongTaiQuay_Quay] FOREIGN KEY([MaQ])
REFERENCES [dbo].[Quay] ([id])
GO
ALTER TABLE [dbo].[LichPhanCongTaiQuay] CHECK CONSTRAINT [FK_LichPhanCongTaiQuay_Quay]
GO
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_LoaiMonAn] FOREIGN KEY([MaLMA])
REFERENCES [dbo].[LoaiMonAn] ([id])
GO
ALTER TABLE [dbo].[MonAn] CHECK CONSTRAINT [FK_MonAn_LoaiMonAn]
GO
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_Quay] FOREIGN KEY([MaQ])
REFERENCES [dbo].[Quay] ([id])
GO
ALTER TABLE [dbo].[MonAn] CHECK CONSTRAINT [FK_MonAn_Quay]
GO
ALTER TABLE [dbo].[NguyenLieu]  WITH CHECK ADD  CONSTRAINT [FK_NguyenLieu_LoaiNguyenLieu] FOREIGN KEY([MaLNL])
REFERENCES [dbo].[LoaiNguyenLieu] ([id])
GO
ALTER TABLE [dbo].[NguyenLieu] CHECK CONSTRAINT [FK_NguyenLieu_LoaiNguyenLieu]
GO
ALTER TABLE [dbo].[NguyenLieu_MonAn]  WITH CHECK ADD  CONSTRAINT [FK_NguyenLieu_MonAn_MonAn] FOREIGN KEY([MaMA])
REFERENCES [dbo].[MonAn] ([id])
GO
ALTER TABLE [dbo].[NguyenLieu_MonAn] CHECK CONSTRAINT [FK_NguyenLieu_MonAn_MonAn]
GO
ALTER TABLE [dbo].[NguyenLieu_MonAn]  WITH CHECK ADD  CONSTRAINT [FK_NguyenLieu_MonAn_NguyenLieu] FOREIGN KEY([MaNL])
REFERENCES [dbo].[NguyenLieu] ([id])
GO
ALTER TABLE [dbo].[NguyenLieu_MonAn] CHECK CONSTRAINT [FK_NguyenLieu_MonAn_NguyenLieu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_BoPhan] FOREIGN KEY([MaBP])
REFERENCES [dbo].[BoPhan] ([id])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_BoPhan]
GO
ALTER TABLE [dbo].[PhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapKho_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[PhieuNhapKho] CHECK CONSTRAINT [FK_PhieuNhapKho_NhanVien]
GO
ALTER TABLE [dbo].[PhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuatKho_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[PhieuXuatKho] CHECK CONSTRAINT [FK_PhieuXuatKho_NhanVien]
GO
ALTER TABLE [dbo].[PhieuYeuCau]  WITH CHECK ADD  CONSTRAINT [FK_PhieuYeuCau_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[PhieuYeuCau] CHECK CONSTRAINT [FK_PhieuYeuCau_NhanVien]
GO
ALTER TABLE [dbo].[PhuTrach_MonAnTrongCaLam]  WITH CHECK ADD  CONSTRAINT [FK_PhuTrach_MonAnTrongCaLam_ChiTietPhuTrachMonAnTrongCaLam] FOREIGN KEY([MaCTPTMACL])
REFERENCES [dbo].[ChiTietPhuTrachMonAnTrongCaLam] ([id])
GO
ALTER TABLE [dbo].[PhuTrach_MonAnTrongCaLam] CHECK CONSTRAINT [FK_PhuTrach_MonAnTrongCaLam_ChiTietPhuTrachMonAnTrongCaLam]
GO
ALTER TABLE [dbo].[PhuTrach_MonAnTrongCaLam]  WITH CHECK ADD  CONSTRAINT [FK_PhuTrach_MonAnTrongCaLam_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[PhuTrach_MonAnTrongCaLam] CHECK CONSTRAINT [FK_PhuTrach_MonAnTrongCaLam_NhanVien]
GO
ALTER TABLE [dbo].[TheKhachHangThanThiet]  WITH CHECK ADD  CONSTRAINT [FK_TheKhachHangThanThiet_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([id])
GO
ALTER TABLE [dbo].[TheKhachHangThanThiet] CHECK CONSTRAINT [FK_TheKhachHangThanThiet_KhachHang]
GO
ALTER TABLE [dbo].[ThucDon_MonAn]  WITH CHECK ADD  CONSTRAINT [FK_ThucDon_MonAn_MonAn] FOREIGN KEY([MaMA])
REFERENCES [dbo].[MonAn] ([id])
GO
ALTER TABLE [dbo].[ThucDon_MonAn] CHECK CONSTRAINT [FK_ThucDon_MonAn_MonAn]
GO
ALTER TABLE [dbo].[ThucDon_MonAn]  WITH CHECK ADD  CONSTRAINT [FK_ThucDon_MonAn_ThucDon] FOREIGN KEY([MaTD])
REFERENCES [dbo].[ThucDon] ([id])
GO
ALTER TABLE [dbo].[ThucDon_MonAn] CHECK CONSTRAINT [FK_ThucDon_MonAn_ThucDon]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_DoiTuong] FOREIGN KEY([MaDT])
REFERENCES [dbo].[DoiTuong] ([id])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_DoiTuong]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_LoaiVe] FOREIGN KEY([MaLV])
REFERENCES [dbo].[LoaiVe] ([id])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_LoaiVe]
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_DichVu] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DichVu] ([id])
GO
ALTER TABLE [dbo].[Voucher] CHECK CONSTRAINT [FK_Voucher_DichVu]
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_LoaiVoucher] FOREIGN KEY([MaLV])
REFERENCES [dbo].[LoaiVoucher] ([id])
GO
ALTER TABLE [dbo].[Voucher] CHECK CONSTRAINT [FK_Voucher_LoaiVoucher]
GO
USE [master]
GO
ALTER DATABASE [QLNHBuffet] SET  READ_WRITE 
GO
