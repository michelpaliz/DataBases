--* SQL CREATE CONSTRAINTS
--~ AUTO INCREMENT Field
-- Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.
-- Often this is the primary key field that we would like to be created automatically every time a new record is inserted.
--~ Constraints can be specified when the table is created with the CREATE TABLE statement, or after the table is created with the ALTER TABLE statement.
-- NOT NULL - Ensures that a column cannot have a NULL value
-- UNIQUE - Ensures that all values in a column are different
-- PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
-- FOREIGN KEY - Prevents actions that would destroy links between tables
-- CHECK - Ensures that the values in a column satisfies a specific condition
-- DEFAULT - Sets a default value for a column if no value is specified
-- CREATE INDEX - Used to create and retrieve data from the database very quickly
--*CREATING A DATABASE TABLE
--> Example with foreign key
-- The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.
-- A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
--  FOREIGN KEY (PersonID) REFERENCES Persons(PersonID) --!The FOREIGN KEY constraint prevents invalid data from being inserted into the foreign key column,
--! because it has to be one of the values contained in the parent table.
-->Example with check
-- CREATE TABLE Persons (
--     ID int NOT NULL,
--     LastName varchar(255) NOT NULL,
--     FirstName varchar(255),
--     Age int,
--      CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes') --! The CHECK constraint is used to limit the value range that can be placed in a column.
-- );
-->Example with default
-- CREATE TABLE [name](
--   id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
--   create_time DATETIME COMMENT 'Create Time',
--   update_time DATETIME COMMENT 'Update Time',
--   [column] VARCHAR(255) COMMENT ''
-- City varchar(255) DEFAULT 'Sandnes' --!The default value will be added to all new records, if no other value is specified.
-- ) DEFAULT CHARSET UTF8 COMMENT '';
--*************************************************--
--* ALTER TABLE --*
--The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
-- The ALTER TABLE statement is also used to add and drop various constraints on an existing table.
--! To add a column in a table:
-- ALTER TABLE
--   table_name
-- ADD
--  column_name datatype;
-- MODIFY COLUMN column_name datatype;
--> Example with Alter table
--!ALTER TABLE Customers
-- ADD Email varchar(255); --!The following SQL adds an "Email" column to the "Customers" table:
-- DROP COLUMN column_name;
-- ALTER COLUMN DateOfBirth year; --!Now we want to change the data type of the column named "DateOfBirth" in the "Persons" tabl
-- DROP COLUMN DateOfBirth;
-- ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes'); --! To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:
-- DROP CONSTRAINT CHK_PersonAge;
-- ALTER City SET DEFAULT 'Sandnes'; --! Set default value to a column
--ALTER City DROP DEFAULT;
--ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID); --!To create a FOREIGN KEY constraint on the "PersonID" column when the "Orders" table is already created, use the following SQL:
-- DROP FOREIGN KEY FK_PersonOrder;
--*************************************************--
--*SELECT --*
-- The SELECT statement is used to select data from a database.
-- The data returned is stored in a result table, called the result-set.
--> Example with Select
-- SELECT * FROM table_name;
--SELECT CustomerName, City FROM Customers;
--*************************************************--
--*SELECT DISTINC --*
-- Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.
--?SINTAX
-- SELECT DISTINCT column1, column2, ...
-- FROM table_name;
--> Example
-- SELECT DISTINCT Country FROM Customers;
--*************************************************--
--*WHERE --*
-- The WHERE clause is used to filter records.
-- It is used to extract only those records that fulfill a specified condition.
----------------------
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;
-------------------------
-- =	Equal
--(>)	Greater than
-- <	Less than
-- (>=)	Greater than or equal
-- <=	Less than or equal
-- <>	Not equal. Note: In some versions of SQL this operator may be written as !=
-- BETWEEN	Between a certain range
-- LIKE	Search for a pattern
-- IN	To specify multiple possible values for a column
-- --> Example
-- SELECT * FROM Customers
-- WHERE Country='Mexico'; --!The following SQL statement selects all the customers from the country "Mexico", in the "Customers" table:
--WHERE CustomerID=1;
--WHERE Price <> 18;
--WHERE Price BETWEEN 50 AND 60;
-- WHERE City IN ('Paris','London');
--*************************************************--
--*The SQL AND, OR and NOT Operators --*
-- The WHERE clause can be combined with AND, OR, and NOT operators.
-- The AND and OR operators are used to filter records based on more than one condition:
-- The AND operator displays a record if all the conditions separated by AND are TRUE.
-- The OR operator displays a record if any of the conditions separated by OR is TRUE.
-- The NOT operator displays a record if the condition(s) is NOT TRUE.
-->Example
-- WHERE Country='Germany' AND City='Berlin';
-- WHERE Country='Germany' AND (City='Berlin' OR City='M??nchen');
-- WHERE NOT Country='Germany' AND NOT Country='USA';
--*************************************************--
--*ORDER BY --*
-- The ORDER BY keyword is used to sort the result-set in ascending or descending order.
-- The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.
--?SYNTAX
-- SELECT column1, column2, ...
-- FROM table_name
-- ORDER BY column1, column2, ... ASC|DESC;
-->Example
-- ORDER BY Country DESC;
-- ORDER BY Country ASC, CustomerName DESC; --!The following SQL statement selects all customers from the "Customers" table, sorted ascending by the "Country" and descending by the "CustomerName" column:
-- ORDER BY Country, CustomerName;
--*************************************************--
--* INSERT INTO --*
-- The INSERT INTO statement is used to insert new records in a table.
--?SYNTAX
-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);
--?SYNTAX
-- INSERT INTO table_name
-- VALUES (value1, value2, value3, ...);
-->Example
-- INSERT INTO Customers (CustomerName, City, Country)
-- VALUES ('Cardinal', 'Stavanger', 'Norway');
--*************************************************--
--* NULL VALUES --*
-- It is not possible to test for NULL values with comparison operators, such as =, <, or <>.
-- We will have to use the IS NULL and IS NOT NULL operators instead.
-->Example
-- WHERE Address IS NULL;
-- WHERE Address IS NOT NULL;
--*************************************************--
--* UPDATE --*
-- Be careful when updating records in a table! Notice the WHERE clause in the UPDATE statement. The WHERE clause specifies which record(s) that should be updated. If you omit the WHERE clause, all records in the table will be updated!
--?Syntax
-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condition;
--> Example
-- UPDATE Customers --!The following SQL statement updates the first customer (CustomerID = 1) with a new contact person and a new city.
-- SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
-- -- WHERE CustomerID = 1;
-- UPDATE Customers
-- SET ContactName='Juan' --!if we omit where clause it will update all the elements of contactName column;
-- WHERE Country='Mexico';
--*************************************************--
--* DELETE --*
-- The DELETE statement is used to delete existing records in a table.
--if we omit where clause will delate all values of the database;
--?SYNTAX
-- DELETE FROM table_name WHERE condition;
-- -->Example
-- DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
--*************************************************--
--* SQL TOP, LIMIT, FETCH FIRST or ROWNUM Clause
-- The SELECT TOP clause is used to specify the number of records to return.
-- The SELECT TOP clause is useful on large tables with thousands of records. Returning a large number of records can impact performance.
--Syntax
-- SELECT TOP number|percent column_name(s)
-- FROM table_name
-- WHERE condition;
--> Example
-- SELECT TOP 3 * FROM Customers; --!The following SQL statement selects the first three records from the "Customers" table (for SQL Server/MS Access):
-- SELECT TOP 50 PERCENT * FROM Customers; --!The following SQL statement selects the first 50% of the records from the "Customers" table
-- SELECT TOP 3 * FROM Customers
-- WHERE Country='Germany';
--*************************************************--
--* The SQL MIN() and MAX() Functions
--* The MIN() function returns the smallest value of the selected column.
--* The MAX() function returns the largest value of the selected colum
--Syntax
-- SELECT MIN(column_name)
-- FROM table_name
-- WHERE condition;
-->Example
-- SELECT MIN(Price) AS SmallestPrice
-- FROM Products;
--*************************************************--
-- *The SQL COUNT(), AVG() and SUM() Functions
--Syntax
-- SELECT COUNT(column_name)
-- FROM table_name
-- WHERE condition;
-->Example
-- SELECT AVG(Price)
-- FROM Products;
--*************************************************--
--* The SQL LIKE Operator
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
-- There are two wildcards often used in conjunction with the LIKE operator:
--~The percent sign (%) represents zero, one, or multiple characters
--~ The underscore sign (_) represents one, single character
-- --Syntax
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE columnN LIKE pattern;
-->Example
-- SELECT * FROM Customers
-- WHERE CustomerName LIKE 'a%'; --! The following SQL statement selects all customers with a CustomerName starting with "a":
-- SELECT * FROM Customers
-- WHERE CustomerName LIKE '%a';  --! The following SQL statement selects all customers with a CustomerName ending with "a":
-- SELECT * FROM Customers
-- WHERE CustomerName LIKE '%or%'; --! The following SQL statement selects all customers with a CustomerName that have "or" in any position:
-- SELECT * FROM Customers
-- WHERE CustomerName LIKE '_r%'; --!The following SQL statement selects all customers with a CustomerName that have "r" in the second position:
-- SELECT * FROM Customers
-- WHERE CustomerName LIKE 'a__%';  --!The following SQL statement selects all customers with a CustomerName that starts with "a" and are at least 3 characters in length:
-- SELECT * FROM Customers
-- WHERE ContactName LIKE 'a%o'; --! The following SQL statement selects all customers with a ContactName that starts with "a" and ends with "o":
-- SELECT * FROM Customers
-- WHERE CustomerName NOT LIKE 'a%'; --!The following SQL statement selects all customers with a CustomerName that does NOT start with "a":
--*************************************************--
--* The SQL IN Operator
-- The IN operator allows you to specify multiple values in a WHERE clause.
-- The IN operator is a shorthand for multiple OR conditions.
--Syntax
-- SELECT column_name(s)
-- FROM table_name
-- WHERE column_name IN (value1, value2, ...);
-->Example
-- SELECT * FROM Customers
-- WHERE Country NOT IN ('Germany', 'France', 'UK'); --!The following SQL statement selects all customers that are NOT located in "Germany", "France" or "UK":
-- SELECT * FROM Customers
-- WHERE Country IN (SELECT Country FROM Suppliers);--!The following SQL statement selects all customers that are from the same countries as the suppliers:
--*************************************************--
--* The SQL BETWEEN Operator
-- The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
-- The BETWEEN operator is inclusive: begin and end values are included.
--Syntax
-- The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
-- The BETWEEN operator is inclusive: begin and end values are included.
-- SELECT * FROM Products
-- WHERE Price NOT BETWEEN 10 AND 20;--!To display the products outside the range of the previous example, use NOT BETWEEN:
-- ~BETWEEN with IN Example
-- SELECT * FROM Products
-- WHERE Price BETWEEN 10 AND 20
-- AND CategoryID NOT IN (1,2,3); --!-- The following SQL statement selects all products with a price between 10 and 20. In addition; do not show products with a CategoryID of 1,2, or 3:
-- ~BETWEEN Text Values Example
-- SELECT * FROM Products
-- WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
-- ORDER BY ProductName;
-- ~BETWEEN Dates Example
-- SELECT * FROM Orders
-- WHERE OrderDate BETWEEN #07/01/1996# AND #07/31/1996#;
--
-- SELECT * FROM Orders
-- WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';