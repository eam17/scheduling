USE [Advising]
GO
/****** Object:  Table [dbo].[Advisor]    Script Date: 1/28/2019 10:08:52 AM ******/
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
