sudo docker exec -it ContainerBD bash

mysql -u root -p

create database 4four;

use 4four;


---TABELA PARA AS MEDIÇÕES

create table dbo_measurement(
id_measurement int primary key auto_increment,
measurement_usage double,
temperature double,
measurement_date datetime,
usage_unit varchar(20),
temperature_unit varchar(20),
fk_component int
)auto_increment = 100;


---TABELA PARA OS SERVIDORES

 create table dbo_server (
 id_server int auto_increment, 
 server_name varchar(100), 
 operational_system varchar(100), 
 ip varchar(100), 
 location varchar(100), 
 fk_client int, 
 primary key (id_server));


---TABELA PARA OS COMPONENTES

create table dbo_component (
id_component int, 
item varchar(200), 
size bigint, 
speed float, 
fk_server int, 
constraint fk_server foreign key (fk_server) references dbo_server (id_server), 
temperature float, 
UUID varchar(200), 
primary key (id_component));
