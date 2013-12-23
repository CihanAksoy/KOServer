IF (EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ACCOUNT_LOGOUT') AND type in (N'P', N'PC')))
    DROP PROCEDURE ACCOUNT_LOGOUT;
GO

IF (EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'MAIN_LOGIN') AND type in (N'P', N'PC')))
    DROP PROCEDURE MAIN_LOGIN;
GO

IF (EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'CLEAR_REMAIN_USERS') AND type in (N'P', N'PC')))
    DROP PROCEDURE CLEAR_REMAIN_USERS;
GO
-- =============================================
-- Author:		katanatr
-- Create date: 2013-12-23
-- Description:	Initial account DB changes
-- =============================================
CREATE PROCEDURE ACCOUNT_LOGOUT
@strAccountID varchar(21),
@nRet smallint OUTPUT
AS

DELETE FROM CURRENTUSER WHERE strAccountID = @strAccountID
SET @nRet = 1
GO

CREATE PROCEDURE MAIN_LOGIN
@strAccountID varchar(21),
@strPassword varchar(28),
@nRet smallint OUTPUT
AS

DECLARE @Password varchar(32)

SELECT @Password = strPasswd FROM TB_USER WHERE strAccountID = @strAccountID

/* Auto-registration, easiest for testing because of encryption scheme. */
IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO TB_USER (strAccountID, strPasswd) VALUES (@strAccountID, @strPassword)
	/* Successful. */
	SET @nRet = 1
	RETURN
END
ELSE IF (@Password != @strPassword)
BEGIN
	/* Invalid password. */
	SET @nRet = 3
	RETURN
END
/* Successful. */
SET @nRet = 1
GO

CREATE PROCEDURE CLEAR_REMAIN_USERS
@strServerIP varchar(50)
AS

DELETE FROM CURRENTUSER WHERE strServerIP = @strServerIP
GO