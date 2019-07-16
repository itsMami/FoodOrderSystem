CREATE PROCEDURE InsertUserPrivilege (@PrivName VARCHAR(20))
AS
BEGIN
INSERT INTO UserPrivileges(Privilege)
VALUES (@PrivName)
END
GO

CREATE PROCEDURE DeletePrivilege @ID INT
AS
BEGIN
DELETE FROM UserPrivileges WHERE UserPrivileges.ID = @ID
END
GO

CREATE PROCEDURE UpdatePrivilege @ID INT,@NewName VARCHAR(20)
AS
BEGIN
UPDATE UserPrivileges SET UserPrivileges.Privilege = @NewName WHERE UserPrivileges.ID = @ID
END
GO

CREATE PROCEDURE ShowAllPrivileges
AS
BEGIN
SELECT * FROM UserPrivileges ORDER BY ID
END
GO

CREATE PROCEDURE InsertUser @Username VARCHAR(100),@UserPassword VARCHAR(18),@City INT,@District INT,
@UserEmail VARCHAR(100),@UserPhone VARCHAR(30),@PrivID INT,@Admin BIT
AS
BEGIN 
INSERT INTO Users(UserName,UserPassword,UserCity,UserDistrict,UserEmail,UserPhone,PrivilegeID,TrueAdmin)
VALUES (@Username,@UserPassword,@City,@District,@UserEmail,@UserPhone,@PrivID,@Admin)
END
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
GO

CREATE PROCEDURE FindAdminOrNot @Name NVARCHAR(30)
AS BEGIN
SELECT TrueAdmin FROM Users WHERE UserName = @Name
END
GO

CREATE PROCEDURE MakeAdmin @ID INT, @BIT BIT
AS
BEGIN
UPDATE Users SET TrueAdmin = @BIT WHERE ID = @ID
END
GO

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
GO

CREATE PROCEDURE UpdateUserEmail @ID INT, @OldEmail VARCHAR(100), @NewEmail VARCHAR(100)
AS
BEGIN
UPDATE Users SET Users.UserEmail = CASE WHEN @OldEmail = Users.UserEmail THEN @NewEmail ELSE Users.UserEmail END
WHERE Users.ID = @ID
END
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

CREATE PROCEDURE DeleteCompany @ID INT
AS
BEGIN
DELETE FROM Companies WHERE Companies.ID = @ID
END
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

CREATE PROCEDURE showUser @ID INT
AS BEGIN
SELECT * FROM Users
WHERE Users.ID = @ID
END
GO

CREATE PROCEDURE InsertCity @Name VARCHAR(25)
AS BEGIN
INSERT INTO City(Name) VALUES (@Name)
END
GO
CREATE PROCEDURE DeleteCity @ID INT
AS BEGIN
DELETE FROM City WHERE ID=@ID
END
GO
CREATE PROCEDURE InsertDistrict @Name VARCHAR(25), @CityID INT
AS BEGIN
INSERT INTO District(Name,CityID) VALUES (@Name,@CityID)
END
GO

CREATE PROCEDURE DeleteDistrict @ID INT
AS BEGIN
DELETE FROM District WHERE ID = @ID
END
GO

CREATE PROCEDURE ListAllCities
AS BEGIN
SELECT * FROM City ORDER BY Name
END
GO
CREATE PROCEDURE ListAllDistrictsWithCity @ID INT
AS BEGIN
SELECT ID,Name FROM District WHERE CityID=@ID ORDER BY Name
END
GO

CREATE PROCEDURE showIDbyUsername @Name VARCHAR(30)
AS BEGIN
SELECT ID FROM Users WHERE UserName = @Name
END
GO

CREATE PROCEDURE GetCompanyFoods @ID INT, @Type VARCHAR(30)
AS BEGIN
SELECT ID,FoodName,FoodPrice,FoodType FROM CompanyFoods
WHERE CompanyID=@ID AND FoodType = @Type ORDER BY FoodType
END
GO

CREATE PROCEDURE GetFoodPrice @ID INT
AS BEGIN
SELECT FoodPrice FROM CompanyFoods WHERE ID = @ID
END
GO
CREATE PROCEDURE UpdateFoodName @ID INT,@Name VARCHAR(30)
AS BEGIN
UPDATE CompanyFoods SET FoodName = @Name WHERE ID = @ID
END
GO
CREATE PROCEDURE UpdateFoodType @ID INT,@Type VARCHAR(30)
AS BEGIN
UPDATE CompanyFoods SET FoodType = @Type WHERE ID = @ID
END
GO
CREATE PROCEDURE UpdateFood @ID INT,@Name VARCHAR(30),@Price INT,@Type VARCHAR(30)
AS BEGIN
UPDATE CompanyFoods SET FoodName = @Name,FoodPrice = @Price,FoodType = @Type WHERE ID = @ID
END
GO
CREATE PROCEDURE GetCompanyIDFromUserName @Name VARCHAR(30)
AS BEGIN
SELECT Companies.ID FROM Companies 
JOIN Users ON Users.ID = Companies.UserID WHERE Companies.CompanyName = @Name
END
GO

CREATE PROCEDURE InsertCompanyFood @Name VARCHAR(30),@Price INT,@Type VARCHAR(30),@ID INT
AS BEGIN
INSERT INTO CompanyFoods(FoodName,FoodPrice,FoodType,CompanyID)
VALUES (@Name,@Price,@Type,@ID)
END
GO

CREATE PROCEDURE UpdateFoodPrice @ID INT,@NewPrice INT
AS BEGIN
UPDATE CompanyFoods SET FoodPrice = @NewPrice WHERE ID = @ID
END
GO

CREATE PROCEDURE DeleteFood @ID INT
AS BEGIN
DELETE FROM CompanyFoods WHERE ID=@ID
END
GO

CREATE PROCEDURE GetCategories
AS BEGIN
SELECT * FROM FoodCategories ORDER BY Name DESC
END
GO

CREATE PROCEDURE ShowCompanyOnDistrict @DistrictID INT
AS BEGIN
SELECT * FROM Companies WHERE Companies.CompanyDistrict = @DistrictID
END
GO

CREATE PROCEDURE GetCompanyPoint @CompanyID INT
AS BEGIN 
SELECT CompanyPoint FROM Companies WHERE Companies.ID = @CompanyID
END
GO

CREATE PROCEDURE IncreaseReview @ID INT
AS BEGIN
UPDATE Companies SET CompanyReviewCount = CompanyReviewCount+1
WHERE ID = @ID
END
GO

CREATE PROCEDURE SetCompanyPoint @ID INT, @Point FLOAT
AS BEGIN 
UPDATE Companies SET CompanyPoint = ((CompanyPoint+@Point)/CompanyReviewCount)
WHERE ID=@ID
END
GO
