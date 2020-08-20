﻿



CREATE TABLE "Profession"
(

	"primaryKey" RAW(16) NOT NULL,

	"Name" NVARCHAR2(255) NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "ServiceRequest"
(

	"primaryKey" RAW(16) NOT NULL,

	"Type" NVARCHAR2(13) NULL,

	"Number" NUMBER(10) NULL,

	"Date" DATE NULL,

	"Status" NVARCHAR2(9) NULL,

	"PermanentAddress" NVARCHAR2(255) NULL,

	"PhoneNumber" NVARCHAR2(255) NULL,

	"INN" NVARCHAR2(255) NULL,

	"ServiceRequestDecision" NVARCHAR2(9) NULL,

	"DecisionDate" DATE NULL,

	"ProfessionD" RAW(16) NOT NULL,

	"Passport" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "Patent"
(

	"primaryKey" RAW(16) NOT NULL,

	"Series" NVARCHAR2(255) NULL,

	"ValidUntil" DATE NULL,

	"Number" NVARCHAR2(255) NULL,

	"IssueDate" DATE NULL,

	"Profession_m0" RAW(16) NOT NULL,

	"ServiceRequest_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "Passport"
(

	"primaryKey" RAW(16) NOT NULL,

	"FirstNameLat" NVARCHAR2(255) NULL,

	"LastNameLat" NVARCHAR2(255) NULL,

	"SecondNameLat" NVARCHAR2(255) NULL,

	"Sex" NVARCHAR2(255) NULL,

	"DateOfBirth" DATE NULL,

	"PlaceOfBirth" NVARCHAR2(255) NULL,

	"DateOfIssue" DATE NULL,

	"ValidUntil" DATE NULL,

	"NumberSeries" NVARCHAR2(255) NULL,

	"Country" NVARCHAR2(5) NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMNETLOCKDATA"
(

	"LockKey" NVARCHAR2(300) NOT NULL,

	"UserName" NVARCHAR2(300) NOT NULL,

	"LockDate" DATE NULL,

	 PRIMARY KEY ("LockKey")
) ;


CREATE TABLE "STORMSETTINGS"
(

	"primaryKey" RAW(16) NOT NULL,

	"Module" nvarchar2(1000) NULL,

	"Name" nvarchar2(255) NULL,

	"Value" CLOB NULL,

	"User" nvarchar2(255) NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMAdvLimit"
(

	"primaryKey" RAW(16) NOT NULL,

	"User" nvarchar2(255) NULL,

	"Published" NUMBER(1) NULL,

	"Module" nvarchar2(255) NULL,

	"Name" nvarchar2(255) NULL,

	"Value" CLOB NULL,

	"HotKeyData" NUMBER(10) NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMFILTERSETTING"
(

	"primaryKey" RAW(16) NOT NULL,

	"Name" nvarchar2(255) NOT NULL,

	"DataObjectView" nvarchar2(255) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMWEBSEARCH"
(

	"primaryKey" RAW(16) NOT NULL,

	"Name" nvarchar2(255) NOT NULL,

	"Order" NUMBER(10) NOT NULL,

	"PresentView" nvarchar2(255) NOT NULL,

	"DetailedView" nvarchar2(255) NOT NULL,

	"FilterSetting_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMFILTERDETAIL"
(

	"primaryKey" RAW(16) NOT NULL,

	"Caption" nvarchar2(255) NOT NULL,

	"DataObjectView" nvarchar2(255) NOT NULL,

	"ConnectMasterProp" nvarchar2(255) NOT NULL,

	"OwnerConnectProp" nvarchar2(255) NULL,

	"FilterSetting_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "STORMFILTERLOOKUP"
(

	"primaryKey" RAW(16) NOT NULL,

	"DataObjectType" nvarchar2(255) NOT NULL,

	"Container" nvarchar2(255) NULL,

	"ContainerTag" nvarchar2(255) NULL,

	"FieldsToView" nvarchar2(255) NULL,

	"FilterSetting_m0" RAW(16) NOT NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "UserSetting"
(

	"primaryKey" RAW(16) NOT NULL,

	"AppName" nvarchar2(256) NULL,

	"UserName" nvarchar2(512) NULL,

	"UserGuid" RAW(16) NULL,

	"ModuleName" nvarchar2(1024) NULL,

	"ModuleGuid" RAW(16) NULL,

	"SettName" nvarchar2(256) NULL,

	"SettGuid" RAW(16) NULL,

	"SettLastAccessTime" DATE NULL,

	"StrVal" nvarchar2(256) NULL,

	"TxtVal" CLOB NULL,

	"IntVal" NUMBER(10) NULL,

	"BoolVal" NUMBER(1) NULL,

	"GuidVal" RAW(16) NULL,

	"DecimalVal" NUMBER(20,10) NULL,

	"DateTimeVal" DATE NULL,

	 PRIMARY KEY ("primaryKey")
) ;


CREATE TABLE "ApplicationLog"
(

	"primaryKey" RAW(16) NOT NULL,

	"Category" nvarchar2(64) NULL,

	"EventId" NUMBER(10) NULL,

	"Priority" NUMBER(10) NULL,

	"Severity" nvarchar2(32) NULL,

	"Title" nvarchar2(256) NULL,

	"Timestamp" DATE NULL,

	"MachineName" nvarchar2(32) NULL,

	"AppDomainName" nvarchar2(512) NULL,

	"ProcessId" nvarchar2(256) NULL,

	"ProcessName" nvarchar2(512) NULL,

	"ThreadName" nvarchar2(512) NULL,

	"Win32ThreadId" nvarchar2(128) NULL,

	"Message" nvarchar2(2000) NULL,

	"FormattedMessage" nvarchar2(2000) NULL,

	 PRIMARY KEY ("primaryKey")
) ;



ALTER TABLE "ServiceRequest"
	ADD CONSTRAINT "ServiceRequest_FProfession_0" FOREIGN KEY ("ProfessionD") REFERENCES "Profession" ("primaryKey");

CREATE INDEX "ServiceRequest_IProfessionD" on "ServiceRequest" ("ProfessionD");

ALTER TABLE "ServiceRequest"
	ADD CONSTRAINT "ServiceRequest_FPassport_0" FOREIGN KEY ("Passport") REFERENCES "Passport" ("primaryKey");

CREATE INDEX "ServiceRequest_IPassport" on "ServiceRequest" ("Passport");

ALTER TABLE "Patent"
	ADD CONSTRAINT "Patent_FProfession_0" FOREIGN KEY ("Profession_m0") REFERENCES "Profession" ("primaryKey");

CREATE INDEX "Patent_IProfession_m0" on "Patent" ("Profession_m0");

ALTER TABLE "Patent"
	ADD CONSTRAINT "Patent_FServiceRequest_0" FOREIGN KEY ("ServiceRequest_m0") REFERENCES "ServiceRequest" ("primaryKey");

CREATE INDEX "Patent_IServiceRequest_m0" on "Patent" ("ServiceRequest_m0");

ALTER TABLE "STORMWEBSEARCH"
	ADD CONSTRAINT "STORMWEBSEARCH_FSTORMFILT_6521" FOREIGN KEY ("FilterSetting_m0") REFERENCES "STORMFILTERSETTING" ("primaryKey");

ALTER TABLE "STORMFILTERDETAIL"
	ADD CONSTRAINT "STORMFILTERDETAIL_FSTORMF_2900" FOREIGN KEY ("FilterSetting_m0") REFERENCES "STORMFILTERSETTING" ("primaryKey");

ALTER TABLE "STORMFILTERLOOKUP"
	ADD CONSTRAINT "STORMFILTERLOOKUP_FSTORMF_1583" FOREIGN KEY ("FilterSetting_m0") REFERENCES "STORMFILTERSETTING" ("primaryKey");


