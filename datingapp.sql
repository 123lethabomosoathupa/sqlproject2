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

drop my_contact cascade;

insert into my_contact(last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
values ('Walker', 'Johnny', '0810911348', 'jwalker@gmail.com', 'Male', '1996-07-06', 5, 4, 2),
('Johanes', 'Jamey', '0673211354', 'msam@gmail.com', 'Female', '2001-03-12', 2, 4, 1);

select my_contact.last_name, my_contact.first_name, my_contact.prof_id, profession.prof_id, profession.profession_name

from my_contact
left join profession
on my_contact.prof_id = profession.prof_id;

select my_contact.contact_id, my_contact.last_name, my_contact.first_name, my_contact.prof_id, profession.prof_id, profession.profession_name, my_contact.contact_id, contact_interests.contact_id, contact_interests.interest_id, interests.interest_id, interests.interest, contact_seeking.contact_id, contact_seeking.seeking_id, seeking.seeking_id, seeking.seeking_status 

from my_contact
left join profession
on my_contact.prof_id = profession.prof_id
left join contact_interests
on my_contact.contact_id = contact_interests.contact_id
left join interests
on contact_interests.interest_id = interests.interest_id
left join contact_seeking
on my_contact.contact_id = contact_seeking.contact_id
left join seeking
on contact_seeking.seeking_id = seeking.seeking_id;

create table profession(
prof_id bigserial constraint prof_key unique,
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

insert into contact_seeking(contact_id, seeking_id)
values (1, 2),
		(2, 3),
		(3, 2),
		(4, 2),
		(5, 3),
		(6, 1),
		(7, 1),
		(8, 2),
		(9, 1),
		(10, 3),
		(11, 2),
		(12, 1),
		(13, 2),
		(14, 3),
		(15, 2);

create table contact_interests(

interest_id integer references interests(interest_id),
contact_id integer references my_contact(contact_id)
	
);

insert into contact_interests(contact_id, interest_id)
values (1, 1),
	(2, 3),
	(3, 4),
	(4, 7),
	(5, 7),
	(6, 6),
	(7, 2 ),
	(8, 3),
	(9, 4),
	(10, 7),
	(11, 7),
	(12, 6),
	(13, 7),
	(14, 7),
	(15, 6);
	

