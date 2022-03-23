-- create table Customer_table(
-- 	
-- )

/* Employee_Location Table */
-- create table employee_location (
-- 	loc_id int(4) primary key, 
--     location varchar(20)
-- )


/* Medicine_Table */
-- create table Medicine_Table(
-- 	
--     medicine_id int(4) primary key,
--     medicine varchar(20),
--     unit_price int(5)
-- 	
-- )

/* Employee_details */
-- create table Employee_Details_Table(
-- 	
--     emp_id int(4) primary key, 
--     current_place varchar(30),
--     salary int(7),
--     joining date

-- )

/* Employee_Log_Table */
-- create table Employee_Log_Table(
-- 	
--     emp_id int(4) primary key,
--     in_Time int(3),
--     out_Time int(3)
-- 	
-- )

/* Employee_Table */
-- create table Employee_Table(
-- 	emp_id int(4) primary key, emp_name varchar(20), loc_id int(4),
--     foreign key (loc_id) references Employee_Location(loc_id)
-- )

/* Customer Table */
create table Customer_Table(

	custo_id int(4) primary key,
    custo_name varchar(20),
    medicine_id int(4),
    quantity int(2),
    loc_id int(4),
    foreign key (medicine_id) references Medicine_Table(medicine_id),
    foreign key (loc_id) references employee_location(loc_id)

)