create database ecom_seller_data;
use ecom_seller_data;
create table seller (
seller_id varchar(50) primary key,
seller_name varchar (50),
region varchar (50),
start_date date ,
email varchar (50)
);

create table order_details(
order_id varchar(50) primary key,
seller_id varchar(50),
order_date date ,
total_amount decimal(10,2),
foreign key (seller_id) references seller(seller_id)
);

create table inventory(
inventory_id varchar(50) primary key,
product_id varchar(50),
seller_id varchar(50),
stock_level int,
foreign key (seller_id) references seller(seller_id)
);

create table customer_feedback(
feedback_id varchar(50) primary key,
order_id varchar(50),
seller_id varchar(50),
ratings int,
feedback_date datetime,
foreign key(order_id) references order_details(order_id),
foreign key(seller_id) references seller(seller_id)
);

create table audits(
audit_id varchar(50) primary key,
seller_id varchar(50),
audit_date datetime ,
complaince_score int,
foreign key (seller_id) references seller(seller_id)
);