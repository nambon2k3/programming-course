USE [master]
GO
/****** Object:  Database [ProgrammingCoursePlatform]    Script Date: 6/30/2024 10:29:17 PM ******/
CREATE DATABASE [ProgrammingCoursePlatform]
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProgrammingCoursePlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET RECOVERY FULL 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET  MULTI_USER 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProgrammingCoursePlatform', N'ON'
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProgrammingCoursePlatform]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 6/30/2024 10:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[imageURL] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 6/30/2024 10:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[LessonTitle] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[videoLink] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/30/2024 10:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[RegistrationDate] [datetime] NULL,
	[role] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [CreatedDate], [imageURL]) VALUES (1, N'Introduction to Programming', N'A beginner course on programming basics.', CAST(N'2024-06-29T14:02:25.587' AS DateTime), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfuX-TF__YzOjG-FEt00-IOmEG0OnXSVHM-A&s')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [CreatedDate], [imageURL]) VALUES (2, N'Advanced Java Programming', N'An advanced course on Java programming.', CAST(N'2024-06-29T14:02:25.587' AS DateTime), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfuX-TF__YzOjG-FEt00-IOmEG0OnXSVHM-A&s')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonID], [CourseID], [LessonTitle], [Content], [CreatedDate], [videoLink]) VALUES (1, 1, N'Lesson 1: Variables and Data Types', N'Content for Lesson 1... ', CAST(N'2024-06-30T22:24:17.887' AS DateTime), N'https://www.youtube.com/embed/tgbNymZ7vqY')
INSERT [dbo].[Lessons] ([LessonID], [CourseID], [LessonTitle], [Content], [CreatedDate], [videoLink]) VALUES (2, 1, N'Lesson 2: Control Structures', N'Content for Lesson 2...', CAST(N'2024-06-29T14:02:25.593' AS DateTime), N'https://www.youtube.com/embed/BVbvKclqZd0')
INSERT [dbo].[Lessons] ([LessonID], [CourseID], [LessonTitle], [Content], [CreatedDate], [videoLink]) VALUES (3, 2, N'Lesson 1: Java Basics', N'Content for Java Lesson 1...', CAST(N'2024-06-29T14:02:25.593' AS DateTime), N'https://www.youtube.com/embed/tgbNymZ7vqY')
INSERT [dbo].[Lessons] ([LessonID], [CourseID], [LessonTitle], [Content], [CreatedDate], [videoLink]) VALUES (4, 2, N'Lesson 2: Object-Oriented Programming', N'Content for Java Lesson 2...', CAST(N'2024-06-29T14:02:25.593' AS DateTime), N'https://www.youtube.com/embed/tgbNymZ7vqY')
SET IDENTITY_INSERT [dbo].[Lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [RegistrationDate], [role]) VALUES (1, N'john_doe', N'123', N'john@example.com', CAST(N'2024-06-29T14:02:25.580' AS DateTime), N'ADMIN')
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [RegistrationDate], [role]) VALUES (2, N'jane_doe', N'123', N'jane@example.com', CAST(N'2024-06-29T14:02:25.580' AS DateTime), N'USER')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4391A052B]    Script Date: 6/30/2024 10:29:17 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534FD113165]    Script Date: 6/30/2024 10:29:17 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Lessons] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
USE [master]
GO
ALTER DATABASE [ProgrammingCoursePlatform] SET  READ_WRITE 
GO
