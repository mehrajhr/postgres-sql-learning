-- null operator
select
  *
from
  students
where
  email is null;

select
  *
from
  students
where
  email is not null;

-- coalesce 
select
  coalesce(email, 'Not provided') as email,
  first_name,
  age
from
  students;

select
  coalesce(null, null, 2, 3);

--answer is 2 because first not null value
-- pagination , limit , offset 
select
  *
from
  students
limit
  5;

select
  *
from
  students
limit
  5
offset
  2;

select
  *
from
  students
limit
  5
offset
  5 * 0;

select
  *
from
  students
limit
  5
offset
  5 * 1;

select
  *
from
  students
limit
  5
offset
  5 * 2;

-- update table 
update students
set
  email = 'sofia@gmail.com'
where
  id = 15;

update students
set
  age = 23,
  grade = 'A'
where
  id in (2, 3);

update students
set
  last_name = 'Riaj'
where
  id = 1;

-- delete data
delete from students
where
  age < 21;

select
  *
from
  students
  -- group by 
select
  country,
  count(*)
from
  students
group by
  country;

select
  grade,
  count(*)
from
  students
group by
  grade;

select
  course,
  count(*)
from
  students
group by
  course;

select
  country,
  avg(age)
from
  students
group by
  country;

-- group by with having
select
  country,
  avg(age)
from
  students
group by
  country
having
  avg(age) > 22;

select
  country,
  count(*)
from
  students
group by
  country
having
  count(*) > 1;

-- foreign key 
create table users (
  user_id serial primary key,
  user_name varchar(25) not null
)
create table posts (
  id serial primary key,
  post text not null,
  user_id int references users (user_id)
)
insert into
  users (user_name)
values
  ('Mehraj'),
  ('Akash'),
  ('Karim'),
  ('Selim'),
  ('Hasnat'),
  ('Fahad');

insert into
  posts (post, user_id)
values
  ('hello ki obosta shobar', 2),
  ('Akashe batashe chol dhire dhire', 3),
  (
    'prem tumi ashbe evabe abar harie jabe vabi ni',
    2
  ),
  ('Kutai acho sei poth shudu nei tumi', 1),
  ('Ahare ahare kutai pabo tahare', 5),
  ('Cholo harie jai akasher oi nil e tumi ar ami', 4),
  (
    'Shei tumi kivabe eto ochena hole , ami tomar opekkhai',
    3
  );

insert into
  posts (post)
values
  ('Kire 7up');

-- inner join
select
  post,
  user_name
from
  posts as p
  inner join users as u on p.user_id = u.user_id;

select
  id,
  post,
  user_name,
  u.user_id
from
  posts as p
  inner join users as u on p.user_id = u.user_id;

-- left join
select
  *
from
  posts as p
  left join users as u on p.user_id = u.user_id;

-- right join
select
  *
from
  posts as p
  right join users as u on p.user_id = u.user_id;

-- full join
select
  *
from
  posts as p
  full join users as u on u.user_id = p.user_id;

-- cros and natural join
create table employee (emp_id int, name varchar(25), dept_id int)
create table department (dept_id int, department_name varchar(50))
insert into
  employee (emp_id, name, dept_id)
values
  (1, 'Mehraj', 101),
  (2, 'Akib', 102);

insert into
  department (dept_id, department_name)
values
  (101, 'Human resource'),(102, 'Software engineering');

-- cros join
select * from employee cross join department;
-- natural join
select * from employee natural joi