/*
Problem Statement →
A travel company TravelOnTheGo maintains the record of passengers and price to travel 
between two cities, for bus type (Sitting and Sleeper).
*/

/*
1) You are required to create two tables PASSENGER and PRICE with the following 
attributes and properties 
PASSENGER
(Passenger_name varchar 
 Category varchar
 Gender varchar
 Boarding_City varchar
 Destination_City varchar
 Distance int
 Bus_Type varchar
);
PRICE
(
 Bus_Type varchar
 Distance int
 Price int
 )
*/
#---------------------------------------------------------------------------
Create Database TravelOnTheGo ;
use TravelOnTheGo;  


create table if not exists `PASSENGER`
(Passenger_name varchar(30),
 Category varchar(30),
 Gender varchar(30),
 Boarding_City varchar(30),
 Destination_City varchar(30),
 Distance int,
 Bus_Type varchar(30)
);

create table if not exists 
PRICE (
 Bus_Type varchar(30),
 Distance int,
 Price int
 );
#----------------------------------------------------------------------- 

/*
2) Insert the following data in the tables
 
Passenger_nam Category Gender Boarding_City Destination_City Distance Bus_Type
Sejal AC F Bengaluru Chennai 350 Sleeper
Anmol Non-AC M Mumbai Hyderabad 700 Sitting
Pallavi AC F Panaji Bengaluru 600 Sleeper
Khusboo AC F Chennai Mumbai 1500 Sleeper
Udit Non-AC M Trivandrum panaji 1000 Sleeper
Ankur AC M Nagpur Hyderabad 500 Sitting
Hemant Non-AC M panaji Mumbai 700 Sleeper
Manish Non-AC M Hyderabad Bengaluru 500 Sitting
Piyush AC M Pune Nagpur 700 Sitting
Bus_Type Distance Price
Sleeper 350 770
Sleeper 500 1100
Sleeper 600 1320
Sleeper 700 1540
Sleeper 1000 2200
Sleeper 1200 2640
Sleeper 350 434
Sitting 500 620
Sitting 500 620
Sitting 600 744
Sitting 700 868
Sitting 1000 1240
Sitting 1200 1488
Sitting 1500 1860
*/

#------------------------------------------------------------------------------------------
insert into `PASSENGER` values("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
insert into `PASSENGER` values("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
insert into `PASSENGER` values("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
insert into `PASSENGER` values("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
insert into `PASSENGER` values("Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper");
insert into `PASSENGER` values("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
insert into `PASSENGER` values("Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper");
insert into `PASSENGER` values("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
insert into `PASSENGER` values("Piyush","AC","M","Pune","Nagpur",700,"Sitting");

INSERT INTO `PRICE` VALUES("Sleeper",350,770);
INSERT INTO `PRICE` VALUES("Sleeper",500,1100);
INSERT INTO `PRICE` VALUES("Sleeper",600,1320);
INSERT INTO `PRICE` VALUES("Sleeper",700,1540);
INSERT INTO `PRICE` VALUES("Sleeper",1000,2200);
INSERT INTO `PRICE` VALUES("Sleeper",1200,2640);
INSERT INTO `PRICE` VALUES("Sleeper",350,434);
INSERT INTO `PRICE` VALUES("Sitting",500,620);
INSERT INTO `PRICE` VALUES("Sitting",500,620);
INSERT INTO `PRICE` VALUES("Sitting",600,744);
INSERT INTO `PRICE` VALUES("Sitting",700,868);
INSERT INTO `PRICE` VALUES("Sitting",1000,1240);
INSERT INTO `PRICE` VALUES("Sitting",1200,1488);
INSERT INTO `PRICE` VALUES("Sitting",1500,1860);
#----------------------------------------------------------------------

/*
Write queries for the following:
3) How many females and how many male passengers travelled for a minimum distance of 
600 KM s?
*/
select gender,count(distance) as passenger_count from
 passenger p  where distance>600 group by gender;
 
 
/*
4) Find the minimum ticket price for Sleeper Bus.
*/  
 select bus_type,min(price) from Price where bus_type="Sleeper";
 
 /*
5) Select passenger names whose names start with character 'S'
*/ 
 select passenger_name from passenger where passenger_name like 'S%';
 
 /*
6) Calculate price charged for each passenger displaying Passenger name, Boarding City, 
Destination City, Bus_Type, Price in the output
*/ 
 select distinct pa.passenger_name,pa.boarding_city,pa.destination_city,pa.bus_type, pr.price from passenger pa  join price pr 
 on pa.distance=pr.distance where pa.bus_type=pr.bus_type;
 
 /*
7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a 
distance of 1000 KM s
*/
 select pa.passenger_name,pr.price from passenger pa join price pr on pa.bus_type=pr.bus_type
 where pa.distance>1000 and pr.bus_type="Sitting";
 
 /*
8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to 
Panaji?
*/ 
select Bus_type,Price from price where distance=(select distance from passenger where passenger_name="Pallavi") 
group by bus_type;

/*
9) List the distances from the "Passenger" table which are unique (non-repeated 
distances) in descending order.
*/
 select distinct distance from passenger order by distance desc;
 
 /*
10) Display the passenger name and percentage of distance travelled by that passenger 
from the total distance travelled by all passengers without using user variables
*/
 select passenger_name,distance/(select sum(distance) from passenger)*100 as percentage_travelled from passenger;
 
 /*
11) Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise
*/ 
 select pr.distance,pr.price,
 case
 when pr.price>1000 then 'Expensive'
 when pr.price>500 and pr.price<=1000 then 'Average'
 else 'Cheap'
 end as Verdict
 from price pr ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 