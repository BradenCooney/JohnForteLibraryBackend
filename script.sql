USE [master]
GO
/****** Object:  Database [library]    Script Date: 7/9/2021 12:04:30 PM ******/
CREATE DATABASE [library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [library] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [library] SET ARITHABORT OFF 
GO
ALTER DATABASE [library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [library] SET RECOVERY FULL 
GO
ALTER DATABASE [library] SET  MULTI_USER 
GO
ALTER DATABASE [library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'library', N'ON'
GO
ALTER DATABASE [library] SET QUERY_STORE = OFF
GO
USE [library]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 7/9/2021 12:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 7/9/2021 12:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[BooksId] [int] NOT NULL,
	[AuthorsId] [int] NOT NULL,
 CONSTRAINT [PK_BookAuthor] PRIMARY KEY CLUSTERED 
(
	[BooksId] ASC,
	[AuthorsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 7/9/2021 12:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[ISBN] [varchar](20) NOT NULL,
	[PublishedYear] [int] NULL,
	[IsCheckedOut] [bit] NULL,
	[CheckedOutDate] [datetime2](7) NULL,
	[DueDate] [datetime2](7) NULL,
	[PatronId] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patrons]    Script Date: 7/9/2021 12:04:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patrons](
	[PatronId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[CardNumber] [varchar](14) NOT NULL,
	[StreetAddress] [varchar](100) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
 CONSTRAINT [PK_LibraryCards] PRIMARY KEY CLUSTERED 
(
	[PatronId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (3, N'Jk')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (4, N'Rowling')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (5, N'Jk')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (6, N'Rowling')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (8, N'Jk')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (9, N'Jk Rowling')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (10, N'Dr. Suess')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (11, N'A different Author')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (12, N'James Patterson')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (13, N'Bill Clinton')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (14, N'J.D. Rudd')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (15, N'Sally Hebworth')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (16, N'Danielle Steel')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (17, N'Danielle Steel')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (18, N'Susan Mallery')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (19, N'Jennifer Weiner')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (20, N'J.K. Rowling')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (21, N'Jk, Bill Clinton')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (22, N'Alex Michaelides')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (23, N'Andrew Child')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (24, N'Lee Child')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (25, N'Andy Weir')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (26, N'David Baldacci')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (27, N'Emily Henry')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (28, N'Nora Roberts')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (29, N'Liane Moriarty')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (30, N'Taylor Jenkins Reid')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (31, N'Nicholas Sparks')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (32, N'Madeline Martin')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (33, N'Dude Perfect')
INSERT [dbo].[Authors] ([AuthorId], [Name]) VALUES (34, N'Delia Owens')
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (12, 10)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (29, 12)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (32, 20)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (33, 20)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (43, 20)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (44, 20)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (45, 20)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (47, 20)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (49, 12)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (50, 12)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (52, 18)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (53, 22)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (54, 12)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (55, 23)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (55, 24)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (57, 25)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (65, 26)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (66, 20)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (67, 28)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (68, 27)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (82, 30)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (84, 29)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (85, 30)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (86, 32)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (87, 33)
INSERT [dbo].[BookAuthor] ([BooksId], [AuthorsId]) VALUES (90, 34)
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (12, N'Green Eggs and Ham', N'9780394800165', 1988, 1, CAST(N'2021-07-06T13:46:25.0432998' AS DateTime2), CAST(N'2021-07-01T13:46:25.0433110' AS DateTime2), 1)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (29, N'The Noise', N'0316499870', 2021, 0, CAST(N'2021-07-04T22:06:26.9318574' AS DateTime2), CAST(N'2021-07-25T22:06:26.9318659' AS DateTime2), 12)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (32, N'Harry Potter and the Sorcerer''s Stone', N'0439708184', 1998, 0, CAST(N'2021-07-05T13:20:34.4476095' AS DateTime2), CAST(N'2021-07-26T13:20:34.4509327' AS DateTime2), NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (33, N'Harry Potter and the Chamber of Secrets', N'0439064872', 2000, 0, CAST(N'2021-07-04T22:06:31.1919758' AS DateTime2), CAST(N'2021-07-25T22:06:31.1919851' AS DateTime2), 12)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (43, N'Harry Potter and the Prisoner of Azkaban', N'0439136369', 2001, 1, CAST(N'2021-07-06T17:03:29.9197594' AS DateTime2), CAST(N'2021-07-27T17:03:29.9201586' AS DateTime2), 1)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (44, N'Harry Potter and the Goblet of Fire', N'1551927063', 2004, 0, CAST(N'2021-07-04T22:06:38.7213806' AS DateTime2), CAST(N'2021-07-25T22:06:38.7213884' AS DateTime2), 12)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (45, N'Harry Potter and the Order of the Phoenix', N'9780439358064', 2004, 0, CAST(N'2021-07-04T22:06:42.7891991' AS DateTime2), CAST(N'2021-07-25T22:06:42.7892068' AS DateTime2), 12)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (47, N'Harry Potter and the Half Blood Prince', N'0439784549', 2005, 0, CAST(N'2021-07-04T22:06:47.2225022' AS DateTime2), CAST(N'2021-07-25T22:06:47.2225084' AS DateTime2), 12)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (49, N'21st Birthday', N'9780316499347', 2021, 0, CAST(N'2021-07-04T22:02:27.1953314' AS DateTime2), CAST(N'2021-07-25T22:02:27.1953409' AS DateTime2), 2)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (50, N'21st Birthday', N'9780316499347', 2021, 0, CAST(N'2021-07-04T22:02:44.6660295' AS DateTime2), CAST(N'2021-07-25T22:02:44.6660353' AS DateTime2), 2)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (51, N'The Silkworm', N'9780316206877', 2014, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (52, N'The Stepsisters', N'9780778312031', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (53, N'The Maidens', N'9781250304452', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (54, N'2 Sisters Detective Agency', N'9781538704592', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (55, N'Better Off Dead', N'1984818503', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (57, N'Project Hail Mary', N'9780593135204', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (65, N'A Gambling Man', N'9781538719671', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (66, N'Harry Potter and the Deathly Hallows', N'9781781102435', 2015, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (67, N'Legacy', N'9781250272935', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (68, N'People We Meet on Vacation', N'9781984806758', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (82, N'Malibu Rising', N'9781524798659', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (84, N'Apples Never Fall', N'9781250220257', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (85, N'Malibu Rising', N'9781524798659', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (86, N'The Last Bookshop in London', N'9781335653048', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (87, N'Dude Perfect 101 Tricks, Tips, and Cool Stuff', N'978-1-4002-1707-6', 2021, 0, NULL, NULL, NULL)
INSERT [dbo].[Books] ([BookId], [Title], [ISBN], [PublishedYear], [IsCheckedOut], [CheckedOutDate], [DueDate], [PatronId]) VALUES (90, N'Where the Crawdads Sing', N'978-0-7352-1910-6', 2021, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Patrons] ON 

INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (1, N'Braden', N'Cooney', N'8168858510', N'braden.cooney@gmail.com', N'61130523111857', N'10801 NE Blackwell Rd.', N'Lee''s Summit', N'MO', N'64086')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (2, N'Lucifer', N'Morningstar', N'1235669876', N'lucifer@gmail.com', N'40683423505286', N'123 Lux Club', N'Las Vegas', N'NV', N'88901')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (3, N'Random', N'Person', N'(816)789-0987', N'random@gmail.com', N'70511052784683', N'1234 Just House', N'Lee''s Summit', N'MO', N'64086')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (4, N'Sherlock', N'Holmes', N'(899)090-8972', N'watson@gmail.com', N'54568602062017', N'123 Baker Street', N'London', N'MO', N'64086')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (5, N'Harry', N'Potter', N'1113534162', N'HarryPotter@hogwartshotmail.com', N'00568877164464', N'Griffyndor tower', N'London', N'DC', N'23455')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (6, N'Barack', N'Obama', N'(999)897-4545', N'thePrez@whitehouse.com', N'36605505515245', N'1600 Pennsylvania Avenue', N'Washington', N'DC', N'20001')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (7, N'Barack', N'Obama', N'(999)897-4545', N'thePrez@whitehouse.com', N'28088601204646', N'1600 Pennsylvania Avenue', N'Washington', N'CT', N'20001')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (8, N'kjk', N'fjfjf', N'(111)456-9808', N'jfjf@gmail', N'21828170622468', N'123 jfjf st', N'jsjs', N'ID', N'09879')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (9, N'Justin', N'Herbert', N'(848)838-0987', N'herbie@bolts.com', N'42150460051750', N'123 Bolt Up', N'Las Vegas', N'CA', N'88901')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (10, N'', N'Cooney', N'8168858510', N'braden.cooney@gmail.com', N'32070132552005', N'10801 NE Blackwell Rd.', N'Lee''s Summit', N'CA', N'64086')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (11, N'', N'Cooney', N'8168858510', N'braden.cooney@gmail.com', N'11533032045334', N'10801 NE Blackwell Rd.', N'Lee''s Summit', N'CA', N'64086')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (12, N'Lydia', N'Cooney', N'8169779597', N'lcooney0205@gmail.com', N'48351740035507', N'10801 NE Blackwell Rd', N'Lees Summit', N'MO', N'64086')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (13, N'Ayre', N'Cooney', N'8169858403', N'ayre.cooney@gmail.com', N'55545750826551', N'10801 NE Blackwell Rd', N'Lees Summit', N'MO', N'64086')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (14, N'Andy', N'Holloway', N'(782)863-3921', N'andy.holloway@ffballerscom', N'27122887664154', N'5409 Arizona Drive', N'Phoenix', N'AZ', N'45098')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (15, N'Barbara', N'Byler', N'(413) 674-9573', N'annamarie_kirl@hotmail.com', N'58735081817508', N'4802 Hilltop Street', N'Springfield', N'MA', N'01103')
INSERT [dbo].[Patrons] ([PatronId], [FirstName], [LastName], [PhoneNumber], [Email], [CardNumber], [StreetAddress], [City], [State], [ZipCode]) VALUES (16, N'James', N'Simpson', N'(530) 965-1674', N'allie2004@yahoo.com', N'82585888781135', N'1646 Maxwell Farm Road', N'Chico', N'CA', N'95926')
SET IDENTITY_INSERT [dbo].[Patrons] OFF
GO
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [DF_Books_IsCheckedOut]  DEFAULT ((0)) FOR [IsCheckedOut]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_Author_Book] FOREIGN KEY([AuthorsId])
REFERENCES [dbo].[Authors] ([AuthorId])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_Author_Book]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([BooksId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_Book_Author]
GO
USE [master]
GO
ALTER DATABASE [library] SET  READ_WRITE 
GO
