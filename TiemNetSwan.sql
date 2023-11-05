CREATE DATABASE quanlytiemnet
go
USE quanlytiemnet

CREATE TABLE customer (
  Customer_id INT NOT NULL PRIMARY KEY,
  name NVARCHAR(45) NULL,
  address NVARCHAR(45) NULL,
  birthday DATE NULL
);
go
CREATE TABLE contact_info (
  Contact_id INT NOT NULL PRIMARY KEY,
  Customer_id INT NULL,
  phone NVARCHAR(45) NULL,
  email NVARCHAR(45) NULL,
  FOREIGN KEY (Customer_id) REFERENCES customer(Customer_id)
);

go
CREATE TABLE account (
  Account_id INT NOT NULL PRIMARY KEY,
  username NVARCHAR(45) NULL,
  password NVARCHAR(45) NULL,
  customer_id INT NOT NULL,
  balance BIGINT NULL,
  total_money_spent BIGINT NULL,
  status NVARCHAR(45) NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(Customer_id)
);

go


CREATE TABLE normal_account (
  Account_id INT NOT NULL UNIQUE,
  username NVARCHAR(45) NULL,
  password NVARCHAR(45) NULL,
  customer_id INT NULL,
  balance BIGINT NULL,
  total_money_spent BIGINT NULL,
  status NVARCHAR(45) NULL,
  PRIMARY KEY(Account_id),
  FOREIGN KEY (Account_id) REFERENCES account(Account_id)
);

go

CREATE TABLE vip_account (
  Account_id INT NOT NULL UNIQUE,
  username NVARCHAR(45) NULL,
  password NVARCHAR(45) NULL,
  customer_id NVARCHAR(45) NULL,
  balance BIGINT NULL,
  total_money_spent BIGINT NULL, 
  discount NVARCHAR(45) NULL,
  status NVARCHAR(45) NULL,
  PRIMARY KEY(Account_id),
  FOREIGN KEY (Account_id) REFERENCES account(Account_id)
);


go
CREATE TABLE combo (
  Combo_id INT NOT NULL PRIMARY KEY,
  name NVARCHAR(45) NULL,
  price INT NULL
);
go

CREATE TABLE computer (
  Computer_id INT NOT NULL PRIMARY KEY,
  config NVARCHAR(255) NULL,
  ip NVARCHAR(45) NULL,
  status NVARCHAR(45) NULL
);
go

CREATE TABLE account_computer_history (
  Access_id INT NOT NULL PRIMARY KEY,
  Account_id INT NOT NULL,
  Computer_id INT NOT NULL,
  Combo_id INT NOT NULL,
  start_time DATETIME NULL,
  end_time DATETIME NULL,
  status NVARCHAR(45) NULL,
  FOREIGN KEY (Account_id) REFERENCES account(Account_id),
  FOREIGN KEY (Combo_id) REFERENCES combo(Combo_id),
  FOREIGN KEY (Computer_id) REFERENCES computer(Computer_id)
);


go

CREATE TABLE web (
  Web_id INT NOT NULL PRIMARY KEY,
  Web_name NVARCHAR(45) NULL
);
go
CREATE TABLE web_access_history (
  WebAccess_id INT NOT NULL PRIMARY KEY,
  Access_id INT NULL,
  Web_id INT NULL,
  start_time DATETIME NULL,
  end_time DATETIME NULL,
  FOREIGN KEY (Access_id) REFERENCES account_computer_history(Access_id),
  FOREIGN KEY (Web_id) REFERENCES web(Web_id)
);

go


--Add data to table
INSERT INTO customer (Customer_id, name, address, birthday)
VALUES 
  (1, 'Phúc', 'Hà Đông', '2002-02-12'),
  (2, 'Nam', 'Cầu Diễn', '2001-05-24'),
  (3, 'Dương', 'Cầu Giấy', '2004-11-21'),
  (4, 'Nghĩa', 'Thanh Xuân', '2003-09-04');
go
--
INSERT INTO contact_info (Contact_id, Customer_id, phone, email)
VALUES 
  (1, 1, '0904738183', 'phuc@gmail.com'),
  (2, 2, '0372847182', 'nam@gmail.com'),
  (3, 2, '0946838223', 'nam@gmail.com'),
  (4, 3, '0988482123', 'duong@gmail.com'),
  (5, 4, '0372884999', 'nghia@gmail.com');
go
--
-- Chèn dữ liệu vào bảng account
INSERT INTO account (Account_id, username, password, customer_id, balance, total_money_spent, status)
VALUES (1, 'phuc3', '3827', 1, 12000, 387000, 'Online'),
       (2, 'phuc1', '4821', 1, 20000, 102040, 'Offline'),
       (3, 'namz', '9482', 2, 50000, 1040300, 'Offline'),
       (4, 'duong34', '8291', 3, 5000, 14900, 'Online'),
       (5, 'nghia96', '0492', 4, 23000, 69300, 'Offline');

go
INSERT INTO normal_account (Account_id, username, password, customer_id, balance, total_money_spent, status)
VALUES 
  (2, 'phuc1', '4821', 1, 20000, 102040, 'Offline'),
  (4, 'duong34', '8291', 3, 5000, 14900, 'Online'),
  (5, 'nghia96', '0492', 4, 23000, 69300, 'Offline');

go
--
INSERT INTO vip_account (Account_id, username, password, customer_id, balance, total_money_spent, discount, status)
VALUES 
  (1, 'phuc3', '3827', '1', 12000, 387000, '30%', 'Online'),
  (3, 'namz', '9482', '2', 50000, 1040300, '30%', 'Offline');
go
--
INSERT INTO account_computer_history (Access_id, Account_id, Computer_id, Combo_id, start_time, end_time, status)
VALUES 
  (1, 4, 2, 2, '2023-09-17 15:10:00', '2023-09-17 16:10:00', 'complete'),
  (2, 1, 5, 1, '2023-09-17 23:00:00', '2023-09-18 07:00:00', 'complete'),
  (3, 3, 1, 1, '2023-09-18 23:00:00', '2023-09-19 07:00:00', 'complete'),
  (4, 5, 3, 1, '2023-09-19 06:00:00', '2023-09-19 12:00:00', 'compelte'), 
  (5, 3, 1, 2, '2023-09-20 06:00:00', '2023-09-20 12:00:00', 'complete'),
  (6, 2, 4, 3, '2023-09-20 07:00:00', '2023-09-20 08:00:00', 'complete'),
  (7, 3, 2, 1, '2023-09-20 23:00:00', '2023-09-21 07:00:00', 'complete'),
  (8, 1, 3, 2, '2023-09-21 12:00:00', '2023-09-21 19:00:00', 'pending'),
  (9, 4, 1, 2, '2023-09-21 14:00:00', '2023-09-21 18:00:00', 'pending');

go

--
INSERT INTO combo (Combo_id, name, price)
VALUES 
  (1, '23h-7h', 24000),
  (2, 'tính theo giờ', 10000),
  (3, '6h-12h', 30000);
go
--
INSERT INTO computer (Computer_id, config, ip, status)
VALUES 
  (1, 'Core I5 12400F|Ram 16G| GTX 1660 Super 6G| SSD 240G', '192.168.2.3', 'Active'),
  (2, 'Core I3 9100F| Ram 8G| RX 580 8G| SSD 256G', '192.168.8.4', 'Inactive'),
  (3, 'Core I5 10400F| GTX 1660 Super 6G| Ram 8G| SSD 240G', '192.168.2.1', 'Active'),
  (4, 'Dual Xeon E5 2676 V3 | RAM 64G | RX 580 8G | NVME 500G', '192.168.9.0', 'Inactive'),
  (5, 'Xeon E5 2676 V3 | RAM 64G | GT 1030 4G | NVME 500G', '192.168.0.1', 'Inactive');
go
--
INSERT INTO web (Web_id, Web_name)
VALUES 
  (1, 'facebook.com'),
  (2, 'google.com'),
  (3, 'youtube.com'),
  (4, 'code.ptit.edu.vn'),
  (5, 'qldt.ptit.edu.vn'),
  (6, 'github.com');

go
--
INSERT INTO web_access_history (WebAccess_id, Access_id, Web_id, start_time, end_time)
VALUES 
  (1, 1, 1, '2023-09-17 15:20:00', '2023-09-17 15:30:00'),
  (2, 2, 6, '2023-09-17 23:01:00', '2023-09-18 3:08:00'),
  (3, 2, 3, '2023-09-17 23:01:00', '2023-09-18 1:01:00'),
  (4, 4, 2, '2023-09-19 06:05:00', '2023-09-19 07:00:00'),
  (5, 7, 4, '2023-09-20 23:01:00', '2023-09-21 01:00:00'),
  (6, 3, 1, '2023-09-20 07:20:00', '2023-09-20 11:30:00'),
  (7, 5, 6, '2023-09-20 06:01:00', '2023-09-20 09:08:00'),
  (8, 6, 3, '2023-09-20 07:00:00', '2023-09-20 08:00:00'),
  (9, 5, 2, '2023-09-20 09:30:00', '2023-09-19 10:00:00'),
  (10, 8, 2, '2023-09-21 12:05:00', '2023-09-21 17:00:00'),
  (11, 9, 4, '2023-09-21 15:01:00', '2023-09-21 17:00:00');


