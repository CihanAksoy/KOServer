SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		katanatr
-- Create date: 2014-01-14
-- Description:	Account DB Script.
-- =============================================
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CURRENTUSER')
    DROP TABLE CURRENTUSER;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TB_USER')
    DROP TABLE TB_USER;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'VERSION')
    DROP TABLE [VERSION];
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ACCOUNT_LOGIN') AND type in (N'P', N'PC'))
    DROP PROCEDURE ACCOUNT_LOGIN;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ACCOUNT_LOGOUT') AND type in (N'P', N'PC'))
    DROP PROCEDURE ACCOUNT_LOGOUT;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'CLEAR_REMAIN_USERS') AND type in (N'P', N'PC'))
    DROP PROCEDURE CLEAR_REMAIN_USERS;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SET_LOGIN_INFO') AND type in (N'P', N'PC'))
    DROP PROCEDURE SET_LOGIN_INFO;
GO

CREATE TABLE CURRENTUSER(
	strAccountID varchar(50) NOT NULL,
	strCharID varchar(50) NOT NULL,
	nServerNo smallint NOT NULL,
	strServerIP varchar(50) NOT NULL,
	strClientIP varchar(50) NOT NULL
)
GO

CREATE TABLE TB_USER(
	ID int IDENTITY(1,1) NOT NULL,
	strAccountID varchar(21) NOT NULL,
	strPasswd varchar(28) NULL,
	strSealPasswd char(8) NOT NULL DEFAULT 12345678,
	dtCreateTime datetime DEFAULT GETDATE()
)
GO

CREATE TABLE [VERSION](
	sVersion smallint NOT NULL,
	sHistoryVersion smallint NOT NULL,
	strFilename char(40) NOT NULL
)
GO

CREATE PROCEDURE ACCOUNT_LOGIN
@strAccountID varchar(21),
@strPasswd varchar(28)
AS

DECLARE @strHashPassword varchar(28)

SELECT @strHashPassword = strPasswd FROM TB_USER WHERE strAccountID = @strAccountID

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO TB_USER (strAccountID, strPasswd) VALUES (@strAccountID, @strPasswd)
	RETURN 1
END
ELSE IF (@strHashPassword != @strPasswd)
	RETURN 3
ELSE
BEGIN
	DELETE FROM CURRENTUSER WHERE strAccountID = @strAccountID
	RETURN 1
END
GO

CREATE PROCEDURE ACCOUNT_LOGOUT
@strAccountID varchar(21)
AS

DELETE FROM CURRENTUSER WHERE strAccountID = @strAccountID
GO

CREATE PROCEDURE CLEAR_REMAIN_USERS
@strServerIP varchar(50)
AS

DELETE FROM CURRENTUSER WHERE strServerIP = @strServerIP
GO

CREATE PROCEDURE SET_LOGIN_INFO
@strAccountID varchar(20),
@strCharID varchar(20),
@nServerno smallint,
@strServerIP varchar(50),
@strClientIP varchar(50),
@bInit tinyint
AS

IF (@bInit = 1)
	INSERT INTO CURRENTUSER (strAccountID, strCharID, nServerNo, strServerIP, strClientIP) VALUES (@strAccountID, @strCharID, @nServerno, @strServerIP, @strClientIP)
ELSE
	UPDATE CURRENTUSER SET nServerNo = @nServerno, strServerIP = @strServerIP WHERE strAccountID = @strAccountID

RETURN 1
GO