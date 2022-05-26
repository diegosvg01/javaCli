sudo docker exec -it ContainerBD bash

mysql -u root -p

create database 4four;

use 4four;

create table dbo_measurement(
id_measurement int primary key auto_increment,
measurement_usage double,
temperature double,
measurement_date datetime,
usage_unit varchar(20),
temperature_unit varchar(20),
fk_component int
)auto_increment = 100;
