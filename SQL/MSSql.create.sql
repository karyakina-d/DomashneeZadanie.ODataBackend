



CREATE TABLE [Profession] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [Name] VARCHAR(255)  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [ServiceRequest] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [Type] VARCHAR(13)  NULL,

	 [Number] INT  NULL,

	 [Date] Date  NULL,

	 [Status] VARCHAR(9)  NULL,

	 [PermanentAddress] String  NULL,

	 [PhoneNumber] String  NULL,

	 [INN] String  NULL,

	 [ServiceRequestDecision] VARCHAR(9)  NULL,

	 [DecisionDate] Date  NULL,

	 [ProfessionD] UNIQUEIDENTIFIER  NOT NULL,

	 [Passport] UNIQUEIDENTIFIER  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [Patent] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [Series] VARCHAR(255)  NULL,

	 [Number] VARCHAR(255)  NULL,

	 [ValidUntil] date  NULL,

	 [IssueDate] date  NULL,

	 [Profession_m0] UNIQUEIDENTIFIER  NOT NULL,

	 [ServiceRequest_m0] UNIQUEIDENTIFIER  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [Passport] (

	 [primaryKey] UNIQUEIDENTIFIER  NOT NULL,

	 [LastNameLat] VARCHAR(255)  NULL,

	 [FirstNameLat] VARCHAR(255)  NULL,

	 [SecondNameLat] VARCHAR(255)  NULL,

	 [Sex] VARCHAR(255)  NULL,

	 [DateOfBirth] Date  NULL,

	 [PlaceOfBirth] VARCHAR(255)  NULL,

	 [DateOfIssue] Date  NULL,

	 [ValidUntil] Date  NULL,

	 [NumberSeries] VARCHAR(255)  NULL,

	 [Country] VARCHAR(5)  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMNETLOCKDATA] (

	 [LockKey] VARCHAR(300)  NOT NULL,

	 [UserName] VARCHAR(300)  NOT NULL,

	 [LockDate] DATETIME  NULL,

	 PRIMARY KEY ([LockKey]))


CREATE TABLE [STORMSETTINGS] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Module] varchar(1000)  NULL,

	 [Name] varchar(255)  NULL,

	 [Value] text  NULL,

	 [User] varchar(255)  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMAdvLimit] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [User] varchar(255)  NULL,

	 [Published] bit  NULL,

	 [Module] varchar(255)  NULL,

	 [Name] varchar(255)  NULL,

	 [Value] text  NULL,

	 [HotKeyData] int  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMFILTERSETTING] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Name] varchar(255)  NOT NULL,

	 [DataObjectView] varchar(255)  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMWEBSEARCH] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Name] varchar(255)  NOT NULL,

	 [Order] INT  NOT NULL,

	 [PresentView] varchar(255)  NOT NULL,

	 [DetailedView] varchar(255)  NOT NULL,

	 [FilterSetting_m0] uniqueidentifier  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMFILTERDETAIL] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Caption] varchar(255)  NOT NULL,

	 [DataObjectView] varchar(255)  NOT NULL,

	 [ConnectMasterProp] varchar(255)  NOT NULL,

	 [OwnerConnectProp] varchar(255)  NULL,

	 [FilterSetting_m0] uniqueidentifier  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [STORMFILTERLOOKUP] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [DataObjectType] varchar(255)  NOT NULL,

	 [Container] varchar(255)  NULL,

	 [ContainerTag] varchar(255)  NULL,

	 [FieldsToView] varchar(255)  NULL,

	 [FilterSetting_m0] uniqueidentifier  NOT NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [UserSetting] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [AppName] varchar(256)  NULL,

	 [UserName] varchar(512)  NULL,

	 [UserGuid] uniqueidentifier  NULL,

	 [ModuleName] varchar(1024)  NULL,

	 [ModuleGuid] uniqueidentifier  NULL,

	 [SettName] varchar(256)  NULL,

	 [SettGuid] uniqueidentifier  NULL,

	 [SettLastAccessTime] DATETIME  NULL,

	 [StrVal] varchar(256)  NULL,

	 [TxtVal] varchar(max)  NULL,

	 [IntVal] int  NULL,

	 [BoolVal] bit  NULL,

	 [GuidVal] uniqueidentifier  NULL,

	 [DecimalVal] decimal(20,10)  NULL,

	 [DateTimeVal] DATETIME  NULL,

	 PRIMARY KEY ([primaryKey]))


CREATE TABLE [ApplicationLog] (

	 [primaryKey] uniqueidentifier  NOT NULL,

	 [Category] varchar(64)  NULL,

	 [EventId] INT  NULL,

	 [Priority] INT  NULL,

	 [Severity] varchar(32)  NULL,

	 [Title] varchar(256)  NULL,

	 [Timestamp] DATETIME  NULL,

	 [MachineName] varchar(32)  NULL,

	 [AppDomainName] varchar(512)  NULL,

	 [ProcessId] varchar(256)  NULL,

	 [ProcessName] varchar(512)  NULL,

	 [ThreadName] varchar(512)  NULL,

	 [Win32ThreadId] varchar(128)  NULL,

	 [Message] varchar(2500)  NULL,

	 [FormattedMessage] varchar(max)  NULL,

	 PRIMARY KEY ([primaryKey]))




 ALTER TABLE [ServiceRequest] ADD CONSTRAINT [ServiceRequest_FProfession_0] FOREIGN KEY ([ProfessionD]) REFERENCES [Profession]
CREATE INDEX ServiceRequest_IProfessionD on [ServiceRequest] ([ProfessionD])

 ALTER TABLE [ServiceRequest] ADD CONSTRAINT [ServiceRequest_FPassport_0] FOREIGN KEY ([Passport]) REFERENCES [Passport]
CREATE INDEX ServiceRequest_IPassport on [ServiceRequest] ([Passport])

 ALTER TABLE [Patent] ADD CONSTRAINT [Patent_FProfession_0] FOREIGN KEY ([Profession_m0]) REFERENCES [Profession]
CREATE INDEX Patent_IProfession_m0 on [Patent] ([Profession_m0])

 ALTER TABLE [Patent] ADD CONSTRAINT [Patent_FServiceRequest_0] FOREIGN KEY ([ServiceRequest_m0]) REFERENCES [ServiceRequest]
CREATE INDEX Patent_IServiceRequest_m0 on [Patent] ([ServiceRequest_m0])

 ALTER TABLE [STORMWEBSEARCH] ADD CONSTRAINT [STORMWEBSEARCH_FSTORMFILTERSETTING_0] FOREIGN KEY ([FilterSetting_m0]) REFERENCES [STORMFILTERSETTING]

 ALTER TABLE [STORMFILTERDETAIL] ADD CONSTRAINT [STORMFILTERDETAIL_FSTORMFILTERSETTING_0] FOREIGN KEY ([FilterSetting_m0]) REFERENCES [STORMFILTERSETTING]

 ALTER TABLE [STORMFILTERLOOKUP] ADD CONSTRAINT [STORMFILTERLOOKUP_FSTORMFILTERSETTING_0] FOREIGN KEY ([FilterSetting_m0]) REFERENCES [STORMFILTERSETTING]

