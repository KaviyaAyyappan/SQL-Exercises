--EXERCISE 1 create a database

CREATE DATABASE Minions

------------------------------------------------------------------------------------------------
--EXERCISE 2 CREATE TABLE

CREATE TABLE Minions(
	Id INT,
	Names Nvarchar(50) NOT NULL,
	Age INT NOT NULL,
	CONSTRAINT PK_ID PRIMARY KEY(Id)
	)

CREATE TABLE Towns(
	Id INT,
	Names Nvarchar(50) NOT NULL,
	CONSTRAINT PK_Towns PRIMARY KEY(Id)
	)

---------------------------------------------------------------------
--EXERCISE 3.Alter table

ALTER TABLE Minions
ADD TownId INT

ALTER TABLE Minions
ADD CONSTRAINT FK_TOWNID FOREIGN KEY (Townid) REFERENCES Towns(Id)

--Select * from Minions


-------------------------------------------------------------------------
--EXERCISE 4.Insert data

INSERT INTO Minions(Id,Names,Age,TownId) Values
(1,'Kevin',22,1),
(2,'Bob',15,3),
(3,'Steward',3,2)

INSERT INTO Towns(Id,Names) values 
(1,'Sofia'),
(2,'Peter'),
(3,'Victoria')

--Select *  from towns


-----------------------------------------------------------------
--EXERCISE 5.Delete the data

TRUNCATE TABLE Minions
---------------------------------------------------------------
--EXERCISE 6.Drop

DROP TABLE Minions
DROP TABLE Towns

--------------------------------------------------------------------------------------------
--EXERCISE 7.Create table people

CREATE TABLE People(
	Id int  IDENTITY(1,1),
	[Name] NVARCHAR (200) NOT NULL,
	Picture VARBINARY(Max) CHECK(DATALENGTH(Picture)> 2*1024*1024),
	Height NUMERIC (4,2),
	[Weight] NUMERIC (4,2),
	Gender char NOT NULL check([Gender] IN ('M','F')),
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(max)
	CONSTRAINT PK_People PRIMARY KEY(Id)
)


--SELECT * FROM People

INSERT INTO People ([Name],Gender,Birthdate,Biography) values
('Kaviya','F','1991-07-04','Lives in sweden'),
('Gopi','M','1986-01-15','Lives in us'),
('Sundar','M','1983-04-13','Lives in canada'),
('Maha','F','1993-05-27','Lives in dubai'),
('Alexa','F','1990-07-21','Lives in cuba')

----------------------------------------------------------------------------------------------
--EXERCISE 8.Create table user

CREATE TABLE Users(
	Id BIGINT IDENTITY(1,1),
	Username VARCHAR(30) UNIQUE NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(Max) CHECK(DATALENGTH(Profilepicture)> 900000),
	LastLoginTime Time,
	IsDeleted BIT,
	CONSTRAINT PK_Users PRIMARY KEY(Id)
)
 
 INSERT INTO Users(Username,[Password],IsDeleted) Values
 ('Kaviya','Kavi@123',0),
 ('sowni','Sowni@123',0),
 ('Andres','Andrey12',1),
 ('Sandra','San_12',1),
 ('philp','phil43',1)
 

 --SELECT * FROM Users
-------------------------------------------------------------------------------------------------
 -- EXERCISE 9.Alter primary key
ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY(Id,Username)
---------------------------------------------------------------------------------------------------
---EXERCISE 10.Add check constraints
ALTER TABLE Users
ADD CONSTRAINT chk_User_pwd CHECK(len(Password) >= 5)
---------------------------------------------------------------------------------------------------
--EXERCISE 11. set default value to the fields
ALTER TABLE Users
ALTER  COLUMN LastLoginTime DATETIME

ALTER TABLE Users
ADD CONSTRAINT DF_lOG_TIME DEFAULT GETdate() for LastLoginTime
---------------------------------------------------------------------------------------------------
--EXERCISE 12.Set unique field
ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY(Id)

ALTER TABLE Users
ADD CONSTRAINT UC_Users UNIQUE(Username)

ALTER TABLE Users
ADD CONSTRAINT ck_Username_len CHECK(len(Username) > 3)
---------------------------------------------------------------------------------------------------
 --13.Movies database

CREATE DATABASE Movies
USE Movies
 -------------------------------------------------------------------
 CREATE TABLE Director(
	Id INT IDENTITY(1,1),
	DirectorName NVARCHAR(100) NOT NULL,
	Notes NVARCHAR(MAX),
	PRIMARY KEY(Id)
	)
CREATE TABLE Geners(
	Id INT IDENTITY(1,1),
	GenerName NVARCHAR(100) NOT NULL,
	Notes NVARCHAR(MAX),
	PRIMARY KEY(Id)
)

CREATE TABLE Categories(
	Id INT IDENTITY(1,1),
	CategoryName NVARCHAR(100) NOT NULL,
	Notes NVARCHAR(MAX),
	PRIMARY KEY(Id)
)
CREATE TABLE Movies(
	Id INT IDENTITY(1,1),
	Title NVARCHAR(100) NOT NULL,
	DirectorId INT NOT NULL,
	CopyRightYear INT NOT NULL,
	[Length] INT,
	GenerId INT NOT NULL,
	CategoryId INT NOT NULL,
	Rating NUMERIC(4,2) CHECK(Rating > 0 AND Rating <=10),
	Notes NVARCHAR(MAX),
	PRIMARY KEY (Id),
	FOREIGN KEY (DirectorId) REFERENCES Director(Id),
	FOREIGN KEY (GenerId) REFERENCES Geners(Id),
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
)

INSERT INTO Director(DirectorName,Notes) Values
('Bharathiraja','Best known director amoung tamil films'),
('Bhagiyaraj','He is the director and hero for the most of the movies in 90s'),
('Vishu','His movies is famous for the family stories'),
('RaviKumar','His movies is full of action and comedy'),
('Dhanush','The most young and upcoming director and hero in tollywood')

Select * from Director
Select * from Geners

Insert Into Geners(GenerName) Values
('Drama'),
('Action'),
('Comedy'),
('Thriller'),
('Romance')

INSERT INTO Categories(CategoryName) Values
('A'),
('B'),
('C'),
('D'),
('E')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, [Length], GenerId, CategoryId, Rating, Notes) VALUES
('Pathinaru',1,1980,200,1,1,4.5,'100 days movies'),
('Bharathi',2,1992,215,2,2,4,'the best movie in tamil history'),
('vishuman',3,1987,300,2,1,3.5,'null'),
('Arunachalam',4,1993,150,4,4,5,'The most exciting movies timm today'),
('Sullan',5,1999,230,5,5,4.7,'null')

SELECT * FROM Movies
-------------------------------------------------------------------------------------------------------------------
--EXERCISE 14.Car rental database

CREATE DATABASE CarRental
USE CarRental
----------------------------------------------------------
CREATE TABLE Categories(
	Id INT IDENTITY(1,1),
	CategoryName NVARCHAR(50) NOT NULL,
	DailyRate money NOT NULL,
	WeeklyRate money NOT NULL,
	MonthlyRate money NOT NULL,
	WeekendRate money NOT NULL,
	PRIMARY KEY (Id)
)

CREATE TABLE Cars(
	Id INT IDENTITY(1,1),
	PlateNumber NVARCHAR(15) NOT NULL UNIQUE,
	Manufacturer NVARCHAR(10) NOT NULL,
	Model NVARCHAR(10) NOT NULL,
	CarYear INT NOT NULL,
	CategoryId INT NOT NULL,
	Picture VarBinary(max),
	Condition VARCHAR(15),
	Available Bit,
	PRIMARY KEY(Id),
	FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
)

CREATE TABLE Employees(
	Id INT IDENTITY(1,1),
	FirstName NVARCHAR(10) NOT NULL,
	LastName NVARCHAR(10) NOT NULL,
	Title NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(max),
	PRIMARY KEY(Id)
)

CREATE TABLE Customers(
	Id INT IDENTITY(1,1),
	DriverLicenceNumber NVARCHAR(20) NOT NULL,
	FullName NVARCHAR(30) NOT NULL,
	Addresss NVARCHAR(30) NOT NULL,
	City NVARCHAR(10) NOT NULL,
	ZIPCode NVARCHAR(10) NOT NULL,
	Notes NVARCHAR(MAX)
	PRIMARY KEY(Id)	
)

CREATE TABLE RentalOrders(
	Id INT IDENTITY(1,1),
	EmployeeId INT NOT NULL,
	CustomerId INT NOT NULL,
	CarId INT NOT NULL,
	TankLevel int NOT NULL,
	KilometrageStart float(2) NOT NULL,
	KilometrageEnd float(2) NOT NULL ,
	TotalKilometrage float(2) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays int NOT NULL ,
	RateApplied money NOT NULL,
	TaxRate money NOT NULL,
	OrderStatus NVARCHAR(10) NOT NULL,
	Notes NVARCHAR(MAX),	
	PRIMARY KEY(Id),
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
	FOREIGN KEY (CarId) REFERENCES Cars(Id),
	
)
ALTER TABLE Rentalorders
ADD CONSTRAINT CK_TotalKilometer CHECK (TotalKilometrage=KilometrageEnd-KilometrageStart) 

ALTER TABLE Rentalorders
ADD CONSTRAINT CK_TotalDays CHECK (TotalDays = DATEDIFF(day, StartDate, EndDate)+1)



Select * from Categories
Select * from RentalOrders
Select * from Cars
Select * from Employees
Select * FROM  Customers

INSERT INTO Categories (CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) VALUES
('Economy',50,350,1500,70),
('Family size',150,1050,4500,250),
('Luxury',200,1400,6000,350)

ALTER TABLE Cars
ADD Doors INT not null

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId,Condition, Available,Doors) VALUES
('SW45879kj','Toyato','Aygo',2012,1,'Good',1,4),
('SW98742hj','Sedan','Mercedes',2013,3,'Excellent',1,4),
('SW58742ls','Toyato','Corollo',2015,2,'Good',0,4)

INSERT INTO Employees(FirstName, LastName, Title) VALUES
('Sarath','Kumar','Manager'),
('Rohit','pulvalsson','Sales Manager'),
('Salman','shrini','Tester')

INSERT INTO Customers(DriverLicenceNumber, FullName, Addresss, City, ZIPCode) VALUES
('C1547895','Harish Dawar','Nacka32','Stockholm','132 50'),
('D1548895','dinesh murthy','globen23','Stockholm','132 23'),
('A1544895','Harish Dawar','Lijeholmen56','Stockholm','132 36')

INSERT INTO RentalOrders( EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus) VALUES
	(1, 1, 1,100, 20100, 20500.5, 400.5, '2020-01-22', '2020-01-22', 1, 15, 0.20, 'Rented'),
	(2, 2, 2,100, 22100, 22250, 150, '2020-02-20', '2020-02-22', 3, 80, 0.20, 'Pending'),
	(3, 3, 3,100, 25000, 25200, 200, '2020-03-21', '2020-03-22', 2, 110, 0.20, 'Closed')

-----------------------------------------------------------------------------------------------------------------------------------
--EXERCISE 15.Hotel Database

CREATE DATABASE Hotel
USE Hotel
---------------------------------
CREATE TABLE Employees (
	Id INT IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL, 
	LastName NVARCHAR(50) NOT NULL, 
	Title NVARCHAR(100) NOT NULL, 
	Notes NVARCHAR(max),
	PRIMARY KEY (Id)
)

CREATE TABLE Customers (
	AccountNumber INT IDENTITY(1,1),--CustomerID
	FirstName NVARCHAR(50) NOT NULL, 
	LastName NVARCHAR(50) NOT NULL, 
	PhoneNumber BIGINT NOT NULL,
	EmergencyName NVARCHAR(50),
	EmergencyNumber BIGINT NOT NULL,
	Notes NVARCHAR(max),
	PRIMARY KEY (AccountNumber)
)

CREATE TABLE RoomStatus (
	RoomStatus NVARCHAR(50) NOT NULL, 
	Notes NVARCHAR(max),
	PRIMARY KEY (RoomStatus)
)

CREATE TABLE RoomTypes (
	RoomType NVARCHAR(50) NOT NULL, 
	Notes NVARCHAR(max),
	PRIMARY KEY (RoomType)
)

CREATE TABLE BedTypes (
	BedType NVARCHAR(50) NOT NULL, 
	Notes NVARCHAR(max),
	PRIMARY KEY (BedType)
)

CREATE TABLE Rooms (	
	RoomNumber INT IDENTITY (1,1),
	RoomType NVARCHAR(50)NOT NULL,--Roomtype table
	BedType NVARCHAR(50) NOT NULL,--Bedtype table
	Rate MONEY NOT NULL,
	RoomStatus NVARCHAR(50) NOT NULL,--room status table
	Notes NVARCHAR(max),
	PRIMARY KEY (RoomNumber),
	FOREIGN KEY (RoomType) REFERENCES RoomTypes(RoomType),
	FOREIGN KEY (BedType) REFERENCES BedTypes(BedType),
	FOREIGN KEY (RoomStatus) REFERENCES RoomStatus(RoomStatus)
)

CREATE TABLE Payments (
	Id int IDENTITY(1,1), 
	EmployeeId INT NOT NULL, --Employee table id
	PaymentDate DATE NOT NULL, 
	AccountNumber INT NOT NULL, --customer table account number
	FirstDateOccupied DATE NOT NULL, 
	LastDateOccupied DATE NOT NULL, 
	TotalDays INT NOT NULL, 
	AmountCharged MONEY NOT NULL, 
	TaxRate MONEY NOT NULL, 
	TaxAmount MONEY NOT NULL, 
	PaymentTotal MONEY NOT NULL, 
	Notes NVARCHAR(max),
	PRIMARY KEY (Id),
	FOREIGN KEY (EmployeeId) REFERENCES Employees (Id),
	FOREIGN KEY (AccountNumber) REFERENCES Customers (AccountNumber),
	CHECK (TotalDays = DATEDIFF(day, FirstDateOccupied, LastDateOccupied)+1),
	CONSTRAINT CK_Payments_TaxAmount CHECK (TaxAmount = AmountCharged * TaxRate), 
	CONSTRAINT CK_Payments_PaymentTotal CHECK (PaymentTotal = AmountCharged + TaxAmount)
	)

CREATE TABLE Occupancies (
	Id INT IDENTITY(1,1), 
	EmployeeId INT NOT NULL, 
	DateOccupied DATE NOT NULL,--Employees table 
	AccountNumber INT NOT NULL, --Account Table
	RoomNumber INT NOT NULL, --Rooms table
	RateApplied MONEY NOT NULL, 
	PhoneCharge MONEY NOT NULL, 
	Notes nvarchar(max),
	PRIMARY KEY (Id),
	FOREIGN KEY (EmployeeId) REFERENCES Employees (Id),
	FOREIGN KEY (AccountNumber) REFERENCES Customers (AccountNumber),
	FOREIGN KEY (RoomNumber) REFERENCES Rooms (RoomNumber),
)

INSERT INTO Employees (FirstName, LastName, Title, Notes) VALUES
('Deva', 'priya', 'Manager', 'Excellet management'),
('Durgesh', 'shrison', 'CEO', NULL),
('Sundar', 'ram', 'Receptionist', NULL)

INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyNumber,Notes) VALUES
('Sandra','Dawood', 0796587463,078954289,'Regular customer'),
('Deppa','Sharma', 91985624715, 9169873215, NULL),
('Mathesh','Travar', 0798564125, 9165673215, NULL)

INSERT INTO RoomStatus (RoomStatus) VALUES
('Available'),
('Reserved'), 
('Booked')

INSERT INTO RoomTypes (RoomType) VALUES
('Double'),
('Hall'),
('Single')

INSERT INTO BedTypes (BedType) VALUES
('Double'),
('Single'), 
('Twin')

INSERT INTO Rooms (RoomType, BedType, Rate, RoomStatus) VALUES
('Single', 'Single', 700, 'Reserved'),
('Double', 'Twin', 1400, 'Booked'),
('Hall', 'Double', 2000, 'Available')

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal)
VALUES
(1, '2020-07-10', 1, '2020-07-10', '2020-07-11', 2, 1000, 0.10, 100, 1100),
(2, '2020-07-10', 2, '2020-06-28','2020-06-28', 1, 2000, 0.10, 200, 2200),
(3, '2020-07-10', 3, '2020-06-15', '2020-06-16', 2, 3000, 0.10, 300, 3300)

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge) VALUES
(1, '2020-07-10', 1, 1, 700, 0),
(2, '2020-07-10', 2, 2, 1000, 100),
(3, '2020-07-10', 3, 3, 2000, 0)

--SELECT * FROM Payments
-------------------------------------------------------------------------------------------------------------------------------------
--EXERCISE.16 Lexicon database

Create database Lexicon
USE Lexicon
---------------------------------------------------------
CREATE TABLE Towns (
	Id int IDENTITY(1,1),
	[Name] nvarchar(200) NOT NULL,
	CONSTRAINT PK_Towns PRIMARY KEY (Id)
)

CREATE TABLE Addresses (
	Id int IDENTITY(1,1), 
	AddressText nvarchar(max) NOT NULL,
	TownId int NOT NULL,
	CONSTRAINT PK_Addresses PRIMARY KEY (Id),
	CONSTRAINT FK_Addresses_Towns FOREIGN KEY (TownId) REFERENCES Towns (Id)
)

CREATE TABLE Departments (
	Id int IDENTITY(1,1), 
	[Name] nvarchar(200) NOT NULL,
	CONSTRAINT PK_Departments PRIMARY KEY (Id)
)

CREATE TABLE Employees (
	Id int IDENTITY(1,1),
	FirstName nvarchar(200) NOT NULL,
	MiddleName nvarchar(200),
	LastName nvarchar(200) NOT NULL,
	JobTitle nvarchar(200) NOT NULL, 
	DepartmentId int NOT NULL, 
	HireDate date NOT NULL, 
	Salary Decimal(10,2) NOT NULL, 
	AddressId int ,
	CONSTRAINT PK_Employees PRIMARY KEY (Id),
	CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentId) REFERENCES Departments (Id),
	CONSTRAINT FK_Employees_Addresses FOREIGN KEY (AddressId) REFERENCES Addresses (Id),
)

SELECT * FROM Employees
---------------------------------------------------------------------------------------------------
--EXERCISE 17.Backup Database

BACKUP DATABASE Lexicon
TO DISK = 'C:\Users\kaviya\source\SQL exercise\lexicon-backup.bak';

DROP DATABASE Lexicon

RESTORE DATABASE Lexicon
FROM DISK = 'C:\Users\kaviya\source\SQL exercise\lexicon-backup.bak'
------------------------------------------------------------------------------------------------------
--EXERCISE 18.Insert Into

INSERT INTO Towns ([Name]) VALUES
	('Sofia'), ('Plovdiv'), ('Varna'), ('Burgas')

INSERT INTO Departments (Name) VALUES
	('Engineering'), 
	('Sales'), 
	('Marketing'), 
	('Software Development'), 
	('Quality Assurance')


INSERT INTO Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary) VALUES
('Mel','Gibson','Gibson','.NET developer',4,'2013/02/01',3500.00),
('Chuck','Norris ','Garbo','Senior Engineer',1,'2004/03/02',4000.00),
('Greta','Garbo ','Gibson','Intern',5,'2016/08/28',525.25),
('Meryl ','Strep ','Strep','CEO',2,'2007/12/09',3500.00),
('Peter ','Pan ','Pan','Intern',3,'2016/08/28',599.88)

-----------------------------------------------------------------------------------------
--EXERCISE 19.Basic select all fields

select * from Towns
select * from Departments
select * from employees
----------------------------------------------------------------------------------------
--EXERCISE 20.Basic Select All Fields and Order Them

select * from Towns
Order by [Name]

select * from Departments
Order by [Name]

select * from employees
Order by Salary DESC
--------------------------------------------------------------------------------------------
--EXERCISE 21.Basic Select Some Fields

SELECT [Name] FROM Towns
Order by [Name]

SELECT [Name] FROM Departments
Order by [Name]

SELECT FirstName,LastName,JobTitle,Salary FROM Employees
Order by Salary DESC
---------------------------------------------------------------------------------------------
--EXERCISE 22.Increase salary database
UPDATE Employees
SET Salary *=0.1

SELECT Salary  FROM Employees