USE [master]
GO
/****** Object:  Database [Classfile]    Script Date: 3/26/2023 23:20:27 ******/
CREATE DATABASE [Classfile]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Classfile', FILENAME = N'D:\SYSTEMS\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Classfile.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Classfile_log', FILENAME = N'D:\SYSTEMS\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Classfile_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Classfile] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Classfile].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Classfile] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Classfile] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Classfile] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Classfile] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Classfile] SET ARITHABORT OFF 
GO
ALTER DATABASE [Classfile] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Classfile] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Classfile] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Classfile] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Classfile] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Classfile] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Classfile] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Classfile] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Classfile] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Classfile] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Classfile] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Classfile] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Classfile] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Classfile] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Classfile] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Classfile] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Classfile] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Classfile] SET RECOVERY FULL 
GO
ALTER DATABASE [Classfile] SET  MULTI_USER 
GO
ALTER DATABASE [Classfile] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Classfile] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Classfile] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Classfile] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Classfile] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Classfile] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Classfile', N'ON'
GO
ALTER DATABASE [Classfile] SET QUERY_STORE = ON
GO
ALTER DATABASE [Classfile] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Classfile]
GO
/****** Object:  Table [dbo].[account]    Script Date: 3/26/2023 23:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[password] [varchar](200) NULL,
	[fullname] [nvarchar](200) NULL,
	[account_type] [varchar](5) NULL,
	[imageAvatar] [varchar](100) NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account_class]    Script Date: 3/26/2023 23:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_class](
	[class_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_student_class] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC,
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class]    Script Date: 3/26/2023 23:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [nvarchar](50) NULL,
	[teacher_account_id] [int] NULL,
	[class_code] [varchar](10) NULL,
	[imageCover] [varchar](100) NULL,
 CONSTRAINT [PK_class] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[file]    Script Date: 3/26/2023 23:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[file](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NULL,
	[file_name] [varchar](100) NULL,
	[file_type] [varchar](100) NULL,
	[file_name_root] [varchar](200) NULL,
 CONSTRAINT [PK_file] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 3/26/2023 23:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class_id] [int] NULL,
	[title] [ntext] NULL,
	[posted_account_id] [int] NULL,
	[date_created] [datetime] NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [username], [password], [fullname], [account_type], [imageAvatar]) VALUES (1, N'area1110', N'123', N'Nguyễn Khánh Huy', N'TC', N'1_17481112032023.png')
INSERT [dbo].[account] ([id], [username], [password], [fullname], [account_type], [imageAvatar]) VALUES (2, N'teacher', N'teacher', N'Nguyễn Khánh Huy TC', N'TC', N'en-WW-HD-2023020321171514032023.jpg')
INSERT [dbo].[account] ([id], [username], [password], [fullname], [account_type], [imageAvatar]) VALUES (3, N'area', N'123', N'Huy', N'STD', N'en-WW-HD-2023021221390914032023.jpg')
SET IDENTITY_INSERT [dbo].[account] OFF
GO
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (1, 1)
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (2, 2)
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (3, 2)
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (4, 2)
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (5, 2)
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (6, 2)
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (8, 2)
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (10, 2)
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (11, 2)
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (12, 2)
INSERT [dbo].[account_class] ([class_id], [account_id]) VALUES (13, 2)
GO
SET IDENTITY_INSERT [dbo].[class] ON 

INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (1, N'PRN231', 1, NULL, NULL)
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (2, N'PRN123', 2, N'etll7381UN', N'Screenshot 2023-03-03 11081710271024032023.png')
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (3, N'PRN123', 2, N'dauc5769TH', NULL)
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (4, N'PRN123456', 2, N'ashp9750IQ', NULL)
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (5, N'PRN1234566789', 2, N'yrru9588AY', NULL)
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (6, N'PRN1234566789', 2, N'zyfe5702XN', NULL)
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (8, N'hkjhladf', 2, N'xqjp6234WM', N'BingImageOfTheDay20513413032023.jpg')
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (9, N'adfaf', 3, N'olky6301DY', NULL)
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (10, N'Class mới nì', 2, N'ckmg7701IT', N'en-WW-HD-2023020916420217032023.jpg')
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (11, N'Lớp với screen shot', 2, N'yjsk6503LU', NULL)
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (12, N'hkjhladf', 2, N'mnea4567JE', NULL)
INSERT [dbo].[class] ([id], [class_name], [teacher_account_id], [class_code], [imageCover]) VALUES (13, N'1234', 2, N'rkak7878DE', NULL)
SET IDENTITY_INSERT [dbo].[class] OFF
GO
SET IDENTITY_INSERT [dbo].[file] ON 

INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (2, 3, N'3_20354305032023', N'mp4', NULL)
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (3, 4, N'4_20565105032023.mp4', N'mp4', NULL)
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (4, 5, N'5_20570005032023.mp4', N'mp4', NULL)
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (5, 11, N'11_22513305032023.zip', N'application/x-zip-compressed', NULL)
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (6, 12, N'12_23005305032023.exe', N'application/octet-stream', NULL)
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (7, 13, N'13_23052805032023.msi', N'application/octet-stream', NULL)
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (8, 13, N'13_23052805032023.exe', N'application/octet-stream', NULL)
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (9, 13, N'13_23052805032023.config', N'application/xml', NULL)
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (10, 14, N'14_23160305032023.msi', N'application/octet-stream', N'NitroSense.msi')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (11, 14, N'14_23160305032023.exe', N'application/octet-stream', N'Setup.exe')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (12, 14, N'14_23160305032023.config', N'application/xml', N'Setup.exe.config')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (13, 15, N'15_23220605032023.exe', N'application/octet-stream', N'BingWallpaper.exe')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (14, 16, N'16_23333205032023.zip', N'application/x-zip-compressed', N'cmder_mini.zip')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (15, 17, N'OfficeSetup_17_23393005032023.exe', N'application/octet-stream', N'OfficeSetup.exe')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (22, 18, N'Screenshot 2023-03-02 194033_18_16452309032023.png', N'image/png', N'Screenshot 2023-03-02 194033.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (23, 18, N'Screenshot 2023-03-02 194041_18_16452309032023.png', N'image/png', N'Screenshot 2023-03-02 194041.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (24, 18, N'Screenshot 2023-03-02 194052_18_16452309032023.png', N'image/png', N'Screenshot 2023-03-02 194052.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (25, 19, N'Screenshot (1)11163910032023.png', N'image/png', N'Screenshot (1).png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (26, 19, N'Screenshot 2023-03-02 20083111165610032023.png', N'image/png', N'Screenshot 2023-03-02 200831.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (27, 21, N'Screenshot (1)11175710032023.png', N'image/png', N'Screenshot (1).png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (28, 21, N'Screenshot 2023-03-02 19403311175710032023.png', N'image/png', N'Screenshot 2023-03-02 194033.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (29, 21, N'Screenshot 2023-03-02 19404111175710032023.png', N'image/png', N'Screenshot 2023-03-02 194041.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (30, 22, N'Chua xác nh?n 33868823160411032023.crdownload', N'application/octet-stream', N'Chua xác nh?n 338688.crdownload')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (32, 23, N'BingImageOfTheDay10382713032023.jpg', N'image/jpeg', N'BingImageOfTheDay.jpg')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (33, 25, N'en-WW-HD-2023020221385614032023.jpg', N'image/jpeg', N'en-WW-HD-20230202.jpg')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (34, 26, N'en-WW-HD-2023021014535815032023.jpg', N'image/jpeg', N'en-WW-HD-20230210.jpg')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (35, 53, N'333395622_6311643248868406_8630745497694249255_n16433117032023.mp4', N'video/mp4', N'333395622_6311643248868406_8630745497694249255_n.mp4')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (36, 53, N'[Pandoratv-raws] Doraemon (2005) 2020.01.25 - (587) (EX 1280x720).mp416441517032023.torrent', N'application/octet-stream', N'[Pandoratv-raws] Doraemon (2005) 2020.01.25 - (587) (EX 1280x720).mp4.torrent')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (38, 93, N'Screenshot 2023-03-03 11074400231624032023.png', N'image/png', N'Screenshot 2023-03-03 110744.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (39, 94, N'Screenshot 2023-03-03 11074400234024032023.png', N'image/png', N'Screenshot 2023-03-03 110744.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (41, 52, N'Screenshot (1)10285424032023.png', N'image/png', N'Screenshot (1).png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (42, 52, N'Screenshot 2023-03-02 19403310285424032023.png', N'image/png', N'Screenshot 2023-03-02 194033.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (43, 52, N'Screenshot 2023-03-02 19404110285424032023.png', N'image/png', N'Screenshot 2023-03-02 194041.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (44, 52, N'Screenshot 2023-03-02 19405210285424032023.png', N'image/png', N'Screenshot 2023-03-02 194052.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (45, 52, N'Screenshot 2023-03-02 19411110285424032023.png', N'image/png', N'Screenshot 2023-03-02 194111.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (46, 52, N'Screenshot 2023-03-02 19481110285424032023.png', N'image/png', N'Screenshot 2023-03-02 194811.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (47, 52, N'Screenshot 2023-03-02 19591310285424032023.png', N'image/png', N'Screenshot 2023-03-02 195913.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (48, 52, N'Screenshot 2023-03-02 20081810285424032023.png', N'image/png', N'Screenshot 2023-03-02 200818.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (49, 52, N'Screenshot 2023-03-02 20083110285424032023.png', N'image/png', N'Screenshot 2023-03-02 200831.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (50, 52, N'Screenshot 2023-03-02 20244310285424032023.png', N'image/png', N'Screenshot 2023-03-02 202443.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (51, 52, N'Screenshot 2023-03-03 11074410285424032023.png', N'image/png', N'Screenshot 2023-03-03 110744.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (52, 52, N'Screenshot 2023-03-03 11081710285424032023.png', N'image/png', N'Screenshot 2023-03-03 110817.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (53, 52, N'Screenshot 2023-03-05 09572810285424032023.png', N'image/png', N'Screenshot 2023-03-05 095728.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (54, 52, N'Screenshot 2023-03-05 10113810285424032023.png', N'image/png', N'Screenshot 2023-03-05 101138.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (55, 52, N'Screenshot 2023-03-05 10115610285424032023.png', N'image/png', N'Screenshot 2023-03-05 101156.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (56, 52, N'Screenshot 2023-03-05 11595010285424032023.png', N'image/png', N'Screenshot 2023-03-05 115950.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (57, 52, N'Screenshot 2023-03-05 12001610285424032023.png', N'image/png', N'Screenshot 2023-03-05 120016.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (58, 52, N'Screenshot 2023-03-06 22022010285424032023.png', N'image/png', N'Screenshot 2023-03-06 220220.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (59, 52, N'Screenshot 2023-03-07 15361410285424032023.png', N'image/png', N'Screenshot 2023-03-07 153614.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (60, 52, N'Screenshot 2023-03-10 22492210285424032023.png', N'image/png', N'Screenshot 2023-03-10 224922.png')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (61, 97, N'mln122outline11251024032023.txt', N'text/plain', N'mln122outline.txt')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (62, 98, N'settings_13323881995291697211451324032023.ptb', N'application/octet-stream', N'settings_133238819952916972.ptb')
INSERT [dbo].[file] ([id], [post_id], [file_name], [file_type], [file_name_root]) VALUES (63, 99, N'vlc-3.0.18-win3212010224032023.exe', N'application/octet-stream', N'vlc-3.0.18-win32.exe')
SET IDENTITY_INSERT [dbo].[file] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (1, 1, N'123456', 1, CAST(N'2023-03-05T20:32:52.667' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (3, 1, N'1234565', 1, CAST(N'2023-03-05T20:35:36.773' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (4, 1, N'1234565', 1, CAST(N'2023-03-05T20:56:51.503' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (5, 1, N'1234565', 1, CAST(N'2023-03-05T20:57:00.077' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (6, 1, N'123456', 1, CAST(N'2023-03-05T22:38:13.097' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (11, 1, N'1234', 1, CAST(N'2023-03-05T22:51:33.307' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (12, 1, N'Heheheh', 1, CAST(N'2023-03-05T23:00:52.953' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (13, 1, N'Hì hì', 1, CAST(N'2023-03-05T23:05:28.970' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (14, 1, N'Post with file rootname', 1, CAST(N'2023-03-05T23:16:03.557' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (15, 1, N'Hehehehe', 1, CAST(N'2023-03-05T23:22:06.653' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (16, 1, N'Thử file size', 1, CAST(N'2023-03-05T23:33:32.143' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (17, 1, N'', 1, CAST(N'2023-03-05T23:39:30.120' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (18, 1, N'test nì hihi', 1, CAST(N'2023-03-05T23:58:07.593' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (19, 1, N'????', 1, CAST(N'2023-03-10T11:03:27.657' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (20, 1, N'123', 1, CAST(N'2023-03-10T11:17:10.340' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (21, 1, N'456', 1, CAST(N'2023-03-10T11:17:56.880' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (22, 1, N'Hehe cái mới nì', 1, CAST(N'2023-03-11T23:16:04.790' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (23, 2, N'He he he', 2, CAST(N'2023-03-13T10:24:11.640' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (24, 8, N'Hê hê Hê', 2, CAST(N'2023-03-14T14:18:23.347' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (25, 4, N'Hê Hê hê', 3, CAST(N'2023-03-14T21:38:56.693' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (26, 8, N'', 2, CAST(N'2023-03-15T14:53:31.223' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (27, 8, N'', 2, CAST(N'2023-03-15T15:02:23.997' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (28, 8, N'', 2, CAST(N'2023-03-15T15:02:26.157' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (29, 8, N'', 2, CAST(N'2023-03-15T15:02:29.183' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (30, 8, N'', 2, CAST(N'2023-03-15T15:02:31.593' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (31, 8, N'', 2, CAST(N'2023-03-15T15:02:34.040' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (32, 8, N'', 2, CAST(N'2023-03-15T15:02:36.380' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (33, 8, N'', 2, CAST(N'2023-03-15T15:02:40.530' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (34, 8, N'', 2, CAST(N'2023-03-15T15:02:42.700' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (35, 8, N'', 2, CAST(N'2023-03-15T15:02:45.200' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (36, 8, N'', 2, CAST(N'2023-03-15T15:02:47.477' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (37, 8, N'', 2, CAST(N'2023-03-15T15:02:49.850' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (38, 8, N'', 2, CAST(N'2023-03-15T15:02:52.013' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (39, 8, N'', 2, CAST(N'2023-03-15T15:02:54.997' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (40, 8, N'', 2, CAST(N'2023-03-15T15:02:57.267' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (41, 8, N'', 2, CAST(N'2023-03-15T15:02:59.897' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (42, 8, N'', 2, CAST(N'2023-03-15T15:03:01.860' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (43, 8, N'', 2, CAST(N'2023-03-15T15:03:04.180' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (44, 8, N'', 2, CAST(N'2023-03-15T15:03:06.453' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (45, 8, N'', 2, CAST(N'2023-03-15T15:03:08.897' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (46, 8, N'', 2, CAST(N'2023-03-15T15:03:11.350' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (47, 8, N'', 2, CAST(N'2023-03-15T15:07:32.173' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (48, 8, N'', 2, CAST(N'2023-03-15T15:07:34.713' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (49, 8, N'', 2, CAST(N'2023-03-15T15:07:37.187' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (50, 8, N'', 2, CAST(N'2023-03-15T15:07:40.440' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (51, 8, N'', 2, CAST(N'2023-03-15T15:07:43.513' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (52, 8, N'Mọi tệp được tải lên', 2, CAST(N'2023-03-15T15:07:46.650' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (53, 3, N'Hmmm', 2, CAST(N'2023-03-17T16:43:30.987' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (54, 2, N'123', 3, CAST(N'2023-03-17T22:01:10.683' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (55, 10, N'', 2, CAST(N'2023-03-17T22:47:38.573' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (56, 10, N'', 2, CAST(N'2023-03-17T22:47:40.360' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (57, 10, N'', 2, CAST(N'2023-03-17T22:47:44.330' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (58, 10, N'', 2, CAST(N'2023-03-17T22:47:46.837' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (59, 10, N'', 2, CAST(N'2023-03-17T22:47:49.050' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (60, 10, N'', 2, CAST(N'2023-03-17T22:47:51.167' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (61, 10, N'', 2, CAST(N'2023-03-17T22:47:53.013' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (62, 10, N'', 2, CAST(N'2023-03-17T22:47:55.590' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (63, 10, N'', 2, CAST(N'2023-03-17T22:47:58.063' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (64, 10, N'', 2, CAST(N'2023-03-17T22:48:00.637' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (65, 10, N'', 2, CAST(N'2023-03-17T22:48:03.480' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (66, 10, N'', 2, CAST(N'2023-03-17T22:48:06.903' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (67, 10, N'', 2, CAST(N'2023-03-17T22:48:09.810' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (68, 10, N'', 2, CAST(N'2023-03-17T22:48:13.047' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (69, 10, N'', 2, CAST(N'2023-03-17T22:48:16.087' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (70, 10, N'', 2, CAST(N'2023-03-17T22:48:18.997' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (71, 10, N'', 2, CAST(N'2023-03-17T22:48:21.863' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (72, 10, N'', 2, CAST(N'2023-03-17T22:48:33.957' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (73, 5, N'', 2, CAST(N'2023-03-17T22:49:07.850' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (74, 5, N'', 2, CAST(N'2023-03-17T22:49:09.767' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (75, 5, N'', 2, CAST(N'2023-03-17T22:49:11.490' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (76, 5, N'', 2, CAST(N'2023-03-17T22:49:13.473' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (77, 5, N'', 2, CAST(N'2023-03-17T22:49:15.677' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (78, 5, N'', 2, CAST(N'2023-03-17T22:49:17.550' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (79, 5, N'', 2, CAST(N'2023-03-17T22:49:19.283' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (80, 5, N'', 2, CAST(N'2023-03-17T22:49:21.100' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (81, 5, N'', 2, CAST(N'2023-03-17T22:49:23.107' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (82, 5, N'', 2, CAST(N'2023-03-17T22:49:26.023' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (83, 5, N'', 2, CAST(N'2023-03-17T22:49:27.680' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (84, 5, N'', 2, CAST(N'2023-03-17T22:49:30.833' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (85, 5, N'', 2, CAST(N'2023-03-17T22:49:33.943' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (86, 3, N'', 2, CAST(N'2023-03-17T22:51:58.513' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (87, 2, N'', 2, CAST(N'2023-03-17T22:52:06.637' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (88, 2, N'', 2, CAST(N'2023-03-17T22:52:09.530' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (89, 2, N'2haudfhqf <span style="background-color: rgb(255, 231, 206);">dsfadfadf</span>', 2, CAST(N'2023-03-17T22:52:50.413' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (90, 10, N'Lol', 3, CAST(N'2023-03-23T17:16:04.740' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (91, 10, N'123', 3, CAST(N'2023-03-23T17:27:18.177' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (92, 10, N'123', 2, CAST(N'2023-03-23T17:27:25.837' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (93, 10, N'adfqer', 2, CAST(N'2023-03-24T00:23:16.373' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (94, 10, N'adfqe', 2, CAST(N'2023-03-24T00:23:40.690' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (95, 10, N'adfaf', 2, CAST(N'2023-03-24T00:24:02.570' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (96, 10, N'23454', 2, CAST(N'2023-03-24T00:27:57.077' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (97, 10, N'<ul><li>Hê hê hê hê</li></ul><table class="table table-bordered"><tbody><tr><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td></tr></tbody></table><ul><li>Hây ya</li></ul>', 2, CAST(N'2023-03-24T11:10:25.053' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (98, 2, N'', 2, CAST(N'2023-03-24T11:45:13.517' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (99, 2, N'', 2, CAST(N'2023-03-24T12:01:02.017' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (100, 2, N'', 2, CAST(N'2023-03-25T21:20:05.957' AS DateTime))
INSERT [dbo].[post] ([id], [class_id], [title], [posted_account_id], [date_created]) VALUES (103, 10, N'<p>???? Thử tí thôi</p>', 3, CAST(N'2023-03-26T23:04:14.357' AS DateTime))
SET IDENTITY_INSERT [dbo].[post] OFF
GO
ALTER TABLE [dbo].[account_class]  WITH CHECK ADD  CONSTRAINT [FK_account_class_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[account_class] CHECK CONSTRAINT [FK_account_class_account]
GO
ALTER TABLE [dbo].[account_class]  WITH CHECK ADD  CONSTRAINT [FK_account_class_class] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([id])
GO
ALTER TABLE [dbo].[account_class] CHECK CONSTRAINT [FK_account_class_class]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_account] FOREIGN KEY([teacher_account_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_account]
GO
ALTER TABLE [dbo].[file]  WITH CHECK ADD  CONSTRAINT [FK_file_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([id])
GO
ALTER TABLE [dbo].[file] CHECK CONSTRAINT [FK_file_post]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_account] FOREIGN KEY([posted_account_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_account]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_class] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_class]
GO
USE [master]
GO
ALTER DATABASE [Classfile] SET  READ_WRITE 
GO
