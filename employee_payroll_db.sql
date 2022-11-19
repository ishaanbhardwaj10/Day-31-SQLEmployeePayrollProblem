-- UC-1
create database payroll_service;
select Name from sys.databases;
use payroll_service;


-- UC-2
create table employee_payroll
(
id int primary key identity,
name varchar(100) not null,
salary money not null,
start_date date
)


-- UC-3
insert into employee_payroll values
('Donna', 40000.0, '2018-04-10'),
('Alex', 25000.0, '2019-08-15'),
('John', 27000.0, '2020-02-19'),
('Michael', 22000.0, '2021-04-08')


-- UC-4
select * from employee_payroll;


-- UC-5
select salary from employee_payroll where name = 'Donna';
select name,salary from employee_payroll where start_date between '2019-01-01' and '2020-12-31';
select name,salary from employee_payroll where start_date between '2019-01-01' and GETDATE();


-- UC-6
alter table employee_payroll add gender char(1)
update employee_payroll set gender = 'M' where name = 'John' or name = 'Michael'
update employee_payroll set gender = 'F' where name = 'Donna' or name = 'Alex'


-- UC-7
select sum(salary) from employee_payroll where gender = 'F' group by gender;
select sum(salary) from employee_payroll where gender = 'M' group by gender;
select gender,sum(salary) from employee_payroll group by gender;

select avg(salary) from employee_payroll where gender = 'F' group by gender;
select avg(salary) from employee_payroll where gender = 'M' group by gender;
select gender,avg(salary) from employee_payroll group by gender;

select min(salary) from employee_payroll where gender = 'F' group by gender;
select min(salary) from employee_payroll where gender = 'M' group by gender;
select gender,min(salary) from employee_payroll group by gender;

select max(salary) from employee_payroll where gender = 'F' group by gender;
select max(salary) from employee_payroll where gender = 'M' group by gender;
select gender,max(salary) from employee_payroll group by gender;

select count(name) from employee_payroll where gender = 'F' group by gender;
select count(name) from employee_payroll where gender = 'M' group by gender;
select gender,count(name) from employee_payroll group by gender;


-- UC-8
alter table employee_payroll add phone_number varchar(250);
alter table employee_payroll add address varchar(250) not null default 'home';
alter table employee_payroll add department varchar(150) not null default 'IT';


-- UC-9
alter table employee_payroll add
basic_pay money,
deductions money,
taxable_pay money,
income_tax money,
net_pay money;


-- UC-10
insert into employee_payroll (name, salary, start_date, gender) values ('Terissa', 32000.0, '2020-05-12', 'F');
update employee_payroll set department = 'Sales' where name = 'Terissa'
insert into employee_payroll (name, salary, start_date, gender, department, basic_pay, deductions, taxable_pay, income_tax, net_pay) values ('Terissa', 32000.0, '2020-05-12', 'F', 'Marketing', 32000.0, 2000.0, 30000.0, 4000.0, 26000.0);
--we can observe, there are two rows for Terissa in the table. one for sales and other for marketing, causing redundancies





