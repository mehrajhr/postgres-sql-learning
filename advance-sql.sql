create table employees (
  id serial primary key,
  name varchar(50) not null,
  department varchar(50) not null,
  salary int
)
INSERT INTO
  employees (name, department, salary)
VALUES
  ('Alice Johnson', 'Engineering', 85000),
  ('Bob Smith', 'Marketing', 62000),
  ('Charlie Davis', 'Engineering', 92000),
  ('Diana Prince', 'Human Resources', 58000),
  ('Edward Norton', 'Sales', 65000),
  ('Fiona Gallagher', 'Engineering', 78000),
  ('George Miller', 'Marketing', 61000),
  ('Hannah Abbott', 'Sales', 59000),
  ('Ian Wright', 'Engineering', 95000),
  ('Jane Doe', 'Human Resources', 60000);

select
  *
from
  employees
  -- subquery 
  -- find who get the max salary
select
  *
from
  employees
where
  salary = (
    select
      max(salary)
    from
      employees
  )
  -- find employee who get more then average salary
select
  *
from
  employees
where
  salary > (
    select
      avg(salary)
    from
      employees
  )
  -- name of the employee who gets the highest salry in hr department
select
  name
from
  employees
where
  salary = (
    select
      max(salary)
    from
      employees
    where
      department = 'Human Resources'
  )
  -- function
create function count_employee () returns int language sql as $$
  select count(*) from employees 
$$
select
  count_employee ()
create function delete_employee (emp_id int) returns void language sql as $$
  delete from employees where id=emp_id
$$
select
  delete_employee (5)
  
  -- procedure 
create procedure delete_employee_byId (emp_id int) language plpgsql as $$
  begin
  delete from employees where id = emp_id;
  end;
$$

call delete_employee_byId(6);


-- increase low salary in Engineering department whose salary lower then average in Engineering
create procedure increase_low_salary(department_name varchar(50))
language plpgsql
as
$$
  declare
  avg_salary int;
  begin
  select avg(salary) into avg_salary from employees where department = department_name;
  update employees set salary = salary*1.1 where department = department_name and salary < avg_salary;
  end;
$$

call increase_low_salary('Engineering')


-- trigger
create table action_logs(
  id serial primary key ,
  emp_name varchar(100),
  action varchar(25),
  action_time timestamp default now()
)

create trigger save_employee_delete_logs
after delete
on employees
for each row
execute function log_employee_deletion()

drop trigger save_employee_delete_logs on employees

create function log_employee_deletion()
returns trigger
language plpgsql
as
$$
begin
  insert into action_logs (emp_name , action) values (old.name , 'delete');
  return old;
  end;
$$

drop function log_employee_deletion()

select
  delete_employee (8)

select * from action_logs


-- indexing

create index idx_email
on students(email)

