


CREATE TABLE IF NOT EXISTS customer_tbl{
	CustomerID INT(9) UNSIGNED AUTO_INCREMENT,
	FirstName varchar(40) NOT NULL,
	LastName varchar(40) NOT NULL,
	Address varchar(255) NOT NULL,
	City varchar(255) NOT NULL,
	PostalCode varchar(6) NOT NULL,
	Province varchar(40) NOT NULL,
	Country varchar(40) NOT NULL,
	PhoneNumber INT(10),
	EmailAddress varchar(255),
	PRIMARY KEY (CustomerID), 
};

CREATE TABLE IF NOT EXISTS product_tbl{
	ProductID INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
	ProductName varchar(255) NOT NULL,
	ProductBrand varchar(255) NOT NULL,
	ProductPrice DECIMAL(10,2) NOT NULL,
	Quantity INT(6) UNSIGNED NOT NULL,
	ActiveStatus TINYINT(1) DEFAULT 1,
	PRIMARY KEY (ProductID),

};

CREATE TABLE IF NOT EXISTS desktop_tbl{
	ProductID ProductID INT(9) UNSIGNED NOT NULL,
	ProductType varchar(255) NOT NULL,
	OperatingSystem varchar(40) NOT NULL,
	CPU varchar(40) NOT NULL,
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
		ON DELETE CASCADE ON UPDATE CASCADE,
};


CREATE TABLE IF NOT EXISTS laptop_tbl{
	ProductID INT(9) UNSIGNED NOT NULL,
	ProductType varchar(255) NOT NULL,
	OperatingSystem varchar(40) NOT NULL,
	ScreenSize FLOAT(3,1) NOT NULL,
	TouchScreen TINYINT(1) NOT NULL DEFAULT 0,
	CPU varchar(40) NOT NULL,
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
		ON DELETE CASCADE ON UPDATE CASCADE,
};


CREATE TABLE IF NOT EXISTS transaction_tbl{
	InvoiceNumber INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
	CustomerID INT(9) UNSIGNED NOT NULL,
	SubTotal DECIMAL(10,2) NOT NULL,
	SaleTime TIMESTAMP(),
	TaxTotal DECIMAL(10,2) NOT NULL,
	SaleTotal DECIMAL(10,2) NOT NULL,

	PRIMARY KEY (InvoiceNumber),
	FOREIGN KEY (CustomerID)
		REFERENCES customer_tbl(CustomerID)
		ON DELETE NO ACTION ON UPDATE CASCADE,

};

CREATE TABLE IF NOT EXISTS product_sale_tbl{
	InvoiceNumber INT(9) UNSIGNED NOT NULL,
	ProductID INT(9) UNSIGNED NOT NULL,
	Quantity INT NOT NULL,
	ProductPrice DECIMAL(10,2) NOT NULL,
	UnitTotal DECIMAL(10,2) NOT NULL,

	PRIMARY KEY(InvoiceNumber, ProductID),
	FOREIGN KEY (InvoiceNumber) REFERENCES transaction_tbl(InvoiceNumber)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (ProductID) REFERENCES product_tbl(ProductID)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (ProductPrice) REFERENCES product_tbl(ProductPrice)
		ON DELETE NO ACTION,


}

CREATE TABLE IF NOT EXISTS tax_rates_tbl{
	Province varchar(40) NOT NULL,
	TaxRate FLOAT(3,2) NOT NULL,

	PRIMARY KEY (Province),
};

INSERT INTO customer_tbl
	(FirstName,LastName,Address,City,PostalCode,Province,Country,PhoneNumber,EmailAddress)
	VALUES
		("Ruben","Loewen","8614 61 ave","Grande Prairie","t8w2x2","Alberta","Canada",7809334670,"ruben_loewen@gmail.com"),
		("Elmur","Fudd","123 Hick Road","Looney Toon","N1C3B8","British Columbia","Canada",2501234567,"wabbitseason@toonmail.com");

INSERT INTO product_tbl
	(ProductName,ProductBrand,ProductPrice,Quantity,ActiveStatus)
	VALUES
		("G10AJ","Asus","")