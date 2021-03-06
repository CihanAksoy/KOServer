SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		katanatr
-- Create date: 2014-01-14
-- Description:	Game DB Script.
-- =============================================
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ACCOUNT_CHAR')
    DROP TABLE ACCOUNT_CHAR;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ITEM_OP')
    DROP TABLE ITEM_OP;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'KNIGHTS')
    DROP TABLE KNIGHTS;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'KNIGHTS_CAPE')
    DROP TABLE KNIGHTS_CAPE;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'KNIGHTS_USER')
    DROP TABLE KNIGHTS_USER;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'MAIL_BOX')
    DROP TABLE MAIL_BOX;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'MONSTER_CHALLENGE')
    DROP TABLE MONSTER_CHALLENGE;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'MONSTER_CHALLENGE_SUMMON_LIST')
    DROP TABLE MONSTER_CHALLENGE_SUMMON_LIST;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'MONSTER_RESPAWN_LIST')
    DROP TABLE MONSTER_RESPAWN_LIST;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'MONSTER_RESPAWN_LIST_INFORMATION')
    DROP TABLE MONSTER_RESPAWN_LIST_INFORMATION;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'MONSTER_SUMMON_LIST')
    DROP TABLE MONSTER_SUMMON_LIST;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'MONSTER_SUMMON_LIST_ZONE')
    DROP TABLE MONSTER_SUMMON_LIST_ZONE;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PREMIUM_ITEM')
    DROP TABLE PREMIUM_ITEM;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'PREMIUM_ITEM_EXP')
    DROP TABLE PREMIUM_ITEM_EXP;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'QUEST_HELPER')
    DROP TABLE QUEST_HELPER;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'QUEST_MONSTER')
    DROP TABLE QUEST_MONSTER;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SEALED_ITEMS')
    DROP TABLE SEALED_ITEMS;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SET_ITEM')
    DROP TABLE SET_ITEM;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'START_POSITION_RANDOM')
    DROP TABLE START_POSITION_RANDOM;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'USER_DAILY_OP')
    DROP TABLE USER_DAILY_OP;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'USERDATA')
    DROP TABLE USERDATA;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'WAREHOUSE')
    DROP TABLE WAREHOUSE;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'GAME_LOGIN') AND type in (N'P', N'PC'))
    DROP PROCEDURE GAME_LOGIN;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'NATION_SELECT') AND type in (N'P', N'PC'))
    DROP PROCEDURE NATION_SELECT;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'CREATE_NEW_CHAR') AND type in (N'P', N'PC'))
    DROP PROCEDURE CREATE_NEW_CHAR;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'CHANGE_HAIR') AND type in (N'P', N'PC'))
    DROP PROCEDURE CHANGE_HAIR;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'LOAD_USER_DATA') AND type in (N'P', N'PC'))
    DROP PROCEDURE LOAD_USER_DATA;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'USER_ITEM_SEAL') AND type in (N'P', N'PC'))
    DROP PROCEDURE USER_ITEM_SEAL;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'INSERT_FRIEND_LIST') AND type in (N'P', N'PC'))
    DROP PROCEDURE INSERT_FRIEND_LIST;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'DELETE_FRIEND_LIST') AND type in (N'P', N'PC'))
    DROP PROCEDURE DELETE_FRIEND_LIST;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'UPDATE_USER_DATA') AND type in (N'P', N'PC'))
    DROP PROCEDURE UPDATE_USER_DATA;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'CREATE_KNIGHTS') AND type in (N'P', N'PC'))
    DROP PROCEDURE CREATE_KNIGHTS;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'UPDATE_KNIGHTS') AND type in (N'P', N'PC'))
    DROP PROCEDURE UPDATE_KNIGHTS;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'DELETE_KNIGHTS') AND type in (N'P', N'PC'))
    DROP PROCEDURE DELETE_KNIGHTS;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'DONATE_CLAN_POINTS') AND type in (N'P', N'PC'))
    DROP PROCEDURE DONATE_CLAN_POINTS;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'MAIL_BOX_CHECK_COUNT') AND type in (N'P', N'PC'))
    DROP PROCEDURE MAIL_BOX_CHECK_COUNT;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'MAIL_BOX_REQUEST_LIST') AND type in (N'P', N'PC'))
    DROP PROCEDURE MAIL_BOX_REQUEST_LIST;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'MAIL_BOX_SEND') AND type in (N'P', N'PC'))
    DROP PROCEDURE MAIL_BOX_SEND;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'MAIL_BOX_READ') AND type in (N'P', N'PC'))
    DROP PROCEDURE MAIL_BOX_READ;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'MAIL_BOX_GET_ITEM') AND type in (N'P', N'PC'))
    DROP PROCEDURE MAIL_BOX_GET_ITEM;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'INSERT_USER_DAILY_OP') AND type in (N'P', N'PC'))
    DROP PROCEDURE INSERT_USER_DAILY_OP;
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'UPDATE_USER_DAILY_OP') AND type in (N'P', N'PC'))
    DROP PROCEDURE UPDATE_USER_DAILY_OP;
GO

ALTER TABLE MAGIC ADD UseStanding tinyint NOT NULL DEFAULT 0
GO

CREATE TABLE ACCOUNT_CHAR(
	strAccountID char(21) NOT NULL,
	bNation tinyint NOT NULL,
	bCharNum tinyint NOT NULL DEFAULT 0,
	strCharID1 char(21) NULL,
	strCharID2 char(21) NULL,
	strCharID3 char(21) NULL
)
GO

CREATE TABLE ITEM_OP(
	nItemID int NOT NULL,
	bTriggerType tinyint NOT NULL,
	nSkillID int NOT NULL,
	bTriggerRate tinyint NOT NULL
)
GO

CREATE TABLE KNIGHTS(
	IDNum smallint NOT NULL,
	Flag tinyint NOT NULL,
	Nation tinyint NOT NULL,
	Ranking tinyint NOT NULL DEFAULT 0,
	IDName char(21) NOT NULL,
	Members smallint NOT NULL DEFAULT 1,
	Chief char(21) NOT NULL,
	ViceChief_1 char(21) NULL,
	ViceChief_2 char(21) NULL,
	ViceChief_3 char(21) NULL,
	Gold bigint NOT NULL DEFAULT 0,
	Domination smallint NOT NULL DEFAULT 0,
	Points int NOT NULL DEFAULT 0,
	Mark image NULL,
	sMarkVersion smallint NOT NULL DEFAULT 0,
	sMarkLen smallint NOT NULL DEFAULT 0,
	sCape smallint NOT NULL DEFAULT -1,
	bCapeR tinyint NOT NULL DEFAULT 0,
	bCapeG tinyint NOT NULL DEFAULT 0,
	bCapeB tinyint NOT NULL DEFAULT 0,
	sAllianceKnights smallint NOT NULL DEFAULT 0,
	ClanPointFund int NOT NULL DEFAULT 0,
	strClanNotice char(128) NULL,
	ClanPointMethod tinyint NOT NULL DEFAULT 0,
	dtCreateTime datetime NOT NULL DEFAULT GETDATE()
)
GO

CREATE TABLE KNIGHTS_CAPE(
	sCapeIndex smallint NOT NULL,
	strName char(30) NOT NULL,
	nBuyPrice int NOT NULL,
	nDuration int NOT NULL,
	byGrade tinyint NOT NULL,
	nBuyLoyalty int NOT NULL,
	byRanking tinyint NOT NULL
)
GO

CREATE TABLE KNIGHTS_USER(
	sIDNum smallint NOT NULL,
	strUserID char(21) NOT NULL,
	nDonatedNP int NOT NULL DEFAULT 0
)

GO

CREATE TABLE MAIL_BOX(
	nLetterID int IDENTITY(1,1) NOT NULL,
	dtSendDate datetime NOT NULL DEFAULT GETDATE(),
	dtReadDate datetime NULL,
	bStatus tinyint NOT NULL DEFAULT 1,
	strSenderID char(21) NOT NULL,
	strRecipientID char(21) NOT NULL,
	strSubject char(31) NOT NULL,
	strMessage char(128) NOT NULL,
	bType tinyint NOT NULL DEFAULT 1,
	nItemID int NOT NULL DEFAULT 0,
	sCount smallint NOT NULL DEFAULT 0,
	sDurability smallint NOT NULL DEFAULT 0,
	nSerialNum bigint NOT NULL DEFAULT 0,
	nCoins int NOT NULL DEFAULT 0,
	bDeleted bit NOT NULL DEFAULT 0,
PRIMARY KEY CLUSTERED 
(
	nLetterID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
)
GO

CREATE TABLE MONSTER_CHALLENGE(
	sIndex smallint NOT NULL,
	bStartTime1 tinyint NOT NULL,
	bStartTime2 tinyint NOT NULL,
	bStartTime3 tinyint NOT NULL,
	bLevelMin tinyint NOT NULL,
	bLevelMax tinyint NOT NULL
)
GO

CREATE TABLE MONSTER_CHALLENGE_SUMMON_LIST(
	sIndex smallint NOT NULL,
	bLevel tinyint NOT NULL,
	bStage tinyint NOT NULL,
	bStageLevel tinyint NOT NULL,
	sTime smallint NOT NULL,
	sSid smallint NOT NULL,
	strName varchar(50) NULL,
	sCount smallint NOT NULL,
	sPosX smallint NOT NULL,
	sPosZ smallint NOT NULL,
	bRange tinyint NOT NULL
)
GO

CREATE TABLE MONSTER_RESPAWN_LIST(
	sIndex smallint NOT NULL,
	sSid smallint NOT NULL,
	sCount smallint NOT NULL
)
GO

CREATE TABLE MONSTER_RESPAWN_LIST_INFORMATION(
	sIndex smallint NULL,
	sSid smallint NULL,
	ZoneID tinyint NULL,
	bType tinyint NULL,
	X smallint NULL,
	Y smallint NULL,
	Z smallint NULL,
	sCount smallint NULL,
	bRadius tinyint NULL
)
GO

CREATE TABLE MONSTER_SUMMON_LIST(
	sSid smallint NOT NULL,
	strName varchar(30) NULL,
	sLevel smallint NOT NULL,
	sProbability smallint NOT NULL,
	bType tinyint NOT NULL
)
GO

CREATE TABLE MONSTER_SUMMON_LIST_ZONE(
	nIndex int NOT NULL,
	ZoneID smallint NOT NULL,
	sSid smallint NOT NULL,
	strName varchar(50) NULL,
	byFamily tinyint NOT NULL
)
GO

CREATE TABLE PREMIUM_ITEM(
	[Type] tinyint NOT NULL,
	ExpRestorePercent smallint NOT NULL,
	NoahPercent smallint NOT NULL,
	DropPercent smallint NOT NULL,
	BonusLoyalty int NOT NULL,
	RepairDiscountPercent smallint NOT NULL,
	ItemSellPercent smallint NOT NULL
)
GO

CREATE TABLE PREMIUM_ITEM_EXP(
	nIndex smallint NOT NULL,
	[Type] tinyint NOT NULL,
	MinLevel tinyint NOT NULL,
	MaxLevel tinyint NOT NULL,
	sPercent smallint NOT NULL
)
GO

CREATE TABLE QUEST_HELPER(
	nIndex int NOT NULL,
	bMessageType tinyint NOT NULL,
	bLevel tinyint NOT NULL,
	nExp int NOT NULL,
	bClass tinyint NOT NULL,
	bNation tinyint NOT NULL,
	bQuestType tinyint NOT NULL,
	bZone tinyint NOT NULL,
	sNpcId smallint NOT NULL,
	sEventDataIndex smallint NOT NULL,
	bEventStatus tinyint NOT NULL,
	nEventTriggerIndex int NOT NULL,
	nEventCompleteIndex int NOT NULL,
	nExchangeIndex int NOT NULL,
	nEventTalkIndex int NOT NULL,
	strLuaFilename char(40) NOT NULL
)
GO

CREATE TABLE QUEST_MONSTER(
	sQuestNum smallint NOT NULL,
	sNum1a smallint NOT NULL,
	sNum1b smallint NOT NULL,
	sNum1c smallint NOT NULL,
	sNum1d smallint NOT NULL,
	sCount1 smallint NOT NULL,
	sNum2a smallint NOT NULL,
	sNum2b smallint NOT NULL,
	sNum2c smallint NOT NULL,
	sNum2d smallint NOT NULL,
	sCount2 smallint NOT NULL,
	sNum3a smallint NOT NULL,
	sNum3b smallint NOT NULL,
	sNum3c smallint NOT NULL,
	sNum3d smallint NOT NULL,
	sCount3 smallint NOT NULL,
	sNum4a smallint NOT NULL,
	sNum4b smallint NOT NULL,
	sNum4c smallint NOT NULL,
	sNum4d smallint NOT NULL,
	sCount4 smallint NOT NULL
)
GO

CREATE TABLE SEALED_ITEMS(
	ID int IDENTITY(1,1) NOT NULL,
	strAccountID char(21) NOT NULL,
	strUserID char(21) NOT NULL,
	nItemSerial bigint NOT NULL,
	nItemID int NOT NULL,
	bSealType tinyint NOT NULL,
 PRIMARY KEY CLUSTERED 
(
	ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
)
GO

CREATE TABLE SET_ITEM(
	SetIndex int NOT NULL,
	SetName varchar(50) NULL,
	ACBonus smallint NOT NULL,
	HPBonus smallint NOT NULL,
	MPBonus smallint NOT NULL,
	StrengthBonus smallint NOT NULL,
	StaminaBonus smallint NOT NULL,
	DexterityBonus smallint NOT NULL,
	IntelBonus smallint NOT NULL,
	CharismaBonus smallint NOT NULL,
	FlameResistance smallint NOT NULL,
	GlacierResistance smallint NOT NULL,
	LightningResistance smallint NOT NULL,
	PoisonResistance smallint NOT NULL,
	MagicResistance smallint NOT NULL,
	CurseResistance smallint NOT NULL,
	XPBonusPercent smallint NOT NULL,
	CoinBonusPercent smallint NOT NULL,
	APBonusPercent smallint NOT NULL,
	APBonusClassType smallint NOT NULL,
	APBonusClassPercent smallint NOT NULL,
	ACBonusClassType smallint NOT NULL,
	ACBonusClassPercent smallint NOT NULL,
	MaxWeightBonus smallint NOT NULL,
	NPBonus tinyint NOT NULL,
	Unk10 tinyint NOT NULL,
	Unk11 tinyint NOT NULL,
	Unk12 tinyint NOT NULL,
	Unk13 tinyint NOT NULL,
	Unk14 tinyint NOT NULL,
	Unk15 tinyint NOT NULL,
	Unk16 tinyint NOT NULL,
	Unk17 tinyint NOT NULL,
	Unk18 tinyint NOT NULL,
	Unk19 tinyint NOT NULL,
	Unk20 tinyint NOT NULL,
	Unk21 tinyint NOT NULL
)
GO

CREATE TABLE START_POSITION_RANDOM(
	ZoneID tinyint NULL,
	PosX smallint NULL,
	PosZ smallint NULL,
	Radius tinyint NULL
)
GO

CREATE TABLE USER_DAILY_OP(
	strUserID char(21) NOT NULL,
	ChaosMapTime int NOT NULL,
	UserRankRewardTime int NOT NULL,
	PersonalRankRewardTime int NOT NULL,
	KingWingTime int NOT NULL,
	WarderKillerTime1 int NOT NULL,
	WarderKillerTime2 int NOT NULL,
	KeeperKillerTime int NOT NULL,
	UserLoyaltyWingRewardTime int NOT NULL
)
GO

CREATE TABLE USERDATA(
	strUserID char(21) NOT NULL,
	Nation tinyint NOT NULL,
	Race tinyint NOT NULL,
	Class smallint NOT NULL,
	HairRGB int NOT NULL,
	[Rank] tinyint NOT NULL DEFAULT 0,
	Title tinyint NOT NULL DEFAULT 0,
	[Level] tinyint NOT NULL DEFAULT 1,
	[Exp] bigint NOT NULL DEFAULT 0,
	Loyalty int NOT NULL DEFAULT 100,
	Face tinyint NOT NULL,
	City tinyint NOT NULL DEFAULT 0,
	Knights smallint NOT NULL DEFAULT 0,
	Fame tinyint NOT NULL DEFAULT 0,
	Hp smallint NOT NULL DEFAULT 100,
	Mp smallint NOT NULL DEFAULT 100,
	Sp smallint NOT NULL DEFAULT 100,
	Strong tinyint NOT NULL,
	Sta tinyint NOT NULL,
	Dex tinyint NOT NULL,
	Intel tinyint NOT NULL,
	Cha tinyint NOT NULL,
	Authority tinyint NOT NULL DEFAULT 1,
	Points smallint NOT NULL DEFAULT 0,
	Gold int NOT NULL DEFAULT 0,
	Zone tinyint NOT NULL DEFAULT 21,
	Bind smallint NULL,
	PX int NOT NULL DEFAULT 81590,
	PZ int NOT NULL DEFAULT 53079,
	PY int NOT NULL DEFAULT 469,
	dwTime int NOT NULL DEFAULT 0,
	strSkill varchar(10) NULL,
	strItem binary(584) NULL,
	strSerial binary(584) NULL,
	sQuestCount smallint NOT NULL DEFAULT 0,
	strQuest binary(600) NULL,
	MannerPoint int NOT NULL DEFAULT 0,
	LoyaltyMonthly int NOT NULL DEFAULT 0,
	dtCreateTime datetime NOT NULL DEFAULT GETDATE(),
	dtUpdateTime datetime NULL
)
GO

CREATE TABLE WAREHOUSE(
	strAccountID char(21) NOT NULL,
	nMoney int NOT NULL DEFAULT 0,
	dwTime int NOT NULL DEFAULT 0,
	WarehouseData binary(1536) NULL,
	strSerial binary(1536) NULL
)
GO

CREATE PROCEDURE GAME_LOGIN
@strAccountID varchar(21),
@strPasswd varchar(28)
AS

DECLARE @bNation tinyint
DECLARE @strHashPassword varchar(28)

SELECT @strHashPassword = strPasswd FROM TB_USER WHERE strAccountID = @strAccountID

IF (@@ROWCOUNT = 0)
	RETURN -1
ELSE IF (@strHashPassword <> @strPasswd)
	RETURN -1

SELECT @bNation = bNation FROM ACCOUNT_CHAR WHERE strAccountID = @strAccountID

IF (@@ROWCOUNT = 0)
	RETURN 0

RETURN @bNation
GO

CREATE PROCEDURE NATION_SELECT
@strAccountID varchar(21),
@bNation tinyint
AS

DECLARE @bCount tinyint

BEGIN TRAN
	SELECT @bCount = COUNT(strAccountID) FROM ACCOUNT_CHAR WHERE strAccountID = @strAccountID

	IF (@bCount = 0)
		INSERT INTO ACCOUNT_CHAR (strAccountID, bNation) VALUES (@strAccountID, @bNation)

	SELECT @bCount = COUNT(strAccountID) FROM WAREHOUSE WHERE strAccountID = @strAccountID

	IF (@bCount = 0)
		INSERT INTO WAREHOUSE (strAccountID, nMoney, dwTime, WarehouseData, strSerial) VALUES (@strAccountID, 0, 0, 0x00, 0x00)

	IF (@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN
		RETURN 0
	END
COMMIT TRAN

RETURN @bNation
GO

CREATE PROCEDURE CREATE_NEW_CHAR
@strAccountID varchar(21),
@index tinyint,
@strCharID varchar(21),
@bRace tinyint,
@sClass smallint,
@nHair int,
@bFace tinyint,
@bStr tinyint,
@bSta tinyint,
@bDex tinyint,
@bIntel tinyint,
@bCha tinyint
AS

DECLARE @bNation tinyint
DECLARE @bCharCount tinyint
DECLARE @bCount tinyint

SELECT @bNation = bNation, @bCharCount = bCharNum FROM ACCOUNT_CHAR WHERE strAccountID = @strAccountID

IF (@bNation = 1 AND @bRace > 10)
	RETURN 2
ELSE IF (@bNation = 2 AND @bRace < 10)
	RETURN 2
ELSE IF (@bNation <> 1 AND @bNation <> 2)
	RETURN 2

SELECT @bCount = COUNT(strUserID) FROM USERDATA WHERE strUserID = @strCharID

IF (@bCount > 0)
	RETURN 3

BEGIN TRAN
	IF (@index = 0)
		UPDATE ACCOUNT_CHAR SET strCharID1 = @strCharID, bCharNum += 1 WHERE strAccountID = @strAccountID
	ELSE IF (@index = 1)
		UPDATE ACCOUNT_CHAR SET strCharID2 = @strCharID, bCharNum += 1 WHERE strAccountID = @strAccountID
	ELSE IF (@index = 2)
		UPDATE ACCOUNT_CHAR SET strCharID3 = @strCharID, bCharNum += 1 WHERE strAccountID = @strAccountID

	IF (@@ERROR <> 0 OR @@ROWCOUNT = 0)
	BEGIN
		ROLLBACK TRAN
		RETURN 4
	END

	INSERT INTO USERDATA (strUserID, Nation, Race, Class, HairRGB, Face, Strong, Sta, Dex, Intel, Cha) 
	VALUES (@strCharID, @bNation, @bRace, @sClass, @nHair, @bFace, @bStr, @bSta, @bDex, @bIntel, @bCha)

	IF (@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN
		RETURN 4
	END
COMMIT TRAN

RETURN 0
GO

CREATE PROCEDURE CHANGE_HAIR
@strAccountID varchar(21),
@strCharID varchar(21),
@bType tinyint,
@bFace tinyint,
@nHair int
AS

IF (NOT EXISTS(SELECT strAccountID FROM ACCOUNT_CHAR WHERE strAccountID = @strAccountID AND @strCharID IN(strCharID1, strCharID2, strCharID3)))
	RETURN 1

UPDATE USERDATA SET HairRGB = @nHair, Face = @bFace WHERE strUserID = @strCharID 

RETURN 0
GO

CREATE PROCEDURE LOAD_USER_DATA
@strAccountID varchar(21),
@strCharID varchar(21)
AS

DECLARE @strCharID1 varchar(21), @strCharID2 varchar(21), @strCharID3 varchar(21)

SELECT	@strCharID1 = ISNULL(strCharID1, ''), 
		@strCharID2 = ISNULL(strCharID2, ''), 
		@strCharID3 = ISNULL(strCharID3, '') 
FROM ACCOUNT_CHAR WHERE strAccountID = @strAccountID

IF (@strCharID NOT IN(@strCharID1, @strCharID2, @strCharID3))
	RETURN

SELECT Nation, Race, Class, HairRGB, [Rank], Title, [Level], [Exp], Loyalty, Face, City, Knights, Fame, Hp, Mp, Sp, Strong, Sta, Dex, Intel, Cha, Authority, Points, Gold, Zone, Bind, PX, PZ, PY, dwTime, strSkill, strItem,strSerial, sQuestCount, strQuest, MannerPoint, LoyaltyMonthly FROM USERDATA WHERE strUserID = @strCharID
GO

CREATE PROCEDURE USER_ITEM_SEAL
@strAccountID char(21),
@strCharID char(21),
@strPasswd char(8),
@nItemSerial bigint,
@nItemID int,
@bSealType tinyint
AS

DECLARE @strSealPasswd char(8)

SELECT @strSealPasswd = strSealPasswd FROM TB_USER WHERE strAccountID = @strAccountID

IF (@bSealType < 3 AND @strSealPasswd <> @strPasswd)
BEGIN
	RETURN 4
END
ELSE
BEGIN
	IF (@bSealType = 1 OR @bSealType = 3)
		INSERT INTO SEALED_ITEMS (strAccountID, strUserID, nItemSerial, nItemID, bSealType) VALUES (@strAccountID, @strCharID, @nItemSerial, @nItemID, @bSealType)
	ELSE IF (@bSealType = 2)
		DELETE FROM SEALED_ITEMS WHERE strAccountID = @strAccountID AND strUserID = @strCharID AND nItemSerial = @nItemSerial AND nItemID = @nItemID

	RETURN 1
END

RETURN 2
GO

CREATE PROCEDURE INSERT_FRIEND_LIST
@strUserID char(21),
@strFriend char(21)
AS

DECLARE @strFriend1 char(21), @strFriend2 char(21), @strFriend3 char(21), @strFriend4 char(21), @strFriend5 char(21), @strFriend6 char(21)
DECLARE @strFriend7 char(21), @strFriend8 char(21), @strFriend9 char(21), @strFriend10 char(21), @strFriend11 char(21), @strFriend12 char(21)
DECLARE @strFriend13 char(21), @strFriend14 char(21), @strFriend15 char(21), @strFriend16 char(21), @strFriend17 char(21), @strFriend18 char(21)
DECLARE @strFriend19 char(21), @strFriend20 char(21), @strFriend21 char(21), @strFriend22 char(21), @strFriend23 char(21), @strFriend24 char(21) 

SELECT	@strFriend1 = strFriend1, @strFriend2 = strFriend2,@strFriend3 = strFriend3,@strFriend4 = strFriend4,
		@strFriend5 = strFriend5, @strFriend6 = strFriend6,@strFriend7 = strFriend7,@strFriend8 = strFriend8,
		@strFriend9 = strFriend9, @strFriend10 = strFriend10,@strFriend11 = strFriend11,@strFriend12 = strFriend12,
		@strFriend13 = strFriend13, @strFriend14 = strFriend14,@strFriend15 = strFriend15,@strFriend16 = strFriend16,
		@strFriend17 = strFriend17, @strFriend18 = strFriend18,@strFriend19 = strFriend19,@strFriend20 = strFriend20,
		@strFriend21 = strFriend21, @strFriend22 = strFriend22,@strFriend23 = strFriend23,@strFriend24 = strFriend24 
		FROM FRIEND_LIST WHERE strUserID = @strUserID

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO FRIEND_LIST (strUserID, strFriend1) VALUES (@strUserID, @strFriend)
	IF (@@ERROR <> 0)
		RETURN 1

	RETURN 0
END

IF (@strFriend1 IS NULL)
	UPDATE FRIEND_LIST SET strFriend1 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend2 IS NULL)
	UPDATE FRIEND_LIST SET strFriend2 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend3 IS NULL)
	UPDATE FRIEND_LIST SET strFriend3 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend4 IS NULL)
	UPDATE FRIEND_LIST SET strFriend4 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend5 IS NULL)
	UPDATE FRIEND_LIST SET strFriend5 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend6 IS NULL)
	UPDATE FRIEND_LIST SET strFriend6 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend7 IS NULL)
	UPDATE FRIEND_LIST SET strFriend7 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend8 IS NULL)
	UPDATE FRIEND_LIST SET strFriend8 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend9 IS NULL)
	UPDATE FRIEND_LIST SET strFriend9 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend10 IS NULL)
	UPDATE FRIEND_LIST SET strFriend10 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend11 IS NULL)
	UPDATE FRIEND_LIST SET strFriend11 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend12 IS NULL)
	UPDATE FRIEND_LIST SET strFriend12 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend13 IS NULL)
	UPDATE FRIEND_LIST SET strFriend13 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend14 IS NULL)
	UPDATE FRIEND_LIST SET strFriend14 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend15 IS NULL)
	UPDATE FRIEND_LIST SET strFriend15 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend16 IS NULL)
	UPDATE FRIEND_LIST SET strFriend16 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend17 IS NULL)
	UPDATE FRIEND_LIST SET strFriend17 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend18 IS NULL)
	UPDATE FRIEND_LIST SET strFriend18 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend19 IS NULL)
	UPDATE FRIEND_LIST SET strFriend19 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend20 IS NULL)
	UPDATE FRIEND_LIST SET strFriend20 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend21 IS NULL)
	UPDATE FRIEND_LIST SET strFriend21 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend22 IS NULL)
	UPDATE FRIEND_LIST SET strFriend22 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend23 IS NULL)
	UPDATE FRIEND_LIST SET strFriend23 = @strFriend WHERE strUserID = @strUserID
ELSE IF (@strFriend24 IS NULL)
	UPDATE FRIEND_LIST SET strFriend24 = @strFriend WHERE strUserID = @strUserID
ELSE
	RETURN 2

IF (@@ERROR <> 0)
	RETURN 1

RETURN 0
GO

CREATE PROCEDURE DELETE_FRIEND_LIST
@strUserID char(21),
@strFriend char(21)
AS

DECLARE @strFriend1 char(21), @strFriend2 char(21), @strFriend3 char(21), @strFriend4 char(21), @strFriend5 char(21), @strFriend6 char(21)
DECLARE @strFriend7 char(21), @strFriend8 char(21), @strFriend9 char(21), @strFriend10 char(21), @strFriend11 char(21), @strFriend12 char(21)
DECLARE @strFriend13 char(21), @strFriend14 char(21), @strFriend15 char(21), @strFriend16 char(21), @strFriend17 char(21), @strFriend18 char(21)
DECLARE @strFriend19 char(21), @strFriend20 char(21), @strFriend21 char(21), @strFriend22 char(21), @strFriend23 char(21), @strFriend24 char(21) 

SELECT	@strFriend1 = strFriend1, @strFriend2 = strFriend2,@strFriend3 = strFriend3,@strFriend4 = strFriend4,
		@strFriend5 = strFriend5, @strFriend6 = strFriend6,@strFriend7 = strFriend7,@strFriend8 = strFriend8,
		@strFriend9 = strFriend9, @strFriend10 = strFriend10,@strFriend11 = strFriend11,@strFriend12 = strFriend12,
		@strFriend13 = strFriend13, @strFriend14 = strFriend14,@strFriend15 = strFriend15,@strFriend16 = strFriend16,
		@strFriend17 = strFriend17, @strFriend18 = strFriend18,@strFriend19 = strFriend19,@strFriend20 = strFriend20,
		@strFriend21 = strFriend21, @strFriend22 = strFriend22,@strFriend23 = strFriend23,@strFriend24 = strFriend24 
		FROM FRIEND_LIST WHERE strUserID = @strUserID

IF (@@ROWCOUNT = 0)
	RETURN 1

IF (@strFriend1 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend1 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend2 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend2 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend3 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend3 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend4 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend4 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend5 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend5 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend6 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend6 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend7 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend7 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend8 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend8 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend9 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend9 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend10 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend10 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend11 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend11 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend12 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend12 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend13 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend13 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend14 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend14 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend15 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend15 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend16 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend16 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend17 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend17 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend18 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend18 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend19 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend19 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend20 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend20 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend21 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend21 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend22 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend22 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend23 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend23 = NULL WHERE strUserID = @strUserID
ELSE IF (@strFriend24 = @strFriend)
	UPDATE FRIEND_LIST SET strFriend24 = NULL WHERE strUserID = @strUserID
ELSE
	RETURN 2

IF (@@ERROR <> 0)
	RETURN 1

RETURN 0
GO

CREATE PROCEDURE UPDATE_USER_DATA
@strCharID char(21),
@bNation tinyint,
@bRace tinyint,
@sClass smallint,
@nHair int,
@bRank tinyint,
@bTitle tinyint,
@bLevel tinyint,
@iExp bigint,
@nLoyalty int,
@bFace tinyint,
@bCity tinyint,
@sClanID smallint,
@bFame tinyint,
@sHp smallint,
@sMp smallint,
@sSp smallint,
@bStr tinyint,
@bSta tinyint,
@bDex tinyint,
@bIntel tinyint,
@bCha tinyint,
@bAuthority tinyint,
@sPoints smallint,		
@nCoins int,
@bZone tinyint,
@sBind smallint,
@iPosX int,
@iPosZ int,
@iPosY int,
@dwTime int,
@sQuestCount smallint,
@strSkill varchar(10),
@strItem binary(584),
@strSerial binary(584),
@strQuest binary(600),
@nMannerPoint int,
@nLoyaltyMonthly int
AS

UPDATE USERDATA 
SET Nation			= @bNation, 
	Race			= @bRace, 
	Class			= @sClass, 
	HairRGB			= @nHair, 
	[Rank]			= @bRank, 
	Title			= @bTitle, 
	[Level]			= @bLevel, 
	[Exp]			= @iExp, 
	Loyalty			= @nLoyalty, 
	Face			= @bFace, 
	City			= @bCity, 
	Knights			= @sClanID, 
	Fame			= @bFame, 
	Hp				= @sHp, 
	Mp				= @sMp, 
	Sp				= @sSp, 
	Strong			= @bStr, 
	Sta				= @bSta, 
	Dex				= @bDex, 
	Intel			= @bIntel, 
	Cha				= @bCha, 
	Authority		= @bAuthority, 
	Points			= @sPoints, 
	Gold			= @nCoins, 
	[Zone]			= @bZone, 
	Bind			= @sBind, 
	PX				= @iPosX, 
	PZ				= @iPosZ, 
	PY				= @iPosY, 
	dwTime			= @dwTime, 
	strSkill		= @strSkill, 
	strItem			= @strItem, 
	strSerial		= @strSerial, 
	sQuestCount		= @sQuestCount, 
	strQuest		= @strQuest, 
	MannerPoint		= @nMannerPoint, 
	LoyaltyMonthly	= @nLoyaltyMonthly, 
	dtUpdateTime	= GETDATE() 
WHERE strUserID		= @strCharID
GO

CREATE PROCEDURE CREATE_KNIGHTS
@sClanID smallint,
@bNation tinyint,
@bFlag tinyint,
@strKnightsName char(21),
@strChief char(21)
AS

DECLARE @bCount tinyint

SELECT @bCount = COUNT(*) FROM KNIGHTS WHERE IDNum = @sClanID OR IDName = @strKnightsName

IF (@bCount > 0)
	RETURN 3

BEGIN TRAN
	INSERT INTO KNIGHTS (IDNum, Nation, Flag, IDName, Chief) VALUES (@sClanID, @bNation, @bFlag, @strKnightsName, @strChief)
	INSERT INTO KNIGHTS_USER (sIDNum, strUserID) VALUES (@sClanID, @strChief)

	IF (@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN
		RETURN 6
	END
COMMIT TRAN

RETURN 0
GO

CREATE PROCEDURE UPDATE_KNIGHTS
@bType tinyint,
@strCharID char(21),
@sClanID smallint,
@bDomination tinyint
AS

DECLARE @bCount tinyint
DECLARE @bMembers tinyint
DECLARE @bUserMembers tinyint
DECLARE @sKnights smallint
DECLARE @strViceChief1 char(21)
DECLARE @strViceChief2 char(21)
DECLARE @strViceChief3 char(21)

SELECT @bCount = COUNT(*) FROM KNIGHTS WHERE IDNum = @sClanID
IF (@bCount = 0)
	RETURN 7

SELECT @bMembers = Members, @strViceChief1 = ViceChief_1, @strViceChief2 = ViceChief_2, @strViceChief3 = ViceChief_3 FROM KNIGHTS WHERE IDNum = @sClanID
IF (@bType = 18)
BEGIN
	SELECT @bUserMembers = COUNT(*) FROM USERDATA WHERE Knights = @sClanID
	
	IF (@bMembers >= 36 OR @bUserMembers >= 36)
		RETURN 8
END
ELSE IF (@bMembers > 36)
	RETURN 8

SELECT @bCount = COUNT(*) FROM USERDATA WHERE strUserID = @strCharID
IF (@bCount = 0)
	RETURN 2

BEGIN TRAN
	IF (@bType = 18)
	BEGIN
		UPDATE KNIGHTS SET Members += 1 WHERE IDNum = @sClanID
		INSERT INTO KNIGHTS_USER (sIDNum, strUserID) VALUES (@sClanID, @strCharID)
		UPDATE USERDATA SET Knights = @sClanID WHERE strUserID = @strCharID
	END
	ELSE IF (@bType IN(19, 20, 23))
	BEGIN
		IF (@bMembers <= 1)
			UPDATE KNIGHTS SET Members = 1 WHERE IDNum = @sClanID
		ELSE
			UPDATE KNIGHTS SET Members -= 1 WHERE IDNum = @sClanID

		DELETE FROM KNIGHTS_USER WHERE strUserID = @strCharID
		
		IF (@strViceChief1 = @strCharID)
			UPDATE KNIGHTS SET ViceChief_1 = NULL WHERE IDNum = @sClanID	
		IF (@strViceChief2 = @strCharID)
			UPDATE KNIGHTS SET ViceChief_2 = NULL WHERE IDNum = @sClanID	
		IF (@strViceChief3 = @strCharID)
			UPDATE KNIGHTS SET ViceChief_3 = NULL WHERE IDNum = @sClanID	
	END
	ELSE IF (@bType = 25)
	BEGIN
		UPDATE KNIGHTS SET Chief = @strCharID WHERE IDNum = @sClanID
		
		IF (@strViceChief1 = @strCharID)
			UPDATE KNIGHTS SET ViceChief_1 = NULL WHERE IDNum = @sClanID
		IF (@strViceChief2 = @strCharID)
			UPDATE KNIGHTS SET ViceChief_2 = NULL WHERE IDNum = @sClanID
		IF (@strViceChief3 = @strCharID)
			UPDATE KNIGHTS SET ViceChief_3 = NULL WHERE IDNum = @sClanID
	END
	ELSE IF (@bType = 26)
	BEGIN
		IF (@strViceChief1 IS NOT NULL AND @strViceChief2 IS NOT NULL AND @strViceChief3 IS NOT NULL)
		BEGIN
			COMMIT TRAN
			RETURN 8
		END
		IF (@strViceChief1 IS NULL)
			UPDATE KNIGHTS SET ViceChief_1 = @strCharID WHERE IDNum = @sClanID
		ELSE IF (@strViceChief2 IS NULL)
			UPDATE KNIGHTS SET ViceChief_2 = @strCharID WHERE IDNum = @sClanID
		ELSE IF (@strViceChief3 IS NULL)
			UPDATE KNIGHTS SET ViceChief_3 = @strCharID WHERE IDNum = @sClanID
	END
	ELSE IF (@bType = 27)
		UPDATE KNIGHTS SET ViceChief_2 = @strCharID WHERE IDNum = @sClanID
	ELSE IF (@bType = 76)
		UPDATE KNIGHTS SET ClanPointMethod = @bDomination WHERE IDNum = @sClanID
	ELSE IF (@bType = 95)
	BEGIN
		UPDATE KNIGHTS SET Chief = @strCharID WHERE IDNum = @sClanID
		
		IF (@strViceChief1 = @strCharID)
			UPDATE KNIGHTS SET ViceChief_1 = NULL WHERE IDNum = @sClanID
		IF (@strViceChief2 = @strCharID)
			UPDATE KNIGHTS SET ViceChief_2 = NULL WHERE IDNum = @sClanID
		IF (@strViceChief3 = @strCharID)
			UPDATE KNIGHTS SET ViceChief_3 = NULL WHERE IDNum = @sClanID
	END

	IF (@@ERROR <> 0)
	BEGIN	 
		ROLLBACK TRAN
		RETURN 2
	END

	IF (@bType = 20)
	BEGIN
		UPDATE USERDATA SET Knights = -1, Fame = 0 WHERE strUserID = @strCharID
		DELETE FROM KNIGHTS_USER WHERE strUserID = @strCharID
	END
COMMIT TRAN

RETURN 0
GO

CREATE PROCEDURE DELETE_KNIGHTS
@sClanID smallint
AS

DECLARE @bCount tinyint

SELECT @bCount = COUNT(*) FROM KNIGHTS WHERE IDNum = @sClanID

IF (@bCount = 0)
	RETURN 7

BEGIN TRAN
	DELETE FROM KNIGHTS WHERE IDNum = @sClanID
	DELETE FROM KNIGHTS_USER WHERE sIDNum = @sClanID

	IF (@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN
		RETURN 7
	END

	UPDATE USERDATA SET Knights = 0, Fame = 0 WHERE Knights = @sClanID
COMMIT TRAN

RETURN 0
GO

CREATE PROCEDURE DONATE_CLAN_POINTS
@strUserID char(21),
@sClanID smallint,
@nNationalPoints int
AS

BEGIN TRAN
	UPDATE KNIGHTS SET ClanPointFund += @nNationalPoints WHERE IDNum = @sClanID
	IF (@@ERROR <> 0 OR @@ROWCOUNT = 0)
		GOTO ERROR

	UPDATE KNIGHTS_USER SET nDonatedNP += @nNationalPoints WHERE strUserID = @strUserID AND sIDNum = @sClanID
	IF (@@ERROR <> 0 OR @@ROWCOUNT = 0)
		GOTO ERROR
COMMIT TRAN
RETURN

ERROR: ROLLBACK TRAN
GO

CREATE PROCEDURE MAIL_BOX_CHECK_COUNT
@strRecipientID char(21)
AS

DECLARE @bCount tinyint

SELECT TOP 12 @bCount = COUNT(*) FROM MAIL_BOX WHERE strRecipientID = @strRecipientID AND bStatus = 1 AND bDeleted = 0

RETURN @bCount
GO

CREATE PROCEDURE MAIL_BOX_REQUEST_LIST
@strRecipientID char(21),
@bNewLettersOnly tinyint
AS

DECLARE @expiresInDays int = 7

IF (@bNewLettersOnly = 1)
	SELECT TOP 12 nLetterID, bStatus, bType, strSubject, strSenderID, bType, nItemID, sCount, nCoins, YEAR(dtSendDate) * 10000 + MONTH(dtSendDate) * 100 + DAY(dtSendDate), DATEDIFF(DD, GETDATE(), dtSendDate + @expiresInDays) FROM MAIL_BOX WHERE strRecipientID = @strRecipientID AND bStatus = 1 AND bDeleted = 0
ELSE
	SELECT TOP 20 nLetterID, bStatus, bType, strSubject, strSenderID, bType, nItemID, sCount, nCoins, YEAR(dtReadDate) * 10000 + MONTH(dtReadDate) * 100 + DAY(dtReadDate), DATEDIFF(DD, dtReadDate, GETDATE()) FROM MAIL_BOX WHERE strRecipientID = @strRecipientID AND bStatus = 2 AND bDeleted = 0

RETURN @@ROWCOUNT
GO

CREATE PROCEDURE MAIL_BOX_SEND
@strSenderID char(21),
@strRecipientID char(21),
@strSubject char(31),
@strMessage char(128),
@bType tinyint,
@nItemID int,
@sCount smallint,
@sDurability smallint,
@nSerialNum bigint
AS

IF (NOT EXISTS(SELECT strUserID FROM USERDATA WHERE strUserID = @strRecipientID))
	RETURN -1

INSERT INTO MAIL_BOX (strSenderID, strRecipientID, strSubject, strMessage, bType, nItemID, sCount, sDurability, nSerialNum) 
VALUES (@strSenderID, @strRecipientID, @strSubject, @strMessage, @bType, @nItemID, @sCount, @sDurability, @nSerialNum)

RETURN 1
GO

CREATE PROCEDURE MAIL_BOX_READ
@strRecipientID char(21),
@nLetterID int
AS

SELECT strMessage FROM MAIL_BOX WHERE strRecipientID = @strRecipientID AND nLetterID = @nLetterID
	
IF (@@ROWCOUNT != 0)
BEGIN
	UPDATE MAIL_BOX SET dtReadDate = GETDATE(), bStatus = 2 WHERE nLetterID = @nLetterID AND bType = 1 AND dtReadDate IS NULL
	UPDATE MAIL_BOX SET dtReadDate = GETDATE() WHERE nLetterID = @nLetterID AND bType = 2 AND dtReadDate IS NULL
END
GO

CREATE PROCEDURE MAIL_BOX_GET_ITEM
@strRecipientID char(21),
@nLetterID int
AS

SELECT nItemID, sCount, sDurability, nCoins, nSerialNum FROM MAIL_BOX WHERE nLetterID = @nLetterID AND strRecipientID = @strRecipientID AND bStatus = 1
UPDATE MAIL_BOX SET bStatus = 2 WHERE nLetterID = @nLetterID AND strRecipientID = @strRecipientID
GO

CREATE PROCEDURE INSERT_USER_DAILY_OP
@strCharID char(21),
@iChaosMapTime int,
@iUserRankRewardTime int,
@iPersonalRankRewardTime int,
@iKingWingTime int,
@iWarderKillerTime1 int,
@iWarderKillerTime2 int,
@iKeeperKillerTime int,
@iUserLoyaltyWingRewardTime int
AS

DELETE FROM USER_DAILY_OP WHERE strUserID = @strCharID
INSERT INTO USER_DAILY_OP (strUserID, ChaosMapTime, UserRankRewardTime, PersonalRankRewardTime, KingWingTime, WarderKillerTime1, WarderKillerTime2, KeeperKillerTime, UserLoyaltyWingRewardTime) VALUES (@strCharID, @iChaosMapTime, @iUserRankRewardTime, @iPersonalRankRewardTime, @iKingWingTime, @iWarderKillerTime1, @iWarderKillerTime2, @iKeeperKillerTime, @iUserLoyaltyWingRewardTime)
GO

CREATE PROCEDURE UPDATE_USER_DAILY_OP
@strCharID char(21),
@bType tinyint,
@iUnixTime int
AS

IF (@bType = 1)
	UPDATE USER_DAILY_OP SET ChaosMapTime = @iUnixTime WHERE strUserID = @strCharID
ELSE IF (@bType = 2)
	UPDATE USER_DAILY_OP SET UserRankRewardTime = @iUnixTime WHERE strUserID = @strCharID
ELSE IF (@bType = 3)
	UPDATE USER_DAILY_OP SET PersonalRankRewardTime = @iUnixTime WHERE strUserID = @strCharID
ELSE IF (@bType = 4)
	UPDATE USER_DAILY_OP SET KingWingTime = @iUnixTime WHERE strUserID = @strCharID
ELSE IF (@bType = 5)
	UPDATE USER_DAILY_OP SET WarderKillerTime1 = @iUnixTime WHERE strUserID = @strCharID
ELSE IF (@bType = 6)
	UPDATE USER_DAILY_OP SET WarderKillerTime2 = @iUnixTime WHERE strUserID = @strCharID
ELSE IF (@bType = 7)
	UPDATE USER_DAILY_OP SET KeeperKillerTime = @iUnixTime WHERE strUserID = @strCharID
ELSE IF (@bType = 8)
	UPDATE USER_DAILY_OP SET UserLoyaltyWingRewardTime = @iUnixTime WHERE strUserID = @strCharID
GO