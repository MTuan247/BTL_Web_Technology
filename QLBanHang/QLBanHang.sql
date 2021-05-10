Create database QLBanHang;

use QLBanHang

--------------------create table-----------------

Create Table Product(
	PRODUCT_ID INT NOT NULL PRIMARY KEY,
	NAME NVARCHAR(100),
	IMAGE NVARCHAR(100),
	PRICE FLOAT,
	SALE FLOAT,
	DESCRIPTION NVARCHAR(100),
	CATEGORY_ID INT,
	AVAILABLE INT,
	FOREIGN KEY (CATEGORY_ID) REFERENCES Category(CATEGORY_ID),
);

Create Table Account(
	USER_ID INT NOT NULL PRIMARY KEY,
	NAME NVARCHAR(100),
	USER_NAME NVARCHAR(30),
	PASSWORD NVARCHAR(30),
	IS_ADMIN BIT,
);

Create Table Cart(
	USER_ID INT,
	PRODUCT_ID INT,
	PRIMARY KEY(USER_ID,PRODUCT_ID),
	FOREIGN KEY (USER_ID) REFERENCES Account(USER_ID),
	FOREIGN KEY (PRODUCT_ID) REFERENCES Product(PRODUCT_ID),
);

Create Table Category(
	CATEGORY_ID INT PRIMARY KEY,
	NAME NVARCHAR(50),
);

--------------insert to account-------------

INSERT INTO Account(USER_ID,USER_NAME,NAME,PASSWORD)
VALUES (1,'tuan','tuan','123');

--------------insert to product-------------
INSERT INTO Product(PRODUCT_ID,NAME,IMAGE,DESCRIPTION,PRICE,SALE,CATEGORY_ID,AVAILABLE)
VALUES (1,'Product 1','https://sieutonghop.com/wp-content/uploads/2020/07/products.jpg','DESCRIPTION',100,0.9,1,200),
(2,'Product 2','https://sieutonghop.com/wp-content/uploads/2020/07/products.jpg','DESCRIPTION',90,1,2,100),
(3,'Product 3','https://sieutonghop.com/wp-content/uploads/2020/07/products.jpg','DESCRIPTION',80,0.8,3,95),
(4,'Product 4','https://sieutonghop.com/wp-content/uploads/2020/07/products.jpg','DESCRIPTION',75,1,2,300),
(5,'Product 5','https://sieutonghop.com/wp-content/uploads/2020/07/products.jpg','DESCRIPTION',86.5,1,5,295);

--------------insert to category-------------
INSERT INTO Category(CATEGORY_ID,NAME)
VALUES (1,'Category 1'),
(2,'Category 2'),
(3,'Category 3'),
(4,'Category 4'),
(5,'Category 5');

-----------------test------------------------

Select * from Cart,Product
where Cart.PRODUCT_ID = Product.PRODUCT_ID

Select * from Cart,Product where Cart.PRODUCT_ID = Product.PRODUCT_ID and USER_ID = 1

Delete From Cart Where USER_ID = 1 AND PRODUCT_ID = 1

Select * from Product where NAME like '%1%'