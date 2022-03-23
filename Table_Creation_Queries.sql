/* Done */
# Department Table
-- create table Department_Table (
-- 	dept_id int(4) primary key,
-- 	dept_name varchar(20)
-- )

# Insurance Table
-- create table Insurance_Table (
-- 	insurance_id int(4) primary key, 
-- 	insurance_name varchar(20)
-- )

# Office Table
-- create table Office_Table(
-- 	office_id int(4) primary key, 
-- 	office_name varchar(20), 
-- 	place varchar(20)
-- )

# Employee Office Table
-- create table Employee_Office_Table(
-- 	id int(4) primary key, 
--     emp_id int(4),
--     office_id int(4),
--     foreign key (emp_id) references Employee_Table(emp_id),
--     foreign key (office_id) references Office_Table(office_id)
-- )

# Employee Info Table
-- create table Employee_Info_Table(
-- 	id int(4) primary key, 
-- 	DOJ date, 
-- 	salary int(10)
-- )

# Employee Table
-- create table Employee_Table(
-- 	emp_id int(4) primary key, 
-- 	emp_name varchar(20), 
-- 	immediate_head_id int(4),
--     insurance_id int(4),
--     employee_info_id int(4),
--     dept_id int(4),
-- 	foreign key (insurance_id) references Insurance_Table(insurance_id),   
-- 	foreign key (employee_info_id) references Employee_Info_Table(id),
-- 	foreign key (dept_id) references Department_Table(dept_id)
-- );
