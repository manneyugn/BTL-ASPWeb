USE [master]
GO
/****** Object:  Database [BTL_WEB]    Script Date: 06/09/20 11:46:20 PM ******/
CREATE DATABASE [BTL_WEB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BTL_WEB', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BTL_WEB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BTL_WEB_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BTL_WEB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BTL_WEB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BTL_WEB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BTL_WEB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BTL_WEB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BTL_WEB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BTL_WEB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BTL_WEB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BTL_WEB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BTL_WEB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BTL_WEB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BTL_WEB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BTL_WEB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BTL_WEB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BTL_WEB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BTL_WEB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BTL_WEB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BTL_WEB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BTL_WEB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BTL_WEB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BTL_WEB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BTL_WEB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BTL_WEB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BTL_WEB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BTL_WEB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BTL_WEB] SET RECOVERY FULL 
GO
ALTER DATABASE [BTL_WEB] SET  MULTI_USER 
GO
ALTER DATABASE [BTL_WEB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BTL_WEB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BTL_WEB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BTL_WEB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BTL_WEB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BTL_WEB', N'ON'
GO
ALTER DATABASE [BTL_WEB] SET QUERY_STORE = OFF
GO
USE [BTL_WEB]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ID] [int] NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[Gia] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaLoai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPhamGioHang]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamGioHang](
	[IDSP] [int] NOT NULL,
	[IDGH] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
	[ThanhTien] [decimal](18, 0) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK__SanPhamG__3214EC279322658A] PRIMARY KEY CLUSTERED 
(
	[IDSP] ASC,
	[IDGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_GioHang]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[V_GioHang]
as
select TenSP, SoLuong, ThanhTien, IDSP, IDGH
from SanPhamGioHang, SanPham
where SanPhamGioHang.IDSP = SanPham.ID
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[ID] [int] NOT NULL,
	[IDKH] [int] NULL,
	[TenKH] [nvarchar](100) NULL,
	[Email] [varchar](100) NULL,
	[SDT] [varchar](12) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[TongTien] [decimal](18, 0) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[TinhTrang] [nvarchar](100) NULL,
	[NgayTao] [date] NULL,
 CONSTRAINT [PK__GioHang__3214EC2758447D88] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[LichSuMuaHang]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[LichSuMuaHang]
as
select GioHang.ID,NgayTao,TenSP,SoLuong,ThanhTien,TinhTrang,IDKH from GioHang,SanPham,SanPhamGioHang where GioHang.ID = SanPhamGioHang.IDGH and SanPhamGioHang.IDSP = SanPham.ID
GO
/****** Object:  Table [dbo].[AnhSanPham]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhSanPham](
	[ID] [int] NOT NULL,
	[LinkAnh] [varchar](max) NULL,
	[IDSP] [int] NULL,
 CONSTRAINT [PK__AnhSanPh__3214EC27B499AD84] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID] [int] NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](4) NULL,
	[SDT] [varchar](12) NULL,
	[DangKyNgay] [date] NULL,
 CONSTRAINT [PK__KhachHan__3214EC27922EDC05] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[ID] [int] NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (1, N'Accessories/nightfox/nf-case-first-min_1500x1000.jpg', 3)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (2, N'Accessories/nightfox/nightfox-case-open_1500x1000.jpg', 3)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (3, N'Accessories/nightfox/nightfox-case-sxs_1500x1000.jpg', 3)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (4, N'Accessories/whitefox/whitefox-case_1500x1000.png', 2)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (5, N'Accessories/whitefox/WhiteFox-Case-min_a14cb422-32b1-4eff-a1ba-5dd639117912_1500x1000.png', 2)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (6, N'Accessories/whitefox/WhiteFox-in-Case-min_2048x2048_b80cb1f7-1baf-449e-80c7-379db45f2340_1500x1000.png', 2)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (7, N'Accessories/Wrist Rests/diagonal_from_top_right_329eb40b-c57d-432c-a6ba-3ff649c08f7d_1499x1002.jpg
', 1)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (8, N'Accessories/Wrist Rests/los_tres_amigos_06a5cfd6-baa8-48d2-9dc7-47b8b00de0e9_1499x1002.jpg', 1)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (9, N'Accessories/Wrist Rests/with_grey_kira_c6a3b6dd-fd1d-4c0e-9be9-20b08c11c92d_1499x1002.jpg', 1)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (10, N'Accessories/Wrist Rests/with_whitefox_diagonal_right_1499x1002.jpg', 1)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (11, N'Accessories/Wrist Rests/wrist_rest_straight_on_997a6495-1f96-43e7-850c-0b98bd8607ec_1499x1002.jpg', 1)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (12, N'Cable/Gradient Cables/GradientCable1_1500x1125.jpg', 4)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (13, N'Cable/Gradient Cables/Kono_Gradient_Cable_1500x1125.jpg', 4)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (14, N'Cable/NightFox USB Type C Cable/nf_cable_1_1500x1000.jpg', 5)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (15, N'Cable/NightFox USB Type C Cable/nf_cable_2_1500x1000.jpg', 5)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (16, N'Cable/WhiteFox USB Type C Cable/type-C_1012f864-8dcc-4d54-ba3f-a9384513c0e1_1500x1000.png', 6)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (17, N'Cable/WhiteFox USB Type C Cable/whitefox-cable-min_1500x1000.jpg', 6)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (18, N'Case/Datamancer Wooden WhiteFox Case/Datamancer-Case-Card-1-min_2000x1333.png', 7)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (19, N'Case/Datamancer Wooden WhiteFox Case/Datamancer-Case-Comparison-min_1500x1000.png', 7)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (20, N'Case/Datamancer Wooden WhiteFox Case/NightFox-Walnut-Case-Wrist-Rest_1500x1000.jpg', 7)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (21, N'Case/Datamancer Wooden WhiteFox Case/Oak-Case_1502x1001.jpg', 7)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (22, N'Case/Datamancer Wooden WhiteFox Case/side-profile-min_1500x1000.png', 7)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (23, N'Case/Datamancer Wooden WhiteFox Case/Walnut_Case_Top_Down_1497x999.jpg', 7)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (24, N'Case/Datamancer Wooden WhiteFox Case/Walnut-Case---Datamancer-min_1500x1000.png', 7)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (25, N'Case/Kira Stealth Full Metal Upgrade Case/Stealth_Metal_Kira_Case_1500x1000.jpg', 8)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (26, N'Case/whitefox/fox-fluff-final-fb-share_1200x630.png', 9)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (27, N'Case/whitefox/WhiteFox_NightFox_1x_1499x1001.jpg', 9)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (28, N'Case/whitefox/whitefox-case-2-min_1500x1000.png', 9)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (29, N'Case/whitefox/WhiteFox-Cherry-Case-Wrist-Rest_1501x1003.jpg', 9)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (30, N'Case/whitefox/whitefox-incase-min_1500x1000.png', 9)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (31, N'Case/whitefox/whitefox-kit-case-min_1500x1000.png', 9)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (32, N'DeskMats/Fuyu/Fuyu_Fade_2400x1012.jpg', 10)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (33, N'DeskMats/Fuyu/Fuyu_Halo_357db450-201f-45f3-b2ce-fd8650112e08_2400x1012.jpg', 10)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (34, N'DeskMats/NovelKeys Deskmats 1/GMK_Camping_Desk_Mat_1500x1000.jpg', 11)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (35, N'DeskMats/NovelKeys Deskmats 1/Laser_1600x1069.jpg', 11)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (36, N'DeskMats/NovelKeys Deskmats 1/Miami_City_1500x1000.jpg', 11)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (37, N'DeskMats/NovelKeys Deskmats 1/Miami_Nights_1500x1000.jpg', 11)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (38, N'DeskMats/NovelKeys Deskmats 1/nasa_black_1600x1069.jpg', 11)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (39, N'DeskMats/NovelKeys Deskmats 1/nasa_red_1600x1069.jpg', 11)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (40, N'DeskMats/NovelKeys Deskmats 1/pu_green_1600x_d08b6ec8-d0e0-427b-b8f8-6169274df018_1600x1069.jpeg', 11)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (41, N'DeskMats/NovelKeys Deskmats 1/pu_orange_1600x_a30c503e-2441-437e-a78e-178cb2b90140_1600x1069.jpeg', 11)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (42, N'DeskMats/NovelKeys Deskmats 1/pu_red_1600x_93fa4b74-fd8d-49c3-9602-e406ff9d6bcb_1600x1069.jpeg', 11)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (43, N'DeskMats/NovelKeys Deskmats 1/Pulse_Deskmat_1500x1001.jpg', 11)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (44, N'DeskMats/NovelKeys Deskmats 2/DSC01184_1600x_c7dc554b-7163-43db-8e5c-de1b3140aae2_1600x1069.jpg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (45, N'DeskMats/NovelKeys Deskmats 2/Godspeed_Camping_1500x1000.jpg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (46, N'DeskMats/NovelKeys Deskmats 2/Godspeed_Desk_Mat_1500x1000.jpg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (47, N'DeskMats/NovelKeys Deskmats 2/godspeed_glow_blue_1500x1000.jpg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (48, N'DeskMats/NovelKeys Deskmats 2/godspeed_glow_green_1500x1000.jpg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (49, N'DeskMats/NovelKeys Deskmats 2/Godspeed_Orange_Mat_1500x1000.jpg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (50, N'DeskMats/NovelKeys Deskmats 2/godspeed_glow_pink_1500x1000.jpg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (51, N'DeskMats/NovelKeys Deskmats 2/Godspeed_Pink_1500x1000.jpg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (52, N'DeskMats/NovelKeys Deskmats 2/gs_ares_1600x_bdfddfff-529f-4af1-802d-4acd9d6f4492_1600x1069.jpeg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (53, N'DeskMats/NovelKeys Deskmats 2/gs_laser_1600x_05b75d6b-3018-4cf0-910b-0bf1f609459c_1600x1069.jpeg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (54, N'DeskMats/NovelKeys Deskmats 2/panda_1600x_3f8f0480-a3f3-47d3-9d5d-b8930c4c2e42_1600x1069.jpeg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (55, N'DeskMats/NovelKeys Deskmats 2/r_panda_1600x_2557c446-a942-46c3-8271-81afb315f52d_1600x1069.jpeg', 12)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (56, N'KeyBoards/EPBT Ivory/2.png', 13)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (57, N'KeyBoards/EPBT Ivory/2_f3539d88-3310-408f-a2f3-c333d1448d2b.png', 13)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (58, N'KeyBoards/EPBT Ivory/5.png', 13)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (59, N'KeyBoards/EPBT Ivory/6.png', 13)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (60, N'KeyBoards/EPBT Ivory/24_287cb540-73b9-4172-b987-1561adfbf0cb.png', 13)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (61, N'KeyBoards/EPBT Ivory/30.png', 13)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (62, N'KeyBoards/EPBT Ivory/F2-slide-1.jpg', 13)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (63, N'KeyBoards/Hexgears Gemini/4.png', 14)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (64, N'KeyBoards/Hexgears Gemini/4_98a0e8f1-eb0f-4a06-8ab4-83f20ab8aed7.png', 14)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (65, N'KeyBoards/Hexgears Gemini/7.png', 14)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (66, N'KeyBoards/Hexgears Gemini/32.png', 14)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (67, N'KeyBoards/Hexgears Gemini/F5-slide-1.jpg', 14)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (68, N'KeyBoards/Keystone Keyboard/1_72bb2651-5c70-403c-86ee-7d70a192c762.png', 15)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (69, N'KeyBoards/Keystone Keyboard/2_498811ad-29a3-43f0-bd6b-45851354e56f.png', 15)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (70, N'KeyBoards/Keystone Keyboard/3_d1aa48ed-04ab-4a27-b8e3-5426e87f1156.png', 15)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (71, N'KeyBoards/Keystone Keyboard/25_fe765d5d-b16a-48c7-a6c7-722d888e46e1.jpg', 15)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (72, N'KeyBoards/Keystone Keyboard/636c4ab03ffc3de6a90d76900cbd3a95.png', 15)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (73, N'KeyBoards/Keystone Keyboard/F3-slide-1.jpg', 15)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (74, N'KeyBoards/GMK Shark Bait/1.png', 16)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (75, N'KeyBoards/GMK Shark Bait/2.png', 16)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (76, N'KeyBoards/GMK Shark Bait/28_92bff767-ffa5-4337-a2cb-87596ca2e165.jpg', 16)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (77, N'KeyBoards/GMK Shark Bait/side-tkl_1920x1080.png', 16)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (78, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_910re_ortho_top_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (79, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_910re_persp_angled_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (80, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_910re_persp_close_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (81, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_andromeda_ortho_top_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (82, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_andromeda_persp_close_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (83, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_andromeda_persp_top_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (84, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_jane2wkl_ortho_top_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (85, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_jane2wkl_persp_angled_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (86, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_jane2wkl_persp_close_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (87, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_m60a_ortho_top_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (88, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_m60a_persp_back_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (89, N'KeyBoards/GMK Fuyu/gmk_mcnos_keyboard_m60a_persp_front_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (90, N'KeyBoards/GMK Fuyu/gmk_mcnos_montage_ortho_top_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (91, N'KeyBoards/GMK Fuyu/gmk_mcnos_montage_persp_angled_2400x1600.png', 17)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (92, N'KeyBoards/GMK Ursa/Iron_165_Ursa_2019-Oct-18_08-34-32PM-000_CustomizedView14617832667_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (93, N'KeyBoards/GMK Ursa/Iron_165_Ursa_2019-Sep-07_08-07-02PM-000_CustomizedView8043650292_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (94, N'KeyBoards/GMK Ursa/Iron_165_Ursa_2019-Sep-07_08-15-58PM-000_CustomizedView19211602184_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (95, N'KeyBoards/GMK Ursa/Iron_165_Ursa_2019-Sep-07_08-16-29PM-000_CustomizedView35055950618_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (96, N'KeyBoards/GMK Ursa/Iron_165_Ursa_2019-Sep-07_08-48-23PM-000_CustomizedView22306442111_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (97, N'KeyBoards/GMK Ursa/Iron_165_Ursa_2019-Sep-07_08-48-33PM-000_CustomizedView33366467967_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (98, N'KeyBoards/GMK Ursa/Iron_165_Ursa_2019-Sep-07_08-48-49PM-000_CustomizedView5198372457_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (99, N'KeyBoards/GMK Ursa/Iron_165_Ursa_2019-Sep-07_08-53-16PM-000_CustomizedView31722127790_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (100, N'KeyBoards/GMK Ursa/Iron_165_Ursa_2019-Sep-07_08-53-29PM-000_CustomizedView2673167495_2400x1797.png', 18)
GO
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (101, N'KeyBoards/GMK Ursa/Iron_165_Ursa_2019-Sep-07_09-03-16PM-000_CustomizedView30044895939_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (102, N'KeyBoards/GMK Ursa/Ursa_Think_2019-Nov-07_05-38-58AM-000_CustomizedView21819354919_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (103, N'KeyBoards/GMK Ursa/Ursa_Think_2019-Nov-07_05-41-59AM-000_CustomizedView7345758142-1_2400x1797.png', 18)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (104, N'KeyBoards/KAT Oasis/Austin_KAT_Oasis_2019-Sep-26_11-47-12PM-000_CustomizedView15284292572_2400x1797.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (105, N'KeyBoards/KAT Oasis/Conone-Green-MaroonMods_2400x1350.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (106, N'KeyBoards/KAT Oasis/Conone-Green-MaroonMods-Novelties_2400x1350.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (107, N'KeyBoards/KAT Oasis/Conone-Silver-Blue-orthographic_2400x1350.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (108, N'KeyBoards/KAT Oasis/Conone-Silver-Blue-side_2400x1350.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (109, N'KeyBoards/KAT Oasis/enamel_1080x1080.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (110, N'KeyBoards/KAT Oasis/KATTHIGNIE2_1080x1080.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (111, N'KeyBoards/KAT Oasis/longrender_1920x1080.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (112, N'KeyBoards/KAT Oasis/nanokat2image2_1080x1080.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (113, N'KeyBoards/KAT Oasis/oasis-10_2400x1350.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (114, N'KeyBoards/KAT Oasis/TGR-910-liha_2400x1350.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (115, N'KeyBoards/KAT Oasis/TGR-910-liha2_2400x1350.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (116, N'KeyBoards/KAT Oasis/TGR-910-PC_2400x1350.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (117, N'KeyBoards/KAT Oasis/untitle342d_1080x1080.png', 19)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (118, N'KeyBoards/KAT Specimen/iron165_1920x1080.png', 20)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (119, N'KeyBoards/KAT Specimen/KAT_Specimen_-_Main_Photo_1920x1080.jpg', 20)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (120, N'KeyBoards/KAT Specimen/kotai_1920x1080.png', 20)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (121, N'KeyBoards/KAT Specimen/koyu_1920x1080.png', 20)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (122, N'KeyBoards/KAT Specimen/pneuma_light1_1920x1080.png', 20)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (123, N'KeyBoards/whitefox/WF1-1200-800_4c6ff4fb-d8a5-4dee-82bc-0f7ac5a975da_1200x800.jpg', 21)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (124, N'KeyBoards/whitefox/stabilizers-min_1500x1000.png', 21)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (125, N'KeyBoards/whitefox/WhiteFox_Kit_Product_Card_2400x1800.png', 21)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (126, N'KeyBoards/whitefox/WhiteFox-1_1500x1000.png', 21)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (127, N'KeyBoards/whitefox/WhiteFox-2_1500x1000.png', 21)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (128, N'KeyCaps/GMK Fuyu/Base_Kit_2400x1359.png', 22)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (129, N'KeyCaps/GMK Fuyu/gfcv2Hy_1920x1920.png', 22)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (130, N'KeyCaps/GMK Fuyu/Icon_Mods_2400x739.png', 22)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (131, N'KeyCaps/GMK Fuyu/Space_Bar_1584x1177.png', 22)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (132, N'KeyCaps/GMK Fuyu/zCauj03_1920x1920.png', 22)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (133, N'KeyCaps/GMK Ursa/GMK_URSA_Kits_2019-Sep-21_06-36-04PM-000_CustomizedView41656778452_2400x1797.png', 23)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (134, N'KeyCaps/GMK Ursa/GMK_URSA_Kits_2019-Sep-21_06-45-09PM-000_CustomizedView21900429282_2400x1797.png', 23)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (135, N'KeyCaps/GMK Ursa/GMK_URSA_Kits_2019-Sep-21_06-46-21PM-000_CustomizedView21900429282_2400x1797.png', 23)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (136, N'KeyCaps/GMK Ursa/GMK_URSA_Kits_2019-Sep-21_06-51-31PM-000_CustomizedView21900429282_2400x1797.png', 23)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (137, N'KeyCaps/GMK Ursa/Less_DOF_2400x1797.png', 23)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (138, N'KeyCaps/GMK Ursa/Top_Down_2400x1797.png', 23)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (139, N'KeyCaps/GMK Ursa/XNxcNZc_1920x1920.png', 23)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (140, N'KeyCaps/GMK Ursa/Z2ylzHl_1920x1920.png', 23)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (141, N'KeyCaps/KAT Oasis/7BbIKt9_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (142, N'KeyCaps/KAT Oasis/Alpha_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (143, N'KeyCaps/KAT Oasis/Baguette_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (144, N'KeyCaps/KAT Oasis/Blank_Alphas_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (145, N'KeyCaps/KAT Oasis/Blank_Liha_Modifiers_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (146, N'KeyCaps/KAT Oasis/CMD_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (147, N'KeyCaps/KAT Oasis/Blank_Oasis_Modifiers_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (148, N'KeyCaps/KAT Oasis/Colevrak_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (149, N'KeyCaps/KAT Oasis/INTL_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (150, N'KeyCaps/KAT Oasis/Liha_40s_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (151, N'KeyCaps/KAT Oasis/Liha_Accent_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (152, N'KeyCaps/KAT Oasis/Liha_Calculus_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (153, N'KeyCaps/KAT Oasis/Liha_Ergo_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (154, N'KeyCaps/KAT Oasis/Liha_Modifiers_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (155, N'KeyCaps/KAT Oasis/Liha_Spacebars_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (156, N'KeyCaps/KAT Oasis/Liha_Novelties_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (157, N'KeyCaps/KAT Oasis/Liha_Ortho_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (158, N'KeyCaps/KAT Oasis/Novelties_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (159, N'KeyCaps/KAT Oasis/Oasis_40s_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (160, N'KeyCaps/KAT Oasis/Oasis_Calculus_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (161, N'KeyCaps/KAT Oasis/Oasis_Ergo_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (162, N'KeyCaps/KAT Oasis/Oasis_Modifiers_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (163, N'KeyCaps/KAT Oasis/Oasis_Ortho_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (164, N'KeyCaps/KAT Oasis/Spacebars_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (165, N'KeyCaps/KAT Oasis/Q3UitM9_1920x1920.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (166, N'KeyCaps/KAT Oasis/UK_1109x889.png', 24)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (167, N'KeyCaps/KAT Specimen/base3_2400x1177.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (168, N'KeyCaps/KAT Specimen/blanks2_2338x1359.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (169, N'KeyCaps/KAT Specimen/extensions_1717x807.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (170, N'KeyCaps/KAT Specimen/extras5_1980x963.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (171, N'KeyCaps/KAT Specimen/french_1688x879.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (172, N'KeyCaps/KAT Specimen/numc3_1373x1218.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (173, N'KeyCaps/KAT Specimen/north_1036x515.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (174, N'KeyCaps/KAT Specimen/ortholinear2_2400x890.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (175, N'KeyCaps/KAT Specimen/othersizes1_1092x755.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (176, N'KeyCaps/KAT Specimen/south_1671x886.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (177, N'KeyCaps/KAT Specimen/ukiso_798x809.png', 25)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (178, N'Plate/nightfox plate/nightfox-plate-close-min_1500x1000.png', 26)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (179, N'Plate/nightfox plate/nightfox-plate-min_1500x1000.png', 26)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (180, N'Plate/whitefox/whitefoxpcb_1500x1000.png', 27)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (181, N'Plate/whitefox/WhiteFox-Kit_1500x1015.png', 27)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (182, N'StaBilizer/GMK SCREW-IN STABILIZERS/1_f57c3b73-def1-4286-9c12-ddf2688537ea_1800x1800.png', 28)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (183, N'StaBilizer/GMK SCREW-IN STABILIZERS/2_861822c9-b4fc-4696-bef5-58c6eb6657cd_1800x1800.png', 28)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (184, N'StaBilizer/GMK SCREW-IN STABILIZERS/3_ba32495d-9d0d-4a93-af89-08fa244f54bd_1800x1800.png', 28)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (185, N'StaBilizer/GMK SCREW-IN STABILIZERS/4_3f0c3e7d-197f-4f28-bc9c-0a7ae897ac84_1800x1800.png', 28)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (186, N'StaBilizer/GMK SCREW-IN STABILIZERS/5_c4639cc0-2ca5-4564-8f4c-a2b673e41dfd_1800x1800.png', 28)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (187, N'StaBilizer/ORIGINAL CHERRY PCB-MOUNT STABILIZERS/1_9bd0bc2e-528b-4acd-9888-c34b4d4ec720_1800x1800.png', 29)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (188, N'StaBilizer/ORIGINAL CHERRY PCB-MOUNT STABILIZERS/3_c38658ff-93ab-4a67-abae-bbc27dc3e64b_1800x1800.png', 29)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (189, N'Switches/Cherry MX Mechanical Switches/Cherry_MX_Black_1500x1000.jpg', 30)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (190, N'Switches/Cherry MX Mechanical Switches/Cherry_MX_Blue_1500x1000.jpg', 30)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (191, N'Switches/Cherry MX Mechanical Switches/Cherry_MX_Brown_1500x1000.jpg', 30)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (192, N'Switches/Cherry MX Mechanical Switches/Cherry_MX_Clear_1500x1000.jpg', 30)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (193, N'Switches/Cherry MX Mechanical Switches/Cherry_MX_Green_1500x1000.jpg', 30)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (194, N'Switches/Cherry MX Mechanical Switches/Cherry_MX_Red_1500x1000.jpg', 30)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (195, N'Switches/Cherry MX Mechanical Switches/Cherry_Switch_Collection_1_1499x999.jpg', 30)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (196, N'Switches/Kailh Pro Switches/Pro_Burgundy_Switches_-_OS_1503x1002.jpg', 31)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (197, N'Switches/Kailh Pro Switches/Pro_Burgundy_Switches_1503x1002.jpg', 31)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (198, N'Switches/Kailh Pro Switches/Pro_Light_Green_Switches_-_OS_1503x1002.jpg', 31)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (199, N'Switches/Kailh Pro Switches/Pro_Light_Green_Switches_1503x1002.jpg', 31)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (200, N'Switches/Kailh Pro Switches/Pro_Purple_Switches_-_OS_1503x1002.jpg', 31)
GO
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (201, N'Switches/Kailh Pro Switches/Pro_Purple_Switches_1503x1002.jpg', 31)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (202, N'Switches/Kailh Speed Switches/Bronze_Switches_-_OS_1503x1002.jpg', 32)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (203, N'Switches/Kailh Speed Switches/Bronze_Switches_1503x1002.jpg', 32)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (204, N'Switches/Kailh Speed Switches/Copper_Switches_-_OS_1503x1002.jpg', 32)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (205, N'Switches/Kailh Speed Switches/Copper_Switches_1503x1002.jpg', 32)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (206, N'Switches/Kailh Speed Switches/Silver_Switches_-_OS_1503x1002.jpg', 32)
INSERT [dbo].[AnhSanPham] ([ID], [LinkAnh], [IDSP]) VALUES (207, N'Switches/Kailh Speed Switches/Silver_Switches_1503x1002.jpg', 32)
INSERT [dbo].[GioHang] ([ID], [IDKH], [TenKH], [Email], [SDT], [DiaChi], [TongTien], [GhiChu], [TinhTrang], [NgayTao]) VALUES (1, 1, N'Nguyễn Hùng Sinh', N'hungsinh@gmail.com', N'091234534263', N'Ngõ 200, Tây Hồ, Hà Nội', CAST(580 AS Decimal(18, 0)), N'', N'Hoàn thành', CAST(N'2020-05-08' AS Date))
INSERT [dbo].[GioHang] ([ID], [IDKH], [TenKH], [Email], [SDT], [DiaChi], [TongTien], [GhiChu], [TinhTrang], [NgayTao]) VALUES (2, 2, N'Hoàng Thùy Linh', N'thuylinh@gmail.com', N'093523436412', N'Ngõ 53, Bưởi, Hà Nội', CAST(352 AS Decimal(18, 0)), N'', N'Hoàn thành', CAST(N'2020-05-09' AS Date))
INSERT [dbo].[GioHang] ([ID], [IDKH], [TenKH], [Email], [SDT], [DiaChi], [TongTien], [GhiChu], [TinhTrang], [NgayTao]) VALUES (3, 3, N'Trần Xuân Phong', N'xuanphong@gmail.com', N'091234534263', N'Số 74, Hoàng Quốc Việt, Hà Nội', CAST(117 AS Decimal(18, 0)), N'', N'Hoàn thành', CAST(N'2020-05-10' AS Date))
INSERT [dbo].[GioHang] ([ID], [IDKH], [TenKH], [Email], [SDT], [DiaChi], [TongTien], [GhiChu], [TinhTrang], [NgayTao]) VALUES (4, 4, N'Lê Xuân Linh', N'xuanlinh@gmail.com', N'039164826753', N'Ngõ 93, Xuân Thủy, Hà Nội', CAST(478 AS Decimal(18, 0)), N'', N'Hoàn thành', CAST(N'2020-05-11' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (1, N'Nguyễn Hùng Sinh', CAST(N'1990-08-08' AS Date), N'hungsinh@gmail.com', N'123456', N'Ngõ 200, Tây Hồ, Hà Nội', N'Nam', N'091234534263', CAST(N'2020-05-08' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (2, N'Hoàng Thùy Linh', CAST(N'1988-03-10' AS Date), N'thuylinh@gmail.com', N'123456', N'Ngõ 53, Bưởi, Hà Nội', N'Nữ', N'093523436412', CAST(N'2020-05-09' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (3, N'Trần Xuân Phong', CAST(N'1970-10-03' AS Date), N'xuanphong@gmail.com', N'123456', N'Số 74, Hoàng Quốc Việt, Hà Nội', N'Nam', N'091234534263', CAST(N'2020-05-10' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (4, N'Lê Xuân Linh', CAST(N'1992-12-01' AS Date), N'xuanlinh@gmail.com', N'123456', N'Ngõ 93, Xuân Thủy, Hà Nội', N'Nam', N'039164826753', CAST(N'2020-05-11' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (5, N'Lung Thị Linh', CAST(N'1977-01-28' AS Date), N'thilinh@gmail.com', N'123456', N'Ngõ 1000, Giải Phóng, Hà Nội', N'Nữ', N'019362728394', CAST(N'2020-05-12' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (6, N'Nguyễn Thị Loan', CAST(N'1990-08-08' AS Date), N'thiloan@gmail.com', N'123456', N'Ngõ 53, Bưởi, Hà Nội', N'Nữ', N'038294516343', CAST(N'2020-05-13' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (7, N'Hoàng Linh Linh', CAST(N'1988-03-10' AS Date), N'linhlinh@gmail.com', N'123456', N'Ngõ 200, Tây Hồ, Hà Nội', N'Nữ', N'093527436412', CAST(N'2020-05-14' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (8, N'Trần Xuân Nhạn', CAST(N'1970-10-03' AS Date), N'nhan@gmail.com', N'123456', N'Số 74, Hoàng Quốc Việt, Hà Nội', N'Nam', N'091923534263', CAST(N'2020-05-15' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (9, N'Lê Xuân Khang', CAST(N'1992-12-01' AS Date), N'khanhxuan@gmail.com', N'123456', N'Ngõ 93, Xuân Thủy, Hà Nội', N'Nam', N'039192826753', CAST(N'2020-05-16' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (10, N'Nguyễn Bằng', CAST(N'1977-01-28' AS Date), N'nguyenbang@gmail.com', N'123456', N'Ngõ 1000, Giải Phóng, Hà Nội', N'Nam', N'019092728394', CAST(N'2020-05-17' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (11, N'Nông Hùng Giang', CAST(N'1991-09-08' AS Date), N'hunggiang@gmail.com', N'123456', N'Ngõ 35, Xuân THủy, Hà Nội', N'Nam', N'038228416343', CAST(N'2020-05-18' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (12, N'La Nông Văn Nữ', CAST(N'1998-10-10' AS Date), N'nongla@gmail.com', N'123456', N'Ngõ 02, Bưởi, Hà Nội', N'Nữ', N'039164826753', CAST(N'2020-05-19' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (13, N'Trần Trần Yên', CAST(N'1970-10-03' AS Date), N'yentran@gmail.com', N'123456', N'Số 74, Trần Quốc Hoàn, Hà Nội', N'Nữ', N'093523436412', CAST(N'2020-05-20' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (14, N'Giàng A Tấng', CAST(N'1999-06-04' AS Date), N'giangatang@gmail.com', N'123456', N'Xuân Thủy, Cầu Giấy, Hà Nội', N'Nam', N'091923534263', CAST(N'2020-05-21' AS Date))
INSERT [dbo].[KhachHang] ([ID], [TenKH], [NgaySinh], [Email], [Password], [DiaChi], [GioiTinh], [SDT], [DangKyNgay]) VALUES (15, N'Nùng Chí Cao', CAST(N'1998-03-20' AS Date), N'chicao@gmail.com', N'123456', N'Bản A Pa, Làng Lũ, Lào Cao', N'Nam', N'039192826753', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (1, N'KeyBoards')
INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (2, N'KeyCaps')
INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (3, N'Switches')
INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (4, N'DeskMats')
INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (5, N'Case')
INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (6, N'Plate')
INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (7, N'StaBilizer')
INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (8, N'Cable')
INSERT [dbo].[Loai] ([ID], [TenLoai]) VALUES (9, N'Accessories')
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (1, N'Wrist Rests', CAST(100 AS Decimal(18, 0)), N'', 9)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (2, N'whitefox', CAST(101 AS Decimal(18, 0)), N'', 9)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (3, N'nightfox', CAST(102 AS Decimal(18, 0)), N'', 9)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (4, N'WhiteFox USB Type C Cable', CAST(103 AS Decimal(18, 0)), N'', 8)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (5, N'NightFox USB Type C Cable', CAST(104 AS Decimal(18, 0)), N'', 8)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (6, N'Gradient Cables', CAST(105 AS Decimal(18, 0)), N'', 8)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (7, N'Datamancer Wooden WhiteFox Case', CAST(106 AS Decimal(18, 0)), N'', 5)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (8, N'Kira Stealth Full Metal Upgrade Case', CAST(107 AS Decimal(18, 0)), N'', 5)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (9, N'whitefox', CAST(108 AS Decimal(18, 0)), N'', 5)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (10, N'Fuyu', CAST(109 AS Decimal(18, 0)), N'', 4)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (11, N'NovelKeys Deskmats 1', CAST(110 AS Decimal(18, 0)), N'', 4)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (12, N'NovelKeys Deskmats 2', CAST(111 AS Decimal(18, 0)), N'', 4)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (13, N'GMK Copper', CAST(112 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (14, N'Hexgears Gemini', CAST(113 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (15, N'Keystone Keyboard', CAST(114 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (16, N'GMK Shark Bait', CAST(115 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (17, N'EPBT Ivory', CAST(116 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (18, N'GMK Ursa', CAST(117 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (19, N'KAT Oasis', CAST(118 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (20, N'KAT Specimen', CAST(119 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (21, N'whitefox', CAST(120 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (22, N'GMK Fuyu', CAST(121 AS Decimal(18, 0)), N'', 2)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (23, N'GMK Ursa', CAST(122 AS Decimal(18, 0)), N'', 2)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (24, N'KAT Oasis', CAST(123 AS Decimal(18, 0)), N'', 2)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (25, N'KAT Specimen', CAST(124 AS Decimal(18, 0)), N'', 2)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (26, N'nightfox plate', CAST(125 AS Decimal(18, 0)), N'', 6)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (27, N'whitefox', CAST(126 AS Decimal(18, 0)), N'', 6)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (28, N'GMK SCREW-IN STABILIZERS', CAST(127 AS Decimal(18, 0)), N'', 7)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (29, N'ORIGINAL CHERRY PCB-MOUNT STABILIZERS', CAST(128 AS Decimal(18, 0)), N'', 7)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (30, N'Cherry MX Mechanical Switches', CAST(129 AS Decimal(18, 0)), N'', 3)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (31, N'Kailh Pro Switches', CAST(130 AS Decimal(18, 0)), N'', 3)
INSERT [dbo].[SanPham] ([ID], [TenSP], [Gia], [MoTa], [MaLoai]) VALUES (32, N'Kailh Speed Switches', CAST(131 AS Decimal(18, 0)), N'', 3)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1, 1, 1, CAST(100 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (2, 4, 1, CAST(101 AS Decimal(18, 0)), CAST(101 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (17, 1, 1, CAST(116 AS Decimal(18, 0)), CAST(116 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (17, 2, 1, CAST(116 AS Decimal(18, 0)), CAST(116 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (17, 4, 1, CAST(116 AS Decimal(18, 0)), CAST(116 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (18, 1, 1, CAST(117 AS Decimal(18, 0)), CAST(117 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (18, 3, 1, CAST(117 AS Decimal(18, 0)), CAST(117 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (19, 1, 1, CAST(118 AS Decimal(18, 0)), CAST(118 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (19, 2, 2, CAST(118 AS Decimal(18, 0)), CAST(236 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (30, 1, 1, CAST(129 AS Decimal(18, 0)), CAST(129 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (31, 4, 1, CAST(130 AS Decimal(18, 0)), CAST(130 AS Decimal(18, 0)), NULL)
INSERT [dbo].[SanPhamGioHang] ([IDSP], [IDGH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (32, 4, 1, CAST(131 AS Decimal(18, 0)), CAST(131 AS Decimal(18, 0)), NULL)
ALTER TABLE [dbo].[AnhSanPham]  WITH CHECK ADD  CONSTRAINT [FK__AnhSanPham__IDSP__59063A47] FOREIGN KEY([IDSP])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[AnhSanPham] CHECK CONSTRAINT [FK__AnhSanPham__IDSP__59063A47]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK__GioHang__IDKH__5070F446] FOREIGN KEY([IDKH])
REFERENCES [dbo].[KhachHang] ([ID])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK__GioHang__IDKH__5070F446]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([ID])
GO
ALTER TABLE [dbo].[SanPhamGioHang]  WITH CHECK ADD  CONSTRAINT [FK__SanPhamGio__IDGH__5DCAEF64] FOREIGN KEY([IDGH])
REFERENCES [dbo].[GioHang] ([ID])
GO
ALTER TABLE [dbo].[SanPhamGioHang] CHECK CONSTRAINT [FK__SanPhamGio__IDGH__5DCAEF64]
GO
ALTER TABLE [dbo].[SanPhamGioHang]  WITH CHECK ADD  CONSTRAINT [FK__SanPhamGio__IDSP__5CD6CB2B] FOREIGN KEY([IDSP])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[SanPhamGioHang] CHECK CONSTRAINT [FK__SanPhamGio__IDSP__5CD6CB2B]
GO
/****** Object:  StoredProcedure [dbo].[CheckEmail]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CheckEmail] @email varchar(100)
as
begin
	select count(Email) from KhachHang where Email = @email
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllSanPham]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllSanPham]
as
begin
	select * from SanPham
end
GO
/****** Object:  StoredProcedure [dbo].[GetMa]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMa]
as
begin
	select Max(ID)
	from GioHang
end
GO
/****** Object:  StoredProcedure [dbo].[GetRanKeyBoard]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRanKeyBoard]
as
begin
	select * 
	from AnhSanPham
	where LinkAnh in (
	select LinkAnh from (select LinkAnh, IDSP, ROW_NUMBER() over(Partition by IDSP order by rand() ) as ROWNUMBER
	from AnhSanPham
	where IDSP in (SELECT Top(3) ID FROM SanPham where MaLoai = 1 order by newid())) groups
	where ROWNUMBER = 1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetRanOther]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRanOther]
as
begin
	select * 
	from AnhSanPham
	where LinkAnh in (
	select LinkAnh from (select LinkAnh, IDSP, ROW_NUMBER() over(Partition by IDSP order by rand() ) as ROWNUMBER
	from AnhSanPham
	where IDSP in (SELECT Top(6) ID FROM SanPham where MaLoai != 1 order by newid())) groups
	where ROWNUMBER = 1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetSanPham]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetSanPham] @MaLoai int 
as
begin 
 select * from SanPham where MaLoai = @MaLoai
end
GO
/****** Object:  StoredProcedure [dbo].[GetSilde]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetSilde]
as
begin
	select *
	from AnhSanPham
	where IDSP in (select top(3) ID from SanPham where MaLoai = 1)
	AND LinkAnh Like 'KeyBoards/%' and LinkAnh Like '%slide-1.jpg'
end	
GO
/****** Object:  StoredProcedure [dbo].[LayLaiMatKhau]    Script Date: 06/09/20 11:46:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LayLaiMatKhau] @email varchar(100)
as
begin
	update KhachHang
	set Password = '123456'
	where Email = @email
end
GO
USE [master]
GO
ALTER DATABASE [BTL_WEB] SET  READ_WRITE 
GO
