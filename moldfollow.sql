USE [master]
GO
/****** Object:  Database [Db_kaliphanetakip]    Script Date: 18.01.2025 18:13:58 ******/
CREATE DATABASE [Db_kaliphanetakip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Db_kaliphanetakip', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Db_kaliphanetakip.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Db_kaliphanetakip_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Db_kaliphanetakip_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Db_kaliphanetakip] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db_kaliphanetakip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Db_kaliphanetakip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET ARITHABORT OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Db_kaliphanetakip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Db_kaliphanetakip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Db_kaliphanetakip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Db_kaliphanetakip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET RECOVERY FULL 
GO
ALTER DATABASE [Db_kaliphanetakip] SET  MULTI_USER 
GO
ALTER DATABASE [Db_kaliphanetakip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Db_kaliphanetakip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Db_kaliphanetakip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Db_kaliphanetakip] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Db_kaliphanetakip] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Db_kaliphanetakip] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Db_kaliphanetakip] SET QUERY_STORE = OFF
GO
USE [Db_kaliphanetakip]
GO
/****** Object:  UserDefinedDataType [dbo].[barkod_str]    Script Date: 18.01.2025 18:13:59 ******/
CREATE TYPE [dbo].[barkod_str] FROM [nvarchar](50) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[belgeno_str]    Script Date: 18.01.2025 18:13:59 ******/
CREATE TYPE [dbo].[belgeno_str] FROM [nvarchar](50) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[cihazseri_str]    Script Date: 18.01.2025 18:13:59 ******/
CREATE TYPE [dbo].[cihazseri_str] FROM [nvarchar](50) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[evrakseri_str]    Script Date: 18.01.2025 18:13:59 ******/
CREATE TYPE [dbo].[evrakseri_str] FROM [nvarchar](20) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[nvarchar_barkodstr]    Script Date: 18.01.2025 18:13:59 ******/
CREATE TYPE [dbo].[nvarchar_barkodstr] FROM [nvarchar](25) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[nvarchar_belgeno]    Script Date: 18.01.2025 18:13:59 ******/
CREATE TYPE [dbo].[nvarchar_belgeno] FROM [nvarchar](20) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[nvarchar_evrakseri]    Script Date: 18.01.2025 18:13:59 ******/
CREATE TYPE [dbo].[nvarchar_evrakseri] FROM [nvarchar](6) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[nvarchar_maxhesapisimno]    Script Date: 18.01.2025 18:13:59 ******/
CREATE TYPE [dbo].[nvarchar_maxhesapisimno] FROM [nvarchar](90) NULL
GO
/****** Object:  Table [dbo].[KT_MAKINATIP]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_MAKINATIP](
	[mak_id] [int] IDENTITY(1,1) NOT NULL,
	[mak_isim] [nvarchar](150) NULL,
	[mak_grup] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KT_ISLEMLER]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_ISLEMLER](
	[islem_id] [int] IDENTITY(1,1) NOT NULL,
	[islem_kalipno] [nvarchar](50) NULL,
	[islem_personel] [nvarchar](50) NOT NULL,
	[islem_istasyon] [nvarchar](50) NULL,
	[islem_baslama] [smalldatetime] NULL,
	[islem_bitirme] [smalldatetime] NULL,
	[islem_sinif] [nvarchar](50) NULL,
	[islem_surec] [int] NULL,
	[islem_aciklama] [varchar](930) NULL,
	[islem_persure] [nvarchar](50) NULL,
	[islem_detay] [int] NULL,
	[islem_maliyet] [int] NULL,
	[islem_malcarpan] [int] NULL,
 CONSTRAINT [PK_KT_ISLEMLER] PRIMARY KEY CLUSTERED 
(
	[islem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[calisma_sure]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[calisma_sure] as
SELECT  parse(islem_persure as int) as sure,islem_istasyon,mak_isim as istasyon from KT_ISLEMLER JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
GO
/****** Object:  Table [dbo].[KT_MALIYET]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_MALIYET](
	[maliyet_id] [int] IDENTITY(1,1) NOT NULL,
	[maliyet_maktip] [int] NULL,
	[maliyet_tutar] [int] NULL,
	[maliyet_tar] [datetime] NULL,
	[maliyet_dak] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KT_PERSONEL]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_PERSONEL](
	[per_id] [int] IDENTITY(1,1) NOT NULL,
	[per_ad] [nvarchar](150) NULL,
	[per_number] [nvarchar](150) NULL,
 CONSTRAINT [PK_KT_PERSONEL] PRIMARY KEY CLUSTERED 
(
	[per_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KT_SURECTIP]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_SURECTIP](
	[surectip_id] [int] IDENTITY(1,1) NOT NULL,
	[surectip_ad] [nvarchar](50) NULL,
 CONSTRAINT [PK_KT_SURECTIP] PRIMARY KEY CLUSTERED 
(
	[surectip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KT_ISLEMSUREC]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_ISLEMSUREC](
	[islemsurec_id] [int] IDENTITY(1,1) NOT NULL,
	[islemsurec] [varchar](50) NULL,
 CONSTRAINT [PK_KT_ISLEMSUREC] PRIMARY KEY CLUSTERED 
(
	[islemsurec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KT_ISLEMDETAY]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_ISLEMDETAY](
	[detay_id] [int] IDENTITY(1,1) NOT NULL,
	[detay_aciklama] [varchar](2500) NULL,
	[detay_islemid] [int] NULL,
 CONSTRAINT [PK_KT_ISLEMDETAY] PRIMARY KEY CLUSTERED 
(
	[detay_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[calisma_card]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[calisma_card] as
SELECT  parse(islem_persure as int) as sure,islem_istasyon,mak_isim as istasyon,islem_bitirme,islem_maliyet,islem_malcarpan,maliyet_tutar,maliyet_tar from KT_ISLEMLER 
JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMDETAY ON KT_ISLEMLER.islem_detay=KT_ISLEMDETAY.detay_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id
JOIN KT_MALIYET ON KT_ISLEMLER.islem_malcarpan=KT_MALIYET.maliyet_id
GO
/****** Object:  View [dbo].[new_calisma_card]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[new_calisma_card] as
SELECT        parse(islem_persure AS int) AS sure, islem_istasyon, mak_isim AS istasyon, islem_bitirme, islem_maliyet, islem_malcarpan, maliyet_tutar, maliyet_tar
FROM            KT_ISLEMLER JOIN
                         KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon = KT_MAKINATIP.mak_id 
                         JOIN
                         KT_MALIYET ON KT_ISLEMLER.islem_malcarpan = KT_MALIYET.maliyet_id
GO
/****** Object:  View [dbo].[new_calisma_sum]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		 create view [dbo].[new_calisma_sum] as

						 select SUM(sure) as 'mak_sure',islem_istasyon as'mak_name' from new_calisma_card group by islem_istasyon
GO
/****** Object:  View [dbo].[KT_kalipad]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[KT_kalipad] as
SELECT       RIGHT(pro_kodu,3) AS 'Kalıp No',pro_adi as 'Kalıp Adı'
                                 FROM            MikroDB_V16_SA20.dbo.PROJELER 
GO
/****** Object:  View [dbo].[KT_kalipadlari]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[KT_kalipadlari] as
SELECT RIGHT(pro_kodu,3) AS 'kalipisim',pro_adi as 'kalipno' FROM MikroDB_V16_SA20.dbo.PROJELER 
GO
/****** Object:  View [dbo].[UR_kalipad]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[UR_kalipad] AS
Select kaynak_kisaad as 'urkalipno', kaynak_aciklama as 'urkalipad' From Nopeksis_V7.dbo.KAYNAKLAR WHERE kaynak_sinif=1 and kaynak_isletme=1 and kaynak_durum=1 
GO
/****** Object:  Table [dbo].[KAL_PER]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KAL_PER](
	[kalper_id] [int] IDENTITY(1,1) NOT NULL,
	[kalper_ad] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KAL_TAKIP]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KAL_TAKIP](
	[kal_id] [int] IDENTITY(1,1) NOT NULL,
	[kal_makineno] [nvarchar](255) NULL,
	[kal_stokkod] [nvarchar](255) NULL,
	[kal_stokad] [nvarchar](255) NULL,
	[kal_kalipgoz] [int] NULL,
	[kal_gercekgoz] [int] NULL,
	[kal_prosescevrim] [int] NULL,
	[kal_gercekcevrim] [int] NULL,
	[kal_giristarih] [datetime] NULL,
	[kal_giriskul] [int] NULL,
 CONSTRAINT [PK_KAL_TAKIP] PRIMARY KEY CLUSTERED 
(
	[kal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KT_ANAMAKİNA]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_ANAMAKİNA](
	[anamak_id] [int] IDENTITY(1,1) NOT NULL,
	[anamak_ad] [nvarchar](50) NULL,
	[anamak_grup] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KT_ANASUREC]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_ANASUREC](
	[surec_id] [int] IDENTITY(1,1) NOT NULL,
	[kalip_no] [nvarchar](50) NULL,
	[per_isim] [int] NULL,
	[per_sure] [nvarchar](50) NULL,
	[per_makinetip] [nvarchar](50) NULL,
	[per_baslangic] [smalldatetime] NULL,
	[per_bitis] [smalldatetime] NULL,
	[surec_tip] [nvarchar](50) NULL,
	[islem_surec] [int] NULL,
 CONSTRAINT [PK_KT_ANASUREC] PRIMARY KEY CLUSTERED 
(
	[surec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KT_DURUSLAR]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_DURUSLAR](
	[durus_id] [int] IDENTITY(1,1) NOT NULL,
	[durus_islemid] [int] NULL,
	[durus_neden] [nvarchar](950) NULL,
	[durus_kalipno] [int] NOT NULL,
	[durus_min] [nvarchar](50) NOT NULL,
	[durus_date] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KT_DURUSNEDEN]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_DURUSNEDEN](
	[durusacik_id] [int] IDENTITY(1,1) NOT NULL,
	[durusacik_neden] [nvarchar](950) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KT_SURE]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KT_SURE](
	[sur_id] [int] IDENTITY(1,1) NOT NULL,
	[sur_ascii] [nvarchar](50) NULL,
 CONSTRAINT [PK_KT_SURE] PRIMARY KEY CLUSTERED 
(
	[sur_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UR_ARIZATESPIT]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UR_ARIZATESPIT](
	[arizatespid_id] [int] IDENTITY(1,1) NOT NULL,
	[arizatespit_ad] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UR_KALIPARIZA]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UR_KALIPARIZA](
	[kalipariza_id] [int] IDENTITY(1,1) NOT NULL,
	[kalipariza_per] [nvarchar](50) NULL,
	[kalipariza_kalipno] [nvarchar](50) NULL,
	[kalipariza_aciklama] [nvarchar](500) NULL,
	[kalipariza_baslangictar] [datetime] NULL,
	[kalipariza_islemtar] [datetime] NULL,
	[kalipariza_islembitis] [datetime] NULL,
	[kalipariza_bitistar] [nvarchar](50) NULL,
	[kalipariza_surec] [int] NULL,
	[kalipariza_down] [nvarchar](50) NULL,
	[kalipariza_upper] [nvarchar](50) NULL,
	[kalipariza_downer] [nvarchar](50) NULL,
	[kalipariza_tip] [nvarchar](50) NULL,
 CONSTRAINT [PK_UR_KALIPARIZA] PRIMARY KEY CLUSTERED 
(
	[kalipariza_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UR_PERSONEL]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UR_PERSONEL](
	[urper_id] [int] IDENTITY(1,1) NOT NULL,
	[urper_ad] [nvarchar](50) NULL,
	[urper_number] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UR_SUREC]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UR_SUREC](
	[arizasurec_id] [int] IDENTITY(1,1) NOT NULL,
	[arizasurec_ad] [nvarchar](50) NULL,
	[arizasurec_acik] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UR_TALEPACİL]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UR_TALEPACİL](
	[talepacil_id] [int] IDENTITY(1,1) NOT NULL,
	[talepacil_ad] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UR_TALEPNEDEN]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UR_TALEPNEDEN](
	[talepneden_id] [int] IDENTITY(1,1) NOT NULL,
	[talepneden_ad] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[anaselect]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[anaselect]
AS
	SET NOCOUNT ON;
SELECT     surec_id, kalip_no, per_isim, per_sure, per_makinetip
FROM        KT_ANASUREC
GO
/****** Object:  StoredProcedure [dbo].[devamopsiyonv2]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[devamopsiyonv2] as


select islem_id,per_ad,surectip_ad,islem_kalipno,mak_isim,detay_aciklama,islem_aciklama, islem_baslama from KT_ISLEMLER

JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMDETAY ON KT_ISLEMLER.islem_detay=KT_ISLEMDETAY.detay_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id where islem_surec='1'
GO
/****** Object:  StoredProcedure [dbo].[islemdevameden]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[islemdevameden]

as

select islem_id,per_ad,surectip_ad,islem_kalipno,mak_isim,sur_ascii,islem_baslama,islem_aciklama from KT_ISLEMLER
JOIN KT_SURE on KT_ISLEMLER.islem_persure=KT_SURE.sur_id
JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id where islem_surec='1'
GO
/****** Object:  StoredProcedure [dbo].[islemduraklat]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[islemduraklat] AS
select islem_id,per_ad,surectip_ad,islem_kalipno,mak_isim,islem_baslama,islem_bitirme,detay_aciklama,islem_aciklama,islem_persure AS 'islem_saat' from KT_ISLEMLER

JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMDETAY ON KT_ISLEMLER.islem_detay=KT_ISLEMDETAY.detay_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id where islem_surec='3'  ORDER BY islem_bitirme DESC
GO
/****** Object:  StoredProcedure [dbo].[islemopsiyon]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[islemopsiyon] as
select islem_id,per_ad,surectip_ad,islem_kalipno,mak_isim,islem_baslama from KT_ISLEMLER
JOIN KT_SURE on KT_ISLEMLER.islem_persure=KT_SURE.sur_id
JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMDETAY ON KT_ISLEMLER.islem_detay=KT_ISLEMDETAY.detay_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id where islem_surec='1'
GO
/****** Object:  StoredProcedure [dbo].[islemopsiyondev]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[islemopsiyondev] as
select islem_id,per_ad,surectip_ad,islem_kalipno,mak_isim,islem_baslama from KT_ISLEMLER
JOIN KT_SURE on KT_ISLEMLER.islem_persure=KT_SURE.sur_id
JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMDETAY ON KT_ISLEMLER.islem_detay=KT_ISLEMDETAY.detay_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id where islem_surec='1'
GO
/****** Object:  StoredProcedure [dbo].[islemselect]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[islemselect]

as

select islem_id,per_ad,surectip_ad,islem_kalipno,mak_isim,sur_ascii,islem_baslama,islem_bitirme, islemsurec,islem_aciklama from KT_ISLEMLER
JOIN KT_SURE on KT_ISLEMLER.islem_persure=KT_SURE.sur_id
JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id
GO
/****** Object:  StoredProcedure [dbo].[islemtamamlanan]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[islemtamamlanan]

as

select islem_id,per_ad,surectip_ad,islem_kalipno,mak_isim,sur_ascii,islem_baslama,islem_bitirme,islem_aciklama from KT_ISLEMLER
JOIN KT_SURE on KT_ISLEMLER.islem_persure=KT_SURE.sur_id
JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id where islem_surec='2'
GO
/****** Object:  StoredProcedure [dbo].[kaliphanesurecizle]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[kaliphanesurecizle]

as

select surec_id,per_ad,surectip_ad,kalip_no,mak_isim,sur_ascii,per_baslangic,islemsurec from KT_ANASUREC
JOIN KT_SURE on KT_ANASUREC.per_sure=KT_SURE.sur_id
JOIN KT_MAKINATIP ON KT_ANASUREC.per_makinetip=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ANASUREC.per_isim=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ANASUREC.surec_tip=KT_SURECTIP.surectip_id
JOIN KT_ISLEMSUREC ON KT_ANASUREC.islem_surec=KT_ISLEMSUREC.islemsurec_id   WHERE islem_surec=1
GO
/****** Object:  StoredProcedure [dbo].[kalite_insert]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[kalite_insert]
(
	@kal_makineno nvarchar(255),
	@kal_stokkod nvarchar(255),
	@kal_stokad nvarchar(255),
	@kal_kalipgoz int,
	@kal_gercekgoz int,
	@kal_prosescevrim int,
	@kal_gercekcevrim int,
	@kal_giristarih datetime,
	@kal_giriskul int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [KAL_TAKIP] ([kal_makineno], [kal_stokkod], [kal_stokad], [kal_kalipgoz], [kal_gercekgoz], [kal_prosescevrim], [kal_gercekcevrim], [kal_giristarih], [kal_giriskul]) VALUES (@kal_makineno, @kal_stokkod, @kal_stokad, @kal_kalipgoz, @kal_gercekgoz, @kal_prosescevrim, @kal_gercekcevrim, @kal_giristarih, @kal_giriskul)
GO
/****** Object:  StoredProcedure [dbo].[kalite_insert2]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[kalite_insert2]
(
	@kal_makineno nvarchar(255),
	@kal_stokkod nvarchar(255),
	@kal_stokad nvarchar(255),
	@kal_kalipgoz int,
	@kal_gercekgoz int,
	@kal_prosescevrim int,
	@kal_gercekcevrim int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [KAL_TAKIP] ([kal_makineno], [kal_stokkod], [kal_stokad], [kal_kalipgoz], [kal_gercekgoz], [kal_prosescevrim], [kal_gercekcevrim]) VALUES (@kal_makineno, @kal_stokkod, @kal_stokad, @kal_kalipgoz, @kal_gercekgoz, @kal_prosescevrim, @kal_gercekcevrim)
GO
/****** Object:  StoredProcedure [dbo].[kalite3]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[kalite3]
(
	@kal_makineno nvarchar(255),
	@kal_stokkod nvarchar(255),
	@kal_stokad nvarchar(255)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [KAL_TAKIP] ([kal_makineno], [kal_stokkod], [kal_stokad]) VALUES (@kal_makineno, @kal_stokkod, @kal_stokad)
GO
/****** Object:  StoredProcedure [dbo].[kalite4]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[kalite4]
(
	@kal_makineno nvarchar(255),
	@kal_stokkod nvarchar(255),
	@kal_stokad nvarchar(255),
	@kal_gercekgoz int,
	@kal_gercekcevriml int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [KAL_TAKIP] ([kal_makineno], [kal_stokkod], [kal_stokad], [kal_gercekgoz], [kal_gercekcevrim]) VALUES (@kal_makineno, @kal_stokkod, @kal_stokad, @kal_gercekgoz,@kal_gercekcevriml)
GO
/****** Object:  StoredProcedure [dbo].[kalite5]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[kalite5]
(
	@kal_makineno nvarchar(255),
	@kal_stokkod nvarchar(255),
	@kal_stokad nvarchar(255),
	@kal_kalipgoz int,
	@kal_gercekgoz int,
	@kal_prosescevrim int,
	@kal_gercekcevrim int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [KAL_TAKIP] ([kal_makineno], [kal_stokkod], [kal_stokad], [kal_kalipgoz], [kal_gercekgoz], [kal_prosescevrim], [kal_gercekcevrim]) VALUES (@kal_makineno, @kal_stokkod, @kal_stokad, @kal_kalipgoz, @kal_gercekgoz, @kal_prosescevrim, @kal_gercekcevrim)
GO
/****** Object:  StoredProcedure [dbo].[NewDeleteCommand]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewDeleteCommand]
(
	@Original_surec_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [KT_ANASUREC] WHERE (([surec_id] = @Original_surec_id))
GO
/****** Object:  StoredProcedure [dbo].[NewInsertCommand]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewInsertCommand]
(
	@kalip_no nvarchar(50),
	@per_isim nvarchar(50),
	@per_sure nvarchar(50),
	@per_makinetip nvarchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [KT_ANASUREC] ([kalip_no], [per_isim], [per_sure], [per_makinetip]) VALUES (@kalip_no, @per_isim, @per_sure, @per_makinetip);
	
SELECT surec_id, kalip_no, per_isim, per_sure, per_makinetip FROM KT_ANASUREC WHERE (surec_id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[NewSelectCommand]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewSelectCommand]
(
	@kal_makineno nvarchar(255),
	@kal_stokkod nvarchar(255),
	@kal_stokad nvarchar(255),
	@kal_kalipgoz int,
	@kal_gercekgoz int,
	@kal_prosescevrim int,
	@kal_gercekcevrim int,
	@kal_giristarih datetime,
	@kal_giriskul int
)
AS
	SET NOCOUNT ON;
INSERT INTO KAL_TAKIP
            ([kal_makineno]
            ,[kal_stokkod]
            ,[kal_stokad]
            ,[kal_kalipgoz]
            ,[kal_gercekgoz]
            ,[kal_prosescevrim]
            ,[kal_gercekcevrim]
            ,[kal_giristarih]
            ,[kal_giriskul])
VALUES      (@kal_makineno
            ,@kal_stokkod
            ,@kal_stokad
            ,@kal_kalipgoz
            ,@kal_gercekgoz
            ,@kal_prosescevrim
            ,@kal_gercekcevrim
            ,@kal_giristarih
            ,@kal_giriskul);
	

GO
/****** Object:  StoredProcedure [dbo].[NewUpdateCommand]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewUpdateCommand]
(
	@kalip_no nvarchar(50),
	@per_isim nvarchar(50),
	@per_sure nvarchar(50),
	@per_makinetip nvarchar(50),
	@Original_surec_id int,
	@surec_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [KT_ANASUREC] SET [kalip_no] = @kalip_no, [per_isim] = @per_isim, [per_sure] = @per_sure, [per_makinetip] = @per_makinetip WHERE (([surec_id] = @Original_surec_id));
	
SELECT surec_id, kalip_no, per_isim, per_sure, per_makinetip FROM KT_ANASUREC WHERE (surec_id = @surec_id)
GO
/****** Object:  StoredProcedure [dbo].[spQueryToHtmlTable]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    
    
CREATE PROC [dbo].[spQueryToHtmlTable]       
(      
  @query nvarchar(MAX), --A query to turn into HTML format. It should not include an ORDER BY clause.      
  @orderBy nvarchar(MAX) = NULL, --An optional ORDER BY clause. It should contain the words 'ORDER BY'.      
  @html nvarchar(MAX) = NULL OUTPUT --The HTML output of the procedure.      
)      
AS      
BEGIN         
  SET NOCOUNT ON;      
      
  IF @orderBy IS NULL BEGIN      
    SET @orderBy = ''        
  END      
      
  DECLARE @realQuery nvarchar(MAX) = '      
    DECLARE @headerRow nvarchar(MAX);      
    DECLARE @cols nvarchar(MAX);          
      
    SELECT * INTO #dynSql FROM (' + @query + ') sub;      
      
    SELECT @cols = COALESCE(@cols + '', '''''''', '', '''') + ''['' + name + ''] AS ''''td''''''      
    FROM tempdb.sys.columns       
    WHERE object_id = object_id(''tempdb..#dynSql'');      
      
    SET @cols = ''SET @html = CAST(( SELECT '' + @cols + '' FROM #dynSql ' + @orderBy + ' FOR XML PATH(''''tr''''), ELEMENTS) AS nvarchar(max))''          
      
    EXEC sys.sp_executesql @cols, N''@html nvarchar(MAX) OUTPUT'', @html=@html OUTPUT      
      
    SELECT @headerRow = COALESCE(@headerRow + '''', '''') + ''<th>'' + name + ''</th>''       
    FROM tempdb.sys.columns       
    WHERE object_id = object_id(''tempdb..#dynSql'');      
      
    SET @headerRow = ''<tr>'' + @headerRow + ''</tr>'';      
      
    SET @html = ''<table border="1">'' + @headerRow + @html + ''</table>'';          
    ';      
      
  EXEC sys.sp_executesql @realQuery, N'@html nvarchar(MAX) OUTPUT', @html=@html OUTPUT      
END       
GO
/****** Object:  StoredProcedure [dbo].[tamamlananislemler]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tamamlananislemler] as
select islem_id,per_ad,surectip_ad,islem_kalipno,mak_isim,islem_baslama,detay_aciklama,islem_aciklama,DATEDIFF(HOUR,islem_baslama,islem_bitirme) AS 'islem_saat' from KT_ISLEMLER
JOIN KT_SURE on KT_ISLEMLER.islem_persure=KT_SURE.sur_id
JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMDETAY ON KT_ISLEMLER.islem_detay=KT_ISLEMDETAY.detay_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id where islem_surec='2' ORDER BY islem_baslama DESC
GO
/****** Object:  StoredProcedure [dbo].[tamamopsiyon]    Script Date: 18.01.2025 18:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tamamopsiyon] as

select islem_id,per_ad,surectip_ad,islem_kalipno,mak_isim,islem_baslama,islem_bitirme,detay_aciklama,islem_aciklama,islem_persure AS 'islem_saat' from KT_ISLEMLER

JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMDETAY ON KT_ISLEMLER.islem_detay=KT_ISLEMDETAY.detay_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id where islem_surec='2'  ORDER BY islem_bitirme DESC
GO
USE [master]
GO
ALTER DATABASE [Db_kaliphanetakip] SET  READ_WRITE 
GO
