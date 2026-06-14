create table students (
  id serial primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  age int,
  grade char(2),
  course varchar(50),
  email varchar(100) unique,
  dob date,
  blood_group varchar(5),
  country varchar(50)
)
insert into
  students (
    first_name,
    last_name,
    age,
    grade,
    course,
    email,
    dob,
    blood_group,
    country
  )
values
  (
    'Mehraj',
    'Hasan',
    22,
    'A+',
    'Computer Science',
    'mehrajhasan@gmail.com',
    '2004-06-14',
    'A+',
    'Bangladesh'
  ),
  (
    'Rahim',
    'Ahmed',
    21,
    'A',
    'Mathematics',
    'rahim.a@gmail.com',
    '2005-02-10',
    'B+',
    'Bangladesh'
  ),
  (
    'Sarah',
    'Khan',
    20,
    'A-',
    'Physics',
    'sarah.khan@yahoo.com',
    '2006-03-22',
    'O+',
    'Bangladesh'
  ),
  (
    'John',
    'Doe',
    23,
    'B+',
    'Economics',
    'john.doe@gmail.com',
    '2003-08-15',
    'A-',
    'USA'
  ),
  (
    'Alice',
    'Smith',
    22,
    'A',
    'Biology',
    'alice.smith@outlook.com',
    '2004-11-05',
    'AB+',
    'Canada'
  ),
  (
    'David',
    'Miller',
    21,
    'B',
    'Chemistry',
    'dmiller@gmail.com',
    '2005-01-30',
    'O-',
    'UK'
  ),
  (
    'Fatima',
    'Zahra',
    20,
    'A+',
    'Computer Science',
    'fatima.z@gmail.com',
    '2006-05-12',
    'B-',
    'Bangladesh'
  ),
  (
    'Michael',
    'Brown',
    24,
    'A-',
    'Statistics',
    'mbrown@live.com',
    '2002-09-18',
    'A+',
    'Australia'
  ),
  (
    'Emily',
    'Davis',
    21,
    'B+',
    'Psychology',
    'emily.davis@gmail.com',
    '2005-07-25',
    'O+',
    'Germany'
  ),
  (
    'Omar',
    'Faruk',
    22,
    'A',
    'Engineering',
    'omar.faruk@gmail.com',
    '2004-04-19',
    'AB-',
    'Bangladesh'
  ),
  (
    'Jessica',
    'Wilson',
    23,
    'A',
    'Sociology',
    'j.wilson@hotmail.com',
    '2003-12-01',
    'A-',
    'UK'
  ),
  (
    'Tanvir',
    'Islam',
    21,
    'A+',
    'Computer Science',
    'tanvir.isl@gmail.com',
    '2005-06-08',
    'O+',
    'Bangladesh'
  ),
  (
    'Chloe',
    'Martin',
    22,
    'B',
    'History',
    'chloe.m@gmail.com',
    '2004-02-14',
    'B+',
    'France'
  ),
  (
    'Robert',
    'Garcia',
    24,
    'A-',
    'Philosophy',
    'r.garcia@gmail.com',
    '2002-10-30',
    'A+',
    'Spain'
  ),
  (
    'Sofia',
    'Rodriguez',
    20,
    'A',
    'Mathematics',
    'sofia.rod@yahoo.com',
    '2006-08-25',
    'O-',
    'Mexico'
  );

-- select 
select
  *
from
  students;

select
  first_name,
  age,
  course,
  email
from
  students;

-- column alias
select
  first_name as "First Name",
  age as userAge,
  email as "Email"
from
  students;

-- sorting
select
  *
from
  students
order by
  age desc;

select
  *
from
  students
order by
  age asc;

select
  *
from
  students
order by
  grade desc;

-- distinct -- means unique
select distinct
  country
from
  students;

select distinct
  blood_group
from
  students;

-- filtering using where 
select
  *
from
  students
where
  country = 'Bangladesh';

select
  first_name as "Name",
  grade as "Grade",
  course as "Program",
  country as "Country"
from
  students
where
  country = 'Bangladesh';

-- filtering with and , or operation
-- filter all students whose country bangladesh or usa and their grade A+
select
  first_name,
  grade,
  age,
  country
from
  students
where
  (
    country = 'Bangladesh'
    or country = 'USA'
  )
  and grade = 'A+';


-- comparison operator

select * from students where age < 22;
select * from students where age > 22;
select * from students where age <= 22;
select * from students where age = 22;

-- not equl operator != which also write as <>
select * from students where country <> 'Bangladesh';

-- between 
select * from students where age between 21 and 23;
select * from students where age between 21 and 23 order by age asc;

-- in
select * from students where country in ('UK', 'USA', 'Germany');
select * from students where course in ('Physics', 'Economics', 'Chemistry');

-- like and ilike
-- select students whose name starts with A
select * from students 
where first_name like 'A%';
-- select students whose name ends with a 
select * from students
where last_name like '%a';
-- select students whose name ends with a_ means last 2nd word must a
select * from students
where last_name like '%a_';

-- like case sensitive if want to case insensitive then use ilike
select * from students 
where first_name ilike 'a%';

-- not opertor
-- select students who from outside of bangladesh
select * from students
where not country = 'Bangladesh';

-- scaler functions (upper , lower , concat , length)
select upper(first_name) as "First Name" from students;
select lower(first_name) as "firstName" from students;
select concat(first_name ,' ', last_name) as fullName from students;

-- aggregate functions (avg , max , min , count , sum)
select avg(age) from students;
select max(age) from students;
select min(age) from students;
select sum(age) from students;
select count(*) from students;