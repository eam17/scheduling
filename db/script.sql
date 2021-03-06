USE [Advising]
GO
/****** Object:  Table [dbo].[Advisor]    Script Date: 12/13/2018 3:17:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advisor](
	[advisorId] [int] NOT NULL,
	[studentId] [int] NOT NULL,
 CONSTRAINT [PK_Advisor] PRIMARY KEY CLUSTERED 
(
	[advisorId] ASC,
	[studentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 12/13/2018 3:17:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[appointmentId] [int] NOT NULL,
	[studentId] [int] NOT NULL,
	[officeId] [int] NOT NULL,
	[slotTime] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[appointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Confirm]    Script Date: 12/13/2018 3:17:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Confirm](
	[studentId] [int] NOT NULL,
	[confirmCode] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Confirm] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Office]    Script Date: 12/13/2018 3:17:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[officeId] [int] IDENTITY(1,1) NOT NULL,
	[buildingId] [nvarchar](4) NOT NULL,
	[roomId] [nchar](4) NOT NULL,
	[suiteId] [nchar](1) NULL,
	[advisorId] [int] NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[officeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeHours]    Script Date: 12/13/2018 3:17:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeHours](
	[officeHoursId] [int] IDENTITY(1,1) NOT NULL,
	[officeId] [int] NOT NULL,
	[startTime] [smalldatetime] NOT NULL,
	[studentId] [int] NULL,
	[advisorId] [int] NOT NULL,
	[note] [nchar](256) NULL,
 CONSTRAINT [PK_OfficeHours] PRIMARY KEY CLUSTERED 
(
	[officeHoursId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/13/2018 3:17:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] NOT NULL,
	[firstName] [varchar](32) NOT NULL,
	[lastName] [varchar](32) NOT NULL,
	[middleinit] [varchar](1) NULL,
	[email] [varchar](16) NOT NULL,
	[password] [varchar](512) NULL,
	[major] [varchar](4) NULL,
	[phonenumber] [nchar](10) NULL,
	[isAdvisor] [bit] NOT NULL,
	[verification] [varchar](4) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_middleinit]  DEFAULT ((-1)) FOR [middleinit]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_isAdvisor]  DEFAULT ((0)) FOR [isAdvisor]
GO
ALTER TABLE [dbo].[Advisor]  WITH CHECK ADD  CONSTRAINT [FK_Advisor_Person] FOREIGN KEY([advisorId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Advisor] CHECK CONSTRAINT [FK_Advisor_Person]
GO
ALTER TABLE [dbo].[Advisor]  WITH CHECK ADD  CONSTRAINT [FK_Advisor_Person1] FOREIGN KEY([studentId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Advisor] CHECK CONSTRAINT [FK_Advisor_Person1]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Office] FOREIGN KEY([officeId])
REFERENCES [dbo].[Office] ([officeId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Office]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Person] FOREIGN KEY([studentId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Person]
GO
ALTER TABLE [dbo].[Confirm]  WITH CHECK ADD  CONSTRAINT [FK_Confirm_Person] FOREIGN KEY([studentId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Confirm] CHECK CONSTRAINT [FK_Confirm_Person]
GO
ALTER TABLE [dbo].[OfficeHours]  WITH CHECK ADD  CONSTRAINT [FK_OfficeHours_Advisor] FOREIGN KEY([advisorId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[OfficeHours] CHECK CONSTRAINT [FK_OfficeHours_Advisor]
GO
ALTER TABLE [dbo].[OfficeHours]  WITH CHECK ADD  CONSTRAINT [FK_OfficeHours_Office] FOREIGN KEY([officeId])
REFERENCES [dbo].[Office] ([officeId])
GO
ALTER TABLE [dbo].[OfficeHours] CHECK CONSTRAINT [FK_OfficeHours_Office]
GO
ALTER TABLE [dbo].[OfficeHours]  WITH CHECK ADD  CONSTRAINT [FK_OfficeHours_Student] FOREIGN KEY([studentId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[OfficeHours] CHECK CONSTRAINT [FK_OfficeHours_Student]
GO
/****** Object:  StoredProcedure [dbo].[insertPerson]    Script Date: 12/13/2018 3:17:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertPerson]
	@firstName varchar(50) = ' ',
	@lastName varchar(50) = ' ',
	@email varchar(50) = ' ',
	@personID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO Person
	(
		firstName,
		lastName,
		email
	)
	VALUES
	(
		@firstName,
		@lastName,
		@email
	)
   
   SET @Personid = SCOPE_IDENTITY()
END
GO
