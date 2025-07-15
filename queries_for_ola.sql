create database ola_db;
use ola_db;

#1  retrive all succesful bookings

create  view successful_booking 
as
select * from bookings
where booking_status='success';

select * from successful_booking;

#2 find average ride distance for each vehicle type 
	
    
	create view ride_distance_for_each_vehicle as
    select vehicle_type,avg(ride_distance)
    as avg_distance from bookings
    group by vehicle_type;
     
     
     select * from ride_distance_for_each_vehicle ;
     
     select * from bookings;
     
#3 total number of canceled rides by customers;

create view canceled_rides_by_customers
as
select count(*) from bookings 
where booking_status='canceled by customer' ;


select * from canceled_rides_by_customers;


#4 top 5 customers who booked the highest number of rides;

create view top_5_customers
as
select customer_id,count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc limit 5;

select * from top_5_customers;

#5 get the number of canceled rides by driver due to personal and car-related issue 

create view canceled_rides_by_driver_p_is
as
select count(*) from bookings
where canceled_rides_by_driver='Personal & car related issue';




select * from  canceled_rides_by_driver_p_is;

#6 find maximum and min 	driver rating  for prime sedan booking

create view max_min_driver_rating as
select max(driver_ratings) as  max_rating ,
min(driver_ratings) as min_rating
from bookings where vehicle_type='prime sedan';


#7 retrive all rides where payment was mad by upi
create view upi_payment as
select * from bookings
where payment_method='upi';

select * from upi_payment;

#8 find the average customer rating par vehicle type
create view avg_customer_rating as
select vehicle_type,avg(customer_rating) as avg_customer_rating
from bookings
group by vehicle_type;

#9 calculate the total booking value of rides completed successfully 

create view  total_successful_rides as
select sum(booking_value)as  total_successful_value
from bookings
where booking_status='success'

#10 list incomplete rides along with the reasons


select * from bookings;


create view incompete_rides_reasons as
select booking_id,incomplete_rides_reason
 from bookings
 where incomplete_rides='yes';
 
 
 
 