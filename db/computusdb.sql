
CREATE DATABASE IF NOT EXISTS computusdb;
USE computusdb;

CREATE TABLE IF NOT EXISTS customer_tbl(
	CustomerID INT(9) UNSIGNED AUTO_INCREMENT,
	FirstName varchar(40) NOT NULL,
	LastName varchar(40) NOT NULL,
	Address varchar(255) NOT NULL,
	City varchar(255) NOT NULL,
	PostalCode varchar(6) NOT NULL,
	Province varchar(40) NOT NULL,
	Country varchar(40) NOT NULL,
	PhoneNumber VARCHAR(10) ,
	EmailAddress varchar(255),
	PRIMARY KEY (CustomerID)
);

CREATE TABLE IF NOT EXISTS product_tbl(
	ProductID INT(9) UNSIGNED AUTO_INCREMENT,
	ProductName varchar(255) NOT NULL,
	ProductBrand varchar(255) NOT NULL,
	ProductPrice DECIMAL(10,2) NOT NULL,
	Quantity INT(6) UNSIGNED NOT NULL,
	ActiveStatus TINYINT(1) DEFAULT 1,
	PRIMARY KEY (ProductID)

);

CREATE TABLE IF NOT EXISTS desktop_tbl(
	ProductID INT(9) UNSIGNED NOT NULL,
	ProductType varchar(255) NOT NULL,
	OperatingSystem varchar(40) NOT NULL,
	CPU varchar(255) NOT NULL,
	GPU varchar(255) NOT NULL,
	Memory varchar(255) NOT NULL,
	StorageA varchar(255) NOT NULL,
	StorageB varchar(255),
	OpticalDevice varchar(255),
	USB varchar(255),
	VideoOutputs varchar(255),

	PRIMARY KEY (ProductID),
	FOREIGN KEY (ProductID) 
		REFERENCES product_tbl(ProductID)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS laptop_tbl(
	ProductID INT(9) UNSIGNED NOT NULL,
	ProductType varchar(255) NOT NULL,
	OperatingSystem varchar(255) NOT NULL,
	ScreenSize FLOAT(3,1) NOT NULL,
	TouchScreen TINYINT(1) NOT NULL DEFAULT 0,
	CPU varchar(255) NOT NULL,
	GPU varchar(255) NOT NULL,
	Memory varchar(255) NOT NULL,
	StorageA varchar(255) NOT NULL,
	StorageB varchar(255),
	OpticalDevice varchar(255),
	USB varchar(255),
	VideoOutputs varchar(255),

	PRIMARY KEY (ProductID),
	FOREIGN KEY (ProductID) 
		REFERENCES product_tbl(ProductID)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS transaction_tbl(
	InvoiceNumber INT(9) UNSIGNED AUTO_INCREMENT NOT NULL,
	CustomerID INT(9) UNSIGNED NOT NULL,
	SubTotal DECIMAL(10,2) NOT NULL,
	SaleTime TIMESTAMP NOT NULL,
	TaxTotal DECIMAL(10,2) NOT NULL,
	SaleTotal DECIMAL(10,2) NOT NULL,

	PRIMARY KEY (InvoiceNumber),
	FOREIGN KEY (CustomerID)
		REFERENCES customer_tbl(CustomerID)
		

);

CREATE TABLE IF NOT EXISTS product_sale_tbl(
	InvoiceNumber INT(9) UNSIGNED NOT NULL,
	ProductID INT(9) UNSIGNED NOT NULL,
	Quantity INT(6) UNSIGNED NOT NULL,
	SalePrice DECIMAL(10,2) NOT NULL,
	UnitTotal DECIMAL(10,2) NOT NULL,

	PRIMARY KEY(InvoiceNumber, ProductID),
	FOREIGN KEY (InvoiceNumber) REFERENCES transaction_tbl(InvoiceNumber)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (ProductID) REFERENCES product_tbl(ProductID)
		ON DELETE NO ACTION ON UPDATE CASCADE
	

);

CREATE TABLE IF NOT EXISTS tax_rates_tbl(
	Province varchar(40) NOT NULL,
	TaxRate FLOAT(5,4) NOT NULL,

	PRIMARY KEY (Province)
);
/*
	setting starting AUTO_INCREMENT values for customer and transaction tables
*/

ALTER TABLE customer_tbl AUTO_INCREMENT = 420004201;
ALTER TABLE transaction_tbl AUTO_INCREMENT = 420000420;
ALTER TABLE product_tbl AUTO_INCREMENT = 042000000;


INSERT IGNORE INTO customer_tbl
	(CustomerID,FirstName,LastName,Address,City,PostalCode,Province,Country,PhoneNumber,EmailAddress)
	VALUES
		(NULL,"Ruben","Loewen","8614 61 ave","Grande Prairie","t8w2x2","Alberta","Canada","7801234567","ruben_loewen@gmail.com"),
		(NULL,"Elmur","Fudd","123 Hick Road","Looney Toon","N1C3B8","British Columbia","Canada","2501234567","wabbitseason@toonmail.com");

INSERT IGNORE INTO product_tbl
	(ProductID,ProductName,ProductBrand,ProductPrice,Quantity,ActiveStatus)
	VALUES
		(NULL,"G10AJ","Asus",749.99,10,1),
		(NULL,"G11CD","Asus",1599.99,5,1),
		(NULL,"ROG G20AJ","Asus",1199.99,4,1);

INSERT IGNORE INTO desktop_tbl
	(ProductID,ProductType,OperatingSystem,CPU,GPU,Memory,StorageA,StorageB,OpticalDevice,USB,VideoOutputs)
	VALUES
		(042000000,"Desktop","Windows 8.1","4th generation i5 Processor","NVIDIA GeForce GTX760 2GB","8 GB DDR3 RAM","256 GB SSD",null,"Tray-in Supermulti DVD RW
","6 x USB3, 4 x USB2","1 x HDMI, 1 x VGA"),
		(042000001,"Desktop","Windows 10 Home","6th generation i7 Processor","NVIDIA GeForce GTX980 4GB","16 GB DDR3 RAM","256 GB SSD","2 TB HDD","Blu-ray Writer","2 x USB3.1,4 x USB3, 4 x USB2","1 x HDMI, 1 x VGA"),
		(042000002,"Desktop","Windows 8.1","4th generation i3 Processor","NVIDIA GeForce GTX760 2GB","8 GB DDR3 RAM","256 GB SSD",null,"Slimtray Blu-ray Combo ","4 x USB3, 4 x USB2","1 x HDMI");

INSERT IGNORE INTO tax_rates_tbl
	(Province,TaxRate)
	VALUES
		("Alberta", 0.0),
		("British Columbia",0.07),
		("Manitoba",0.08),
		("New Brunswick",0.08),
		("Newfoundland and Labrador",0.08),
		("Northwest Territories",0.0),
		("Nova Scotia",0.10),
		("Nunavut",0.0),
		("Ontario",0.08),
		("Prince Edward Island",0.09),
		("Quebec",0.0975),
		("Saskatchewan",0.05),
		("Yukon",0.0);
INSERT IGNORE INTO transaction_tbl
	(InvoiceNumber,CustomerID,SubTotal,TaxTotal,SaleTotal)
	VALUES
		(NULL,420004202,1599.99,80,1679.99);

INSERT IGNORE INTO product_sale_tbl
	(InvoiceNumber,ProductID,Quantity,SalePrice,UnitTotal)
	VALUES
		(420000420,042000001,1,1599.99,1599.99);


