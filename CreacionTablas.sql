use stock_of_equipments

Create table profile(
profile_id varchar(50) not null primary key,
profile_name varchar (100) not null,
profile_email varchar (100) not null,
profile_condition varchar (50) not null,
profile_type varchar (15) not null,
profile_status varchar (10) not null
);

create table seat_university(
seat_university_id int identity(1,1) not null primary key,
seat_university_name varchar(50) not null
);

create table schedule(
schedule_id int identity(1,1) not null primary key,
schedule_name varchar(50) not null
);

Create table class(
class_id varchar (50) not null primary key,
class_name varchar (100) not null
);

Create table device(
device_id varchar (50) not null primary key,
device_name  varchar (100) not null,
device_category  varchar (100) not null,
device_quantity int not null,
device_available int not null,
device_status varchar (10) not null,
seat_university_id int not null foreign key references seat_university(seat_university_id)
);

Create table assignment(
assignment_id int identity(1,1) not null primary key,
class_id varchar(50) not null foreign key references class(class_id),
schedule_id int not null foreign key references schedule(schedule_id),
seat_university_id int not null foreign key references seat_university(seat_university_id),
profile_id varchar(50) not null foreign key references profile(profile_id)
)

Create table reserve(
reserve_id int identity(1,1) not null primary key,
reserve_date varchar(10) not null,
reserve_hour varchar(10) not null,
assigment_id int not null foreign key references assignment(assignment_id)
);

Create table reserve_detail(
reserve_detail_id int identity(1,1) not null primary key,
reserve_id int not null foreign key references reserve(reserve_id),
device_id varchar(50) not null foreign key references device(device_id),
reserve_quantity int not null,
assigment_id int not null foreign key references assignment(assignment_id),
reserve_detail_status varchar(10) not null
);

Create table wait_list(
wait_list_id int identity(1,1) not null primary key,
reserve_id int not null foreign key references reserve(reserve_id),
device_id varchar(50) not null foreign key references device(device_id),
reserve_quantity int not null,
assigment_id int not null foreign key references assignment(assignment_id),
wait_list_status varchar(10) not null
);