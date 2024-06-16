#---1. create a database called 'assignment' (Note please do the assignment tasks in this database)
create database assignment;
drop database assignment;
create database assignment;
use assignment;
#---2. Create the tables from ConsolidatedTables.sql and enter the records as specified in it.
#---3.Create a table called countries with the following columns
#name, population, capital 
create table countries (name varchar(20),population int,capital varchar(30));
drop table countries;
create table countries (name varchar(20),population int,capital varchar(30));
insert into countries values ('China',1382,'Beijing'),
('India',1326,'Delhi'),('United_states',324,'Washington_d.c'),('Indoneshia',260,'Jakarta'),
('Brazil',209,'Brassila'),('Pakistan',193,'Islamabad'),('Nigeria',187,'Abuja'),
('Bangladesh',163,'Dhaka'),('Russia',143,'Moscow'),('Mexico',128,'Mexico City'),('Japan',126,'Tokyo'),
('Philippines',102,'Manila'),('Ethiopia',101,'Addis Ababa'),('Vietnam',94,'Hanoi'),
('Egypt',93,'Cairo'),('Germany',81,'Berlin'),('Iran',80,'Tehran'),('Turkey',79,'Ankara'),
('Congo',79,'Kinshasa'),('France',64,'Paris'),('United Kingdom',65,'London'),('Italy',60,'Rome'),
('South Africa',55,'Pretoria'),('Myanmar',54,'Naypyidaw');

#####Add a couple of countries of your choice
insert into  countries values ('New Caledonia',94,'Noumea'),('Fiji',93,'Suva'),
('Gambia',73,'Banjul'),('Vanuata',51,'Port Villa');
select * from countries;

###Change ‘Delhi' to ‘New Delhi'
update countries set capital='New_Delhi' where population= 1326;

######Rename the table countries to big_countries.
rename table countries to Big_countries;

#####Create the following tables. Use auto increment wherever applicable
create table product(product_id int primary key, product_name varchar(255) not null unique, description text);
drop table product;
create table suppliers(supplier_id int primary key, supplier_name varchar(30), location text);
create table stock(
id int primary key, 
product_id int,
balance_stock int,
foreign key (product_id) references product(product_id));
####Enter some records into the three tables
insert into product values(101,'furniture','commercial and residential furniture'),
(102,'food','packaged food'),(103,'goods','like food and beverages');
insert into suppliers values(1,'Allen','Mumbai'),(2,'Alex','Pune'),(3,'Tanu','Delhi');
insert into stock values(10,'101','20000'),(20,'102','30000'),(30,'103','40000');
#####Modify the supplier table to make supplier name unique and not null.
ALTER TABLE Suppliers MODIFY COLUMN supplier_name VARCHAR(255) NOT NULL UNIQUE;
ALTER TABLE stock ADD COLUMN deptno INT;
#########Modify the emp table as follows
UPDATE stock
SET deptno = 
    CASE 
        WHEN id % 2 = 0 THEN 20
        WHEN id % 3 = 0 THEN 30
        WHEN id % 4 = 0 THEN 40
        WHEN id % 5 = 0 THEN 50
        ELSE 10
    END;
    #######Create a unique index on the emp_id column.
CREATE UNIQUE INDEX id_unique_index
ON stock (id);
##########Create a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.
create table emp_sal(emp_no int, first_name varchar(10),last_name varchar(10),salary int);
drop table emp_sal;
insert into emp_sal values(1,'Prajakta','shelke',20000),(2,'nikita','jadhav',30000),(3,'aarti','joshi',50000);
######Create a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.
SELECT emp_no, first_name, last_name, salary from emp_sal
ORDER BY salary DESC;



