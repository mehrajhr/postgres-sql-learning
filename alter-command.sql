create table employe (id serial, name varchar(50), age int);

-- rename table with alter 
alter table employe
rename to employee;

-- add new column using alter
alter table employee
add column email varchar(100);

-- drop column from table using alter
alter table employee
drop column email;

-- rename a column using alter
alter table employee
rename column name to user_name;

-- change type of column 
alter table employee
alter column user_name type varchar(100);

-- add constraints
alter table employee
alter column email
set not null;

-- drop constraints
alter table employee
alter column email
drop not null;

-- set default value
alter table employee
alter column email
set default 'testemail@gmail.com';

-- drop default values
alter table employee
  alter column email drop default;



-- add constraints (table level constraints)
alter table employee
add constraint unique_employee_email unique(email);

insert into employee(user_name , age , email)
values('akash',32, 'akash@gamil.com');

alter table employee 
add constraint pk_employee_id primary key(id);