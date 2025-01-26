-------------------------
-- VIEWS
-------------------------
USE kampkaravan

GO
-- View to track Product Sales
-- Analyze transaction data over time (monthly).
CREATE VIEW vw_TransactionAnalytics AS
SELECT 
    YEAR(T.TransactionDate) AS Year,
    MONTH(T.TransactionDate) AS Month,
    COUNT(T.TransactionID) AS TransactionCount,
    SUM(T.TotalAmount) AS TotalAmount,
    SUM(T.TaxAmount) AS TotalTaxAmount
FROM TRANSACTION_ T
GROUP BY YEAR(T.TransactionDate), MONTH(T.TransactionDate)
GO


--View for Payment Summary per Transaction Type
--This view provides a summary of how much was paid via each transaction type (Cash, Bank Transfer, Credit Card) across all transactions.
CREATE VIEW vw_PaymentTypeSummary AS
SELECT 
    T.TransactionType,
    COUNT(T.TransactionID) AS TransactionCount,
    SUM(T.TotalAmount) AS TotalAmount,
    SUM(T.TaxAmount) AS TotalTaxAmount
FROM TRANSACTION_ T
GROUP BY T.TransactionType;

GO

--View to Calculate Revenue for Each Shop
--This view will calculate the total revenue (TotalAmount) and tax for each shop.
CREATE VIEW vw_ShopRevenue AS
SELECT 
    Sh.ShopID,
    SUM(T.TotalAmount) AS TotalRevenue,
    SUM(T.TaxAmount) AS TotalTaxAmount
FROM SHOP Sh
INNER JOIN TRANSACTION_ T ON Sh.ShopID = T.ShopID
GROUP BY Sh.ShopID;

GO

--View to Get Supplier and Product Transaction Details
--This view will join the SUPPLIER, TRANSACTION_, and TRANSACTION_PRODUCT tables to show each product sold and its related supplier’s transaction details.
CREATE VIEW vw_SupplierProductTransaction AS
SELECT 
    S.SupplierID,
    S.SupplierName,
    P.ProductID,
    P.ProductName,
    T.TransactionID,
    T.TotalAmount,
    T.TaxAmount,
    T.TransactionType
FROM SUPPLIER S
INNER JOIN TRANSACTION_ T ON S.SupplierID = T.SupplierID
INNER JOIN TRANSACTION_PRODUCT TP ON T.TransactionID = TP.TransactionID
INNER JOIN PRODUCT_ P ON TP.ProductID = P.ProductID;



GO

-- View Each Customer Total transaction amount
CREATE VIEW vw_IndividualCustomer AS
SELECT 
	IC.CustomerID,
	C.Email,
	C.PhoneNumber,
	C.BillingAddressCity,
	C.ShippingCity,
	C.RegistrationDate,
	SUM(T.TotalAmount) as TotalMoneySpentByCustomer,
	SUM(T.TaxAmount) as TotalTaxPayedByCustomer
FROM INDIVIDUAL_CUSTOMER IC
INNER JOIN CUSTOMER C ON IC.CustomerID = C.CustomerID
INNER JOIN TRANSACTION_ T on IC.CustomerID = T.CustomerID
GROUP BY IC.CustomerID, C.Email, C.PhoneNumber ,C.BillingAddressCity, C.ShippingCity, C.RegistrationDate;