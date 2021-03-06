USE [Advising]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 1/28/2019 10:08:53 AM ******/
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
