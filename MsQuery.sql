CREATE TABLE UserPrivileges
(
	ID INT IDENTITY PRIMARY KEY,
	Privilege VARCHAR(20) UNIQUE NOT NULL
)
GO
CREATE TABLE Users
(
	ID INT IDENTITY PRIMARY KEY,
	UserName VARCHAR(100) NOT NULL UNIQUE,
	UserPassword VARCHAR(18) NOT NULL,
	UserCity INT FOREIGN KEY REFERENCES City(ID) NOT NULL,
	UserDistrict INT FOREIGN KEY REFERENCES District(ID) NOT NULL,
	UserEmail VARCHAR(100) NOT NULL,
	UserPhone VARCHAR(30) NOT NULL,
	PrivilegeID INT FOREIGN KEY REFERENCES UserPrivileges(ID) ON DELETE CASCADE NOT NULL ,
	TrueAdmin BIT DEFAULT 0 NULL
)
GO

INSERT INTO UserPrivileges(Privilege)
VALUES ('Admin'),('Company'),('User')

DELETE FROM UserPrivileges
WHERE ID = 1
GO

CREATE PROCEDURE InsertUserPrivilege (@PrivName VARCHAR(20))
AS
BEGIN
INSERT INTO UserPrivileges(Privilege)
VALUES (@PrivName)
END
EXEC InsertUserPrivilege 'test'
GO

CREATE PROCEDURE DeletePrivilege @ID INT
AS
BEGIN
DELETE FROM UserPrivileges WHERE UserPrivileges.ID = @ID
END
EXEC DeletePrivilege 1
GO

CREATE PROCEDURE UpdatePrivilege @ID INT,@NewName VARCHAR(20)
AS
BEGIN
UPDATE UserPrivileges SET UserPrivileges.Privilege = @NewName WHERE UserPrivileges.ID = @ID
END
EXEC UpdatePrivilege 2,'test'
GO

CREATE PROCEDURE ShowAllPrivileges
AS
BEGIN
SELECT * FROM UserPrivileges ORDER BY ID
END
EXEC ShowAllPrivileges
GO


CREATE PROCEDURE InsertUser @Username VARCHAR(100),@UserPassword VARCHAR(18),@City INT,@District INT,
@UserEmail VARCHAR(100),@UserPhone VARCHAR(30),@PrivID INT,@Admin BIT
AS
BEGIN 
INSERT INTO Users(UserName,UserPassword,UserCity,UserDistrict,UserEmail,UserPhone,PrivilegeID,TrueAdmin)
VALUES (@Username,@UserPassword,@City,@District,@UserEmail,@UserPhone,@PrivID,@Admin)
END

EXEC InsertCity Istanbul
EXEC InsertDistrict Basaksehir,1
EXEC InsertUser 'admin','admin',1,1,'admin@admin.com','5052375618',1,1
EXEC InsertUser 'test','admin',1,1,'admin@admin.com','5052375618',3,0
EXEC DeleteUser 2
GO

CREATE PROCEDURE CheckUsername @Username VARCHAR(30)
AS BEGIN
SELECT 1 FROM Users WHERE UserName = @Username
END
GO

CREATE PROCEDURE DeleteUser @ID INT
AS 
BEGIN
DELETE FROM Users WHERE Users.ID = @ID
END
EXEC DeleteUser 3
GO

CREATE PROCEDURE FindAdminOrNot @Name NVARCHAR(30)
AS BEGIN
SELECT TrueAdmin FROM Users WHERE UserName = @Name
END

EXEC FindAdminOrNot 'admin'
CREATE PROCEDURE MakeAdmin @ID INT, @BIT BIT
AS
BEGIN
UPDATE Users SET TrueAdmin = @BIT WHERE ID = @ID
END
GO
EXEC InsertCity Ankara
EXEC MakeAdmin 4,True

CREATE PROCEDURE UpdateUserPassword @ID INT,@OldPassword VARCHAR(18),@NewPassword VARCHAR(18),@PrivID INT
AS
BEGIN
UPDATE Users SET Users.UserPassword = 
					CASE WHEN @OldPassword = Users.UserPassword 
					THEN @NewPassword 
					ELSE Users.UserPassword
					END ,
Users.PrivilegeID = CASE WHEN @OldPassword = Users.UserPassword THEN @PrivID ELSE Users.ID END
WHERE Users.ID = @ID
END
EXEC UpdateUserPassword 1,'aaA','aaAa',2
GO

CREATE PROCEDURE UpdateUserEmail @ID INT, @OldEmail VARCHAR(100), @NewEmail VARCHAR(100)
AS
BEGIN
UPDATE Users SET Users.UserEmail = CASE WHEN @OldEmail = Users.UserEmail THEN @NewEmail ELSE Users.UserEmail END
WHERE Users.ID = @ID
END
GO
EXEC UpdateUserEmail 1,'test@gmail.com','dene'


SELECT * FROM Users
GO

CREATE PROCEDURE checkLogin @Username VARCHAR(100),@UserPassword VARCHAR(18)
AS
BEGIN
SELECT 1 FROM Users WHERE Users.UserName = @Username AND Users.UserPassword = @UserPassword
END
GO

CREATE PROCEDURE checkLoginPrivilege @Username VARCHAR(100)
AS
BEGIN
SELECT PrivilegeID
FROM Users
WHERE Users.UserName = @Username
END
EXEC checkLoginPrivilege admin


EXEC checkLogin 'user',123456

CREATE TABLE Companies
(
	ID INT IDENTITY PRIMARY KEY,
	UserID INT FOREIGN KEY REFERENCES Users(ID) ON DELETE CASCADE NOT NULL,
	CompanyName VARCHAR(50) UNIQUE NOT NULL,
	CompanyEmail VARCHAR(50) NOT NULL,
	CompanyPhone VARCHAR(20) NOT NULL,
	CompanyDistrict INT FOREIGN KEY REFERENCES District(ID) ON DELETE CASCADE NOT NULL,
	CompanyWorkHoursStart INT NOT NULL,
	CompanyWorkHoursEnd INT NOT NULL,
	CompanyServiceTime INT NOT NULL,
	CompanyMinimumPrice INT NOT NULL,
	CompanyPoint FLOAT
)
GO

CREATE PROCEDURE InsertCompany @Name VARCHAR(50),@UserID INT,@Email VARCHAR(50),@Phone VARCHAR(20),
@District INT,@WorkStart INT,@WorkEnd INT,@ServiceTime INT,@MinPrice INT,@Point FLOAT
AS
BEGIN
INSERT INTO Companies(CompanyName,UserID,CompanyEmail,CompanyPhone,CompanyDistrict,
CompanyWorkHoursStart,CompanyWorkHoursEnd,CompanyServiceTime,CompanyMinimumPrice,CompanyPoint)
VALUES (@Name,@UserID,@Email,@Phone,@District,@WorkStart,@WorkEnd,@ServiceTime,@MinPrice,@Point)
END
GO
EXEC insertCompany 'denemae',12,'deneme@gmail.com','+905052375618','Istanbul','Basaksehir',10,23,45,10,8.7
GO

CREATE PROCEDURE DeleteCompany @ID INT
AS
BEGIN
DELETE FROM Companies WHERE Companies.ID = @ID
END
GO
EXEC deleteCompany 1
GO

CREATE PROCEDURE UpdateCompany  @Name VARCHAR(50),@Email VARCHAR(50),@Phone VARCHAR(20),
@District INT,@WorkStart INT,@WorkEnd INT,@ServiceTime INT,@MinPrice INT,@Point FLOAT
AS
BEGIN
UPDATE Companies SET CompanyName = @Name,CompanyEmail = @Email,CompanyPhone=@Phone,
CompanyDistrict = @District,CompanyWorkHoursStart = @WorkStart,CompanyWorkHoursEnd = @WorkEnd,CompanyServiceTime = @ServiceTime,
CompanyMinimumPrice = @MinPrice,CompanyPoint = @Point
END
GO
EXEC updateCompany 'update','update@gmail.com','+update','update','update',0,0,0,0,0

CREATE PROCEDURE listAllUsers
AS BEGIN
SELECT * FROM Users
WHERE Users.PrivilegeID = 3
END
GO

CREATE PROCEDURE listAllAdmin
AS BEGIN
SELECT * FROM Users
WHERE Users.PrivilegeID = 1
END
GO

CREATE PROCEDURE listAllCompanies
AS BEGIN
SELECT * FROM Users
WHERE Users.PrivilegeID = 2
END
GO
EXEC listAllUsers


CREATE PROCEDURE showUser @ID INT
AS BEGIN
SELECT * FROM Users
WHERE Users.ID = @ID
END
GO

SELECT * FROM Users
GO

CREATE TABLE City
(
	ID INT IDENTITY PRIMARY KEY,
	Name VARCHAR(25) NOT NULL
)
CREATE TABLE District
(
	ID INT IDENTITY PRIMARY KEY,
	CityID INT FOREIGN KEY REFERENCES City(ID) ON DELETE CASCADE NOT NULL,
	Name VARCHAR(25) UNIQUE NOT NULL
)
GO
CREATE PROCEDURE InsertCity @Name VARCHAR(25)
AS BEGIN
INSERT INTO City(Name) VALUES (@Name)
END

EXEC InsertCity Bolu

CREATE PROCEDURE DeleteCity @ID INT
AS BEGIN
DELETE FROM City WHERE ID=@ID
END

EXEC DeleteCity 2

CREATE PROCEDURE InsertDistrict @Name VARCHAR(25), @CityID INT
AS BEGIN
INSERT INTO District(Name,CityID) VALUES (@Name,@CityID)
END

EXEC InsertDistrict Basaksehir,1

CREATE PROCEDURE DeleteDistrict @ID INT
AS BEGIN
DELETE FROM District WHERE ID = @ID
END
EXEC DeleteDistrict 1

CREATE PROCEDURE ListAllCities
AS BEGIN
SELECT * FROM City ORDER BY Name
END

CREATE PROCEDURE ListAllDistrictsWithCity @ID INT
AS BEGIN
SELECT ID,Name FROM District WHERE CityID=@ID ORDER BY Name
END


CREATE PROCEDURE showIDbyUsername @Name VARCHAR(30)
AS BEGIN
SELECT ID FROM Users WHERE UserName = @Name
END

EXEC showIDbyUsername admin


CREATE TABLE CompanyFoods
(
	ID INT IDENTITY PRIMARY KEY,
	FoodName VARCHAR(30) NOT NULL,
	FoodPrice INT NOT NULL,
	FoodType VARCHAR(30) NOT NULL,
	CompanyID INT FOREIGN KEY REFERENCES Companies(ID) ON DELETE CASCADE NOT NULL
)
CREATE PROCEDURE GetCompanyFoods @ID INT, @Type VARCHAR(30)
AS BEGIN
SELECT ID,FoodName,FoodPrice,FoodType FROM CompanyFoods
WHERE CompanyID=@ID AND FoodType = @Type ORDER BY FoodType
END
EXEC GetCompanyFoods 6,Dessert

CREATE PROCEDURE GetFoodPrice @ID INT
AS BEGIN
SELECT FoodPrice FROM CompanyFoods WHERE ID = @ID
END

CREATE PROCEDURE UpdateFoodName @ID INT,@Name VARCHAR(30)
AS BEGIN
UPDATE CompanyFoods SET FoodName = @Name WHERE ID = @ID
END

CREATE PROCEDURE UpdateFoodType @ID INT,@Type VARCHAR(30)
AS BEGIN
UPDATE CompanyFoods SET FoodType = @Type WHERE ID = @ID
END

CREATE PROCEDURE UpdateFood @ID INT,@Name VARCHAR(30),@Price INT,@Type VARCHAR(30)
AS BEGIN
UPDATE CompanyFoods SET FoodName = @Name,FoodPrice = @Price,FoodType = @Type WHERE ID = @ID
END

CREATE PROCEDURE GetCompanyIDFromUserName @Name VARCHAR(30)
AS BEGIN
SELECT Companies.ID FROM Companies 
JOIN Users ON Users.ID = Companies.UserID WHERE Companies.CompanyName = 'q'
END
EXEC GetCompanyIDFromUserName 'q'
INSERT INTO CompanyFoods(FoodName,FoodPrice,FoodType,CompanyID) VALUES ('test',10,'dessert',6)

EXEC GetCompanyIDFromUserName 'Little Ceaser'

EXEC showIDbyUsername 'a'
CREATE PROCEDURE InsertCompanyFood @Name VARCHAR(30),@Price INT,@Type VARCHAR(30),@ID INT
AS BEGIN
INSERT INTO CompanyFoods(FoodName,FoodPrice,FoodType,CompanyID)
VALUES (@Name,@Price,@Type,@ID)
END

EXEC InsertCompanyFood 'at eti',30,'main food',6

CREATE PROCEDURE UpdateFoodPrice @ID INT,@NewPrice INT
AS BEGIN
UPDATE CompanyFoods SET FoodPrice = @NewPrice WHERE ID = @ID
END
EXEC UpdateFoodPrice 2,56

CREATE PROCEDURE DeleteFood @ID INT
AS BEGIN
DELETE FROM CompanyFoods WHERE ID=@ID
END

EXEC DeleteFood 2