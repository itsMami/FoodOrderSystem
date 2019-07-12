--INSERT INTO TABLES


INSERT INTO UserPrivileges(Privilege)
VALUES ('Admin'),('Company'),('User')
GO

INSERT INTO Users(UserName,UserPassword,UserCity,UserDistrict,UserEmail,UserPhone,PrivilegeID,TrueAdmin)
VALUES ('admin','admin',1,1,'admin@admin.com','-',1,1)
GO

INSERT INTO FoodCategories(Name)
VALUES ('Soups'),('Main Foods'),('Meats'),('Salads'),('Drinks'),('Desserts')
GO

INSERT INTO City(Name)
VALUES ('Ankara'),('Istanbul'),('Bolu'),('Cankiri'),('Izmir')
GO

INSERT INTO District(CityID,Name)
VALUES (1,'Kizilay'),(1,'Emek'),(1,'Ulus'),(2,'Eminonu'),(2,'Bakirkoy'),(2,'Basaksehir'),
(3,'Merkez'),(4,'Merkez'),(5,'Cesme')
GO