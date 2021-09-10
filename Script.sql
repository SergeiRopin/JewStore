USE JewStore;
GO

---CREATE TABLES---
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'Sizes')
CREATE TABLE Sizes
(
	[ID]		INT				IDENTITY(1,1) PRIMARY KEY,
	[Size]		DECIMAL(5,1)	NOT NULL	DEFAULT(''),
	[mmNeed]	BIT				NOT NULL	DEFAULT(0),

	CONSTRAINT UC_Sizes_Size UNIQUE ([Size])
)

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'TypeOfProduct')
CREATE TABLE TypeOfProduct
(
	[ID]				INT				IDENTITY(1,1) PRIMARY KEY,
	[Type]				NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[IsWgh]				BIT				NOT NULL	DEFAULT(0),
	[IsGold]			BIT				NOT NULL	DEFAULT(0),
	[IsSilver]			BIT				NOT NULL	DEFAULT(0),
	[IsEnterprise]		BIT				NOT NULL	DEFAULT(0),
	[PriceField]		NVARCHAR(255)	NULL		DEFAULT(''),
	[QtyButWgh]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Rent]				NVARCHAR(255)	NULL		DEFAULT(''),
	[Pension]			NVARCHAR(255)	NULL		DEFAULT(''),
	[topGlobal]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Probe]				INT				NOT NULL	DEFAULT(''),
	[PricePerGramm]		DECIMAL(6,2)	NOT NULL	DEFAULT(0),
	[ObmPricePerGramm]	NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[ObmEnabled]		NVARCHAR(255)	NULL		DEFAULT(''),

	CONSTRAINT UC_TypeOfProduct UNIQUE ([Type])
)

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'Supplyer')
CREATE TABLE Supplyer
(
	[ID]				INT				IDENTITY(1,1) PRIMARY KEY,
	[SupplName]			NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[Profit]			NVARCHAR(255)	NULL		DEFAULT(''),
	[BarCodeHandler]	NVARCHAR(255)	NULL		DEFAULT(''),
	[Comission]			NVARCHAR(255)	NULL		DEFAULT(''),
	[UgSilv]			NVARCHAR(255)	NULL		DEFAULT(''),
	[UgGold]			NVARCHAR(255)	NULL		DEFAULT(''),
	[SilvObmWgh]		NVARCHAR(255)	NULL		DEFAULT(''),
	[IsNDS]				BIT				NOT NULL	DEFAULT(0),
	[Directory]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Mark]				NVARCHAR(255)	NULL		DEFAULT(''),
	[Address]			NVARCHAR(255)	NULL		DEFAULT(''),
	[EDRPOU]			NVARCHAR(255)	NULL		DEFAULT(''),
	[LicenseNum]		NVARCHAR(255)	NULL		DEFAULT(''),
	[IsImport]			BIT				NOT NULL	DEFAULT(0),

	CONSTRAINT UC_Supplyer_Name UNIQUE ([SupplName])
)

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'CG')
CREATE TABLE CG
(
	[ID]				INT				IDENTITY(1,1) PRIMARY KEY,
	[GrpNum]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Description]		NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[Price]				DECIMAL(6,2)	NOT NULL	DEFAULT(0),
	[Price2]			DECIMAL(6,2)	NOT NULL	DEFAULT(0),
	[Price3]			DECIMAL(6,2)	NOT NULL	DEFAULT(0),
	[Price4]			DECIMAL(6,2)	NOT NULL	DEFAULT(0),
	[Price5]			DECIMAL(6,2)	NULL		DEFAULT(0),
	[ObmPrice1]			DECIMAL(6,2)	NULL		DEFAULT(0),
	[ObmPrice2]			DECIMAL(6,2)	NULL		DEFAULT(0),
	[ObmPrice3]			DECIMAL(6,2)	NULL		DEFAULT(0),
	[ObmPrice4]			DECIMAL(6,2)	NULL		DEFAULT(0),
	[ObmPrice5]			DECIMAL(6,2)	NULL		DEFAULT(0)

	CONSTRAINT UC_CG_Description UNIQUE ([Description])
)

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'Category')
CREATE TABLE Category
(
	[Id]			INT				IDENTITY(1,1) PRIMARY KEY,
	[CategoryName]	NVARCHAR(256)	NOT NULL	DEFAULT(''),

	CONSTRAINT UC_Category_Name UNIQUE ([CategoryName])
)

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'Products')
CREATE TABLE Products
(
	[ID]				INT				IDENTITY(1,1) PRIMARY KEY,
	[Group]				INT				NULL		DEFAULT(0),
	[ArtNum]			NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[ProductName]		NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[Wgh_ug]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Price]				DECIMAL(8,2)	NOT NULL	DEFAULT(0),
	[PerGramm]			INT				NULL		DEFAULT(0),
	[SilvPerGramm]		NVARCHAR(255)	NULL		DEFAULT(''),
	[ObmPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
	[ObmPerGramm]		NVARCHAR(255)	NULL		DEFAULT(''),
	[Category]			INT				NOT NULL	DEFAULT(0),
	[CategorySub]		NVARCHAR(255)	NULL		DEFAULT(''),
	[UgSilv]			NVARCHAR(255)	NULL		DEFAULT(''),
	[UgGold]			NVARCHAR(255)	NULL		DEFAULT(''),
	[NotForOrder]		BIT				NULL		DEFAULT(0),
	[OrderIt]			NVARCHAR(255)	NULL		DEFAULT('')

	CONSTRAINT FK_ProductsCategory_CategoryID FOREIGN KEY ([Category]) REFERENCES Category([ID]),
)
CREATE NONCLUSTERED INDEX IX_Products_ArtNum ON dbo.Products([ArtNum])
CREATE NONCLUSTERED INDEX IX_Products_Group ON dbo.Products([Group])
CREATE NONCLUSTERED INDEX IX_Products_Category ON dbo.Products([Category])

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'Clients')
CREATE TABLE Clients
(
	[ID]				INT				IDENTITY(1,1) PRIMARY KEY,
	[ClientsName]		NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[Address]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Phone]				NVARCHAR(255)	NULL		DEFAULT(''),
	[Fax]				NVARCHAR(255)	NULL		DEFAULT(''),
	[EMail]				NVARCHAR(255)	NULL		DEFAULT(''),
	[ContactW]			NVARCHAR(255)	NULL		DEFAULT(''),
	[IPN]				NVARCHAR(255)	NULL		DEFAULT(''),
	[Discount]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Data]				NVARCHAR(255)	NULL		DEFAULT(''),
	[IsShop]			BIT				NULL		DEFAULT(0),
	[LicenseNum]		NVARCHAR(255)	NULL		DEFAULT(''),
	[LicenseValid]		NVARCHAR(255)	NULL		DEFAULT(''),
	[BirkNum]			NVARCHAR(255)	NULL		DEFAULT(''),
	[License]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Reg]				NVARCHAR(255)	NULL		DEFAULT(''),
	[NetPath]			NVARCHAR(255)	NULL		DEFAULT(''),

	CONSTRAINT UC_Clients_ClientsName UNIQUE ([ClientsName])
)
CREATE NONCLUSTERED INDEX IX_Clients_ClientsName ON dbo.Clients([ClientsName])

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'Actions')
CREATE TABLE Actions
(
	[ID]				INT				PRIMARY KEY,
	[Name]				NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[NamePrint]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Kfc]				NVARCHAR(255)	NULL		DEFAULT(''),
	[IsObm]				BIT				NULL		DEFAULT(0),
	[NotActive]			NVARCHAR(255)	NULL		DEFAULT(''),
	[RepSuffix]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Rash]				BIT				NOT NULL	DEFAULT(0),
	[Qty]				INT				NULL		DEFAULT(0)
)
CREATE NONCLUSTERED INDEX IX_Actions_Name ON dbo.Actions([Name])

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'MovementsHistoryINFO')
CREATE TABLE MovementsHistoryINFO
(
	[ID]				INT				IDENTITY(1,1) PRIMARY KEY,
	[OriginalID]		NVARCHAR(255)	NULL		DEFAULT(''),
	[SupplID]			INT				NOT NULL	DEFAULT(0),
	[ClientID]			INT				NOT NULL	DEFAULT(0),
	[Data]				DATE			NULL,					-------------------------
	[DocNum]			INT				NOT NULL	DEFAULT(0),
	[Status]			INT				NOT NULL	DEFAULT(0),
	[Locked]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Comments]			NVARCHAR(255)	NULL		DEFAULT(''),
	[RTT]				NVARCHAR(255)	NULL		DEFAULT(''),
	[PriceType]			INT				NOT NULL	DEFAULT(0),
	[RetQty]			INT				NULL		DEFAULT(0),
	[RetWgh]			NVARCHAR(255)	NULL		DEFAULT(''),
	[RetSumm]			NVARCHAR(255)	NULL		DEFAULT(''),
	[AccMetall]			NVARCHAR(255)	NULL		DEFAULT(''),
	[AccMoney]			NVARCHAR(255)	NULL		DEFAULT(''),
	[DutyToDate]		NVARCHAR(255)	NULL		DEFAULT(''),
	[DutySumm]			NVARCHAR(255)	NULL		DEFAULT(''),
	[IsPoz]				INT				NULL		DEFAULT(0),
	[Discount]			NVARCHAR(255)	NULL		DEFAULT(''),

	CONSTRAINT FK_MovementsHistoryINFOStatus_ActionsID FOREIGN KEY ([Status]) REFERENCES Actions([ID]),
	CONSTRAINT FK_MovementsHistoryINFOClientID_ClientID FOREIGN KEY ([ClientID]) REFERENCES Clients([ID])
)
CREATE NONCLUSTERED INDEX IX_MovementsHistoryINFO_Status ON dbo.MovementsHistoryINFO([Status])
CREATE NONCLUSTERED INDEX IX_MovementsHistoryINFO_ClientID ON dbo.MovementsHistoryINFO([ClientID])
CREATE NONCLUSTERED INDEX IX_MovementsHistoryINFO_DocNum ON dbo.MovementsHistoryINFO([DocNum])
CREATE NONCLUSTERED INDEX IX_MovementsHistoryINFO_Data ON dbo.MovementsHistoryINFO([Data])

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'Discounts')
CREATE TABLE Discounts
(
	[ProdID]			BIGINT			PRIMARY KEY,
	[PrimSum]			DECIMAL(8,2)	NULL		DEFAULT(0),
	[SaleSum]			DECIMAL(8,2)	NULL		DEFAULT(0),
	[Comments]			NVARCHAR(255)	NULL		DEFAULT(''),
	[CardID]			INT				NULL		DEFAULT(0),
	[IsObm]				BIT				NOT NULL	DEFAULT(0),
	[SaleManID]			INT				NULL		DEFAULT(0),
	[ObmSum]			DECIMAL(8,2)	NULL		DEFAULT(0),

	CONSTRAINT UC_Discounts_ProdID UNIQUE ([ProdID])
)

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'DiamondChars')
CREATE TABLE DiamondChars
(
	[ID]				BIGINT			PRIMARY KEY,
	[Description]		NVARCHAR(255)	NULL		DEFAULT(''),
	[IsDiamond]			BIT				NOT NULL	DEFAULT(0),
	[CtWgh]				DECIMAL(8,3)	NOT NULL	DEFAULT(0),
	[Qty]				INT				NOT NULL	DEFAULT(0)
)

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'Movements')
CREATE TABLE Movements
(
	[RecordID]			INT				IDENTITY(1,1) PRIMARY KEY ,
	[ID]				BIGINT			NOT NULL	DEFAULT(0),
	[TypeOfProduct]		INT				NOT NULL	DEFAULT(0),
	[DateIncome]		DATE			NULL,					
	[ProductID]			INT				NOT NULL	DEFAULT(0),
	[SizeID]			INT				NULL		DEFAULT(0),
	[Weight]			DECIMAL(8,3)	NOT NULL	DEFAULT(0),
	[InPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
	[OutPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
	[ClientID]			INT				NULL		DEFAULT(0),
	[DeliveryDate]		DATE			NULL,					
	[DateSold]			DATETIME		NULL,					
	[DateReturn]		DATE			NULL,					
	[PaymentDate]		DATE			NULL,					
	[Print]				NVARCHAR(255)	NULL		DEFAULT(''),
	[InventDate]		DATE			NULL,					
	[ObmPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
	[ObmEnabled]		BIT				NULL		DEFAULT(0),
	[IsObmSold]			BIT				NULL		DEFAULT(0),
	[bk]				NVARCHAR(255)	NULL		DEFAULT(''),
	[Arch]				NVARCHAR(255)	NULL		DEFAULT(''),
	[RTT]				NVARCHAR(255)	NULL		DEFAULT(''),
	[DocNum]			INT				NULL		DEFAULT(0),
	[PrimPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
	[MetalWeight]		DECIMAL(5,3)	NULL		DEFAULT(0),
	[InWork]			NVARCHAR(255)	NULL		DEFAULT(''),
	[wWgh]				NVARCHAR(255)	NULL		DEFAULT(''),
	[FirstClientID]		NVARCHAR(255)	NULL		DEFAULT(''),
	[DeliveryID]		NVARCHAR(255)	NULL		DEFAULT(''),
	[CashTerminal]		NVARCHAR(255)	NULL		DEFAULT(''),
	[TotIn]				NVARCHAR(255)	NULL		DEFAULT(''),
	[CurrencyType]		NVARCHAR(255)	NULL		DEFAULT(''),
	[InWorkPerGramm]	NVARCHAR(255)	NULL		DEFAULT(''),
	[MetallAddCharge]	NVARCHAR(255)	NULL		DEFAULT(''),
	[CombySale]			NVARCHAR(255)	NULL		DEFAULT(''),
	[Comments]			NVARCHAR(255)	NULL		DEFAULT(''),
	[CalcPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
	[StonesINFO]		NVARCHAR(255)	NULL		DEFAULT(''),
	[CurrRate]			NVARCHAR(255)	NULL		DEFAULT(''),
	[SalerID]			NVARCHAR(255)	NULL		DEFAULT(''),
	[CheckID]			NVARCHAR(255)	NULL		DEFAULT(''),
	[BaseDiscount]		NVARCHAR(255)	NULL		DEFAULT(''),

	CONSTRAINT FK_MovementsTypeOfProduct_TypeOfProductID FOREIGN KEY ([TypeOfProduct]) REFERENCES TypeOfProduct([ID]),
	CONSTRAINT FK_MovementsProductID_ProductsID FOREIGN KEY ([ProductID]) REFERENCES Products([ID]),
	CONSTRAINT FK_MovementsSizeID_SizesID FOREIGN KEY ([SizeID]) REFERENCES Sizes([ID]),
)
CREATE NONCLUSTERED INDEX IX_Movements_Barcode ON dbo.Movements([ID]);
CREATE NONCLUSTERED INDEX IX_Movements_ProductId ON dbo.Movements([ProductID])
CREATE NONCLUSTERED INDEX IX_Movements_TypeOfProduct ON dbo.Movements([TypeOfProduct])
CREATE NONCLUSTERED INDEX IX_Movements_SizeId ON dbo.Movements([SizeID])
CREATE NONCLUSTERED INDEX IX_Movements_ClientId ON dbo.Movements([ClientID])

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'MovementsHistory')
CREATE TABLE MovementsHistory
(
	[ID]				INT				IDENTITY(1,1) PRIMARY KEY,
	[InfoID]			INT				NOT NULL	DEFAULT(0),
	[MovementsID]		BIGINT			NOT NULL	DEFAULT(0),
	[Price]				DECIMAL(8,2)	NOT NULL	DEFAULT(0),

	CONSTRAINT FK_MovementsHistoryInfoID_MovementsHistoryINFOID FOREIGN KEY ([InfoID]) REFERENCES MovementsHistoryINFO([ID]),
)
CREATE NONCLUSTERED INDEX IX_MovementsHistory_InfoID ON dbo.MovementsHistory([InfoID])
CREATE NONCLUSTERED INDEX IX_MovementsHistory_Barcode ON dbo.MovementsHistory([MovementsID])

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BulkData')
CREATE TABLE BulkData
(
	[ID]				BIGINT			NOT NULL	DEFAULT(0),
	[Type]				NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[DateIncome]		VARCHAR(20)		NULL,
	[ArtNum]			NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[ProductName]		NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[SupplName]			NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[Size]				VARCHAR(20)		NULL		DEFAULT(''),
	[CategoryName]		NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[Weight]			VARCHAR(20)		NOT NULL	DEFAULT(''),
	[InPrice]			VARCHAR(20)		NOT NULL	DEFAULT(''),
	[OutPrice]			VARCHAR(20)		NOT NULL	DEFAULT(''),
	[ClientsName]		NVARCHAR(255)	NOT NULL	DEFAULT(''),
	[DateSold]			VARCHAR(50)		NULL,
	[DateReturn]		VARCHAR(20)		NULL,
	[PaymentDate]		VARCHAR(20)		NULL,
	[InventDate]		VARCHAR(20)		NOT NULL	DEFAULT(''),
	[ObmPrice]			VARCHAR(20)		NOT NULL	DEFAULT(''),
	[ObmEnabled]		BIT				NOT NULL	DEFAULT(''),
	[IsObmSold]			BIT				NOT NULL	DEFAULT(''),
	[PrimSum]			VARCHAR(20)		NULL		DEFAULT(0),
	[SaleSum]			VARCHAR(20)		NULL		DEFAULT(0),
	[CardId]			INT				NULL		DEFAULT(0),
	[Comments]			NVARCHAR(255)	NULL		DEFAULT(''),
	[StoneDescription]	NVARCHAR(255)	NULL		DEFAULT(''),
	[IsDiamond]			BIT				NULL		DEFAULT(0),
	[CtWgh]				VARCHAR(20)		NULL		DEFAULT(''),
	[Qty]				INT				NULL		DEFAULT(0)
)
---------------------------------------------------------------------------

---LOGGING---
IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'ETLExecutionLog')
CREATE TABLE [ETLExecutionLog] 
(
	[Id]					INT IDENTITY(1,1) PRIMARY KEY,
	[ETLProcessId]			UNIQUEIDENTIFIER	NOT NULL	DEFAULT NEWID(),
    [OperationName]			VARCHAR(256)		NOT NULL	DEFAULT(''),
	[AffectedTable]			VARCHAR(256)		NOT NULL	DEFAULT(''),	
	[AffectedRows]			INT					NOT NULL	DEFAULT(0),
	[SourceRowsCount]		INT					NOT NULL	DEFAULT(0),
	[Details]               NVARCHAR(MAX)		NOT NULL	DEFAULT(''),
	[SourcePath]			NVARCHAR(4000)		NOT NULL	DEFAULT(''),
    [CreatedAt]             DATETIME			NOT NULL	DEFAULT GETUTCDATE(),  --UTC Time   
	[SourceName]			NVARCHAR(256)		NULL		DEFAULT('')
)
GO

IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'ETLErrorsLog')
CREATE TABLE [ETLErrorsLog] 
(
	[Id]					INT IDENTITY(1,1) PRIMARY KEY,
	[SourceName]			NVARCHAR(256)		NOT NULL	DEFAULT(''),
    [ErrorMessage]			NVARCHAR(MAX)		NOT NULL	DEFAULT(''),
    [ErrorSeverity]			NVARCHAR(256)		NOT NULL	DEFAULT(''),
    [ErrorState]			NVARCHAR(256)		NOT NULL	DEFAULT(''),
    [CreatedAt]             DATETIME			NOT NULL	DEFAULT GETUTCDATE(),  --UTC Time   
)
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[usp_LogETL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [usp_LogETL]
GO
CREATE PROCEDURE [usp_LogETL]  
@AffectedTable NVARCHAR(256),
@AffectedRows INT,
@SourcePath NVARCHAR(2048),
@ExecutionId UNIQUEIDENTIFIER,
@SourceFileRowsCount INT,
@SourceName NVARCHAR(256),
@OperationName VARCHAR(256) = 'Insert'
AS
	SET NOCOUNT ON;
	DECLARE @FinalRowsCount INT;
	DECLARE @FinalRowsCountSql NVARCHAR(512) = 'SELECT @FinalRowsCount = COUNT(*) FROM ' + @AffectedTable;
	EXECUTE sp_executesql @FinalRowsCountSql, N'@FinalRowsCount INT OUTPUT', @FinalRowsCount OUTPUT;

	INSERT INTO [ETLExecutionLog] ([ETLProcessId],[OperationName],[AffectedTable],[AffectedRows],[SourceRowsCount],[Details],[SourcePath],[CreatedAt],[SourceName])
	VALUES(
	@ExecutionId,
	@OperationName,
	@AffectedTable,
	@AffectedRows,
	@SourceFileRowsCount,
	'Number of rows before execution ' + @OperationName + ' operation - ' + CAST(@FinalRowsCount-@AffectedRows AS NVARCHAR(256)) 
	+ '. Number of rows after execution - '	+ CAST(@FinalRowsCount AS NVARCHAR(256)) 
	+ '. Number of affected rows - ' + CAST(@AffectedRows AS NVARCHAR(256)) + '.', 
	@SourcePath,
	GETUTCDATE(),
	@SourceName
	)
GO
-------------------------------------

---FUNCTIONS---
DROP FUNCTION IF EXISTS dbo.usf_GetBarcodeDigit;
GO
CREATE FUNCTION dbo.usf_GetBarcodeDigit (@DigitIndex int, @Barcode varchar(50))  
RETURNS INT  
--Returns barcode digit by index
AS  
BEGIN  
	RETURN CAST(SUBSTRING(@Barcode, @DigitIndex, 1) AS INT);
END 
GO

DROP FUNCTION IF EXISTS dbo.usf_CalculateBarcode;
GO
CREATE FUNCTION dbo.usf_CalculateBarcode (@Barcode bigint)  
RETURNS BIGINT  
AS  
--Calculates control number of barcode in EAN-13 format and adds it to the end of 12 digit barcode
BEGIN  
	DECLARE @UpdatedBarcode BIGINT;
	IF len(@Barcode) = 12
		begin
			DECLARE @BarcodeString VARCHAR(50) = CAST(@Barcode AS VARCHAR);
			DECLARE @OddSum INT = (select dbo.usf_GetBarcodeDigit(1,@BarcodeString)) 
			+ (select dbo.usf_GetBarcodeDigit(3,@BarcodeString))
			+ (select dbo.usf_GetBarcodeDigit(5,@BarcodeString))
			+ (select dbo.usf_GetBarcodeDigit(7,@BarcodeString))
			+ (select dbo.usf_GetBarcodeDigit(9,@BarcodeString))
			+ (select dbo.usf_GetBarcodeDigit(11,@BarcodeString));
			DECLARE @OddResult INT = @OddSum * 3;

			DECLARE @EvenSum INT = (select dbo.usf_GetBarcodeDigit(2,@BarcodeString)) 
			+ (select dbo.usf_GetBarcodeDigit(4,@BarcodeString))
			+ (select dbo.usf_GetBarcodeDigit(6,@BarcodeString))
			+ (select dbo.usf_GetBarcodeDigit(8,@BarcodeString))
			+ (select dbo.usf_GetBarcodeDigit(10,@BarcodeString))
			+ (select dbo.usf_GetBarcodeDigit(12,@BarcodeString));

			DECLARE @Sum INT = @OddResult + @EvenSum;
			DECLARE @LastSumDigit INT = CAST(right(@Sum, 1) AS INT);

			DECLARE @ControlNumber INT = 10 - @LastSumDigit;
			SET @UpdatedBarcode = CAST((@BarcodeString + CAST(right(@ControlNumber,1) AS VARCHAR(50))) AS BIGINT);
		end
	ELSE 
		SET @UpdatedBarcode = @Barcode;

	RETURN @UpdatedBarcode;
END 
GO

DROP FUNCTION IF EXISTS dbo.usf_ConvertStringToDate;
GO
CREATE FUNCTION dbo.usf_ConvertStringToDate(@Date varchar(20))  
RETURNS DATE  
AS  
--Converts date in string format to date
BEGIN
	IF @Date IS NULL
		RETURN NULL
	DECLARE @ConvertedDate DATE = DATEFROMPARTS(
		  SUBSTRING(@Date,7,4),
		  SUBSTRING(@Date,4,2),
		  SUBSTRING(@Date,1,2));
    RETURN @ConvertedDate;  
END 
GO

DROP FUNCTION IF EXISTS dbo.usf_ConvertStringToDateTime;
GO
CREATE FUNCTION dbo.usf_ConvertStringToDateTime(@Date varchar(20))  
RETURNS DATETIME  
AS  
--Converts string to datetime
BEGIN
	IF @Date IS NULL
		RETURN NULL
	IF len(@Date) > 12
		BEGIN
			DECLARE @length INT = len(@Date);
			DECLARE @ConvertedDateTime DATETIME = DATETIMEFROMPARTS(
			  CAST(SUBSTRING(@Date,7,4) AS INT),
			  CAST(SUBSTRING(@Date,4,2) AS INT),
			  CAST(SUBSTRING(@Date,1,2) AS INT),
			  CAST(IIF(@length=19, SUBSTRING(@Date,12,2), SUBSTRING(@Date,12,1)) AS INT),
			  CAST(IIF(@length=19, SUBSTRING(@Date,15,2), SUBSTRING(@Date,14,2)) AS INT),
			  CAST(IIF(@length=19, SUBSTRING(@Date,18,2), SUBSTRING(@Date,17,2)) AS INT),
			  0);
			RETURN @ConvertedDateTime;
		END
	DECLARE @ConvertedDate DATETIME = DATETIMEFROMPARTS(
		  SUBSTRING(@Date,7,4),
		  SUBSTRING(@Date,4,2),
		  SUBSTRING(@Date,1,2),
		  0, 0, 0, 0);
    RETURN @ConvertedDate;  
END 
GO
------------------------------------------------------------------------

---Main Stored Procedure---
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[usp_BulkInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [usp_BulkInsert]
GO
CREATE PROCEDURE [usp_BulkInsert]  
AS
	--Iterate through files and run ETL for each
	SET NOCOUNT ON;
	DECLARE @SourceDirectory NVARCHAR(256) = 'C:\Test_ETL\';
	DECLARE @Command NVARCHAR(256) =  'dir ' + @SourceDirectory + '*.csv /b';

	DECLARE @EtlFiles TABLE (ID INT IDENTITY, [FileName] NVARCHAR(256));
	INSERT INTO @EtlFiles EXEC xp_cmdshell @Command

	DECLARE @FileName NVARCHAR(256);

	DECLARE etlFiles_cursor CURSOR FOR   
		SELECT [FileName] 
		FROM @EtlFiles 
		WHERE [FileName]  IS NOT NULL
	OPEN etlFiles_cursor  
	FETCH NEXT FROM etlFiles_cursor   
	INTO @FileName 
	WHILE @@FETCH_STATUS = 0  
	BEGIN
		DECLARE @ExecutedFile NVARCHAR(256) = (SELECT DISTINCT [SourceName] FROM dbo.ETLExecutionLog WHERE [SourceName] = @FileName);

		IF(@ExecutedFile IS NULL)
			EXEC [usp_RunETL] @SourceDirectory, @FileName;

		FETCH NEXT FROM etlFiles_cursor INTO @FileName 
	END   
	CLOSE etlFiles_cursor;  
	DEALLOCATE etlFiles_cursor;

	--Move archive data to archive table
	EXEC [usp_MoveDataToArchive]
GO
-----------------------------------------

---ETL---
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[usp_RunETL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [usp_RunETL]
GO
CREATE PROCEDURE [usp_RunETL]  
@SourceDirectory NVARCHAR(256),
@FileName NVARCHAR(256)
AS
	SET NOCOUNT ON;
	BEGIN TRANSACTION ETLTransaction;
		BEGIN TRY
			TRUNCATE TABLE BulkData;
			DECLARE @DataSource NVARCHAR(1000) = @SourceDirectory + @FileName;
			DECLARE @ExecutionId UNIQUEIDENTIFIER = NEWID();
			DECLARE @SourceFileRowsCount INT;

			-- add row terminator to the last row of source file since it's missed
			DECLARE @Command NVARCHAR(1000) = 'echo. >> ' + @DataSource;
			DECLARE @ExecutedFile NVARCHAR(256) = (SELECT DISTINCT [SourceName] FROM dbo.ETLErrorsLog WHERE [SourceName] = @FileName);
			IF(@ExecutedFile  IS NULL)
				EXEC xp_cmdshell @Command

			BEGIN
				--Extract data from source file and load to data transfer table
				DECLARE @SqlBulk NVARCHAR(MAX) = 'BULK INSERT BulkData
					FROM ''' + @DataSource + '''
					WITH (
						FORMAT = ''CSV'',
						CODEPAGE = ''65001'',
						FIRSTROW = 2,
						FIELDTERMINATOR = ''\t'',
						ROWTERMINATOR = ''\n'',
						MAXERRORS = 0,
						KEEPNULLS)';
				EXECUTE sp_executesql @SqlBulk;

				SET @SourceFileRowsCount = @@ROWCOUNT;
			END

			BEGIN
				INSERT INTO dbo.Sizes
				SELECT DISTINCT 
					CAST(REPLACE(ISNULL(bd.[Size],0), ',', '.') AS DECIMAL(5,1)),
					'' as 'mmNeed'
				FROM dbo.BulkData as bd
				LEFT JOIN dbo.Sizes as s on CAST(REPLACE(ISNULL(bd.[Size],0), ',', '.') AS DECIMAL(5,1)) = s.[Size]
				WHERE s.[Size] IS NULL

				--Logging
				EXEC [usp_LogETL] N'Sizes', @@ROWCOUNT, @DataSource, @ExecutionId, @SourceFileRowsCount, @FileName
			END

			BEGIN
				INSERT INTO dbo.TypeOfProduct
				SELECT DISTINCT 
					bd.[Type],
					0 as 'IsWgh',
					CASE WHEN bd.[Type] LIKE('%золото%') THEN 1 ELSE 0 END as 'IsGold',
					CASE WHEN bd.[Type] LIKE('%серебро%') THEN 1 ELSE 0 END as 'IsSilver',
					0 as 'IsEnterprise',
					'' as 'PriceField',
					'' as 'QtyButWgh',
					'' as 'Rent',
					'' as 'Pension',
					'' as 'topGlobal',
					CASE 
						WHEN bd.[Type] LIKE('%серебро%') THEN SUBSTRING(bd.[Type], 9, 3) 
						WHEN bd.[Type] LIKE('%золото%') THEN SUBSTRING(bd.[Type], 8, 3)
						ELSE 0
					END as 'Probe',
					0 as 'PricePerGramm',
					'' as 'ObmPricePerGramm',
					'' as 'ObmEnabled'
				FROM dbo.BulkData as bd
				LEFT JOIN dbo.TypeOfProduct as t on bd.[Type] = t.[Type]
				WHERE t.[Type] IS NULL

				--Logging
				EXEC [usp_LogETL] N'TypeOfProduct', @@ROWCOUNT, @DataSource, @ExecutionId, @SourceFileRowsCount, @FileName
			END

			BEGIN
				INSERT INTO dbo.Supplyer
				SELECT DISTINCT 
					bd.[SupplName],
					'' as 'Profit',
					'' as 'BarCodeHandler',
					'' as 'Comission',
					'' as 'UgSilv',
					'' as 'UgGold',
					'' as 'SilvObmWgh',
					0 as 'IsNDS',
					'' as 'Directory',
					'' as 'Mark',
					'' as 'Address',
					'' as 'EDRPOU',
					'' as 'LicenseNum',
					0 as 'IsImport'
				FROM dbo.BulkData as bd
				LEFT JOIN dbo.Supplyer as s on bd.[SupplName] = s.[SupplName]
				WHERE s.[SupplName] IS NULL

				--Logging
				EXEC [usp_LogETL] N'Supplyer', @@ROWCOUNT, @DataSource, @ExecutionId, @SourceFileRowsCount, @FileName
			END

			BEGIN
				INSERT INTO dbo.Category
				SELECT DISTINCT 
					bd.[CategoryName]					
				FROM dbo.BulkData as bd
				LEFT JOIN dbo.Category as c on bd.[CategoryName] = c.[CategoryName]
				WHERE c.[CategoryName] IS NULL

				--Logging
				EXEC [usp_LogETL] N'Category', @@ROWCOUNT, @DataSource, @ExecutionId, @SourceFileRowsCount, @FileName
			END

			BEGIN
				INSERT INTO dbo.Products
				SELECT DISTINCT
					s.[ID] as 'Group', 
					bd.[ArtNum],
					bd.[ProductName],
					'' as 'Wgh_ug',
					0 as 'Price',
					0 as 'PerGramm',
					'' as 'SilvPerGramm',
					0 as 'ObmPrice',
					'' as 'ObmPerGramm',
					c.[ID] as 'Category',
					'' as 'CategorySub',
					'' as 'UgSilv',
					'' as 'UgGold',
					0 as 'NotForOrder',
					'' as 'OrderIt'					
				FROM dbo.BulkData as bd
				INNER JOIN dbo.Supplyer as s on bd.[SupplName] = s.[SupplName]
				INNER JOIN dbo.Category as c on bd.[CategoryName] = c.[CategoryName]
				LEFT JOIN dbo.Products as p on bd.[SupplName] = s.[SupplName] AND p.[Group] = s.[ID]
					AND bd.[ArtNum] = p.[ArtNum]
					AND bd.[ProductName] = p.[ProductName]
					AND bd.[CategoryName] = c.[CategoryName] AND p.[Category] = c.[ID]
				WHERE p.[Group] IS NULL AND p.[ArtNum] IS NULL AND p.[ProductName] IS NULL AND p.[Category] IS NULL

				--Logging
				EXEC [usp_LogETL] N'Products', @@ROWCOUNT, @DataSource, @ExecutionId, @SourceFileRowsCount, @FileName
			END

			BEGIN
				INSERT INTO dbo.Clients
				SELECT DISTINCT 
					bd.[ClientsName],
					'' as 'Address',
					'' as 'Phone',
					'' as 'Fax',
					'' as 'EMail',
					'' as 'ContactW',
					'' as 'IPN',
					'' as 'Discount',
					'' as 'Data',
					0 as 'IsShop',
					'' as 'LicenseNum',
					'' as 'LicenseValid',
					'' as 'BirkNum',
					'' as 'License',
					'' as 'Reg',
					'' as 'NetPath'
				FROM dbo.BulkData as bd
				LEFT JOIN dbo.Clients as c on bd.[ClientsName] = c.[ClientsName]
				WHERE c.[ClientsName] IS NULL

				--Logging
				EXEC [usp_LogETL] N'Clients', @@ROWCOUNT, @DataSource, @ExecutionId, @SourceFileRowsCount, @FileName
			END

			BEGIN
				INSERT INTO dbo.Discounts
				SELECT DISTINCT 
					dbo.usf_CalculateBarcode(bd.[ID]) as 'ProdID',
					CAST(REPLACE(ISNULL(bd.[PrimSum],0), ',', '.') AS DECIMAL(8,2)),
					CAST(REPLACE(ISNULL(bd.[SaleSum],0), ',', '.') AS DECIMAL(8,2)),
					bd.[Comments],
					CAST(ISNULL(bd.[CardId],0) AS INT),
					0 as 'IsObm',
					0 as 'SaleManID',
					0 as 'ObmSum'
				FROM dbo.BulkData as bd
				LEFT JOIN dbo.Discounts as d on dbo.usf_CalculateBarcode(bd.[ID]) = d.[ProdID]
				WHERE d.[ProdID] IS NULL
					
				--Logging
				EXEC [usp_LogETL] N'Discounts', @@ROWCOUNT, @DataSource, @ExecutionId, @SourceFileRowsCount, @FileName
			END

			BEGIN
				INSERT INTO dbo.DiamondChars
				SELECT DISTINCT 
					dbo.usf_CalculateBarcode(bd.[ID]) as 'ID',
					ISNULL(bd.[StoneDescription], '') as 'Description',
					ISNULL(bd.[IsDiamond], 0),
					ISNULL(bd.[CtWgh], 0),
					ISNULL(bd.[Qty], 0)					
				FROM dbo.BulkData as bd
				LEFT JOIN dbo.DiamondChars as dc on dbo.usf_CalculateBarcode(bd.[ID]) = dc.[ID]
				WHERE dc.[ID] IS NULL
					
				--Logging
				EXEC [usp_LogETL] N'DiamondChars', @@ROWCOUNT, @DataSource, @ExecutionId, @SourceFileRowsCount, @FileName
			END

			BEGIN
				INSERT INTO dbo.Movements
				SELECT DISTINCT
					dbo.usf_CalculateBarcode(bd.[ID]) as 'Barcode',
					tp.[ID] as 'TypeOfProduct',
					dbo.usf_ConvertStringToDate(bd.[DateIncome]) as 'DateIncome',
					p.[ID] as 'ProductID',
					sz.[ID] as 'SizeID',
					CAST(REPLACE(bd.[Weight], ',', '.') AS DECIMAL(8,3)) as 'Weight',
					CAST(REPLACE(ISNULL(bd.[InPrice], 0), ',', '.') AS DECIMAL(8,2)),
					CAST(REPLACE(ISNULL(bd.[OutPrice], 0), ',', '.') AS DECIMAL(8,2)),
					cl.[ID] as 'ClientID',
					null as 'DeliveryDate',
					dbo.usf_ConvertStringToDateTime(bd.[DateSold]) as 'DateSold',
					dbo.usf_ConvertStringToDate(bd.[DateReturn]) as 'DateReturn',
					dbo.usf_ConvertStringToDate(bd.[PaymentDate]) as 'PaymentDate',
					'' as 'Print',		
					dbo.usf_ConvertStringToDate(bd.[InventDate]) as 'InventDate',
					CAST(REPLACE(ISNULL(bd.[ObmPrice], 0), ',', '.') AS DECIMAL(8,2)) as 'ObmPrice',
					CAST(bd.[ObmEnabled] as BIT),
					CAST(bd.[IsObmSold] as BIT),
					'' as 'bk',
					'' as 'Arch',				
					'' as 'RTT',				
					0 as 'DocNum',
					0 as 'PrimPrice',			
					0 as 'MetalWeight',
					'' as 'InWork',	
					'' as 'wWgh',				
					'' as 'FirstClientID',		
					'' as 'DeliveryID',		
					'' as 'CashTerminal',		
					'' as 'TotIn',				
					'' as 'CurrencyType',		
					'' as 'InWorkPerGramm',	
					'' as 'MetallAddCharge',	
					'' as 'CombySale',			
					ISNULL(bd.[Comments], ''),
					0 as 'CalcPrice',			
					'' as 'StonesINFO',		
					'' as 'CurrRate',			
					'' as 'SalerID',			
					'' as 'CheckID',			
					'' as 'BaseDiscount'		
				FROM dbo.BulkData as bd
				INNER JOIN dbo.TypeOfProduct as tp on tp.[Type] = bd.[Type]
				INNER JOIN dbo.Supplyer as s on bd.[SupplName] = s.[SupplName]
				INNER JOIN dbo.Category as c on bd.[CategoryName] = c.[CategoryName]
				INNER JOIN dbo.Products as p on bd.[SupplName] = s.[SupplName] AND p.[Group] = s.[ID]
					AND bd.[ArtNum] = p.[ArtNum]
					AND bd.[ProductName] = p.[ProductName]
					AND bd.[CategoryName] = c.[CategoryName] AND p.[Category] = c.[ID]
				INNER JOIN dbo.Sizes as sz on CAST(REPLACE(ISNULL(bd.[Size],0), ',', '.') AS DECIMAL(5,1)) = sz.[Size]
				INNER JOIN dbo.Clients as cl on cl.[ClientsName] = bd.[ClientsName]
				LEFT JOIN dbo.Movements as m on tp.[ID] = m.[TypeOfProduct]
					AND sz.[ID] = m.[SizeID]
					AND cl.[ID] = m.[ClientID]
					AND p.[ID] = m.[ProductID]
					AND m.[DateIncome] = dbo.usf_ConvertStringToDate(bd.[DateIncome])
					AND m.[ID] = dbo.usf_CalculateBarcode(bd.[ID])
					AND m.[Weight] = CAST(REPLACE(bd.[Weight], ',', '.') AS DECIMAL(8,3))
					AND m.[InPrice] = CAST(REPLACE(ISNULL(bd.[InPrice], 0), ',', '.') AS DECIMAL(8,2))
					AND m.[OutPrice] = CAST(REPLACE(ISNULL(bd.[OutPrice], 0), ',', '.') AS DECIMAL(8,2))
					AND ISNULL(m.[DateSold], '01.01.1900') = ISNULL(dbo.usf_ConvertStringToDateTime(bd.[DateSold]), '01.01.1900')
					AND ISNULL(m.[DateReturn], '01.01.1900') = ISNULL(dbo.usf_ConvertStringToDate(bd.[DateReturn]), '01.01.1900')
					AND ISNULL(m.[PaymentDate], '01.01.1900') = ISNULL(dbo.usf_ConvertStringToDate(bd.[PaymentDate]), '01.01.1900')
					AND ISNULL(m.[InventDate], '01.01.1900') = ISNULL(dbo.usf_ConvertStringToDate(bd.[InventDate]), '01.01.1900')
					AND m.[ObmPrice] = CAST(REPLACE(ISNULL(bd.[ObmPrice], 0), ',', '.') AS DECIMAL(8,2))
					AND m.[ObmEnabled] = CAST(bd.[ObmEnabled] as BIT)
					AND m.[IsObmSold] = CAST(bd.[IsObmSold] as BIT)
					AND m.[Comments] = ISNULL(bd.[Comments], '')
				WHERE m.[TypeOfProduct] IS NULL 
				AND m.[SizeID] IS NULL 
				AND m.[ClientID] IS NULL 
				AND m.[ProductID] IS NULL
				AND m.[DateIncome] IS NULL
				AND m.[ID] IS NULL
				AND m.[Weight] IS NULL 
				AND m.[InPrice] IS NULL 
				AND m.[OutPrice] IS NULL 
				AND m.[DateSold] IS NULL
				AND m.[DateReturn] IS NULL
				AND m.[PaymentDate] IS NULL
				AND m.[InventDate] IS NULL
				AND m.[ObmPrice] IS NULL
				AND m.[ObmEnabled] IS NULL
				AND m.[IsObmSold] IS NULL
				AND m.[Comments] IS NULL

				--Logging
				EXEC [usp_LogETL] N'Movements', @@ROWCOUNT, @DataSource, @ExecutionId, @SourceFileRowsCount, @FileName
			END
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION ETLTransaction;

			DECLARE @ErrorMessage NVARCHAR(MAX) = ERROR_MESSAGE();
			DECLARE @ErrorSeverity NVARCHAR(MAX) = ERROR_SEVERITY();
			DECLARE @ErrorState NVARCHAR(MAX) = ERROR_STATE();

			INSERT INTO dbo.[ETLErrorsLog] 
			VALUES (@FileName, @ErrorMessage, @ErrorSeverity, @ErrorState, GETUTCDATE())

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
			RETURN;
		END CATCH
	COMMIT TRANSACTION ETLTransaction;
	GO
GO
-------------------------------------

---MOVE DATA TO ARCHIVE---
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[usp_MoveDataToArchive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [usp_MoveDataToArchive]
GO
CREATE PROCEDURE [usp_MoveDataToArchive] 
---Move movements sold more than 3 years ago to archive---
AS
	SET NOCOUNT ON;
	BEGIN TRANSACTION MoveToArchive;
		IF NOT EXISTS(SELECT name FROM sys.filegroups WHERE name = 'Archive')
		BEGIN
			ALTER DATABASE JewStore  
			ADD FILEGROUP Archive;	 
		END

		IF NOT EXISTS(SELECT name FROM sys.database_files WHERE name = 'JewStoreArchive')
				BEGIN
					ALTER DATABASE JewStore   
					ADD FILE   
					(  
						NAME = JewStoreArchive,  
						FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JewStore_Archive.ndf',  
						SIZE = 10MB,  
						FILEGROWTH = 15%
					) 
					TO FILEGROUP Archive;
				END

		IF NOT EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'Movements_Archive')
				CREATE TABLE Movements_Archive
				(
					[RecordID]			INT				PRIMARY KEY,
					[ID]				BIGINT			NOT NULL	DEFAULT(0),
					[TypeOfProduct]		INT				NOT NULL	DEFAULT(0),
					[DateIncome]		DATE			NULL,					
					[ProductID]			INT				NOT NULL	DEFAULT(0),
					[SizeID]			INT				NULL		DEFAULT(0),
					[Weight]			DECIMAL(8,3)	NOT NULL	DEFAULT(0),
					[InPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
					[OutPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
					[ClientID]			INT				NULL		DEFAULT(0),
					[DeliveryDate]		DATE			NULL,					
					[DateSold]			DATETIME		NULL,					
					[DateReturn]		DATE			NULL,					
					[PaymentDate]		DATE			NULL,					
					[Print]				NVARCHAR(255)	NULL		DEFAULT(''),
					[InventDate]		DATE			NULL,					
					[ObmPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
					[ObmEnabled]		BIT				NULL		DEFAULT(0),
					[IsObmSold]			BIT				NULL		DEFAULT(0),
					[bk]				NVARCHAR(255)	NULL		DEFAULT(''),
					[Arch]				NVARCHAR(255)	NULL		DEFAULT(''),
					[RTT]				NVARCHAR(255)	NULL		DEFAULT(''),
					[DocNum]			INT				NULL		DEFAULT(0),
					[PrimPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
					[MetalWeight]		DECIMAL(5,3)	NULL		DEFAULT(0),
					[InWork]			NVARCHAR(255)	NULL		DEFAULT(''),
					[wWgh]				NVARCHAR(255)	NULL		DEFAULT(''),
					[FirstClientID]		NVARCHAR(255)	NULL		DEFAULT(''),
					[DeliveryID]		NVARCHAR(255)	NULL		DEFAULT(''),
					[CashTerminal]		NVARCHAR(255)	NULL		DEFAULT(''),
					[TotIn]				NVARCHAR(255)	NULL		DEFAULT(''),
					[CurrencyType]		NVARCHAR(255)	NULL		DEFAULT(''),
					[InWorkPerGramm]	NVARCHAR(255)	NULL		DEFAULT(''),
					[MetallAddCharge]	NVARCHAR(255)	NULL		DEFAULT(''),
					[CombySale]			NVARCHAR(255)	NULL		DEFAULT(''),
					[Comments]			NVARCHAR(255)	NULL		DEFAULT(''),
					[CalcPrice]			DECIMAL(8,2)	NULL		DEFAULT(0),
					[StonesINFO]		NVARCHAR(255)	NULL		DEFAULT(''),
					[CurrRate]			NVARCHAR(255)	NULL		DEFAULT(''),
					[SalerID]			NVARCHAR(255)	NULL		DEFAULT(''),
					[CheckID]			NVARCHAR(255)	NULL		DEFAULT(''),
					[BaseDiscount]		NVARCHAR(255)	NULL		DEFAULT('')
				)
				ON [Archive];

		DECLARE @ThreeYearsAgo DATETIME = DATEADD(year, -3, GETDATE())

		INSERT INTO dbo.Movements_Archive 
				SELECT * FROM dbo.Movements
				WHERE 
					[DateSold] IS NOT NULL AND [DateSold] < @ThreeYearsAgo
					OR [DateReturn] IS NOT NULL AND [DateReturn] < @ThreeYearsAgo

		DELETE FROM dbo.Movements
				WHERE 
					[DateSold] IS NOT NULL AND [DateSold] < @ThreeYearsAgo
					OR [DateReturn] IS NOT NULL AND [DateReturn] < @ThreeYearsAgo
	COMMIT TRANSACTION MoveToArchive;
	GO
GO
-------------------------------------------------

--EXEC [usp_BulkInsert]
-------------------------------------------

---SCHEDULED JOB---
USE msdb ;  
GO  
EXEC dbo.sp_add_job 
   @job_name = N'Daily Bulk Insert',
   @enabled = 1,
   @description = 'A job to execute [usp_BulkInsert] daily'
GO
EXEC sp_add_jobstep
   @job_name = N'Daily Bulk Insert',
   @step_name = N'Run [usp_BulkInsert]',
   @command = 'EXEC [usp_BulkInsert]',
   @database_name = 'JewStore'
GO
EXEC dbo.sp_add_schedule  
    @schedule_name = N'Run Every Day at 3 AM',  
    @enabled = 1,
    @freq_type = 4,  
    @freq_interval = 1,
	@active_start_time = 030000
GO
EXEC dbo.sp_add_schedule  
    @schedule_name = N'Run Every Day at 3 AM',  
    @enabled = 1,
    @freq_type = 4,  
    @freq_interval = 1,
	@active_start_time = 030000
GO
EXEC dbo.sp_attach_schedule
   @job_name = N'Daily Bulk Insert',
   @schedule_name = N'Run Every Day at 3 AM'
GO
EXEC dbo.sp_attach_schedule
   @job_name = N'Daily Bulk Insert',
   @schedule_name = N'Run Every Day at 3 AM'
GO
EXEC dbo.sp_add_jobserver  
    @job_name = N'Daily Bulk Insert';  
GO  
-----------------------------------

---Grant permission to Developers Role---
CREATE ROLE Developers

DECLARE @Query NVARCHAR(MAX);
DECLARE GrantPermission_cursor CURSOR FOR   
		SELECT 'GRANT ALTER, CONTROL, DELETE, INSERT, REFERENCES, SELECT, UPDATE, VIEW DEFINITION ON '+ QUOTENAME( SCHEMA_NAME ( schema_id ) ) + '.' + QUOTENAME( name ) + ' to Developers' 
		FROM sys.objects 
		WHERE type in ('U','V')
	OPEN GrantPermission_cursor  
	FETCH NEXT FROM GrantPermission_cursor   
	INTO @Query 
	WHILE @@FETCH_STATUS = 0  
	BEGIN		
		EXEC(@Query) 
		FETCH NEXT FROM GrantPermission_cursor INTO @Query 
	END   
	CLOSE GrantPermission_cursor;  
	DEALLOCATE GrantPermission_cursor;
--------------------------------------------------------------