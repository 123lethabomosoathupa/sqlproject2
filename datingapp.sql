create table my_contact(
contact_id bigserial constraint contact_key primary key,
last_name varchar(100),
first_name varchar(100),
phone varchar(10),
email varchar(100),
gender varchar(10),
birthday date,
prof_id integer references profession (prof_id),
zip_code integer references zipcode (zip_code),
status_id integer references status (status_id)


);

select * from my_contact;

insert into my_contact(last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
values ('van den Heever', 'Dyllan', '0678940134', 'dvanheever@gmail.com', 'Male', '2000-09-05', 4, 3, 3);


create table profession(
prof_id bigserial constraint prof_key primary key,
profession_name varchar(50)

);

insert into profession(profession_name)
values('Unemployed'),
	('High School'),
	('University'),
	('Bachelors'),
	('Masters');
	
select * from profession;

drop table profession;
create table zipcode(
	
zip_code bigserial constraint zip_key Primary Key,
city varchar(50),
province varchar(30)

);

insert into zipcode(city, province)
values('Johannesburg', 'Gauteng'),
	('Pretoria', 'Gauteng'),
	('Cape Town', 'Western Cape'),
	('Stellenbosh', 'Western Cape'),
	('Durban', 'KZN'),
	('Richards Bay', 'KZN'),
	('East London', 'Eastern Cape'),
	('Port Elizabeth', 'Eastern Cape'),
	('Bloemfontein', 'Free State'),
	('Phuthaditjhaba', 'Free State'),
	('Rustenburg', 'North West'),
	('Sun City', 'North West'),
	('Polokwane', 'Limpopo'),
	('Marble Hall', 'Limpopo'),
	('Kimberley', 'Northern Cape'),
	('Upington', 'Northern Cape'),
	('Middelburg', 'Mpumalanga'),
	('Nelspruit', 'Mpumalanga');

select * from zipcode;
drop table zipcode;

create table status(
	
status_id bigserial constraint status_key primary key,
status varchar(15)
);

insert into status(status)
values ('Single'),
	('Married'),
	('complicated');

select * from status;

drop table status;
create table seeking(
seeking_id bigserial constraint seeking_key primary key,
seeking_status varchar(10)
);

insert into seeking(seeking_status)
values ('Male'),
		('Female'),
		('Both');

select * from seeking;
drop table seeking;
create table interests(
interest_id bigserial constraint interest_key primary key,
interest varchar(50)
);

insert into interests(interest)
values ('Nature'),
	('Movies'),
	('Music'),
	('Gaming'),
	('Travelling'),
	('Cars'),
	('Fishing'),
	('Sports'),
	('Partying');

select * from interests;

drop table interests;

create table contact_seeking(

seeking_id integer references seeking(seeking_id),
contact_id integer references my_contact(contact_id)
	
);

create table contact_interests(

interest_id integer references interests(interest_id),
contact_id integer references my_contact(contact_id)
	
);

