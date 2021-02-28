-- Final Project
-- Created by: Ian Ustanik and Rishabh Agarwal
-- Due Date: 12/2/2019

-- -------------------------

-- SQL Script for Creating Tables and Inserting Sample Data. 

----------Tables----------

-- Created Customer Table
CREATE TABLE Customer(
	CustomerID CHAR(10) NOT NULL,
	CustomerFirstName VARCHAR(30) NOT NULL,
	CustomerLastName VARCHAR(30) NOT NULL,
	CustomerStreetNo VARCHAR(10) NOT NULL,
	CustomerStreetName VARCHAR(30) NOT NULL,
	CustomerCity VARCHAR(20) NOT NULL,
	CustomerState VARCHAR(30) NOT NULL,
	CustomerZipCode VARCHAR(10) NOT NULL,
	CustomerCellPhoneNumber VARCHAR(20),

	CONSTRAINT Customer_PK PRIMARY KEY (CustomerId)
);

-- Created Vendor Table
CREATE TABLE Vendor(
	VendorID CHAR(10) NOT NULL,
	VendorName VARCHAR(30) NOT NULL,
	VendorStreetNo VARCHAR(30) NOT NULL,
	VendorStreetName VARCHAR(30) NOT NULL,
	VendorCity VARCHAR(30) NOT NULL,
	VendorState VARCHAR(30) NOT NULL,
	VendorZipCode VARCHAR(30) NOT NULL,
	VendorBusinessPhoneNumber VARCHAR(30),

	CONSTRAINT Vendor_PK PRIMARY KEY (VendorId)
);

-- Created Room Table
CREATE TABLE Room(
	RoomNumber CHAR(10) NOT NULL,
	ToiletryUnits VARCHAR(10) NOT NULL,
	TowelUnits VARCHAR(10) NOT NULL,
	BedsheetUnits VARCHAR(10) NOT NULL,

	CONSTRAINT Room_PK PRIMARY KEY (RoomNumber)
);

-- Created RestaurantMeal Table
CREATE TABLE RestaurantMeal(
	MealID CHAR(10) NOT NULL,
	MeatUnits VARCHAR(20) NOT NULL,
	VegetableUnits VARCHAR(20) NOT NULL,
	DrinkUnits VARCHAR(20) NOT NULL,

	CONSTRAINT RestaurantMeal_PK PRIMARY KEY (MealID)
);

-- Created Purchase Table
CREATE TABLE Purchase(
	PurchaseID CHAR(10) NOT NULL,
	ProductType VARCHAR(30) NOT NULL CHECK(ProductType IN ('Toiletry', 'Towel', 'Bedsheet', 'Meat', 'Vegetable', 'Drink')),
	Quantity VARCHAR(30) NOT NULL,
	PurchaseDate DATE NOT NULL,

	CONSTRAINT Purchase_PK PRIMARY KEY (PurchaseID)
);

-- Created StorageInventory Table
CREATE TABLE StorageInventory(
	StorageID CHAR(10) NOT NULL,
	PurchaseID CHAR(10) NOT NULL,
	ProductType VARCHAR(30) NOT NULL CHECK(ProductType IN ('Toiletry', 'Towel', 'Bedsheet', 'Meat', 'Vegetable', 'Drink')),
	ProductPrice VARCHAR(30) NOT NULL,

	CONSTRAINT StorageInventory_PK PRIMARY KEY (StorageID),
	CONSTRAINT StorageInventory_FK FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID)

);

-- Created Product Table
CREATE TABLE Product(
	ProductID CHAR(10) NOT NULL,
	VendorID CHAR(10) NOT NULL,
	ProductType VARCHAR(20) NOT NULL CHECK(ProductType IN ('Toiletry', 'Towel', 'Bedsheet', 'Meat', 'Vegetable', 'Drink')),
	ProductPrice VARCHAR(20) NOT NULL,

	CONSTRAINT Product_PK PRIMARY KEY (ProductID),
	CONSTRAINT Product_FK FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)

);

-- Created OrderLine Table
CREATE TABLE OrderLine(
	OrderLineID CHAR(10) NOT NULL,
	PurchaseID CHAR(10) NOT NULL,
	ProductID CHAR(10) NOT NULL,

	CONSTRAINT OrderLine_PK PRIMARY KEY (OrderLineID),
	CONSTRAINT OrderLine_FK1 FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID),
	CONSTRAINT OrderLine_FK2 FOREIGN KEY (ProductID) REFERENCES Product(ProductID)

);

-- Created Reservation Table
CREATE TABLE Reservation(
	ReservationID CHAR(10) NOT NULL,
	RoomNumber CHAR(10) NOT NULL,
	MealID CHAR(10) NOT NULL,
	CustomerID CHAR(10) NOT NULL,
	CheckInDate DATE NOT NULL,
	CheckOutDate DATE NOT NULL,

	CONSTRAINT Reservation_PK PRIMARY KEY (ReservationID, RoomNumber, MealID),
	CONSTRAINT Reservation_FK1 FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber),
	CONSTRAINT Reservation_FK2 FOREIGN KEY (MealID) REFERENCES RestaurantMeal(MealID),
	CONSTRAINT Reservation_FK3 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)

);
----------Sample Data----------

-- Inserted Customer Data
INSERT INTO Customer (CustomerID,CustomerFirstName,CustomerLastName,CustomerStreetNo,CustomerStreetName,CustomerCity,CustomerState,CustomerZipCode,CustomerCellPhoneNumber)
VALUES('1','Rohit','Sharma','112','Peddar Rd','Mumbai','Maharashtra','400003','9930023011');
INSERT INTO Customer (CustomerID,CustomerFirstName,CustomerLastName,CustomerStreetNo,CustomerStreetName,CustomerCity,CustomerState,CustomerZipCode,CustomerCellPhoneNumber)
VALUES('2','Rahul','Kapoor','1334','Nepensea Rd','Mumbai','Maharashtra','400003','9830022011');
INSERT INTO Customer (CustomerID,CustomerFirstName,CustomerLastName,CustomerStreetNo,CustomerStreetName,CustomerCity,CustomerState,CustomerZipCode,CustomerCellPhoneNumber)
VALUES('3','Chris','Pulisic','1445','Lancaster Ave','Syracuse','New York','13210','3154667777');
INSERT INTO Customer (CustomerID,CustomerFirstName,CustomerLastName,CustomerStreetNo,CustomerStreetName,CustomerCity,CustomerState,CustomerZipCode,CustomerCellPhoneNumber)
VALUES('4','Brad','Friedel','111','Ackerman Ave','Syracuse','New York','13210','3154990007');
INSERT INTO Customer (CustomerID,CustomerFirstName,CustomerLastName,CustomerStreetNo,CustomerStreetName,CustomerCity,CustomerState,CustomerZipCode,CustomerCellPhoneNumber)
VALUES('5','Michael','Scott','303','Euclid Ave','Syracuse','New York','13210', NULL);

-- Inserted Reservation Data
INSERT INTO Reservation(ReservationID,RoomNumber,MealID,CustomerID,CheckInDate,CheckOutDate)
VALUES('11','8001','600','3','10/20/2019','10/23/2019');
INSERT INTO Reservation(ReservationID,RoomNumber,MealID,CustomerID,CheckInDate,CheckOutDate)
VALUES('12','7001','601','2','08/04/2018','08/20/2018');
INSERT INTO Reservation(ReservationID,RoomNumber,MealID,CustomerID,CheckInDate,CheckOutDate)
VALUES('13','5001','602','1','09/12/2018','10/02/2018');
INSERT INTO Reservation(ReservationID,RoomNumber,MealID,CustomerID,CheckInDate,CheckOutDate)
VALUES('15','3001','603','4','09/12/2019','09/22/2019');
INSERT INTO Reservation(ReservationID,RoomNumber,MealID,CustomerID,CheckInDate,CheckOutDate)
VALUES('14','1001','604','5','03/02/2019','03/04/2019');

-- Inserted Room Data
INSERT INTO Room(RoomNumber,ToiletryUnits,TowelUnits,BedsheetUnits)
VALUES('8001','15','6','5');
INSERT INTO Room(RoomNumber,ToiletryUnits,TowelUnits,BedsheetUnits)
VALUES('1001','20','3','6');
INSERT INTO Room(RoomNumber,ToiletryUnits,TowelUnits,BedsheetUnits)
VALUES('3001','12','8','9');
INSERT INTO Room(RoomNumber,ToiletryUnits,TowelUnits,BedsheetUnits)
VALUES('5001','17','4','3');
INSERT INTO Room(RoomNumber,ToiletryUnits,TowelUnits,BedsheetUnits)
VALUES('7001','14','6','8');

-- Inserted Purchase Data
INSERT INTO Purchase(PurchaseID,ProductType,Quantity,PurchaseDate)
VALUES('999','Vegetable','30','10/22/2019');
INSERT INTO Purchase(PurchaseID,ProductType,Quantity,PurchaseDate)
VALUES('900','Meat','50','01/02/2019');
INSERT INTO Purchase(PurchaseID,ProductType,Quantity,PurchaseDate)
VALUES('909','Towel','100','01/03/2019');
INSERT INTO Purchase(PurchaseID,ProductType,Quantity,PurchaseDate)
VALUES('903','Drink','50','01/09/2019');
INSERT INTO Purchase(PurchaseID,ProductType,Quantity,PurchaseDate)
VALUES('907','Toiletry','20','01/01/2019');
INSERT INTO Purchase(PurchaseID,ProductType,Quantity,PurchaseDate)
VALUES('908','Bedsheet','60','01/10/2019');

-- Inserted RestaurantMeal Data
INSERT INTO RestaurantMeal(MealID,MeatUnits,VegetableUnits,DrinkUnits)
VALUES('600','30','20','16');
INSERT INTO RestaurantMeal(MealID,MeatUnits,VegetableUnits,DrinkUnits)
VALUES('601','15','10','17');
INSERT INTO RestaurantMeal(MealID,MeatUnits,VegetableUnits,DrinkUnits)
VALUES('602','10','20','30');
INSERT INTO RestaurantMeal(MealID,MeatUnits,VegetableUnits,DrinkUnits)
VALUES('603','20','16','19');
INSERT INTO RestaurantMeal(MealID,MeatUnits,VegetableUnits,DrinkUnits)
VALUES('604','30','20','10');

-- Inserted OrderLine Data
INSERT INTO OrderLine(OrderLineID,PurchaseID,ProductID)
VALUES('700','999','300');
INSERT INTO OrderLine(OrderLineID,PurchaseID,ProductID)
VALUES('701','900','301');
INSERT INTO OrderLine(OrderLineID,PurchaseID,ProductID)
VALUES('702','909','302');
INSERT INTO OrderLine(OrderLineID,PurchaseID,ProductID)
VALUES('703','907','303');
INSERT INTO OrderLine(OrderLineID,PurchaseID,ProductID)
VALUES('704','903','304');

-- Inserted Product Data
INSERT INTO Product(ProductID,VendorID,ProductType,ProductPrice)
VALUES('300','400','Vegetable','20');
INSERT INTO Product(ProductID,VendorID,ProductType,ProductPrice)
VALUES('301','401','Meat','30');
INSERT INTO Product(ProductID,VendorID,ProductType,ProductPrice)
VALUES('302','402','Drink','3');
INSERT INTO Product(ProductID,VendorID,ProductType,ProductPrice)
VALUES('303','403','Towel','10');
INSERT INTO Product(ProductID,VendorID,ProductType,ProductPrice)
VALUES('304','404','Toiletry','9');

-- Inserted Vendor Data
INSERT INTO Vendor(VendorID,VendorName,VendorStreetNo,VendorStreetName,VendorCity,VendorState,VendorZipCode,VendorBusinessPhoneNumber)
VALUES('400','ABC foods','1010','Colaba','Mumbai','Maharashtra','400001','9200202020');
INSERT INTO Vendor(VendorID,VendorName,VendorStreetNo,VendorStreetName,VendorCity,VendorState,VendorZipCode,VendorBusinessPhoneNumber)
VALUES('401','CBD cold storage','1403','IC colony','Mumbai','Maharashtra','400004','9892207200');
INSERT INTO Vendor(VendorID,VendorName,VendorStreetNo,VendorStreetName,VendorCity,VendorState,VendorZipCode,VendorBusinessPhoneNumber)
VALUES('402','THC beverages','1400','Orlem road','Mumbai','Maharashtra','400007','9636471777');
INSERT INTO Vendor(VendorID,VendorName,VendorStreetNo,VendorStreetName,VendorCity,VendorState,VendorZipCode,VendorBusinessPhoneNumber)
VALUES('403','CVV furnishing','100','Cuffe Parade','Mumbai','Maharashtra','400002','9930013034');
INSERT INTO Vendor(VendorID,VendorName,VendorStreetNo,VendorStreetName,VendorCity,VendorState,VendorZipCode,VendorBusinessPhoneNumber)
VALUES('404','NBC traders','101','Marine Lines','Mumbai','Maharashtra','400005', NULL);

-- Inserted StorageInventory Data
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('800','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('801','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('802','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('803','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('804','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('805','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('806','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('807','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('808','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('809','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('810','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('811','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('812','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('813','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('814','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('815','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('816','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('817','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('818','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('819','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('820','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('821','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('822','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('823','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('824','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('825','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('826','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('827','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('828','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('829','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('830','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('831','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('832','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('833','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('834','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('835','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('836','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('837','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('838','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('839','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('840','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('841','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('842','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('843','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('844','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('845','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('846','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('847','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('848','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('849','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('850','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('851','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('852','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('853','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('854','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('855','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('856','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('857','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('858','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('859','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('860','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('861','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('862','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('863','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('864','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('865','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('866','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('867','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('868','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('869','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('870','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('871','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('872','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('873','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('874','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('875','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('876','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('877','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('878','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('879','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('880','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('881','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('882','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('883','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('884','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('885','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('886','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('887','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('888','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('889','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('890','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('891','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('892','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('893','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('894','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('895','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('896','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('897','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('898','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('899','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('900','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('901','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('902','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('903','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('904','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('905','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('906','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('907','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('908','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('909','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('910','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('911','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('912','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('913','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('914','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('915','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('916','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('917','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('918','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('919','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('920','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('921','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('922','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('923','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('924','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('925','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('926','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('927','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('928','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('929','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('930','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('931','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('932','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('933','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('934','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('935','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('936','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('937','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('938','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('939','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('940','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('941','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('942','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('943','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('944','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('945','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('946','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('947','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('948','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('949','907','Toiletry','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('950','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('951','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('952','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('953','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('954','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('955','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('956','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('957','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('958','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('959','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('960','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('961','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('962','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('963','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('964','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('965','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('966','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('967','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('968','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('969','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('970','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('971','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('972','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('973','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('974','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('975','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('976','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('977','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('978','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('979','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('980','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('981','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('982','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('983','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('984','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('985','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('986','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('987','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('988','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('989','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('990','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('991','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('992','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('993','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('994','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('995','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('996','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('997','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('998','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('999','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1000','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1001','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1002','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1003','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1004','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1005','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1006','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1007','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1008','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1009','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1010','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1011','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1012','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1013','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1014','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1015','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1016','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1017','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1018','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1019','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1020','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1021','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1022','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1023','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1024','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1025','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1026','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1027','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1028','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1029','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1030','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1031','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1032','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1033','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1034','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1035','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1036','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1037','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1038','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1039','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1040','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1041','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1042','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1043','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1044','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1045','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1046','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1047','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1048','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1049','909','Towel','10');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1050','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1051','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1052','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1053','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1054','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1055','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1056','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1057','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1058','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1059','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1060','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1061','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1062','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1063','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1064','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1065','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1066','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1067','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1068','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1069','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1070','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1071','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1072','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1073','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1074','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1075','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1076','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1077','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1078','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1079','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1080','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1081','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1082','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1083','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1084','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1085','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1086','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1087','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1088','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1089','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1090','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1091','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1092','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1093','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1094','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1095','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1096','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1097','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1098','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1099','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1100','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1101','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1102','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1103','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1104','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1105','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1106','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1107','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1108','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1109','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1110','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1111','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1112','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1113','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1114','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1115','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1116','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1117','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1118','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1119','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1120','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1121','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1122','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1123','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1124','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1125','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1126','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1127','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1128','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1129','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1130','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1131','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1132','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1133','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1134','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1135','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1136','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1137','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1138','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1139','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1140','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1141','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1142','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1143','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1144','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1145','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1146','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1147','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1148','908','Bedsheet','9');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1149','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1150','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1151','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1152','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1153','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1154','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1155','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1156','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1157','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1158','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1159','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1160','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1161','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1162','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1163','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1164','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1165','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1166','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1167','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1168','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1169','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1170','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1171','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1172','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1173','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1174','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1175','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1176','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1177','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1178','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1179','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1180','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1181','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1182','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1183','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1184','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1185','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1186','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1187','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1188','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1189','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1190','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1191','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1192','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1193','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1194','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1195','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1196','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1197','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1198','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1199','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1200','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1201','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1202','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1203','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1204','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1205','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1206','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1207','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1208','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1209','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1210','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1211','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1212','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1213','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1214','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1215','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1216','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1217','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1218','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1219','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1220','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1221','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1222','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1223','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1224','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1225','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1226','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1227','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1228','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1229','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1230','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1231','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1232','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1233','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1234','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1235','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1236','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1237','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1238','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1239','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1240','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1241','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1242','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1243','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1244','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1245','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1246','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1247','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1248','999','Vegetable','20');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1249','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1250','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1251','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1252','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1253','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1254','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1255','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1256','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1257','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1258','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1259','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1260','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1261','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1262','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1263','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1264','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1265','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1266','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1267','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1268','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1269','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1270','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1271','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1272','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1273','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1274','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1275','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1276','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1277','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1278','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1279','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1280','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1281','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1282','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1283','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1284','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1285','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1286','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1287','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1288','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1289','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1290','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1291','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1292','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1293','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1294','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1295','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1296','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1297','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1298','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1299','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1300','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1301','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1302','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1303','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1304','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1305','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1306','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1307','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1308','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1309','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1310','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1311','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1312','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1313','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1314','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1315','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1316','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1317','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1318','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1319','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1320','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1321','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1322','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1323','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1324','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1325','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1326','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1327','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1328','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1329','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1330','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1331','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1332','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1333','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1334','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1335','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1336','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1337','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1338','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1339','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1340','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1341','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1342','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1343','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1344','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1345','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1346','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1347','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1348','900','Meat','30');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1349','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1350','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1351','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1352','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1353','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1354','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1355','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1366','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1367','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1368','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1369','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1370','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1371','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1372','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1373','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1374','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1375','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1376','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1377','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1378','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1379','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1380','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1381','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1382','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1383','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1384','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1385','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1386','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1387','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1388','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1389','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1390','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1391','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1392','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1393','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1394','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1395','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1396','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1397','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1398','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1399','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1400','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1401','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1402','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1403','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1404','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1405','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1406','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1407','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1408','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1409','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1410','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1411','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1412','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1413','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1414','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1415','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1416','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1417','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1418','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1419','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1420','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1421','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1422','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1423','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1424','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1425','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1426','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1427','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1428','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1429','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1430','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1431','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1432','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1433','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1434','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1435','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1436','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1437','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1438','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1439','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1440','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1441','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1442','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1443','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1444','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1445','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1446','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1447','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1448','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1449','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1450','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1451','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1452','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1453','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1454','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1455','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1456','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1457','903','Drink','3');
INSERT INTO StorageInventory(StorageID,PurchaseID,ProductType,ProductPrice)
VALUES('1458','903','Drink','3');

-- Viewed Completed Tables
SELECT * FROM Customer
SELECT * FROM Reservation
SELECT * FROM Room
SELECT * FROM RestaurantMeal
SELECT * FROM StorageInventory
SELECT * FROM Purchase
SELECT * FROM Product
SELECT * FROM OrderLine
SELECT * FROM Vendor

-- SQL Statements for Answering Major Data Questions. 

--1) ---------- How much room inventory is there available for a reservation? ---------- 
SELECT re.ReservationID, ro.*
FROM Room ro 
JOIN Reservation re
ON ro.RoomNumber = re.RoomNumber

--2) ---------- How much restaurant inventory is there available for a reservation? ---------- 
SELECT re.ReservationID, rm.*
FROM RestaurantMeal rm
JOIN Reservation re
ON rm.MealID = re.MealID

--3) ---------- What are the customer details for a reservation? ----------
SELECT re.ReservationID, c.*
FROM Customer c
JOIN Reservation re
ON c.CustomerID = re.CustomerID

--4) ---------- What are the vendor details for a product? ----------
SELECT p.ProductID, v.*
FROM Vendor v
JOIN Product p
ON v.VendorID = p.VendorID

--5) ---------- What are current inventory levels in storage? ----------
SELECT si.ProductType, COUNT(ProductType) 'Current Inventory'
FROM StorageInventory si
GROUP BY si.ProductType

