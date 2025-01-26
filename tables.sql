USE master
GO

CREATE DATABASE kampkaravan
GO

USE kampkaravan

-- It is a combined version of all Create SQLs. There are many tables connected to each other with foreign key(s).
-- Hence, in order to be able to create the database, all tables must be ordered considering the relationships.


/* ---------------------------------
SUPPLIER
*/ ---------------------------------
CREATE TABLE SUPPLIER(
	SupplierID INT IDENTITY(1,1) PRIMARY KEY,
	CategoryID INT NOT NULL,
	SupplierName NVARCHAR(50) NOT NULL,
	SupplierRepresentative NVARCHAR(50) NOT NULL,
	PrimaryContactNumber NVARCHAR(20) NOT NULL,
	Country NVARCHAR(50) NOT NULL,
	Province NVARCHAR(50) NOT NULL,
	City NVARCHAR(50) NOT NULL,
	District NVARCHAR(50) NOT NULL,
	Street NVARCHAR(50) NOT NULL,
	Building NVARCHAR(50) NOT NULL,
	DoorNumber SMALLINT NOT NULL,
	Zipcode INT NOT NULL,
	BusinessAddress AS (Country + ' ' + Province + ' ' + City + ' ' + District + ' ' + Street + ' ' +Building + ' ' + CAST(DoorNumber AS NVARCHAR(4))+ ' ' + CAST(Zipcode AS NVARCHAR(4))) PERSISTED,
	SupplierType NVARCHAR(1) NOT NULL CHECK(SupplierType IN ('R','I'))
);

CREATE TABLE REGULAR_SUPPLIER(
	RegularSupplierID INT IDENTITY(1,1) PRIMARY KEY,
	SupplierID INT FOREIGN KEY REFERENCES SUPPLIER(SupplierID),
	ContractStartDate DATE NOT NULL,
	ContractEndDate DATE NOT NULL,
	ContractPeriod INT NULL, -- trigger will be added.
	RestockFrequency BIT NOT NULL
);

-- Trigger for calculating of the contract period of REGULAR_SUPPLIER
/*
CREATE TRIGGER trigger_CalculateContractPeriod
ON REGULAR_SUPPLIER 
AFTER INSERT
AS 
BEGIN 
	UPDATE REGULAR_SUPPLIER
	SET ContractPeriod = 
		DATEDIFF(YEAR, REGULAR_SUPPLIER.ContractStartDate, REGULAR_SUPPLIER.ContractEndDate)
		- CASE
				WHEN DATEADD(YEAR, DATEDIFF(YEAR, REGULAR_SUPPLIER.ContractStartDate, REGULAR_SUPPLIER.ContractEndDate), REGULAR_SUPPLIER.ContractStartDate) > REGULAR_SUPPLIER.ContractEndDate
				THEN 1
				ELSE 0
			END
	FROM REGULAR_SUPPLIER
	INNER JOIN inserted ON REGULAR_SUPPLIER.Supplier_ID = inserted.Supplier_ID;
END;
*/

CREATE TABLE IRREGULAR_SUPPLIER(
	IrregularSupplierID INT IDENTITY(1,1) PRIMARY KEY,
	LastSupplyDate Date NOT NULL,
	SUPPLIER INT NOT NULL FOREIGN KEY REFERENCES SUPPLIER(SupplierID)
);

CREATE TABLE AVAILABLE_MONTHS(
	AvailableMonthsID INT IDENTITY(1,1) PRIMARY KEY,
	AvailableMonthsName NVARCHAR(50) NOT NULL 
);
/* ---------------------------------
SHOP
*/ ---------------------------------

CREATE TABLE SHOP(
	ShopID INT IDENTITY(1,1) PRIMARY KEY,
	PhoneNumber nvarchar(20) unique NOT NULL,
	ShopType nvarchar(1) CHECK(ShopType IN ('O','S','R')) NOT NULL
);

--INSERT INTO A (Name, FirstName, Type)
--VALUES ('John', 'Doe', 'B');

--INSERT INTO B (ID, Telephone, BKol)
--VALUES (SCOPE_IDENTITY(), '555-1234', 'Additional Info for B');

CREATE TABLE ONLINE_SHOP(
	OnlineShopID INT IDENTITY(1,1) PRIMARY KEY,
	ShopID INT FOREIGN KEY REFERENCES SHOP(ShopID) ON DELETE CASCADE NOT NULL
);

CREATE TABLE WEBSITE(
	WebsiteID INT IDENTITY(1,1) PRIMARY KEY,
	WebsiteAddress NVARCHAR(50) unique NOT NULL,
	OnlineShopID INT FOREIGN KEY REFERENCES ONLINE_SHOP(OnlineShopID) ON DELETE CASCADE NOT NULL 
);

CREATE TABLE SHIPPING_PARTNER(
	ShippingPartnersID INT IDENTITY(1,1) PRIMARY KEY,
	PartnerName NVARCHAR(50) NOT NULL, 
	OnlineShopID INT NOT NULL FOREIGN KEY REFERENCES ONLINE_SHOP(OnlineShopID) ON DELETE CASCADE
);

--Many to Many between Shipping_Partner and Online_Shop
CREATE TABLE SHIPPING_PARTNER_ONLINE_SHOP(
	ShippingPartnerID INT FOREIGN KEY REFERENCES SHIPPING_PARTNER(ShippingPartnersID),
	OnlineShopID INT FOREIGN KEY REFERENCES ONLINE_SHOP(OnlineShopID),
	Primary Key(ShippingPartnerID, OnlineShopID)
);

CREATE TABLE SHOWROOM(
	ShowroomID INT IDENTITY(1,1) PRIMARY KEY,
	ShowroomAddress NVARCHAR(50) NOT NULL,
	ShowroomVehicleCapacity INT NOT NULL,
	ShopID INT FOREIGN KEY REFERENCES SHOP(ShopID) ON DELETE CASCADE NOT NULL
);

CREATE TABLE REPAIR_SHOP(
	RepairShopID INT IDENTITY(1,1) PRIMARY KEY,
	RepairShopAddress NVARCHAR(50) NOT NULL,
	TechnicianCount INT,
	ToolCapacity INT,
	RepairVehicleCapacity INT,
	ShopID INT FOREIGN KEY REFERENCES SHOP(ShopID) ON DELETE CASCADE NOT NULL
);

CREATE TABLE SUPPLIER_SHOP(
	SupplierID INT NOT NULL FOREIGN KEY REFERENCES SUPPLIER(SupplierID),
	ShopID INT NOT NULL FOREIGN KEY REFERENCES SHOP(ShopID),
	PRIMARY KEY(SupplierID, ShopID)
);

/* ---------------------------------
CUSTOMER
*/ ---------------------------------

CREATE TABLE CUSTOMER(
	CustomerID INT identity(1,1) PRIMARY KEY,
	-- Composite attributes of ShippingAddress
	ShippingCountry VARCHAR(50) NOT NULL,
	ShippingProvince VARCHAR(50) NOT NULL,
	ShippingCity VARCHAR(50)  NOT NULL,
	ShippingDistrict VARCHAR(50) NOT NULL,
	ShippingStreet VARCHAR(50) NOT NULL,
	ShippingBuilding VARCHAR(50) NOT NULL,
	ShippingDoorNumber VARCHAR(50) NOT NULL,
	ShippingZipCode VARCHAR(50) NOT NULL,

	-- Composite attributes of BillingAddress
	BillingAddressCountry VARCHAR(50) NOT NULL,
	BillingAddressProvince VARCHAR(50) NOT NULL,
	BillingAddressCity VARCHAR(50) NOT NULL,
	BillingAddressDistrict VARCHAR(50) NOT NULL,
	BillingAddressStreet VARCHAR(50) NOT NULL,
	BillingAddressBuilding VARCHAR(50) NOT NULL,
	BillingAddressDoorNumber VARCHAR(50) NOT NULL,
	BillingAddressZipCode VARCHAR(50) NOT NULL,

	Email VARCHAR(50) UNIQUE NOT NULL, -- Derrived Attribute??
	PhoneNumber VARCHAR(50) UNIQUE NOT NULL, --Derrived Attribute??
	RegistrationDate DATE,
	CustomerType CHAR(1) NOT NULL CHECK (CustomerType IN ('I', 'D')) -- 'O' for INDIVIDUAL_CUSTOMER, 'D' for DEALER
	);

-- Many to many relationship between Customer and Shop
CREATE TABLE CUSTOMER_SHOP (
    CustomerID INT  NOT NULL,
    ShopID INT NOT NULL,
    PRIMARY KEY (CustomerID, ShopID),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (ShopID) REFERENCES SHOP(ShopID) ON DELETE CASCADE,
);


CREATE TABLE INDIVIDUAL_CUSTOMER(
	IndividualCustomerID INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT NOT NULL,
	IndividiualCustomerFirstName VARCHAR(50) NOT NULL,
	IndividiualCustomerLastName VARCHAR(50) NOT NULL,
	IndividiualCustomerGender VARCHAR(1),
	IndividiualCustomerAge INT, --Derived Attribute??
	FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE,
	--CHECK (customer_id IN (SELECT customer_id FROM CUSTOMER WHERE customer_type = 'I', 
	); 

CREATE TABLE DEALER(
	DealerID INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT NOT NULL,
	DealerCompanyName VARCHAR(50) NOT NULL,
	DealerDiscountRate VARCHAR(50) NOT NULL,
	DealerRepresentative VARCHAR(50) NOT NULL ,
	DealerIndustry VARCHAR(50) NOT NULL, -- DERIVED ATTRIBUTE??
	DealerTaxID INT NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE,
	--CHECK (customer_id IN (SELECT customer_id FROM CUSTOMER WHERE customer_type = 'D', 
	); 


/* ---------------------------------
DEPARTMENT
*/ ---------------------------------

-- MSSQL didn't allow to use subqueries, hence i commented the check blocks for disjoint rule.
-- Base table for DEPARTMENT
CREATE TABLE DEPARTMENT (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
	ShopID INT NOT NULL,
    DepartmentName VARCHAR(50) NOT NULL,
    --[TotalEmployee] will be used as foreign key here.
	-- THIS TYPE CHECKING MAY BE A TRIGGER.
	FOREIGN KEY (ShopID) REFERENCES SHOP(ShopID),
	DepartmentType CHAR(1) NOT NULL CHECK (DepartmentType IN ( 'R' , 'O')) -- 'O' for OFFICE, 'R' for REPAIR_INSTALLATION
);

-- Subclass OFFICE inheriting DEPARTMENT
CREATE TABLE OFFICE (
    OfficeID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentID INT NOT NULL,
    OfficeType VARCHAR(50) NOT NULL,
	ComputerCount INT, -- DERIVED ATTRIBUTE???
	PrinterCount INT,-- DERIVED ATTRIBUTE???
	OfficeSubDepartmentType CHAR(1) NOT NULL CHECK (OfficeSubDepartmentType IN ('E', 'A', 'C')) -- 'E' for E-COMMERCE, 'A' for ACCOUNTING, 'C' for CUSTOMER_SERVICE
    FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID),
	--CHECK (department_id IN (SELECT department_id FROM DEPARTMENT WHERE type = 'O'))
);

-- Subclass E-COMMERCE inheriting OFFICE
CREATE TABLE E_COMMERCE (
    EcommerceID INT IDENTITY(1,1) PRIMARY KEY,
    OfficeID INT NOT NULL,
    WebsiteName VARCHAR(100),
    FOREIGN KEY (OfficeID) REFERENCES OFFICE(OfficeID),
	--CHECK (office_id IN (SELECT office_id FROM OFFICE WHERE type = 'E'))
);


-- Multivalued Attribute of E-COMMERCE
CREATE TABLE E_COMMERCE_MONTHLY_PROFIT (
	EcommerceMonthlyProfit INT IDENTITY(1,1) PRIMARY KEY,
	EcommerceID INT NOT NULL,
	EcommerceMonthlyProfitAmount INT,
	EcommerceMonthlyProfitMonth TINYINT NOT NULL CHECK (EcommerceMonthlyProfitMonth BETWEEN 1 AND 12), -- 1 to 12
    EcommerceMonthlyProfitYear SMALLINT NOT NULL CHECK (EcommerceMonthlyProfitYear >= 2000), -- Valid year range
	FOREIGN KEY (EcommerceID) REFERENCES E_COMMERCE(EcommerceID)
);


-- Subclass ACCOUNTING inheriting OFFICE
CREATE TABLE ACCOUNTING (
    AccountingID INT IDENTITY(1,1) PRIMARY KEY,
    OfficeID INT NOT NULL,
    FinanceTool VARCHAR(100),
	MonthlyTotalProfit INT,
	MonthlyExpenses INT, 
    FOREIGN KEY (OfficeID) REFERENCES OFFICE(OfficeID),
	--CHECK (office_id IN (SELECT office_id FROM OFFICE WHERE type = 'A'))
);


-- Multivalued Attribute of ACCOUNTING
CREATE TABLE ACCOUNTING_MONTHLY_PROFIT (
	AccountingMonthlyProfitID INT IDENTITY(1,1) PRIMARY KEY,
	AccountingID INT NOT NULL,
	AccountingMonthlyProfitAmount INT,
	AccountingMonthlyProfitMonth TINYINT NOT NULL CHECK (AccountingMonthlyProfitMonth BETWEEN 1 AND 12),
	AccountingMonthlyProfitYear SMALLINT NOT NULL CHECK (AccountingMonthlyProfitYear >= 2000),
	FOREIGN KEY(AccountingID) REFERENCES ACCOUNTING(AccountingID)
);

-- Multivalued Attribute of ACCOUNTING
CREATE TABLE ACCOUNTING_MONTHLY_EXPENSES (
	AccountingMonthlyExpensesID INT IDENTITY(1,1) PRIMARY KEY,
	AccountingID INT NOT NULL,
	AccountingMonthlyExpensesAmount INT,
	AccountingMonthlyExpensesMonth TINYINT NOT NULL CHECK (AccountingMonthlyExpensesMonth BETWEEN 1 AND 12),
	AccountingMonthlyExpensesYear SMALLINT NOT NULL CHECK (AccountingMonthlyExpensesYear >= 2000),
	FOREIGN KEY(AccountingID) REFERENCES ACCOUNTING(AccountingID)
);


-- Subclass CUSTOMER_SERVICE inheriting OFFICE
CREATE TABLE CUSTOMER_SERVICE (
    CustomerserviceID INT IDENTITY(1,1) PRIMARY KEY,
    OfficeID INT NOT NULL,
    SupportTool VARCHAR(100),
	TotalCallLogs VARCHAR(100),
	TotalComplaints VARCHAR(100),
	AverageSatisfactionScore FLOAT,
    FOREIGN KEY (OfficeID) REFERENCES OFFICE(OfficeID),
	--CHECK (office_id IN (SELECT office_id FROM OFFICE WHERE type = 'C'))
);

-- Subclass REPAIR_INSTALLATION inheriting DEPARTMENT
CREATE TABLE REPAIR_INSTALLATION (
    RepairInstallationID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentID INT NOT NULL,
    Specialization VARCHAR(100),
	MonthlyTotalProfit INT, --Multivalued Attribute???
    FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID),
	--CHECK (department_id IN (SELECT department_id FROM DEPARTMENT WHERE type = 'R'))
);

-- Multivalued Attribute of REPAIR_INSTALLATION
CREATE TABLE  REPAIR_INSTALLATION_PROFIT (
	RepairInstallationMonthlyProfitID INT IDENTITY(1,1) PRIMARY KEY,
	RepairInstallationID INT NOT NULL,
	RepairInstallationProfitAmount INT,
	RepairInstallationProfitMonth TINYINT NOT NULL CHECK (RepairInstallationProfitMonth BETWEEN 1 AND 12),
	RepairInstallationProfitYear SMALLINT NOT NULL CHECK (RepairInstallationProfitYear >= 2000),
	FOREIGN KEY(RepairInstallationID) REFERENCES REPAIR_INSTALLATION(RepairInstallationID)
);


-- Multivalued attribute of  REPAIR_INSTALLATION
CREATE TABLE REPAIR_INSTALLATION_TOOLS_INVENTORY (
    ToolID INT PRIMARY KEY IDENTITY(1,1), -- Unique identifier for each tool entry
    RepairID INT NOT NULL, -- Foreign key linking to REPAIR_INSTALLATION
    ToolName VARCHAR(100) NOT NULL, -- Name of the tool
    ToolQuantity INT NOT NULL, -- Quantity of the tool
    FOREIGN KEY (RepairID) REFERENCES REPAIR_INSTALLATION(RepairInstallationID)
);


/* ---------------------------------
WORKER
*/ ---------------------------------

CREATE TABLE WORKER(
	WorkerID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	FullName AS (FirstName + ' ' + LastName),
	Gender nvarchar(6) NOT NULL CHECK(Gender IN ('Female','Male')),
	Email nvarchar(50) unique NOT NULL,
	BirthDate Date NOT NULL,
	CONSTRAINT CHK_BirthDate CHECK (DATEDIFF(YEAR, BirthDate, GETDATE()) >= 18),
	Phone nvarchar(20) unique NOT NULL,
	Address_ nvarchar(50) NOT NULL,
	Salary smallmoney NOT NULL,
	StartDate Date NOT NULL,
	WorkerAge AS (DATEDIFF(YEAR, BirthDate, GETDATE()) - 
           CASE 
               WHEN (MONTH(BirthDate) > MONTH(GETDATE())) OR 
                    (MONTH(BirthDate) = MONTH(GETDATE()) AND DAY(BirthDate) > DAY(GETDATE()))
               THEN 1 
               ELSE 0 
           END),
	WorkerType nvarchar(1) NOT NULL CHECK(WorkerType IN ('M','E')),
	CONSTRAINT chk_Salary CHECK(Salary >= 17002),
	CONSTRAINT chk_IsAdult CHECK (
        DATEDIFF(YEAR, BirthDate, GETDATE()) -  
        CASE 
            WHEN (MONTH(BirthDate) > MONTH(GETDATE())) OR 
                 (MONTH(BirthDate) = MONTH(GETDATE()) AND DAY(BirthDate) > DAY(GETDATE()))
            THEN 1 
            ELSE 0 
        END >= 18
    )
);

CREATE TABLE MANAGER(
	 ManagerID INT IDENTITY(1,1) PRIMARY KEY,
	 AnnualLeaveDays INT NOT NULL,
	 ManagerType nvarchar(1) NOT NULL CHECK(ManagerType IN ('G','D')),
	 WorkerID INT FOREIGN KEY REFERENCES WORKER(WorkerID) ON DELETE CASCADE NOT NULL,
	 CONSTRAINT chk_AnnualLeaveDaysForManager CHECK(AnnualLeaveDays <= 30)
);

CREATE TABLE GENERAL_MANAGER(
	GeneralManagerID INT IDENTITY(1,1) PRIMARY KEY,
	IsShareHolder BIT NOT NULL CHECK(IsShareHolder >= 0),
	SharePercentage FLOAT NOT NULL CHECK(SharePercentage >= 0),
	ManagerID INT FOREIGN KEY REFERENCES MANAGER(ManagerID) ON DELETE CASCADE NOT NULL ,
	Constraint chk_isShareHolder_sharePercentage CHECK (
		(IsShareHolder = 0 AND SharePercentage = 0) OR
		(IsShareHolder != 0 AND SharePercentage < 100)
	)
);

CREATE TABLE DEPARTMENT_MANAGER(
	DepartmentManagerID INT IDENTITY(1,1) PRIMARY KEY,
	GeneralManagerID INT FOREIGN KEY REFERENCES GENERAL_MANAGER(GeneralManagerID),
	DepartmentID INT FOREIGN KEY REFERENCES DEPARTMENT(DepartmentID) NOT NULL,
	ManagerID INT FOREIGN KEY REFERENCES MANAGER(ManagerID) ON DELETE CASCADE NOT NULL
); 

CREATE TABLE EMPLOYEE(
	EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
	PerformanceRate FLOAT NOT NULL,
	EmployeeType nvarchar(1) NOT NULL CHECK(EmployeeType IN ('F','P')),
	--Department_ID INT FOREIGN KEY REFERENCES DEPARTMENT(Department_ID), --fk
	DepartmentManagerID INT FOREIGN KEY REFERENCES DEPARTMENT_MANAGER(DepartmentManagerID) NOT NULL, --fk
	DepartmentID INT FOREIGN KEY REFERENCES DEPARTMENT(DepartmentID) NOT NULL, --fk
	WorkerID INT FOREIGN KEY REFERENCES WORKER(WorkerID) ON DELETE CASCADE NOT NULL 
);

CREATE TABLE FULL_TIME(
	FullTimeID INT IDENTITY(1,1) PRIMARY KEY,
	AnnualLeaveDays INT NOT NULL,
	EmployeeID INT FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID) ON DELETE CASCADE NOT NULL,
	CONSTRAINT chk_AnnualLeaveDaysForFullTime CHECK(AnnualLeaveDays <= 30)
);

CREATE TABLE PART_TIME(
	PartTimeID INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeID INT FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID) ON DELETE CASCADE NOT NULL
);

CREATE TABLE WORKING_TIMES(
	WorkingTimesID INT IDENTITY(1,1) PRIMARY KEY,
	Day_ nvarchar(9) NOT NULL CHECK(Day_ IN ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')),
	StartTime Time NOT NULL,
	EndTime Time NOT NULL,
	PartTimeID INT FOREIGN KEY REFERENCES PART_TIME(PartTimeID) NOT NULL
);


/* ---------------------------------
SERVICE
*/ ---------------------------------

CREATE TABLE SERVICE_(
	ServiceID INT IDENTITY(1,1) PRIMARY KEY,
	ServiceName nvarchar(50) NOT NULL,
	ServiceDescription nvarchar(50) NOT NULL,
	ServicePrice decimal(10,2) NOT NULL,
	VehicleRegistrationID INT NOT NULL,
	ServiceType nvarchar(1) CHECK(ServiceType IN ('R','I')),
	RepairShopID INT FOREIGN KEY REFERENCES REPAIR_SHOP(RepairShopID),
	CONSTRAINT chk_ServicePrice CHECK(ServicePrice >= 500)
);

CREATE TABLE REPAIR(
	RepairID INT IDENTITY(1,1) PRIMARY KEY,
	ServiceID INT FOREIGN KEY REFERENCES SERVICE_(ServiceID) ON DELETE CASCADE NOT NULL 
);

--???
CREATE TABLE TOOL_USED(
	ToolID INT IDENTITY(1,1) PRIMARY KEY,
	ToolName NVARCHAR(50) NOT NULL,
	RepairID INT FOREIGN KEY REFERENCES REPAIR(RepairID) ON DELETE CASCADE NOT NULL
);

CREATE TABLE INSTALLATION(
	InstallationID INT IDENTITY(1,1) PRIMARY KEY,
	ServiceID INT FOREIGN KEY REFERENCES SERVICE_(ServiceID) ON DELETE CASCADE NOT NULL 
);

CREATE TABLE PRODUCT_(
	ProductID INT IDENTITY(1,1) PRIMARY KEY,
	ProductName nvarchar(50) NOT NULL,
	Stock INT NOT NULL,
	ProductDescription nvarchar(50) NOT NULL,
	ProductPrice decimal(11,2) NOT NULL,
	ProductBrand nvarchar(50) NOT NULL,
	ProductType nvarchar(1) NOT NULL CHECK(ProductType IN ('H','A','V','T','F','O','E','K','S')),
	CONSTRAINT chk_ProductPrice CHECK(ProductPrice >= 0),
	CONSTRAINT chk_PStock CHECK(Stock >= 0)
);

CREATE TABLE PRODUCT_INSTALLATION(
	ProductID INT FOREIGN KEY REFERENCES PRODUCT_(ProductID) ON DELETE CASCADE NOT NULL ,
	InstallationID INT FOREIGN KEY REFERENCES INSTALLATION(InstallationID) ON DELETE CASCADE NOT NULL,
	PRIMARY KEY(ProductID, InstallationID)
);

CREATE TABLE HEATING_COOLING(
	HeatingCoolingID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID INT FOREIGN KEY REFERENCES PRODUCT_(ProductID) ON DELETE CASCADE NOT NULL,
	HCType nvarchar(50) NOT NULL,
	Width decimal(5,2) NOT NULL,
	Height decimal(5,2) NOT NULL,
	Depth decimal(5,2) NOT NULL,
	HCSize as (Width * Height * Depth) PERSISTED,
	PowerSource nvarchar(50) NOT NULL,
	Capacity decimal(5,2) NOT NULL, 
);

CREATE TABLE AWNING(
	AwningID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID INT FOREIGN KEY REFERENCES PRODUCT_(ProductID) ON DELETE CASCADE NOT NULL,
	Width decimal(5,2)NOT NULL,
	ALength decimal(5,2) NOT NULL,
	AwningSize as (Width * ALength) PERSISTED,
	AwningColor nvarchar(50) NOT NULL,
	AwningWeight decimal(5,2) NOT NULL,
);

CREATE TABLE VEHICLE(
	VehicleID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID INT FOREIGN KEY REFERENCES PRODUCT_(ProductID) ON DELETE CASCADE NOT NULL,
	VehicleBrand nvarchar(50) NOT NULL,
	VehicleModel nvarchar(50) NOT NULL,
	VehicleYear SMALLINT CHECK(VehicleYear <= 2024 AND VehicleYear >= 1900) NOT NULL,
	VehicleType nvarchar(1) CHECK(VehicleType IN ('T','M','C')) NOT NULL,
	VWidth decimal(5,2) NOT NULL,
	VLength decimal(5,2) NOT NULL,
	VehicleSize AS (VWidth * VLength) PERSISTED,
	WeightCapacity decimal(11,2) NOT NULL
);

CREATE TABLE TRAILER(
	TrailerID INT IDENTITY(1,1) PRIMARY KEY,
	VehicleID INT FOREIGN KEY REFERENCES VEHICLE(VehicleID) ON DELETE CASCADE NOT NULL,
	TrailerType nvarchar(50) NOT NULL
);

CREATE TABLE MOTOCARAVAN(
	MotocaravanID INT IDENTITY(1,1) PRIMARY KEY,
	VehicleID INT FOREIGN KEY REFERENCES VEHICLE(VehicleID) ON DELETE CASCADE NOT NULL,
	EngineSize decimal(5,2) NOT NULL,
	FuelType nvarchar(50) NOT NULL
);

CREATE TABLE CAMPER(
	CamperID INT IDENTITY(1,1) PRIMARY KEY,
	VehicleID INT FOREIGN KEY REFERENCES VEHICLE(VehicleID) ON DELETE CASCADE NOT NULL,
	EngineSize decimal(5,2) NOT NULL,
	FuelType nvarchar(50) NOT NULL,
	PopupRoof nvarchar(50) NOT NULL,
	Kitchenette nvarchar(50) NOT NULL
);

CREATE TABLE TOWBAR(
	TowbarID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID INT FOREIGN KEY REFERENCES PRODUCT_(ProductID) ON DELETE CASCADE NOT NULL,
	MaxTowingCapacity INT NOT NULL,
);

CREATE TABLE SUITABLE_CAR(
	SuitableCarID INT IDENTITY(1,1) PRIMARY KEY,
	SuitableCarName nvarchar(50) NOT NULL,
	TowbarID INT FOREIGN KEY REFERENCES TOWBAR(TowbarID)
);

CREATE TABLE FURNITURE_MULTIMEDIA(
	FurnitureMultimediaID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID INT FOREIGN KEY REFERENCES PRODUCT_(ProductID) ON DELETE CASCADE NOT NULL,
	FMType nvarchar(50) NOT NULL,
	FWidth decimal(5,2) NOT NULL,
	FLength decimal(5,2) NOT NULL,
	FDepth decimal(5,2) NOT NULL,
	FMSize AS (FWidth * FLength * FDepth) PERSISTED,
	PowerRequirement nvarchar(50) NOT NULL
);

CREATE TABLE OUTDOOR(
	OutdoorID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID INT FOREIGN KEY REFERENCES PRODUCT_(ProductID) ON DELETE CASCADE NOT NULL,
	OutdoorType NVARCHAR(50) NOT NULL,
	IsWaterProof BIT NOT NULL,
);

CREATE TABLE MATERIAL(
	MaterialID INT IDENTITY(1,1) PRIMARY KEY,
	MaterialName NVARCHAR(50) NOT NULL,
	OutdoorID INT NOT NULL FOREIGN KEY REFERENCES OUTDOOR(OutdoorID)
);

CREATE TABLE ENERGY_SYSTEM(
	EnergySystemID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID INT FOREIGN KEY REFERENCES PRODUCT_(ProductID) ON DELETE CASCADE NOT NULL,
	EnergySystemType NVARCHAR(50) NOT NULL,
	EWidth decimal(5,2) NOT NULL,
	ELength decimal(5,2) NOT NULL,
	EDepth decimal(5,2) NOT NULL,
	ESize AS (EWidth * ELength * EDepth) PERSISTED,
	PowerOutput NVARCHAR(50) NOT NULL,
	BatteryCapacity INT NOT NULL
);

CREATE TABLE KITCHEN(
	KitchenID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID INT FOREIGN KEY REFERENCES PRODUCT_(ProductID) ON DELETE CASCADE NOT NULL,
	KitchenType NVARCHAR(50) NOT NULL,
	PowerSource NVARCHAR(50) NOT NULL,
	KWidth decimal(5,2) NOT NULL,
	KLength decimal(5,2) NOT NULL,
	KDepth decimal(5,2) NOT NULL,
	KSize AS (KWidth * KLength * KDepth) PERSISTED,
);

CREATE TABLE SANITATION(
	SanitationID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID INT FOREIGN KEY REFERENCES PRODUCT_(ProductID) ON DELETE CASCADE NOT NULL,
	SanitationType NVARCHAR(50) NOT NULL,
	SWidth decimal(5,2) NOT NULL,
	SLength decimal(5,2) NOT NULL,
	SDepth decimal(5,2) NOT NULL,
	SSize AS (SWidth * SLength * SDepth) PERSISTED,
	WaterConsumption NVARCHAR(50) NOT NULL,
	IsPortable BIT NOT NULL
);

CREATE TABLE PRODUCT_SHOP(
	ProductID INT NOT NULL FOREIGN KEY REFERENCES PRODUCT_(ProductID),
	ShopID INT NOT NULL FOREIGN KEY REFERENCES SHOP(ShopID),
	PRIMARY KEY(ProductID, ShopID)
);







/* ---------------------------------
TRANSACTION
*/ ---------------------------------

CREATE TABLE TRANSACTION_(
	TransactionID INT IDENTITY(1,1) PRIMARY KEY,
	TransactionType NVARCHAR(2) NOT NULL CHECK(TransactionType IN ('C','BT','CC')),
	TransactionDate Date NOT NULL,
	TotalAmount decimal(11,2) NOT NULL,
	TaxAmount decimal(11,2) NULL, --It will be updated with trigger.
	TransactionStatus NVARCHAR(50) NOT NULL,
	CurrentType NVARCHAR(3) NOT NULL DEFAULT 'TRY',
	SupplierID INT NOT NULL FOREIGN KEY REFERENCES SUPPLIER(SupplierID),
	CustomerID INT NOT NULL FOREIGN KEY REFERENCES CUSTOMER(CustomerID),
	ShopID INT NOT NULL FOREIGN KEY REFERENCES SHOP(ShopID)
);

CREATE TABLE CASH(
	CashID INT IDENTITY(1,1) PRIMARY KEY,
	TransactionID INT FOREIGN KEY REFERENCES TRANSACTION_(TransactionID), 
	ChangeGiven decimal(11,2) NOT NULL,
	EmployeeID INT FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID)
);

CREATE TABLE BANK_TRANSFER(
	BankTransferID INT IDENTITY(1,1) PRIMARY KEY,
	TrancationID INT FOREIGN KEY REFERENCES TRANSACTION_(TransactionID),
	BankName NVARCHAR(50) NOT NULL,
	AccountNumber NVARCHAR(50) NOT NULL,
	BankTransferDiscount decimal(5,2) NOT NULL
);

CREATE TABLE CREDIT_CARD(
	CreditCardID INT IDENTITY(1,1) PRIMARY KEY,
	TransactionID INT FOREIGN KEY REFERENCES TRANSACTION_(TransactionID),
	CardType NVARCHAR(50) NOT NULL,
	CardIssuer NVARCHAR(50) NOT NULL,
	TransactionFee decimal(11,2) NOT NULL
);

CREATE TABLE TRANSACTION_CUSTOMER(
	TransactionID INT NOT NULL FOREIGN KEY REFERENCES TRANSACTION_(TransactionID),
	CustomerID INT NOT NULL FOREIGN KEY REFERENCES CUSTOMER(CustomerID),
	PRIMARY KEY(TransactionID, CustomerID)
);

CREATE TABLE TRANSACTION_SERVICE(
	TransactionID INT NOT NULL FOREIGN KEY REFERENCES TRANSACTION_(TransactionID),
	ServiceID INT NOT NULL FOREIGN KEY REFERENCES SERVICE_(ServiceID),
	PRIMARY KEY(TransactionID, ServiceID)
);

CREATE TABLE TRANSACTION_PRODUCT(
	TransactionID INT NOT NULL FOREIGN KEY REFERENCES TRANSACTION_(TransactionID),
	ProductID INT NOT NULL FOREIGN KEY REFERENCES PRODUCT_(ProductID),
	PRIMARY KEY(TransactionID, ProductID)
);