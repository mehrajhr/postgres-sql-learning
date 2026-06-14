-- create database school;
-- create a table for teacheres
create table teachers (
  id serial primary key,
  userName varchar(50) not null,
  email varchar(100) not null,
  age smallint check (age >= 22),
  isActive boolean default true,
  unique (userName, email)
)
-- insert data into teachers table 
insert into
  teachers (userName, email, age)
values
  ('jamil', 'jamil@gmail.com', 24),
  ('Shazid', 'Shazid@gmail.com', 32)

-- get data from teacheres table 
select * from teachers;

-- delete table 

drop table if exists teachers;