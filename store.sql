#DDL - CREATE
create database store;
create table countries(
code int primary key,
name varchar(20) unique,
continent_name varchar(20) not null
);
create table users(
id int primary key,
full_name varchar(20),
email varchar(20) unique,
gender char(1) check (gender='M' or gender='F'),
date_of_birth varchar(15),
created_at datetime,
country_code int,
foreign key(country_code) references countries(code)
);
create table orders(
id int primary key,
user_id int,
foreign key (user_id) references user(id),
status varchar(15) check (status='start' or status='finish'),
created_at datetime
);
create table order_products(
order_id int ,
product_id varchar(20),
quantity int default 0,
primary key (order_id, product_id),
foreign key (order_id) references orders(id),
foreign key (product_id) references products(id)
);
create table products(
id int primary key,
name varchar(10) not null,
price int default 0,
status varchar(10) check(status='valid' or status='expired'),
created_at datetime 
);

#DML - Insert 
insert into countries values(1,'Saudi Arabia','Asia');
insert into users values(1,'Ghadeer','ghad@mail.com','F','1996-09-28','2022-04-17',966);
insert into orders values(1,454,'start','2022-04-17 02:00:00');
insert into products values(1,'makeup',500,'expired','2022-04-17 02:17:00');
insert into order_products values(120,220,1);

#DML - Update 
update countries set name='KSA' where code='1';
#DML - Delete 
delete from products where id='1';

#DDL - Alter 
alter table users modify column created_at datetime default current_timestamp;
alter table orders modify column created_at datetime default current_timestamp;
alter table products modify column created_at datetime default current_timestamp;