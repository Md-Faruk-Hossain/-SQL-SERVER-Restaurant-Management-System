
							
/*							
							=>  SQL Project Name : Restaurant Management Systems(RMS) 
							=>  By : Md Faruk Hossain   
						    

																															*/
--=====================================>>>>   START OF DDL SCRIPT   <<<<=======================================--


 /*------------DDL: 01. Database
                    02. Table
                    03. Alter Table
                    04. Constraint(Primary Key,FK,Default,Check,Nullibility)
                    05. Drop object
                    06. Index
                    07. Sequence
                    08. View
                    09. Stpre procedure
                    10.Trigger(For, Instead Of)
                    11.UDF(Scalar valued,Inline Table Valued,Multi-statement table valued function)
*/

USE RestaurantManagementSystem
GO

------------------------------->DATA INSERT<------------------------------------------

------------------------>1.INSERT INTO Menugroup VALUES<------------------------------

INSERT INTO Menugroup VALUES
                   (1,'Soup'),
                   (2,'Sub Sandwich'),
                   (3,'Chicken'),
                   (4,'Pasta'),
                   (5,'Vegtable'),
                   (6,'Curry'),
                   (7,'Pizza'),
                   (8,'Kacchi'),
                   (9,'Beverage'),
                   (10,'Shakes')

GO
SELECT *FROM Menugroup
GO

------------------------ >2.INSERT INTO ItemDetails VALUES <------------------------------

INSERT INTO ItemDetails VALUES
                  (1,'Thai Soup',270.00),
                  (1,'Chicken Corn Soup',160.00),
                  (1,'Vegetable Soup',470.00),
                  (1,'Hot & Sour Soup',150.00),
                  (2,'Chicken Sub Sandwich',170),
                  (2,'BBQ Chicken Sub Sandwich',370),
                  (2,'Chicken Naga Sub Sandwich',230),
                  (3,'Regular Chicken Burger',190.00),
                  (3,'Special Chicken Burger',350.00),
                  (3,'Chicken Cheese Blast Burger',370.00),
                  (3,'Chicken Cheese Delight Burger',590.00),
                  (4,'Past Bast',240.00),
                  (4,'Mexiean Oven Pasta',230.00),
                  (4,'BBQ Chicken Pasta',540.00),
                  (4,'Chicken Sausage Pasta',270.00),
                  (5,'Garlic Mushroom',450.00),
                  (5,'Chiense Mixed Vagetable',250.00),
                  (5,'Thai Mixed Vagetable',350.00),
                  (5,'Chicken Mixed Vagetable',550.00),
                  (6,'Sweet & Sour Chicken',540.00),
                  (6,'Chicken Chili Onion',180.00),
                  (6,'Chicken Curry',180.00),
                  (6,'Chicken Sizling',300.00),
                  (6,'Shrimp Masala',900.00),
                  (7,'BBQ Meat lovers Pizza',290.00),
                  (7,'BBQ Rizza',750.00),
                  (7,'Great Mushroom Pizza',890.00),
                  (7,'Chedar Superme Pizza',240.00),
                  (8,'Petuk kacchi',370.00),
                  (8,'Basmati Mutton kacchi',350.00),
                  (8,'Basmati Mutton kacchi',550.00),
                  (8,'Special Basmati Mutton kacchi',950.00),
                  (9,'Cold Coffee',120.00),
                  (9,'Borhani',160.00),
                  (9,'Hot Coffee',420),
                  (10,'Orea Milkshake',180),
                  (10,'Kitkat Milkshake',220),
                  (10,'Strawberry shake',580)
GO
SELECT *FROM ItemDetails
GO

---------------------------3.INSERT INTO Customers VALUES------------------------------

INSERT INTO Customers VALUES
                  (1,'Md Faruk ','Hossain','01285875524'),
                  (2,'Md ','Atikur','01285875524'),
                  (3,'Md Mamunur',' Roshid','01285875524'),
                  (4,'Md Shaon',' Kholifa','01285875524'),
                  (5,'Abdul',' Ahad','01285875524'),
                  (6,'Jannat ','Tabassum','01285875524'),
                  (7,'Mahbur ','Rahman','01285875524'),
                  (8,'Md ','Alamin','01285875524'),
                  (9,'R.A ','Asha','01285875524'),
                  (10,'Md ','Rakim','01285875524'),
                  (11,'Nur',' Muhammad','01285875524'),
                  (12,'Md ','Anas','01285875524'),
                  (13,'Afsana ','Sorkar','01285875524'),
                  (14,'Faiza ','Akter Mumu','01285875524')
GO
SELECT *FROM Customers
GO

------------------------------4.INSERT INTO Designation VALUES---------------------------------

INSERT INTO Designation VALUES
                  ('Manager'),
                  ('Cashier'),
                  ('Waiter'),
                  ('Chef')
                  
GO
SELECT *FROM Designation
GO
-----------------------------5.INSERT INTO Employees VALUES-------------------------------------
INSERT INTO Employees VALUES

                  (1,'Md Shaon Kholifa',1,'01285875524','Male',26,'5874253698521','shoan365@gmail.com','Barishal','Bangladesh','N/A','Muladi'),
                  (2,'Md Atikur',2,'01285875521','Male',25,'5874253698541','atik365@gmail.com','Rajshahi','Bangladesh','N/A','Bakergong'),
                  (3,'Md Mamunur Roshid',3,'01285875523','Male',24,'5874253698561','mamunur365@gmail.com','Sylhet','Bangladesh','N/A','Muladi'),
                  (4,'Md Faruk Hossain',3,'01285875524','Male',28,'5874253698581','faruk365@gmail.com','Dinajpur','Bangladesh','N/A','Manikgong'),
                  (5,'Abdul Ahad',4,'01285875526','Male',22,'5874253698571','abdul365@gmail.com','Mymensingh','Bangladesh','N/A','Muladi'),
                  (6,'Jannat Tabassum',4,'01285875527','Female',19,'5874253698531','jannat365@gmail.com',',Noakhali','Bangladesh','N/A','Savar')
	 
GO
SELECT *FROM Employees
GO
----------------------------6.INSERT INTO TableDetails VALUES-----------------------------------
INSERT INTO TableDetails VALUES
                   ('Table 1',3),
                   ('Table 2',3),
                   ('Table 3',4),
                   ('Table 4',4)
GO
SELECT *FROM TableDetails
GO
---------------------------------SELECT TOTAL AMOUNT ITEMDETAILS ------------------------

(SELECT ItemDetails.UnitPrice*Orders.Quantity*(1-Discount)'Total' FROM ItemDetails,Orders WHERE ItemDetails.ItemId=Orders.OrderId )
GO

-------------------------------7.INSERT INTO Orders VALUES----------------------------------------

INSERT INTO Orders VALUES
                   (1,1,1,12,.05),
                   (2,2,5,3,.05),
                   (3,3,3,4,.05),
                   (4,4,6,2,.05),
                   (5,4,7,9,.05),
                   (6,1,8,2,.05),
                   (7,3,38,5,.05),
                   (8,3,30,4,.05),
                   (9,1,25,3,.05),
                   (10,1,22,6,.05),
                   (11,2,18,1,.05),
                   (12,4,15,2,.05),
                   (13,1,9,7,.05),
                   (14,2,14,14,.05)
                  
GO

SELECT *FROM Orders
GO
------------------------------------8.INSERT INTO Products VALUES---------------------------------
INSERT INTO Products VALUES
(NEXT VALUE FOR SProducts,'Chicken Curry',8,200),
(NEXT VALUE FOR SProducts,'Chicken Rejala',6,300),
(NEXT VALUE FOR SProducts,'Chicken Birani',4,100),
(NEXT VALUE FOR SProducts,'Chicken shop',3,70),
(NEXT VALUE FOR SProducts,'Chicken rice',9,70),
(NEXT VALUE FOR SProducts,'Chicken ',5,80),
(NEXT VALUE FOR SProducts,'Chicken shop',4,90),
(NEXT VALUE FOR SProducts,' Curry',11,50),
(NEXT VALUE FOR SProducts,' Thiay Shup',12,400),
(NEXT VALUE FOR SProducts,'Burger',6,400),
(NEXT VALUE FOR SProducts,'Chicken Burger',8,80),
(NEXT VALUE FOR SProducts,'Sub Burger',8,80)

GO
INSERT INTO Products VALUES
(NEXT VALUE FOR SProducts,1)
SELECT *FROM Products
GO
----------------------------9.INSERT INTO CUSTOMERTBL VALUES---------------------
INSERT INTO Customertbl VALUES
(1,'Md Arif',6,620),
(2,'Md Arif',6,620),
(3,'Md Arif',6,620),
(4,'Md Arif',6,620),
(5,'Md Arif',6,620),
(6,'Md Arif',6,620),
(7,'Md Arif',6,620),
(8,'Md Arif',6,620),
(9,'Md Arif',6,620),
(10,'Md Arif',6,620),
(11,'Md Arif',6,620)
GO
SELECT * FROM Customertbl
GO

----------------------------------------------INSERTING DATA THROUGH STORED PROCEDURE-----------------------------------------------------

EXEC sp_InsertCustomers 21,'Asana ','Srkar','01285875527'
EXEC sp_InsertCustomers 22,'Rpa ','Sokar','01285875526'
EXEC sp_InsertCustomers 23,'Marufa ','Khatun','01285875525'
EXEC sp_InsertCustomers 24,'Atik ','Khan','01285875594'
EXEC sp_InsertCustomers 25,'Arian ','Sorkar','01285875534'
EXEC sp_InsertCustomers 26,'Rian ','Sorkar','01285875522'
EXEC sp_InsertCustomers 27,'Akash ','Sorkar','01285875527'
EXEC sp_InsertCustomers 28,'Tomal ','Sorkar','0128587552'
EXEC sp_InsertCustomers 29,'Jakia ','Sorkar','01285875524'
EXEC sp_InsertCustomers 30,'Aria ','Sorkar','01285875524'
EXEC sp_InsertCustomers 31,'Aman ','Sorkar','01285875524'
EXEC sp_InsertCustomers 32,'Alamin ','Sorkar','01285875524'
EXEC sp_InsertCustomers 33,'Mahim ','Sorkar','01285875524'
EXEC sp_InsertCustomers 34,'Tonmay ','Sorkar','01285875524'
EXEC sp_InsertCustomers 35,'Bilkis ','Sorkar','01285875524'
EXEC sp_InsertCustomers 36,'Mahi ','Sorkar','01285875524'
EXEC sp_InsertCustomers 37,'Afroza ','Sorkar','01285875524'
EXEC sp_InsertCustomers 38,'Mahabub ','Sorkar','01285875524'
EXEC sp_InsertCustomers 39,'Rubi ','Sorkar','01285875524'
EXEC sp_InsertCustomers 40,'Amin ','Sorkar','01285875524'
GO
SELECT * FROM Customers
GO
-----------------------------------------------------EXEC SP_InsertEmployeesWithReturn-------------------------------------------------

EXEC SP_InsertEmployeesWithReturn  15,'Jannat Tabassum',4,'01285875521','Female',19,'5874253606531','jannat365@gmail.com','Noakhali','Bangladesh','N/A','Savar'

EXEC SP_InsertEmployeesWithReturn  8,'Jannt Tabassum',4,'01285875522','Female',19,'5874253696532','jannat365@gmail.com','Noakhali','Bangladesh','N/A','Savar'

EXEC SP_InsertEmployeesWithReturn  9,'Janat Tabassum',4,'01285875523','Female',19,'5874253696533','jannat365@gmail.com','Noakhali','Bangladesh','N/A','Savar'

EXEC SP_InsertEmployeesWithReturn  10,'Jnnat Tabassum',4,'01285875524','Female',19,'5874253696534','jannat365@gmail.com','Noakhali','Bangladesh','N/A','Savar'

EXEC SP_InsertEmployeesWithReturn  11,'Janna Tabassum',4,'01285875525','Female',19,'5874253696535','jannat365@gmail.com','Noakhali','Bangladesh','N/A','Savar'

EXEC SP_InsertEmployeesWithReturn  12,'annat Tabassum',4,'01285875526','Female',19,'5874253696536','jannat365@gmail.com','Noakhali','Bangladesh','N/A','Savar'

EXEC SP_InsertEmployeesWithReturn  13,'Jannatul Tabassum',4,'01285875527','Female',19,'5874253696537','jannat365@gmail.com','Noakhali','Bangladesh','N/A','Savar'

EXEC SP_InsertEmployeesWithReturn  14,'Jannatu Tabassum',4,'01285875528','Female',19,'5874253696538','jannat365@gmail.com','Noakhali','Bangladesh','N/A','Savar'
GO

SELECT *FROM Employees
GO
---------------------------------Test View-------------------------
SELECT *FROM V_Customerstbl
GO


--------------------------------------EXEC SP_InsertEmployeesWithOutPutParameter-----------------------------------------------

EXEC SP_InsertEmployeesWithOutPutParameter 16,'Janatu Tabasum',4,'01285874526','Female',19,'3874253496535','jannat365@gmail.com','Barishal','Bangladesh','N/A','Savar,Islam'
EXEC SP_InsertEmployeesWithOutPutParameter 17,'Janatu Tabasum',4,'01285874526','Female',19,'3874253496536','jannat365@gmail.com','Barishal','Bangladesh','N/A','Savar,Islam'
EXEC SP_InsertEmployeesWithOutPutParameter 18,'Janatu Tabasum',4,'01285874526','Female',19,'3874253496534','jannat365@gmail.com','Barishal','Bangladesh','N/A','Savar,Islam'
EXEC SP_InsertEmployeesWithOutPutParameter 19,'Janatu Tabasum',4,'01285874526','Female',19,'3874253496533','jannat365@gmail.com','Barishal','Bangladesh','N/A','Savar,Islam'
EXEC SP_InsertEmployeesWithOutPutParameter 20,'Janatu Tabasum',4,'01285874526','Female',19,'3874253496537','jannat365@gmail.com','Barishal','Bangladesh','N/A','Savar,Islam'
EXEC SP_InsertEmployeesWithOutPutParameter 21,'Janatu Tabasum',4,'01285874526','Female',19,'3874253496538','jannat365@gmail.com','Barishal','Bangladesh','N/A','Savar,Islam'
EXEC SP_InsertEmployeesWithOutPutParameter 22,'Janatu Tabasum',4,'01285874526','Female',19,'3874253496538','jannat365@gmail.com','Barishal','Bangladesh','N/A','Savar,Islam'
EXEC SP_InsertEmployeesWithOutPutParameter 23,'Janatu Tabasum',4,'01285874526','Female',19,'3874253496539','jannat365@gmail.com','Barishal','Bangladesh','N/A','Savar,Islam'

GO

/*         JOIN QUARY WITH AGGREGATE COLUMN WITH GROUP BY,ORDERBY CLAUSE
           TO FIND OUT CUSTOMER WISE TOTAL DISCOUNT                        */


		   ----------------------------INNSER JOIN-------------------------------

SELECT O.CustomerId,SUM(Itemd.UnitPrice*O.Quantity* O.Discount) 'Discount_per_Customer' FROM Orders O
INNER JOIN ItemDetails Itemd ON Itemd.ItemId=O.ItemId
GROUP BY O.CustomerId
ORDER BY O.CustomerId DESC
GO
-----------------------------LEFT JOIN----------------------------------------------------

SELECT O.CustomerId,SUM(Itemd.UnitPrice*O.Quantity* O.Discount) 'Discount_per_Customer' FROM Orders O
LEFT JOIN ItemDetails Itemd ON Itemd.ItemId=O.ItemId
GROUP BY O.CustomerId
ORDER BY O.CustomerId DESC
GO
-----------------------RIGHT JOIN--------------------------

SELECT O.CustomerId,SUM(Itemd.UnitPrice*O.Quantity* O.Discount) 'Discount_per_Customer' FROM Orders O
RIGHT JOIN ItemDetails Itemd ON Itemd.ItemId=O.ItemId
GROUP BY O.CustomerId
ORDER BY O.CustomerId 
GO
-------------------------FULL JOIN ----------------------------

SELECT CustomerId,SUM(UnitPrice*Quantity*(1-DISCOUNT)) AS 'NET_ORDER_AMOUNT' FROM Orders O
FULL JOIN ItemDetails Itemd ON Itemd.ItemId=O.ItemId
GROUP BY ROLLUP (CustomerId,OrderId)
HAVING SUM(UnitPrice*Quantity*(1-DISCOUNT)) >=350
ORDER BY CustomerId
GO

-------------------------CROSS JOIN----------------------------

SELECT CustomerId,SUM(UnitPrice*Quantity*(1-DISCOUNT)) AS 'NET_ORDER_AMOUNT' FROM Orders O
CROSS JOIN ItemDetails Itemd WHERE Itemd.ItemId=O.ItemId
GROUP BY ROLLUP (CustomerId,OrderId)
HAVING SUM(UnitPrice*Quantity*(1-DISCOUNT)) <=500
ORDER BY CustomerId
GO


------------------------SUBQUERY TO FIND OUT THE ORDERS DETAILS OF A SPECIFIC CUSTOMER------------------

SELECT ItemName FROM Orders O
JOIN ItemDetails Itemd ON Itemd.ItemId=O.ItemId
WHERE ItemName='Thai Soup'(SELECT CustomerFName,CustomerLName FROM Customers WHERE CustomerId=15 )
GO


--USING ROLLUP IN QUERY WITH HAVING CLAUSE TO FIND OUT THE CUSTOMER AND Item WSIE NET ORDER AMOUNT WHO HAVE MORE THAN 350 ORDER AMOUNT

SELECT CustomerId,SUM(UnitPrice*Quantity*(1-DISCOUNT)) AS 'NET_ORDER_AMOUNT' FROM Orders O
 JOIN ItemDetails Itemd ON Itemd.ItemId=O.ItemId
GROUP BY ROLLUP (CustomerId,OrderId)
HAVING SUM(UnitPrice*Quantity*(1-DISCOUNT)) >=350
ORDER BY CustomerId
GO


-- USING  SEARCHED CASE FUNCTION TO FIND OUT THE CUSTOMER WHO HAVE GET 20 OR MORE PERCENT DISCOUNT ON THEIR PURCHASE

SELECT ORDERID,SUM(Quantity*UnitPrice) AS 'Total Amount ordered',
CASE
	WHEN SUM(Quantity*UnitPrice)>= 400
		THEN '15% DISCOUNT'
	WHEN SUM(Quantity*UnitPrice)>= 150
		THEN '10% DISCOUNT'
	ELSE 'DEFAULT DISCOUNT'
END AS DISCOUNT
FROM Orders
GROUP BY OrderId

GO
----------------------GROUPING--------------------------------------

SELECT O.CustomerId,Itemd.ItemName,SUM(UnitPrice*Quantity* O.Discount) 'Discount_per_Customer' FROM Orders O
INNER JOIN ItemDetails Itemd ON Itemd.ItemId=O.ItemId
INNER JOIN Customers C ON C.CustomerId=O.CustomerId
GROUP BY GROUPING SETS (O.CustomerId,Itemd.ItemName)
ORDER BY O.CustomerId DESC,Itemd.ItemName DESC
GO

------------------------------------TEST WITH DATA INSERT-----------------------

DECLARE @id INT
EXEC @id = SP_InsertEmployeesWithReturn 55,'Jannat Tabassum',4,'01285875527','Female',19,'5874253698531','jannat365@gmail.com',',Noakhali','Bangladesh','N/A','Savar'
PRINT 'New product inserted with Id : '+STR(@id)
GO

-------------------user defined functions -----------------------

SELECT  dbo.FN_OrdersDatailes(1)'Total'
GO



---------------------------------TEST TRIGGER------------------
DELETE FROM Prodcuts
WHERE ProdId=1
GO


-----------------------WITH MY CTE--------------------------

WITH MyCTE AS
(
      SELECT CustomerId,SUM(UnitPrice*Quantity*(1-DISCOUNT)) AS 'NET_ORDER_AMOUNT' 
      FROM Orders O
       JOIN ItemDetails Itemd ON Itemd.ItemId=O.ItemId
      GROUP BY ROLLUP (CustomerId,OrderId)
      HAVING SUM(UnitPrice*Quantity*(1-DISCOUNT)) >=350
    
      
)
SELECT *FROM MyCTE
GO
 ---------------------------------------------CAST-------------------------------------------------------

 SELECT CAST('01-JUNE-2019 10:00 AM' AS DATE) 'DATE'
   GO

 DECLARE @MYTIME   datetime= '01-june-2019 10:00 AM'
 SELECT CONVERT (VARCHAR,GETDATE(),  8) 'TIME'
 GO

-----------------------------------MERGE---------------------------------
   SELECT *FROM Products
   GO
   SELECT *FROM Customertbl
   GO
   


     MERGE Products AS TARGET
	USING Customertbl AS SOURCE
	ON SOURCE.Quantity = TARGET.Quantity
	WHEN MATCHED THEN 
	UPDATE SET TARGET.Price=SOURCE.UnitPrice
	WHEN  NOT MATCHED BY TARGET THEN
	INSERT (Price) VALUES(SOURCE.UnitPrice)
	;
	GO
----------------------CUBE--------------------------------------
SELECT O.CustomerId,Itemd.ItemName,SUM(UnitPrice*Quantity* O.Discount) 'Discount_per_Customer' FROM Orders O
INNER JOIN ItemDetails Itemd ON Itemd.ItemId=O.ItemId
INNER JOIN Customers C ON C.CustomerId=O.CustomerId
GROUP BY CUBE (O.CustomerId,Itemd.ItemName)
ORDER BY O.CustomerId DESC,Itemd.ItemName DESC
GO

---------------------TEST TRIGGERS FOR UPDATE DATA----------------
			UPDATE Customers
			SET PhoneNo=01358765526
			WHERE CustomerId=@CId

-------------- SQL Server GROUP BY clause and aggregate functions---------------------------

SELECT CustomerId, COUNT(UnitPrice*Quantity*(1-DISCOUNT)) AS 'NET_ORDER_AMOUNT' FROM Orders O
 JOIN ItemDetails Itemd ON Itemd.ItemId=O.ItemId
GROUP BY ROLLUP (CustomerId,OrderId)
HAVING SUM(UnitPrice*Quantity*(1-DISCOUNT)) >=350
ORDER BY CustomerId
GO

-------------------------------Built-in Function--------------------------------

SELECT LTRIM('    MAHABUB')'NAME'
SELECT RTRIM('5522')'        NUMER'
SELECT RTRIM(LTRIM('    faruk            '))'name'
SELECT LOWER('     FARUK     ')'NAME'
SELECT UPPER('Faruk')
SELECT REVERSE('')
SELECT LEN(' faruk  ') 'CHARACTER'
SELECT ASCII('MD FRUK  ')'CHARACTER'
GO
-------------------- LOOP(While LOOP)------------------------
DECLARE @Number INT
SET @Number =50
WHILE @Number <=119
BEGIN
PRINT CHAR (@Number)
SET @Number=@Number+1
End
GO


------------------------------------IF ELSE------------------------------

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


----------------------------TRY CATCH-------------------------

CREATE PROCEDURE sp_WithItemDetails  
AS  
    SELECT * FROM ItemDetails 
GO  
  
BEGIN TRY  
    EXECUTE ItemName'Hot & Sour Soup';  
	EXECUTE ItemName'Chicken Curry'; 
	
END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_ItemId(22 ) as
     
END CATCH; 

--=================================>>>>>>>>>>>>>>>>>>>     END OF DML SCRIPT     <<<<<<<<<<<<=============================================