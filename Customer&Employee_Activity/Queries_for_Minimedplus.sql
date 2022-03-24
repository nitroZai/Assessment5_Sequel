# 1. Display the customers name who bought medicines from ameerpet as well as display the medicine
# & the employee associated
select c.custo_name, m.medicine, e.emp_name from customer_table c
join medicine_table m on c.medicine_id = m.medicine_id
join employee_table e on e.loc_id = c.loc_id;
 
# 2. Display all the details of the employee with log details
select * from employee_table e
join employee_details_table ed on ed.emp_id = e.emp_id
join employee_log_table el on el.emp_id = e.emp_id;

# 3.Display the 3nd highest salaried employee in MiniMedplus whose location is Madhapur
select * from employee_table e
join employee_details_table ed on ed.emp_id = e.emp_id
join employee_location_table el on el.loc_id = e.loc_id
where 3-2 > (select count(salary) 
	from employee_details_table ed1 where ed.salary > ed1.salary);

# 4. Display the employees who are on leave which also need to include the location details
select * from employee_table e
join employee_details_table ed on e.emp_id = ed.emp_id
join employee_location_table el on el.loc_id = e.loc_id
join employee_log_table elog on e.emp_id = elog.emp_id
where elog.in_Time is null;

# 5. Display the total cost of the customer medicines
select 
	c.custo_name, 
	m.medicine,
	c.quantity, 
    m.unit_price, 
    (m.unit_price * c.quantity) as 'Total Cost'
from customer_table c
join medicine_table m on m.medicine_id = c.medicine_id;