SELECT * FROM uber_data_original;
SELECT * FROM uber_data;

--------------------------------------------------------Converting Data Types-----------------------------------------------------------;
-----------------------DATE----------------------------------------------;
SELECT `Date`,
str_to_date(`Date`, '%Y-%m-%d')
FROM uber_data;

UPDATE uber_data
SET `Date` = str_to_date(`Date`, '%Y-%m-%d');

ALTER TABLE uber_data
MODIFY COLUMN `Date` date;

---------------------------Time-----------------------------------------------------;

SELECT `Time`,
str_to_date(`TIME`, '%H:%i')
FROM uber_data;

UPDATE uber_data
SET `Time` = str_to_date(`TIME`, '%H:%i');

ALTER TABLE uber_data
MODIFY COLUMN `Time` TIME;

------------------------------Booking ID-------------------------------------------------------------;

SELECT * FROM uber_data;

ALTER TABLE uber_data
MODIFY COLUMN `Booking ID` VARCHAR(12);

ALTER TABLE uber_data
MODIFY COLUMN `Booking Status` VARCHAR(25);

ALTER TABLE uber_data
MODIFY COLUMN `Booking Status` ENUM('Successful', 'Incomplete', 'Cancelled by Customer', 'Cancelled by Driver');

ALTER TABLE uber_data
MODIFY COLUMN `Customer ID` VARCHAR(10);

ALTER TABLE uber_data
MODIFY COLUMN `Vehicle Type` ENUM('Premier', 'Uber Go', 'Courier Delivery', 'Auto', 'UberXL', 'Moto');

ALTER TABLE uber_data
MODIFY COLUMN `Pickup Location` VARCHAR(50);

ALTER TABLE uber_data
MODIFY COLUMN `Drop Location` VARCHAR(50);

ALTER TABLE uber_data
MODIFY COLUMN `Booking Value` DECIMAL(10,1);

ALTER TABLE uber_data
MODIFY COLUMN `Payment Method` ENUM('Cash', 'UPI', 'Credit Card', 'Debit Card', 'Uber Wallet', 'Moto');

ALTER TABLE uber_data
MODIFY COLUMN `Ride Distance` DECIMAL(10,1);

ALTER TABLE uber_data
MODIFY COLUMN `Driver Ratings` DECIMAL(5,1);

ALTER TABLE uber_data
MODIFY COLUMN `Customer Rating` DECIMAL(5,1);

SELECT * FROM uber_data;

