/* --------------------------------
INDEXES
-- All Foreign Keys are indexed
-- Customer Registration Date is indexed.
*/ --------------------------------
USE master
GO


USE kampkaravan


/* --------------------------------
SUPPLIER INDEXES
*/ --------------------------------

CREATE INDEX idxOnlineShop
ON ONLINE_SHOP (ShopID);


CREATE INDEX idxWebSite
ON WEBSITE (OnlineShopID);

CREATE INDEX idxShowRoom
ON SHOWROOM (ShopID);

CREATE INDEX idxRepairShop
ON REPAIR_SHOP (ShopID);

/* ---------------------------------
CUSTOMER INDEXES
*/ ---------------------------------

-- Registration is indexed because it may be used in data analysis.
CREATE INDEX idxCustomerRegistrationDate
ON CUSTOMER (RegistrationDate);

CREATE INDEX idxCustomerShopCustomerID
ON CUSTOMER_SHOP (CustomerID);

CREATE INDEX idxCustomerShopShopID
ON CUSTOMER_SHOP (ShopID);

CREATE INDEX idxIndividiualCustomer
ON INDIVIDUAL_CUSTOMER (IndividualCustomerID);

		
CREATE INDEX idxDealer
ON DEALER (CustomerID);


/* ---------------------------------
DEPARTMENT INDEXES
*/ ---------------------------------

CREATE INDEX idxDepartment
ON DEPARTMENT (ShopID);

CREATE INDEX idxOffice
ON OFFICE (DepartmentID);

CREATE INDEX idxEcommerce
ON E_COMMERCE (OfficeID);

CREATE INDEX idxEcommerceMonthlyProfit
ON E_COMMERCE_MONTHLY_PROFIT (EcommerceID);

CREATE INDEX idx_Accounting
ON ACCOUNTING (OfficeID);

CREATE INDEX idxAccountingMonthlyProfit
ON ACCOUNTING_MONTHLY_PROFIT (AccountingID);

CREATE INDEX idxAccountingMonthlyExpenses
ON ACCOUNTING_MONTHLY_EXPENSES (AccountingID);


CREATE INDEX idxCustomerService
ON CUSTOMER_SERVICE (OfficeID);

CREATE INDEX idxRepairInstallation
ON REPAIR_INSTALLATION (DepartmentID);

CREATE INDEX idxRepairInstallationProfit
ON REPAIR_INSTALLATION_PROFIT (RepairInstallationID);

CREATE INDEX idxRepairInstallationToolsInventory
ON REPAIR_INSTALLATION_TOOLS_INVENTORY (RepairID);

/* ---------------------------------
WORKER INDEXES
*/ ---------------------------------

CREATE INDEX idxManager
ON MANAGER (WorkerID);

CREATE INDEX idxGeneralManager
ON GENERAL_MANAGER (ManagerID);

CREATE INDEX idxDepartmentManagerGeneralManagerIdx
ON DEPARTMENT_MANAGER (GeneralManagerID);

CREATE INDEX idxDepartmentManagerDepartmentIdx
ON DEPARTMENT_MANAGER (DepartmentID);

CREATE INDEX idxDepartmentManagerManagerIdx
ON DEPARTMENT_MANAGER (ManagerID);

CREATE INDEX idxEmployeeDepartmentManageRIdx
ON EMPLOYEE (DepartmentManagerID);

CREATE INDEX idxEmployeeDepartmentIdx
ON EMPLOYEE (DepartmentID);

CREATE INDEX idxEmployeeWorkerIdx
ON EMPLOYEE (WorkerID);

CREATE INDEX idxFullTime
ON FULL_TIME (EmployeeID);

CREATE INDEX idxPartTime
ON PART_TIME (EmployeeID);

CREATE INDEX idxWorkingTimes
ON WORKING_TIMES (PartTimeID);


/* ---------------------------------
SERVICE INDEXES
*/ ---------------------------------

CREATE INDEX idxService
ON SERVICE_ (RepairShopID);

CREATE INDEX idxRepair
ON REPAIR (ServiceID);

CREATE INDEX idxToolUsed
ON TOOL_USED (RepairID);

CREATE INDEX idxInstallation
ON INSTALLATION (ServiceID);

CREATE INDEX idxProductInstallationProductIdx
ON PRODUCT_INSTALLATION (ProductID);

CREATE INDEX idxProductInstallationInstallationIdx
ON PRODUCT_INSTALLATION (InstallationID);


/* ---------------------------------
TRANSACTION INDEXES
*/ ---------------------------------

CREATE INDEX idxTransactionSupplierIdx
ON TRANSACTION_ (SupplierID);

CREATE INDEX idxTransactionCustomerIdx
ON TRANSACTION_ (CustomerID);

CREATE INDEX idxTransactionShopIdx
ON TRANSACTION_ (ShopID);

CREATE INDEX idxCashTransactionIdx
ON CASH (TransactionID);

CREATE INDEX idxCashEmployeeIdx
ON CASH (EmployeeID);

CREATE INDEX idxBankTransfer
ON BANK_TRANSFER (TrancationID);

CREATE INDEX idxCreditCard
ON CREDIT_CARD (TransactionID);

CREATE INDEX idxTransactionCustomerTransactionIdx
ON TRANSACTION_CUSTOMER (TransactionID);

CREATE INDEX idxTransactionCustomerCustomerIdx
ON TRANSACTION_CUSTOMER (CustomerID);

CREATE INDEX idxTransactionServiceTransactionIdx
ON TRANSACTION_SERVICE (TransactionID);

CREATE INDEX idxTransactionServiceServiceIdx
ON TRANSACTION_SERVICE (ServiceID);

CREATE INDEX idxTransactionProductTransactionIdx
ON TRANSACTION_PRODUCT (TransactionID);

CREATE INDEX idxTransactionProductProductIdx
ON TRANSACTION_PRODUCT (ProductID);

