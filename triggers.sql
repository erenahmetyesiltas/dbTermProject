/* --------------------------------
TRIGGERS
*/ --------------------------------
USE kampkaravan
GO

-- Trigger for calculating of the contract period of REGULAR_SUPPLIER
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
	INNER JOIN inserted ON REGULAR_SUPPLIER.SupplierID = inserted.SupplierID;
END;

GO


CREATE TRIGGER trg_CalculateTaxAmount
ON TRANSACTION_
AFTER INSERT
AS
BEGIN
    UPDATE TRANSACTION_
    SET TaxAmount = CASE
                        WHEN TRANSACTION_.TaxAmount IS NULL THEN TRANSACTION_.TotalAmount * 0.20 -- Assuming 20% tax
                        ELSE TRANSACTION_.TaxAmount
                    END
    FROM TRANSACTION_
    INNER JOIN inserted ON TRANSACTION_.TransactionID = inserted.TransactionID;
END;
GO


--Automatically set the TransactionStatus to "Completed" when a payment is recorded
-- in any of the payment tables (CASH, BANK_TRANSFER, CREDIT_CARD).
CREATE TRIGGER trigger_UpdateTransactionStatus
ON CASH
AFTER INSERT
AS
BEGIN
    UPDATE TRANSACTION_
    SET TransactionStatus = 'Completed'
    WHERE TransactionID IN (SELECT TransactionID FROM inserted);
END;

GO

CREATE TRIGGER trg_UpdateTransactionStatus_Bank
ON BANK_TRANSFER
AFTER INSERT
AS
BEGIN
    UPDATE TRANSACTION_
    SET TransactionStatus = 'Completed'
    WHERE TransactionID IN (SELECT TrancationID FROM inserted);
END;

GO 

CREATE TRIGGER trg_UpdateTransactionStatus_CreditCard
ON CREDIT_CARD
AFTER INSERT
AS
BEGIN
    UPDATE TRANSACTION_
    SET TransactionStatus = 'Completed'
    WHERE TransactionID IN (SELECT TransactionID FROM inserted);
END;
