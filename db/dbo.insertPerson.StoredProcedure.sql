USE [Advising]
GO
/****** Object:  StoredProcedure [dbo].[insertPerson]    Script Date: 1/28/2019 10:08:53 AM ******/
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
