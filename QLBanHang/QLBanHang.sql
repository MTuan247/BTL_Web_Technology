Create database QLBanHang;

use QLBanHang

--------------------create table-----------------
Create Table Category(
	CATEGORY_ID INT PRIMARY KEY,
	NAME NVARCHAR(50),
);

Create Table Product(
	PRODUCT_ID INT NOT NULL PRIMARY KEY,
	NAME NVARCHAR(200),
	IMAGE NVARCHAR(500),
	PRICE FLOAT,
	SALE FLOAT,
	DESCRIPTION NVARCHAR(500),
	CATEGORY_ID INT,
	AVAILABLE INT,
	FOREIGN KEY (CATEGORY_ID) REFERENCES Category(CATEGORY_ID),
);

Create Table Account(
	USER_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NAME NVARCHAR(100),
	USER_NAME NVARCHAR(30),
	PASSWORD NVARCHAR(30),
	IS_ADMIN BIT,
);

Create Table Cart(
	USER_ID INT,
	PRODUCT_ID INT,
	NUMBER INT,
	PRIMARY KEY(USER_ID,PRODUCT_ID),
	FOREIGN KEY (USER_ID) REFERENCES Account(USER_ID),
	FOREIGN KEY (PRODUCT_ID) REFERENCES Product(PRODUCT_ID),
);

drop table order_detail;
CREATE TABLE order_detail (
  ORDER_ID int NOT NULL identity(1,1),
  NAME nvarchar(200) DEFAULT NULL,
  PHONE_NUMBER varchar(12) DEFAULT NULL,
  ADDRESS nvarchar(200),
  TOTAL_MONEY float,
  USER_ID int,
  STATUS smallint DEFAULT '0',
  Foreign key (USER_ID) references Account(USER_ID),
  PRIMARY KEY (ORDER_ID)
)



CREATE TABLE order_product (
  ORDER_PRODUCT_ID int NOT NULL IDENTITY(1,1),
  ORDER_ID int,
  PRODUCT_ID int,
  NUMBER int,
  PRIMARY KEY (ORDER_PRODUCT_ID),
  Foreign key (order_id) references order_detail(order_id),
  Foreign key (product_id) references product(product_id)
)





--

--------------insert to account-------------

INSERT INTO Account(USER_ID,USER_NAME,NAME,PASSWORD,IS_ADMIN)
VALUES (1,'tuan','tuan','123',0);

--------------insert to category-------------

INSERT INTO Category(CATEGORY_ID,NAME)
VALUES (1,N'Laptop'),
(2,N'Điện thoại'),
(3,N'Tablet'),
(4,N'Smart Watch');

--------------insert to product-------------

INSERT INTO Product(PRODUCT_ID,NAME,IMAGE,DESCRIPTION,PRICE,SALE,CATEGORY_ID,AVAILABLE)
VALUES 
(1,N'Laptop HP 340s G7 i3 1005G1/4GB/256GB/Win10 (240Q4PA)','https://cdn.tgdd.vn/Products/Images/44/237630/hp-340s-g7-i3-240q4pa-13-600x600.jpg',N'Laptop HP có thiết kế trang nhã, thanh lịch nhưng không kém phần sang trọng, được phủ một lớp màu bạc bóng bẩy cùng những hoạ tiết phây xước giúp bảo vệ máy khỏi các tác động vật lí, đảm bảo tính thẩm mĩ cao dù được làm bằng nhựa. Với trọng lượng chỉ 1.38 kg và độ dày 17.9 mm, HP 340s G7 tự tin đồng hành cùng bạn trẻ trên mọi hành trình.',12590000,0.9,1,200),
(2,N'Laptop Lenovo IdeaPad Slim 3 15IIL05 i3 1005G1/4GB/512GB/Win10 (81WE0132VN)','https://cdn.tgdd.vn/Products/Images/44/236315/lenovo-ideapad-slim-3-15iil05-i3-81we0132vn-600x600.jpg',N'Laptop Lenovo IdeaPad Slim 3 15IIL05 i3 (81WE0132VN) là một chiếc laptop học tập văn phòng có thiết kế đẹp mắt, phong cách năng động. Không chỉ vượt trội về thiết kế mà hiệu năng cực kỳ ổn định với chip Intel Core i3 giúp bạn hoàn thành công việc nhanh chóng.',12990000,1,1,100),
(3,N'Laptop Lenovo ThinkBook 15IIL i3 1005G1/4GB/512GB/Win10 (20SM00D9VN)','https://cdn.tgdd.vn/Products/Images/44/230161/lenovo-thinkbook-15iil-i3-20sm00d9vn-021320-101327-600x600.jpg',N'Laptop Lenovo ThinkBook 15IIL i3 (20SM00D9VN) sở hữu thiết kế từ kim loại toát lên vẻ sang trọng, sắc sảo, cấu hình lí tưởng cho học tập, trình duyệt web khi trang bị bộ vi xử lý Intel thế hệ thứ 10 mới và ổ cứng SSD cực nhanh.',19990000,0.8,1,95),
(4,N'Laptop Acer Aspire 7 A715 42G R4ST R5 5500U/8GB/256GB/4GB GTX1650/Win10 (NH.QAYSV.004)','https://cdn.tgdd.vn/Products/Images/44/235405/acer-aspire-7-a715-42g-r4st-r5-nhqaysv004-16-600x600.jpg',N'Laptop Acer Aspire 7 A715 42G R4ST R5 (NH.QAYSV.004) có thiết kế đơn giản, trang nhã nhưng trang bị cấu hình mạnh mẽ đáp ứng nhu cầu đồ hoạ, kỹ thuật chuyên nghiệp và chiến game mượt mà.',7500000,1,1,300),
(5,N'Laptop Acer Nitro 5 AN515 45 R3SM R5 5600H/8GB/512GB/4GB GTX1650/144Hz/Balo/Win10 (NH.QBMSV.005)','https://cdn.tgdd.vn/Products/Images/44/237636/acer-nitro-5-an515-45-r3sm-r5-nhqbmsv005-600x600.jpg',N'Laptop Acer Nitro 5 AN515 45 R3SM R5 (NH.QBMSV.005) có vẻ ngoài hình hầm hố đặc trưng của dòng laptop gaming, cấu hình mạnh mẽ chạy mượt các tựa game được các game thủ ưa thích với con chip AMD Ryzen 5 và card đồ họa NVIDIA GeForce GTX 1650 4GB.',23490000,1,1,295),
(6,N'Điện thoại Samsung Galaxy S21 5G','https://cdn.tgdd.vn/Products/Images/42/220833/samsung-galaxy-s21-tim-600x600.jpg',N'Galaxy S21 5G nằm trong series S21 đến từ Samsung nổi bật với thiết kế tràn viền, cụm camera ấn tượng cho đến hiệu năng mạnh mẽ hàng đầu.',23490000,1,2,295),
(7,N'Điện thoại iPhone 12 64GB','https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-violet-1-600x600.jpg',N'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB.',23490000,1,2,295),
(8,N'Điện thoại Xiaomi Redmi Note 10 (6GB/128GB)','https://cdn.tgdd.vn/Products/Images/42/222758/xiaomi-redmi-note-10-thumb-green-600x600.jpg','Xiaomi đã trình làng chiếc điện thoại mang tên gọi là Xiaomi Redmi Note 10 với điểm nhấn chính là cụm 4 camera 48 MP, chip rồng Snapdragon 678 mạnh mẽ cùng nhiều nâng cấp như dung lượng pin 5.000 mAh và hỗ trợ sạc nhanh 33 W tiện lợi.',23490000,1,2,295),
(9,N'Điện thoại OPPO A93','https://cdn.tgdd.vn/Products/Images/42/229056/oppo-a93-trang-14-600x600.jpg',N'OPPO đã tung ra OPPO A93 dòng sản phẩm thuộc phân khúc điện thoại tầm trung được xem là tiếp nối từ OPPO A92 với nhiều điểm được nâng cấp như hiệu năng, hệ thống camera cùng khả năng sạc nhanh 18 W.',23490000,1,2,295),
(10,N'Điện thoại Samsung Galaxy A02','https://cdn.tgdd.vn/Products/Images/42/228999/samsung-galaxy-a02-xanhduong-600x600-600x600.jpg',N'Samsung bổ sung thêm tùy chọn smartphone trong phân khúc giá rẻ mang tên Galaxy A02, máy trang bị một cấu hình ổn định cùng mức pin khủng 5000 mAh cho thời lượng vượt trội trong tầm giá mang đến bạn nhiều trải nghiệm thú vị hơn.',23490000,1,2,295),
(11,N'Máy tính bảng Samsung Galaxy Tab S7','https://cdn.tgdd.vn/Products/Images/522/225031/samsung-galaxy-tab-s7-gold-new-600x600.jpg',N'Samsung Galaxy Tab S7 chiếc máy tính bảng có thiết kế tuyệt đẹp, màn hình 120 Hz siêu mượt, camera kép ấn tượng, bút S Pen cùng một hiệu năng mạnh mẽ thuộc top đầu thị trường máy tính bảng Android.',23490000,1,3,295),
(12,N'Máy tính bảng Huawei MatePad T10s (Nền tảng Huawei Mobile Service)','https://cdn.tgdd.vn/Products/Images/522/233257/huawei-t10s-600x600-600x600.jpg',N'Chiếc máy tính bảng của Huawei, Huawei MatePad T10s cũng đã chính thức được chào sân. Với vi xử lý 8 nhân mở ra một thế giới giải trí mượt mà, sống động từng khoảnh khắc với màn hình cực lớn, hé lộ một chiếc máy tính bảng tốt trong tầm giá mà bất kỳ ai cũng đều yêu thích.',23490000,1,3,295),
(13,N'Máy tính bảng Samsung Galaxy Tab A7 (2020)','https://cdn.tgdd.vn/Products/Images/522/228144/samsung-galaxy-tab-a7-2020-vangdong-600x600.jpg',N'Samsung Galaxy Tab A7 (2020) là một chiếc máy tính bảng có thiết kế đẹp, cấu hình khá, nhiều tính năng tiện ích, một công cụ đắc lực hỗ trợ bạn trong công việc cũng như trong học tập hay giải trí.',23490000,1,3,295),
(14,N'Máy tính bảng Lenovo Tab M10 - FHD Plus','https://cdn.tgdd.vn/Products/Images/522/235365/tab-m10-fhd-plus-600-600x600.jpg',N'Từ việc sử dụng các thiết bị điện tử đa dạng của các gia đình hiện nay, Lenovo đã nắm bắt được nhu cầu thiết yếu này và cho ra mắt chiếc máy tính bảng Lenovo Tab M10 - FHD Plus với những tính năng tiện ích ấn tượng, “khoác chiếc áo” của thời đại và có mức giá siêu ưu đãi.',23490000,1,3,295),
(15,N'Máy tính bảng iPad Air 4 Wifi 64GB (2020)','https://cdn.tgdd.vn/Products/Images/522/228808/ipad-air-4-wifi-64gb-2020-xanhduong-600x600-600x600.jpg',N'Apple đã trình làng máy tính bảng iPad Air 4 Wifi 64 GB (2020). Đây là thiết bị đầu tiên của hãng được trang bị chip A14 Bionic - chip di động mạnh nhất của Apple (năm 2020). Và có màn lột xác nhờ thiết kế được thừa hưởng từ iPad Pro với viền màn hình mỏng bo cong quanh máy.',23490000,1,3,295),
(16,N'Đồng hồ định vị trẻ em 4G Kidcare S8 Đen','https://cdn.tgdd.vn/Products/Images/7077/236906/kidcare-s8-den-thumb-fix-600x600.jpg',N'Kiểu dáng độc lạ, cá tính',23490000,1,4,295),
(17,N'Đồng hồ định vị trẻ em 4G Kidcare S6 Hồng','https://cdn.tgdd.vn/Products/Images/7077/236901/kidcare-s6-hong-thumb-fix-600x600.jpg',N'Thiết kế năng động, màu hồng dễ thương thích hợp với các bé gái',23490000,1,4,295),
(18,N'Samsung Galaxy Watch 3 LTE 41mm viền thép dây da','https://cdn.tgdd.vn/Products/Images/7077/226477/samsung-galaxy-watch-3-lte-41mm-thum-600x600.jpg',N'Sự thoải mái của bạn là cảm hứng thiết kế',23490000,1,4,295),
(19,N'Apple Watch S6 LTE 40mm viền nhôm dây cao su xanh','https://cdn.tgdd.vn/Products/Images/7077/229033/apple-watch-s6-lte-40mm-vien-nhom-day-cao-su-1-1-600x600.jpg',N'Kiểu dáng năng động, cá tính',23490000,1,4,295),
(20,N'Vòng đeo tay thông minh Mi Band 6','https://cdn.tgdd.vn/Products/Images/7077/236733/mi-band-6-thumb-fix-600x600.jpg',N'Kiểu dáng gọn nhẹ, năng động',23490000,1,4,295);



-----------------test------------------------
