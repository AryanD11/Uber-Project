SELECT * FROM uber_data_original;
SELECT * FROM uber_data_cleaned;
SELECT * FROM uber_data;

SQL Question-------------------------------------;

1.	Retrieve all bookings where the Booking Value is greater than ₹1000.;

SELECT * 
FROM uber_data
WHERE `Booking Value` > 1000;

CREATE VIEW Booking_Value_greater_than_₹1000 AS 
SELECT * 
FROM uber_data
WHERE `Booking Value` > 1000;

SELECT * FROM Booking_Value_greater_than_₹1000;


2.	Find the total number of bookings for each Vehicle Type.;

SELECT `Vehicle Type` , COUNT(`Booking ID`) As Total_num_of_Booking
FROM uber_data
GROUP BY `Vehicle Type`;

CREATE VIEW Total_number_of_bookings_for_each_Vehicle_Type AS
SELECT `Vehicle Type` , COUNT(`Booking ID`) As Total_num_of_Booking
FROM uber_data
GROUP BY `Vehicle Type`;

SELECT * FROM Total_number_of_bookings_for_each_Vehicle_Type;

3.	Get the number of successful rides that started and ended in the same location.;

SELECT *
FROM uber_data
WHERE `Booking Status` = 'Successful' 
AND `Pickup Location` = `Drop Location`;

CREATE VIEW Successful_rides_Ended_in_the_Same_Location AS
SELECT * FROM uber_data 
WHERE `Booking Status` = 'Successful' 
AND `Pickup Location` = `Drop Location`;

SELECT * FROM Successful_rides_Ended_in_the_Same_Location;

4.	List the top 10 customers with the highest average Booking Value.;

SELECT `Customer ID` , AVG(`Booking Value`) AS Avg_Booking_Value
FROM uber_data
GROUP BY `Customer ID`
ORDER BY Avg_Booking_Value DESC
LIMIT 10;

CREATE VIEW Top_10_Customer_With_Highest_Average_Booking_Value AS
SELECT `Customer ID` , AVG(`Booking Value`) AS Avg_Booking_Value
FROM uber_data
GROUP BY `Customer ID`
ORDER BY Avg_Booking_Value DESC
LIMIT 10;

SELECT * FROM Top_10_Customer_With_Highest_Average_Booking_Value;


5.	Retrieve the total number of bookings cancelled by customers on weekends.;

SELECT COUNT(`Booking ID`) 
FROM uber_data
WHERE `Booking Status` = 'Cancelled by Customer' AND 
DAYOFWEEK(`Date`) IN (1,7);

CREATE VIEW Total_bookings_Cancelled_by_customer_on_weekends AS 
SELECT COUNT(`Booking ID`) 
FROM uber_data
WHERE `Booking Status` = 'Cancelled by Customer' AND 
DAYOFWEEK(`Date`) IN (1,7);

SELECT * FROM Total_bookings_Cancelled_by_customer_on_weekends;


6.	Find the most frequently occurring cancellation reason by drivers.;

SELECT `Cancelled by Driver Reason`, COUNT(*) AS total_Cancellation
FROM uber_data
WHERE `Booking Status` = 'Cancelled by Driver'
GROUP BY `Cancelled by Driver Reason`
ORDER BY total_Cancellation DESC
LIMIT 1;

CREATE VIEW Most_frequently_occurring_cancellation_reason_by_drivers AS 
SELECT `Cancelled by Driver Reason`, COUNT(*) AS total_Cancellation
FROM uber_data
WHERE `Booking Status` = 'Cancelled by Driver'
GROUP BY `Cancelled by Driver Reason`
ORDER BY total_Cancellation DESC;

SELECT * FROM Most_frequently_occurring_cancellation_reason_by_drivers;


7.	Calculate the average Booking Value for Successful Rides.;

SELECT  AVG(`Booking Value`)
FROM uber_data
WHERE `Booking Status` = 'successful';

CREATE VIEW Average_Booking_Value_for_Successful_Rides AS 
SELECT  AVG(`Booking Value`)
FROM uber_data
WHERE `Booking Status` = 'successful';

SELECT * FROM Average_Booking_Value_for_Successful_Rides;


8.	What is the percentage of bookings made using each Payment Method out of all successful bookings?;

SELECT `Payment Method`, COUNT(*)  / (SELECT COUNT(*) FROM uber_data WHERE `Booking Status` = 'Successful') * 100 AS Percentage_Booking_Made
FROM uber_data
WHERE `Booking Status` = 'Successful'
GROUP BY `Payment Method`;

CREATE VIEW Percentage_of_booking_made_using_each_payment_method AS
SELECT `Payment Method`, COUNT(*)  / (SELECT COUNT(*) FROM uber_data WHERE `Booking Status` = 'Successful') * 100 AS Percentage_Booking_Made
FROM uber_data
WHERE `Booking Status` = 'Successful'
GROUP BY `Payment Method`;

SELECT * FROM Percentage_of_booking_made_using_each_payment_method;


9. Find rides longer than 20 km where Avg CTAT was below 5 minutes.;

SELECT * 
FROM uber_data
WHERE `Booking Status` = 'Successful'
AND `Ride Distance` > 20
AND `Avg CTAT` < 5;

CREATE VIEW Rides_longer_than_20km_where_AvgCTAT_was_below_5_minutes AS 
SELECT * 
FROM uber_data
WHERE `Booking Status` = 'Successful'
AND `Ride Distance` > 20
AND `Avg CTAT` < 5;

SELECT * FROM Rides_longer_than_20km_where_AvgCTAT_was_below_5_minutes;


10.	Find the Pickup Locations with the highest number of incomplete rides due to ‘Vehicle Breakdown’. ;


SELECT `Pickup Location`, COUNT(*) AS Incomplete_Rides
FROM uber_data
WHERE `Incomplete Ride Reason` = 'Vehicle Breakdown'
AND `Booking Status` = 'Incomplete'
GROUP BY `Pickup Location`
ORDER BY Incomplete_Rides DESC;

CREATE VIEW Incomplete_Ride_due_to_Vehicle_Breakdown AS 
SELECT `Pickup Location`, COUNT(*) AS Incomplete_Rides
FROM uber_data
WHERE `Incomplete Ride Reason` = 'Vehicle Breakdown'
AND `Booking Status` = 'Incomplete'
GROUP BY `Pickup Location`
ORDER BY Incomplete_Rides DESC;

SELECT * FROM Incomplete_Ride_due_to_Vehicle_Breakdown;


11.	Retrieve the earliest and latest Booking Date in the dataset.;

SELECT  MIN(`Date`) AS Earliest_Date, MAX(`Date`) AS Latest_Date
FROM uber_data;

CREATE VIEW Earliest_and_latest_Booking_Date AS 
SELECT  MIN(`Date`) AS Earliest_Date, MAX(`Date`) AS Latest_Date
FROM uber_data;

SELECT * FROM Earliest_and_latest_Booking_Date;

12.	Calculate the total Booking Value of successful rides grouped by month and Payment Method.;

SELECT date_format(`Date`, '%Y-%m') AS Month, `Payment Method`, SUM(`Booking Value`) AS Total_Booking_Value
FROM uber_data
WHERE `Booking Status` = 'Successful'
GROUP BY Month , `Payment Method`
ORDER BY Month DESC;

CREATE VIEW Booking_Value_Grouped_by_Month_and_Payment_Method AS 
SELECT date_format(`Date`, '%Y-%m') AS Month, `Payment Method`, SUM(`Booking Value`) AS Total_Booking_Value
FROM uber_data
WHERE `Booking Status` = 'Successful'
GROUP BY Month , `Payment Method`
ORDER BY Month DESC;

SELECT * FROM Booking_Value_Grouped_by_Month_and_Payment_Method;


13.	List the customers who have cancelled more than 3 rides.;

SELECT `Customer ID`, COUNT(*) AS Cancelled_Ride
FROM uber_data
WHERE `Booking Status` = 'Cancelled by Customer'
GROUP BY `Customer ID`
HAVING COUNT(*) >2
ORDER BY Cancelled_Ride DESC;

CREATE VIEW Customers_who_have_cancelled_more_than_3_rides AS 
SELECT `Customer ID`, COUNT(*) AS Cancelled_Ride
FROM uber_data
WHERE `Booking Status` = 'Cancelled by Customer'
GROUP BY `Customer ID`
HAVING COUNT(*) >2
ORDER BY Cancelled_Ride DESC;

SELECT * FROM Customers_who_have_cancelled_more_than_3_rides;

14.	Find the average VTAT and CTAT for each Vehicle Type on match days.;

SELECT `Vehicle Type`, AVG(`Avg VTAT`) AS Avg_VTAT, AVG(`Avg CTAT`) AS Avg_CTAT
FROM uber_data
WHERE `Booking Status` = 'Successful'
AND `Date` IN ( '2022-03-27',  '2022-05-15',  '2022-08-21',  '2023-03-19', '2023-06-11' ,'2023-10-22')
GROUP BY `Vehicle Type`;

CREATE VIEW Average_VTAT_and_CTAT_for_each_Vehicle_Type_on_match_days AS 
SELECT `Vehicle Type`, AVG(`Avg VTAT`) AS Avg_VTAT, AVG(`Avg CTAT`) AS Avg_CTAT
FROM uber_data
WHERE `Booking Status` = 'Successful'
AND `Date` IN ( '2022-03-27',  '2022-05-15',  '2022-08-21',  '2023-03-19', '2023-06-11' ,'2023-10-22')
GROUP BY `Vehicle Type`;

SELECT * FROM Average_VTAT_and_CTAT_for_each_Vehicle_Type_on_match_days;

15.	Get the Pickup and Drop combinations (route pairs) that have been used more than 30 times.; 

SELECT `Pickup Location` , `Drop Location`, COUNT(*) AS Total_Rides
FROM uber_data
WHERE `Booking Status` = 'Successful'
GROUP BY `Pickup Location` , `Drop Location`
HAVING COUNT(*) >= 30 
ORDER BY Total_Rides DESC;

CREATE VIEW Pickup_Drop_combinations_been_used_more_than_30_times AS 
SELECT `Pickup Location` , `Drop Location`, COUNT(*) AS Total_Rides
FROM uber_data
WHERE `Booking Status` = 'Successful'
GROUP BY `Pickup Location` , `Drop Location`
HAVING COUNT(*) >= 30 
ORDER BY Total_Rides DESC;

SELECT * FROM Pickup_Drop_combinations_been_used_more_than_30_times;

-----------------------------------------------------------------------------------------------------------------------------------------;











