USE kampkaravan
GO


--------------------------------------------------
--8 STORED PROCEDURES
--------------------------------------------------

--------------------------------------------------
--INSERT FULLTIMEWORKER (WORKER)
--------------------------------------------------

CREATE PROCEDURE InsertFullTimeWorker(
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Gender NVARCHAR(6),
    @Email NVARCHAR(50),
    @BirthDate DATE,
    @Phone NVARCHAR(20),
    @Address NVARCHAR(50),
    @Salary SMALLMONEY,
    @StartDate DATE,
    @PerformanceRate FLOAT,
    @AnnualLeaveDays INT,
    @DepartmentID INT,
    @DepartmentManagerID INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Worker tablosuna kayýt ekleme ve WorkerID'yi alma
        DECLARE @NewWorkerID INT;
        INSERT INTO Worker (FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
        VALUES (@FirstName, @LastName, @Gender, @Email, @BirthDate, @Phone, @Address, @Salary, @StartDate, 'E');
        SET @NewWorkerID = SCOPE_IDENTITY();

        -- Employee tablosuna kayýt ekleme ve EmployeeID'yi alma
        DECLARE @NewEmployeeID INT;
        INSERT INTO Employee (PerformanceRate, EmployeeType, DepartmentID, DepartmentManagerID, WorkerID)
        VALUES (@PerformanceRate, 'F', @DepartmentID, @DepartmentManagerID, @NewWorkerID);
        SET @NewEmployeeID = SCOPE_IDENTITY();

        -- FullTime tablosuna kayýt ekleme
        INSERT INTO FULL_TIME(AnnualLeaveDays, EmployeeID)
        VALUES (@AnnualLeaveDays, @NewEmployeeID);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

GO
/*
EXEC InsertFullTimeWorker
    @FirstName = 'John',
    @LastName = 'Doe',
    @Gender = 'Male',
    @Email = 'john.doe@example.com',
    @BirthDate = '1990-01-01',
    @Phone = '+1234567890',
    @Address = '123 Main Street, Cityville',
    @Salary = 25000,
    @StartDate = '2025-01-01',
    @PerformanceRate = 4.5,
    @AnnualLeaveDays = 20,
    @DepartmentID = 1,
    @DepartmentManagerID = 3;

	GO
*/

--------------------------------------------------
--UPDATE FULLTIME (WORKER)
--------------------------------------------------
CREATE PROCEDURE UpdateFullTimeWorker
    @WorkerID INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Gender NVARCHAR(6),
    @Email NVARCHAR(50),
    @BirthDate DATE,
    @Phone NVARCHAR(20),
    @Address NVARCHAR(50),
    @Salary SMALLMONEY,
    @StartDate DATE,
    @PerformanceRate FLOAT,
    @AnnualLeaveDays INT,
    @DepartmentID INT,
    @DepartmentManagerID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Worker tablosunu güncelleme
        UPDATE Worker
        SET FirstName = @FirstName,
            LastName = @LastName,
            Gender = @Gender,
            Email = @Email,
            BirthDate = @BirthDate,
            Phone = @Phone,
            Address_ = @Address,
            Salary = @Salary,
            StartDate = @StartDate
        WHERE WorkerID = @WorkerID;

        -- Employee tablosunu güncelleme
        UPDATE Employee
        SET PerformanceRate = @PerformanceRate,
            DepartmentID = @DepartmentID,
            DepartmentManagerID = @DepartmentManagerID
        WHERE WorkerID = @WorkerID;

        -- FullTime tablosunu güncelleme
        UPDATE FULL_TIME
        SET AnnualLeaveDays = @AnnualLeaveDays
        WHERE EmployeeID = (SELECT EmployeeID FROM Employee WHERE WorkerID = @WorkerID);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

GO

--------------------------------------------------
--READ FULLTIME (WORKER)
--------------------------------------------------

CREATE PROCEDURE ReadFullTimeWorker
    @WorkerID INT = NULL
AS
BEGIN
    SELECT 
        W.WorkerID,
        W.FirstName,
        W.LastName,
        W.Gender,
        W.Email,
        W.BirthDate,
        W.Phone,
        W.Address_,
        W.Salary,
        W.StartDate,
        E.PerformanceRate,
        F.AnnualLeaveDays,
        D.DepartmentName
    FROM Worker W
    INNER JOIN Employee E ON W.WorkerID = E.WorkerID
    INNER JOIN FULL_TIME F ON E.EmployeeID = F.EmployeeID
    INNER JOIN Department D ON E.DepartmentID = D.DepartmentID
    WHERE (@WorkerID IS NULL OR W.WorkerID = @WorkerID);
END;

GO

--------------------------------------------------
--DELETE FULLTIME (WORKER)
--------------------------------------------------

CREATE PROCEDURE DeleteFullTimeWorker
    @WorkerID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- FullTime tablosundan silme
        DELETE FROM FULL_TIME
        WHERE EmployeeID = (SELECT EmployeeID FROM Employee WHERE WorkerID = @WorkerID);

        -- Employee tablosundan silme
        DELETE FROM Employee
        WHERE WorkerID = @WorkerID;

        -- Worker tablosundan silme
        DELETE FROM Worker
        WHERE WorkerID = @WorkerID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

GO





--------------------------------------------------
--INSERT PartTimeWorker (WORKER)
--------------------------------------------------

CREATE PROCEDURE InsertPartTimeWorker(
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Gender NVARCHAR(6),
    @Email NVARCHAR(50),
    @BirthDate DATE,
    @Phone NVARCHAR(20),
    @Address NVARCHAR(50),
    @Salary SMALLMONEY,
    @StartDate DATE,
    @PerformanceRate FLOAT,
    @AnnualLeaveDays INT,
    @DepartmentID INT,
    @DepartmentManagerID INT,
	@Day_ NVARCHAR(9),
	@StartTime TIME,
	@EndTime TIME
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Worker tablosuna kayýt ekleme ve WorkerID'yi alma
        DECLARE @NewWorkerID INT;
        INSERT INTO Worker (FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
        VALUES (@FirstName, @LastName, @Gender, @Email, @BirthDate, @Phone, @Address, @Salary, @StartDate, 'E');
        SET @NewWorkerID = SCOPE_IDENTITY();

        -- Employee tablosuna kayýt ekleme ve EmployeeID'yi alma
        DECLARE @NewEmployeeID INT;
        INSERT INTO Employee (PerformanceRate, EmployeeType, DepartmentID, DepartmentManagerID, WorkerID)
        VALUES (@PerformanceRate, 'F', @DepartmentID, @DepartmentManagerID, @NewWorkerID);
        SET @NewEmployeeID = SCOPE_IDENTITY();

        -- FullTime tablosuna kayýt ekleme
		DECLARE @NewPartTimeID INT;
        INSERT INTO PART_TIME(EmployeeID)
        VALUES (@NewEmployeeID);
		SET @NewPartTimeID = SCOPE_IDENTITY();

		--Working_Times Tablosuna ekleme
		INSERT INTO WORKING_TIMES(Day_, StartTime, EndTime, PartTimeID)
		VALUES(@Day_, @StartTime, @EndTime, @NewPartTimeID);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

GO

--------------------------------------------------
--INSERT GeneralManager (WORKER)
--------------------------------------------------

CREATE PROCEDURE InsertGeneralManager(
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Gender NVARCHAR(6),
    @Email NVARCHAR(50),
    @BirthDate DATE,
    @Phone NVARCHAR(20),
    @Address NVARCHAR(50),
    @Salary SMALLMONEY,
    @StartDate DATE,
    @AnnualLeaveDays INT,
    @IsShareHolder BIT,
    @SharePercentage FLOAT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Worker tablosuna kayýt ekleme ve WorkerID'yi alma
        DECLARE @NewWorkerID INT;
        INSERT INTO Worker (FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
        VALUES (@FirstName, @LastName, @Gender, @Email, @BirthDate, @Phone, @Address, @Salary, @StartDate, 'M');
        SET @NewWorkerID = SCOPE_IDENTITY();

        -- Manager tablosuna kayýt ekleme ve ManagerID'yi alma
        DECLARE @NewManagerID INT;
        INSERT INTO Manager (ManagerType, AnnualLeaveDays, WorkerID)
        VALUES ('G', @AnnualLeaveDays, @NewWorkerID);
        SET @NewManagerID = SCOPE_IDENTITY();

        -- General_Manager tablosuna kayýt ekleme
        INSERT INTO General_Manager (IsShareHolder, SharePercentage, ManagerID)
        VALUES (@IsShareHolder, @SharePercentage, @NewManagerID);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

GO

/*
EXEC InsertGeneralManager
    @FirstName = 'Alice',
    @LastName = 'Smith',
    @Gender = 'Female',
    @Email = 'alice.smith@example.com',
    @BirthDate = '1985-06-15',
    @Phone = '+asdas',
    @Address = '456 Elm Street, Cityville',
    @Salary = 50000,
    @StartDate = '2025-01-01',
    @AnnualLeaveDays = 25,
    @IsShareHolder = 1,
    @SharePercentage = 10.5;

GO
*/

--------------------------------------------------
--INSERT Department Manager(WORKER)
--------------------------------------------------

CREATE PROCEDURE InsertDepartmentManager(
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Gender NVARCHAR(6),
    @Email NVARCHAR(50),
    @BirthDate DATE,
    @Phone NVARCHAR(20),
    @Address NVARCHAR(50),
    @Salary SMALLMONEY,
    @StartDate DATE,
    @AnnualLeaveDays INT,
    @PerformanceRate FLOAT,
    @GeneralManagerID INT,  -- Foreign key to General_Manager
    @DepartmentID INT       -- Foreign key to Department
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Worker tablosuna kayýt ekleme ve WorkerID'yi alma
        DECLARE @NewWorkerID INT;
        INSERT INTO Worker (FirstName, LastName, Gender, Email, BirthDate, Phone, Address_, Salary, StartDate, WorkerType)
        VALUES (@FirstName, @LastName, @Gender, @Email, @BirthDate, @Phone, @Address, @Salary, @StartDate, 'M');
        SET @NewWorkerID = SCOPE_IDENTITY();

        -- Manager tablosuna kayýt ekleme ve ManagerID'yi alma
        DECLARE @NewManagerID INT;
        INSERT INTO Manager (ManagerType, AnnualLeaveDays, WorkerID)
        VALUES ('D', @AnnualLeaveDays, @NewWorkerID);
        SET @NewManagerID = SCOPE_IDENTITY();

        -- Department_Manager tablosuna kayýt ekleme
        INSERT INTO Department_Manager (GeneralManagerID, DepartmentID, ManagerID)
        VALUES (@GeneralManagerID, @DepartmentID, @NewManagerID);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

GO


--------------------------------------------------
--CUSTOMER STORED PROCEDURES
--------------------------------------------------
-- It contains 2update and 2delete stored procedure
-- on customer tables


--------------------------------------------------
--INSERT INDIVIDUAL CUSTOMER(CUSTOMER)
--------------------------------------------------


CREATE PROCEDURE InsertIndividualCustomer
    @ShippingCountry NVARCHAR(50),
    @ShippingProvince NVARCHAR(50),
    @ShippingCity NVARCHAR(50),
    @ShippingDistrict NVARCHAR(50),
    @ShippingStreet NVARCHAR(50),
    @ShippingBuilding NVARCHAR(50),
    @ShippingDoorNumber NVARCHAR(50),
    @ShippingZipCode NVARCHAR(50),
    @BillingCountry NVARCHAR(50),
    @BillingProvince NVARCHAR(50),
    @BillingCity NVARCHAR(50),
    @BillingDistrict NVARCHAR(50),
    @BillingStreet NVARCHAR(50),
    @BillingBuilding NVARCHAR(50),
    @BillingDoorNumber NVARCHAR(50),
    @BillingZipCode NVARCHAR(50),
    @Email NVARCHAR(50),
    @PhoneNumber NVARCHAR(50),
    @RegistrationDate DATE,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Gender NVARCHAR(1),
    @Age INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- CUSTOMER tablosuna kayýt ekleme
        DECLARE @NewCustomerID INT;
        INSERT INTO CUSTOMER (
            ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding,
            ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity,
            BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber,
            BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType
        )
        VALUES (
            @ShippingCountry, @ShippingProvince, @ShippingCity, @ShippingDistrict, @ShippingStreet, @ShippingBuilding,
            @ShippingDoorNumber, @ShippingZipCode, @BillingCountry, @BillingProvince, @BillingCity, @BillingDistrict,
            @BillingStreet, @BillingBuilding, @BillingDoorNumber, @BillingZipCode, @Email, @PhoneNumber,
            @RegistrationDate, 'I'
        );
        SET @NewCustomerID = SCOPE_IDENTITY();

        -- INDIVIDUAL_CUSTOMER tablosuna kayýt ekleme
        INSERT INTO INDIVIDUAL_CUSTOMER (
            CustomerID, IndividiualCustomerFirstName, IndividiualCustomerLastName, IndividiualCustomerGender,
            IndividiualCustomerAge
        )
        VALUES (
            @NewCustomerID, @FirstName, @LastName, @Gender, @Age
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

GO

--------------------------------------------------
--INSERT DEALER(CUSTOMER)
--------------------------------------------------


CREATE PROCEDURE InsertDealer
    @ShippingCountry NVARCHAR(50),
    @ShippingProvince NVARCHAR(50),
    @ShippingCity NVARCHAR(50),
    @ShippingDistrict NVARCHAR(50),
    @ShippingStreet NVARCHAR(50),
    @ShippingBuilding NVARCHAR(50),
    @ShippingDoorNumber NVARCHAR(50),
    @ShippingZipCode NVARCHAR(50),
    @BillingCountry NVARCHAR(50),
    @BillingProvince NVARCHAR(50),
    @BillingCity NVARCHAR(50),
    @BillingDistrict NVARCHAR(50),
    @BillingStreet NVARCHAR(50),
    @BillingBuilding NVARCHAR(50),
    @BillingDoorNumber NVARCHAR(50),
    @BillingZipCode NVARCHAR(50),
    @Email NVARCHAR(50),
    @PhoneNumber NVARCHAR(50),
    @RegistrationDate DATE,
    @CompanyName NVARCHAR(50),
    @DiscountRate NVARCHAR(50),
    @Representative NVARCHAR(50),
    @Industry NVARCHAR(50),
    @TaxID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- CUSTOMER tablosuna kayýt ekleme
        DECLARE @NewCustomerID INT;
        INSERT INTO CUSTOMER (
            ShippingCountry, ShippingProvince, ShippingCity, ShippingDistrict, ShippingStreet, ShippingBuilding,
            ShippingDoorNumber, ShippingZipCode, BillingAddressCountry, BillingAddressProvince, BillingAddressCity,
            BillingAddressDistrict, BillingAddressStreet, BillingAddressBuilding, BillingAddressDoorNumber,
            BillingAddressZipCode, Email, PhoneNumber, RegistrationDate, CustomerType
        )
        VALUES (
            @ShippingCountry, @ShippingProvince, @ShippingCity, @ShippingDistrict, @ShippingStreet, @ShippingBuilding,
            @ShippingDoorNumber, @ShippingZipCode, @BillingCountry, @BillingProvince, @BillingCity, @BillingDistrict,
            @BillingStreet, @BillingBuilding, @BillingDoorNumber, @BillingZipCode, @Email, @PhoneNumber,
            @RegistrationDate, 'D'
        );
        SET @NewCustomerID = SCOPE_IDENTITY();

        -- DEALER tablosuna kayýt ekleme
        INSERT INTO DEALER (
            CustomerID, DealerCompanyName, DealerDiscountRate, DealerRepresentative, DealerIndustry, DealerTaxID
        )
        VALUES (
            @NewCustomerID, @CompanyName, @DiscountRate, @Representative, @Industry, @TaxID
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;



--------------------------------------------------------------------
--DELETE IndividualCustomer (CUSTOMER)
--------------------------------------------------------------------
GO
CREATE PROCEDURE DeleteIndividualCustomer
    @CustomerID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- CUSTOMER tablosundan ve baðlý INDIVIDUAL_CUSTOMER tablosundan silme iþlemi
        DELETE FROM CUSTOMER
        WHERE CustomerID = @CustomerID
          AND CustomerType = 'I';

        -- Not: ON DELETE CASCADE nedeniyle INDIVIDUAL_CUSTOMER tablosundaki kayýt otomatik silinecektir.

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

GO



--------------------------------------------------------------------
--DELETE Dealer (CUSTOMER)
--------------------------------------------------------------------

CREATE PROCEDURE DeleteDealer
    @CustomerID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- CUSTOMER tablosundan ve baðlý DEALER tablosundan silme iþlemi
        DELETE FROM CUSTOMER
        WHERE CustomerID = @CustomerID
          AND CustomerType = 'D';

        -- Not: ON DELETE CASCADE nedeniyle DEALER tablosundaki kayýt otomatik silinecektir.

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
