
							
/*							
							=>  SQL Project Name : Restaurant Management Systems(RMS) 
							=>  By : Md Faruk Hossain   
						   

																															*/
--=====================================   START OF DDL SCRIPT   =======================================--




/*-------------------DML: 01. Data Insert(Via SP)
                          02. Data Update(Via SP)
                          03. Data Delete(Via SP)
                          04. Data Select
                          05. CASE
                          06. CTE
                          07. MERGE
                          08. Grouping SETS
                          09. ROLLUP
                          10. CUBE
                          11. JOIN Query
                          12. SubQuery(Inner SubQuery, Co-related SubQuery)
                          13. Aggregate Function
                          14. Built-in Function 
                          15. CAST- CONVERT
                          16. TRY....CATCH
                          17. IF...ELSE
                          18. LOOP(While LOOP)
                          19. GOTO
                          20. WAITFOR
                          21. SELECT INTO
                          22. Test Trigger
                          23. Test View
                          24. Test UDF
                          25. Test SP
*/




CREATE DATABASE RestaurantManagementSystem
ON
(
	      NAME= 'RestaurantManagementSystem_Data',
	      FILENAME='H:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RestaurantManagementSystem_Data.mdf',
	      SIZE=100MB,
	      MAXSIZE=1GB,
	      FILEGROWTH=10MB
)
LOG ON
(
		  NAME= 'RestaurantManagementSystem_Log',
	      FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RestaurantManagementSystem_Log.ldf',
	      SIZE=50MB,
	      MAXSIZE=1GB,
	      FILEGROWTH=10%
)
GO


USE RestaurantManagementSystem
GO
---------------------------1.CREATE TABLE Menugroup-----------------------------
CREATE TABLE Menugroup
(
	        CatagoryId INT PRIMARY KEY,
	        [Name] VARCHAR(100) NOT NULL
)
GO

SELECT *FROM Menugroup
GO
----------------------------2.CREATE TABLE ItemDetails--------------------------
CREATE TABLE ItemDetails
(
	        ItemId INT PRIMARY KEY IDENTITY,
	        CatagoryId INT REFERENCES Menugroup(CatagoryId),
	        ItemName VARCHAR(100) NOT NULL,
	        UnitPrice MONEY NOT NULL
	
)
GO
SELECT *FROM ItemDetails
GO
------------------------------3.CREATE TABLE Customers----------------------------
CREATE TABLE Customers
(
	     CustomerId INT PRIMARY KEY,
	     CustomerFName NVARCHAR(20) NOT NULL,
	     CustomerLName NVARCHAR(20)  NULL,
	     PhoneNo VARCHAR(17) CHECK(PhoneNo like '%[0-9]') DEFAULT NULL
)
GO
SELECT *FROM Customers
GO
-------------------------------4.CREATE TABLE Designation-------------------------
CREATE TABLE Designation
(
	    DesignationId INT PRIMARY KEY IDENTITY,
	    Titlename VARCHAR(52) NOT NULL
)
GO

SELECT *FROM Designation
GO
-----------------------------5.CREATE TABLE Employees------------------------------
CREATE TABLE Employees
(
	    EmployeeId INT PRIMARY KEY,
	    [Name]VARCHAR(100) NOT NULL,
	    DesignationId INT REFERENCES Designation(DesignationId),
	    PhoneNo VARCHAR(17) NOT NULL,
	    Gender VARCHAR(50) NOT NULL,
	    Age INT NOT NULL,
	    NID CHAR(13) NOT NULL UNIQUE CHECK(NID LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	    Email VARCHAR(50) NULL,
	    Empcity VARCHAR(20) NOT NULL,
	    Empcountry VARCHAR(30) NULL,
	    EmpImage  VARCHAR(MAX) NOT NULL DEFAULT 'N/A',
	    [Address] VARCHAR(200) NOT NULL
)
GO

SELECT *FROM Employees
GO
------------------------------6.CREATE TABLE TableDetails-------------------------

CREATE TABLE TableDetails
(
	     TableId INT PRIMARY KEY IDENTITY, 
	     [Name] VARCHAR(50) NOT NULL,
	     EmployeeId INT REFERENCES Employees(EmployeeId),
)
GO

SELECT *FROM TableDetails
GO

----------------------------7.CREATE TABLE Orders------------------------------------
CREATE TABLE Orders
(
	      OrderId INT PRIMARY KEY IDENTITY,
	      CustomerId INT REFERENCES Customers(CustomerId),
	      TableId INT REFERENCES TableDetails(TableId),
	      ItemId INT REFERENCES ItemDetails(ItemId ),
	      Quantity INT,
	      Discount FLOAT NOT NULL DEFAULT 0,
	      Amount AS (Quantity*Discount)
	
)
GO
(SELECT ItemDetails.UnitPrice*Orders.Quantity*(1-Discount)'Total' FROM ItemDetails,Orders WHERE ItemDetails.ItemId=Orders.OrderId )
GO

SELECT *FROM Orders
GO
--------------------------8.CREATE TABLE Products-----------------------------------
CREATE TABLE Products
(
	ProdId INT PRIMARY KEY,
	ProName VARCHAR(50) NOT NULL,
	Quantity INT
)
GO

CREATE Sequence SProducts
Start with 1001
increment by 1
GO

SELECT *FROM Products
GO
------------------------9.CREATE TABLE Customertbl----------------------------------
CREATE TABLE Customertbl
(
	CustId INT,
	CustName VARCHAR(20) NOT NULL,
	Quantity INT,
	UnitPrice MONEY
)
GO

SELECT * FROM Customertbl
GO
-------------------------------------ALTER TABLE (ADD, DELETE COLUMN, DROP COLUMN)---------------------------------------------------


---------------------------------------- ADD COLUMN TO A EXISTING TABLE----------------------------------------------------------
 
ALTER TABLE Products
ADD Price MONEY 
GO
SELECT *FROM Products
GO
-------------------------------------------DELETE COLUMN FROM A EXISTING TABLE--------------------------------------------------------------
ALTER TABLE Products
DROP COLUMN ProName
GO
--------------------------------------------------------DROP A TABLE------------------------------------------------------------------------

IF OBJECT_ID('Customer') IS NOT NULL
DROP TABLE Customertbl
GO
---==================1.CREATING INDEX, 2.VIEW, 3.STORED PROCEDURE, 4.FUNTIONS, 5.TRIGGERS ON THE TABLE CREATE BEFORE========================


------------------------------------------------------------001 INDEX ----------------------------------------------------------------------

-------------------------------------CREATING A NONCLUSTERED INDEX FOR CUSTOMER TABLE-------------------------------------------------------

CREATE UNIQUE NONCLUSTERED INDEX IX_Prodcut
ON Products (Quantity)    
GO
-------------------------------------CREATING A CLUSTERED INDEX FOR CUSTOMER TABLE---------------------------------------------------------

CREATE CLUSTERED INDEX IX_Customer
ON Customertbl(CustId)
GO


--------------------------------------------------------    002 VIEW     -------------------------------------------------------------------

--CREATE A VIEW FOR UPDATE, INSERT AND DELETE DATA FROM BASE TABLE

CREATE VIEW V_Customerstbl
AS
SELECT *FROM Customertbl
GO
SELECT *FROM V_Customerstbl
GO

----------------------------------INSERTING DATA USING VIEW---------------------------------
INSERT INTO V_Customerstbl VALUES
(15,' Atikur Hossain',14,540)
GO

-------------AS  CUSTOMARS IS REFERENCED TO OTHERS TABLE, WE CAN NOT DELETE IT USING VIEW. BUT I WRITE THE SYNTAX OF DELETING DATA USING VIEW
DELETE FROM V_Customerstbl
WHERE CustId=15

--------------------------------------------CREATE A VIEW TO FIND OUT THE CUSTOMERS WHO HAVE ORDERED MORE THE 300 TK

SELECT TOP 5 PERCENT O.OrderId,O.CustomerId,O.ItemId,O.Quantity,Itemd.UnitPrice FROM ItemDetails Itemd
JOIN  Orders O ON O.ItemId=Itemd.ItemId
WHERE (UnitPrice*Quantity)>=300
GO


--------------------------------------------------- 003 STORED PROCEDURE--------------------------------------------------------------------


----------------------------------------A STORED PROCEDURE FOR QUERY  DATA---------------------------------------------------

CREATE PROC SP_Customerstbl
WITH ENCRYPTION
AS
SELECT *FROM Customers
WHERE CustomerFName='Md Faruk '
GO

--------------------------------A STORED PROCEDURE FOR INSERTING  DATA-------------------------------------------------

CREATE PROC sp_InsertCustomers
						@customerId INT,
						@customerFname VARCHAR(20) ,
						@customerLname VARCHAR(20) ,
						@PhoneNo VARCHAR(20)
						
AS
BEGIN
	INSERT INTO Customers(CustomerId,CustomerFName,CustomerLName,PhoneNo)
	VALUES(@customerid,@customerFname,@customerLname,@PhoneNo)
END
GO
 


----------------------------A STORED PROCEDURE FOR DELETING DATA-----------------------------------

CREATE PROC SP_DeleteCustomers
							@customerFname VARCHAR(20)
AS
	DELETE FROM Customers
	WHERE CustomerFName=@customerFname
GO

----------------------------------A STORED PROCEDURE FOR INSERTING DATA WITH RETURN VALUES------------------------------
CREATE PROC SP_InsertEmployeesWithReturn

										@EmployeeId INT,
										@Name VARCHAR(100),
										@DesignationId INT,
										@PhoneNo VARCHAR(17),
										@Gender VARCHAR(50),
										@Age INT,
										@NID CHAR(13),
										@Email VARCHAR(50),
										@Empcity VARCHAR(20),
										@Empcountry VARCHAR(30),
										@EmpImage  VARCHAR(MAX),
										@Address VARCHAR(200)
AS
DECLARE @id INT 
INSERT INTO Employees (EmployeeId,[Name],DesignationId,PhoneNo,Gender,Age,NID,Email,Empcity,Empcountry,EmpImage,[Address]) VALUES
(@EmployeeId,@Name,@DesignationId,@PhoneNo,@Gender,@Age,@NID,@Email,@Empcity,@Empcountry,@EmpImage,@Address)
SELECT @id=IDENT_CURRENT('Employees')
RETURN @id
GO

---------------TEST WITH DATA INSERT

DECLARE @id INT
EXEC @id = SP_InsertEmployeesWithReturn 55,'Jannat Tabassum',4,'01285875527','Female',19,'5874253698531','jannat365@gmail.com',',Noakhali','Bangladesh','N/A','Savar'
PRINT 'New product inserted with Id : '+STR(@id)
GO

---------------------------------------------A Stored procedure for inserting data with output parameter-------------------

CREATE PROC SP_InsertEmployeesWithOutPutParameter
										@EmployeeId INT,
										@Name VARCHAR(100),
										@DesignationId INT,
										@PhoneNo VARCHAR(17),
										@Gender VARCHAR(50),
										@Age INT,
										@NID CHAR(13),
										@Email VARCHAR(50),
										@Empcity VARCHAR(20),
										@Empcountry VARCHAR(30),
										@EmpImage VARCHAR(MAX)='N/A',
										@Address VARCHAR(200)= NULL,
										@Religion VARCHAR(50)OUTPUT
AS
INSERT INTO Employees VALUES(@EmployeeId,@Name,@DesignationId,@PhoneNo,@Gender,@Age,@NID,@Email,@Empcountry,@EmpImage,@Address,@Religion)
SELECT @Religion=IDENT_CURRENT('Employees')
GO


-------------------------test with data insert-------------------------------------

DECLARE @Religion  varchar
EXEC SP_InsertEmployeesWithOutPutParameter 30,'Md Akash',4,01275958565,'Male',29,5698536985475,'mnhbba@gmail.com','dhaka','Bangladesh','N/A','Kumilla',@Religion OUTPUT
SELECT @Religion 'New Id'
GO

-----------------------------------------------------------------------4.FUNTIONS-------------------------------------------------------------------------------------------
--functions
/*
There are three types of user defined functions in the sql language.
				1.Scalar valued function
				2.Single-Statement table valued function
				3.Multi-Statement table valued function

I have used all the three in my project
*/

--------------------------------------------------------------------1.Scalar valued function-------------------------------------------------------------------------------

CREATE FUNCTION FN_OrdersDatailes
					(@OrderId INT)
RETURNS MONEY
AS

	BEGIN
		DECLARE @Amount MONEY
		SELECT @Amount=SUM(UnitPrice*Quantity) FROM Orders o
		JOIN ItemDetails Item ON Item.ItemId=o.ItemId
		WHERE OrderId=@OrderId
		RETURN @Amount
	END	
GO

SELECT  dbo.FN_OrdersDatailes(1)'Total'
GO


------------------2.Single-Statement table valued function----------------------

CREATE FUNCTION FN_ItemAmountPerOrder
								(@OrderId INT)
RETURNS TABLE
AS
RETURN 
(
	
		
		SELECT SUM(UnitPrice*Quantity) AS 'Total Price',
		SUM(UnitPrice*Quantity*Discount) AS 'Total Discount',
	    SUM(UnitPrice*Quantity*(1-Discount)) AS 'Net Amount'
		
		FROM Orders o
		JOIN ItemDetails Item ON Item.ItemId=o.ItemId
		WHERE OrderId=@OrderId
		
)
GO


----------3 Multi-Statement table-valued function(More than one statement. So we will use BEGIN AND END STATEMENT)-----

CREATE FUNCTION FN_MultiStatementTablelist
										(@OrderId INT)
RETURNS @CustomerTablelist TABLE
(
	CusId INT,
	Amount MONEY,
	Cotegory VARCHAR(40)
)

BEGIN 
			INSERT INTO @CustomerTablelist 
			SELECT td.TableId,COUNT(O.CustomerId),'Category'
			FROM Orders O
			JOIN TableDetails td ON td.TableId=O.ItemId
			GROUP BY td.TableId,'Category'
			ORDER BY COUNT(O.CustomerId)
			RETURN
END
GO
---------------------------------------------------------------05 TRIGGERS--------------------------------------------------------------------------

CREATE TABLE Products
(
	ProdId INT PRIMARY KEY,
	ProName VARCHAR(50) NOT NULL,
	Quantity INT
)
GO
CREATE TABLE Customer
(
	CustId INT,
	CustName VARCHAR(20) NOT NULL,
	Quantity INT,
	UnitPrice MONEY
)
GO



SELECT *FROM Products
GO





------------------------------------ AFTER TRIGGER FOR INSERT DATA INTO CUSTOMERS TABLE -------------------------------------

CREATE TRIGGER TR_CustomersInsert
ON Customers
FOR INSERT
AS
	BEGIN
			DECLARE @CId INT, @P INT
			SELECT @CId=CustomerId , @P=PhoneNo FROM inserted

			UPDATE Customers
			SET PhoneNo=01358765526
			WHERE CustomerId=@CId
	END
GO
select *from Customers
GO
------------------------------CREATE TRIGGERS FOR DELETE DATA FROM PRODUCTS TABLE----------------------------------

CREATE TRIGGER TR_DeleteProducts
ON Products
FOR DELETE
AS
	BEGIN
			DECLARE @PId INT, @Q INT
			SELECT @PId=ProdId,@Q=Quantity FROM deleted

			UPDATE Products
			SET Stock=Stock-@Q
			WHERE ProdId=@PId
	END
GO
--TEST--
DELETE FROM Prodcuts
WHERE ProdId=1
GO



---------------------CREATE FOR TRIGGERS FOR update DATA IN THE CUSTOMERS TABLE------------------------------
select *from ItemDetails
go
CREATE TRIGGER TR_UpdateItemDetails
ON ItemDetails
FOR UPDATE
AS
	BEGIN
			IF UPDATE (UnitPrice)
			BEGIN
						DECLARE @ItmId INT, 
								@tn INT,
								@Up INT,
								@Change INT

						SELECT @ItmId=I.ItemId,@tn=D.ItemName,@Up=I.UnitPrice
						FROM Inserted I
						JOIN Deleted D ON D.ItemId=I.ItemId
						SET @Change=@tn-@Up

						UPDATE Item
						SET Stock=Stock+@Change
						WHERE ItemId=@ItmId
			END
	END
GO



----------------CREATING AN INSTEAD OF TRIGGER FOR NOT INSERTING ORDERS WHEN ItemDetails HAS ENDED. ------------------------------

CREATE TRIGGER TR_OrdersInsert
ON ItemDetails
INSTEAD OF INSERT
AS
	BEGIN
			DECLARE @ItemId INT, @Quantity INT
			SELECT @ItemId=ItemId, @Quantity=Quantity FROM inserted
			SELECT @ItemDetails= SUM(Quantity) FROM Orders WHERE OId=@OrderId
			
			IF @ItemDetails>=@Quantity
					BEGIN 
							INSERT INTO ItemDetails(ItemId,CatagoryId,ItemName,UnitPrice)	
							SELECT ItemId,CatagoryId,ItemName,UnitPrice FROM inserted
					END

			ELSE
					BEGIN
							RAISERROR('SORRY, THERE IS NOT Item ',10,1)
							ROLLBACK TRANSACTION
					END
	END
GO

SELECT * FROM ItemDetails
SELECT * FROM Orders


--=================================>>>>>>>>>>>>>>>>>>>     END OF DDL SCRIPT     <<<<<<<<<<<<=============================================