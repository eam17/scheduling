USE [Advising]
GO
/****** Object:  Table [dbo].[Office]    Script Date: 1/28/2019 10:08:53 AM ******/
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
