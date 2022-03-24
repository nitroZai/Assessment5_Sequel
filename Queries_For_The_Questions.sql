-- 1. Get the list of employee details which should include their name,department and 
--     name of the insurance type 

select e.emp_name, d.dept_name, i.insurance_name from employee_table e
join insurance_table i using (insurance_id)
join department_table d using (dept_id);

-- 2.Get the list of departments of employees working at particular place(e.gMadhapur)
select e.emp_name, d.dept_name, o.place from employee_table e
join department_table d using (dept_id)
join employee_office_table eo using (emp_id)
join office_table o on o.office_id = eo.office_id
where o.place = 'Madhapur';

-- 3.Get the count of employees working in each location
select o.place, count(*) from employee_table e
join employee_office_table eo using (emp_id)
join office_table o on o.office_id = eo.office_id
group by o.place order by o.place desc LIMIT 1;

-- 4.Get the third highest salaried employee name, insurance name and salary(Joins)
# Creating a table and Finding Minimum
create table thirdHighest
select e.emp_name, i.insurance_name, ei.salary from employee_table e
join employee_info_table ei on ei.id = e.employee_info_id
join insurance_table i using(insurance_id)
order by salary desc LIMIT 3;
# Select Query for the newly created Table
select emp_name, insurance_name, salary from thirdhighest order by salary asc LIMIT 1;

# Comparision using Implicit Join
select emp_name, salary, insurance_name 
from 
	(select e.emp_name, ei.salary, i.insurance_name 
		from employee_table e, employee_info_table ei, insurance_table i
			where e.employee_info_id = ei.id and i.insurance_id = e.insurance_id and 3 - 1= 
			(select count(distinct salary) from employee_info_table eii where ei.salary < eii.salary)) 
			as secondary;

# 5.Get the Average salary of employees from each department for a particular location
select d.dept_name, avg(salary) from employee_table e
join department_table d on e.dept_id = d.dept_id
join employee_office_table eo on eo.emp_id = e.emp_id
join office_table o on eo.office_id = o.office_id
join employee_info_table ei on ei.id = e.employee_info_id
group by e.dept_id;

# 6. Get the sum of salaries of the employees joined after 02-01-2022 working in ‘Madhapur’
select sum(salary) from employee_table e
join employee_office_table eo on e.emp_id = eo.emp_id
join office_table o on o.office_id = eo.office_id
join employee_info_table ei on e.employee_info_id = ei.id
where ei.DOJ > '2022-01-02' and o.place = 'Madhapur';

# 7. Get name, department, salary of employees who joined after 20-02-2022 
# and  salary is greater than 20000 
# and has insurance either in lic or icici or both and whose work location is madhapur.

select e.emp_name, d.dept_name, ei.salary, i.insurance_name from employee_table e
join employee_office_table eo on e.emp_id = eo.emp_id
join employee_info_table ei on e.employee_info_id = ei.id
join office_table o on o.office_id = eo.office_id
join insurance_table i using (insurance_id)
join department_table d on e.dept_id = d.dept_id
where ei.salary > 20000 and ei.DOJ > '2022-01-1'
and i.insurance_name in ('LIC', 'Bajaj');

# 8. Get the list of employee names and their respective immediate head name
# Implicit Join
select e.emp_name as 'Employee Name', head.emp_name As 'Immediate Head' from employee_table e, employee_table head
where head.emp_id = e.immediate_head_id;

# Explicit Join
select e.emp_name as 'Employee Name', head.emp_name As 'Immediate Head' from employee_table e
join employee_table head on head.emp_id = e.immediate_head_id;

# 9. Get the list of employee names and their respective immediate head name with  
# their respective department names.
#  Eg: emp name | emp department name | immediate head name | immediate head department name

select e.emp_name as 'Employee Name', 
	d.dept_name as 'Employee Department Name',
    head.emp_name As 'Immediate Head',
    d.dept_name as 'Immediate Head Department Name'
    from employee_table e
join employee_table head on head.emp_id = e.immediate_head_id
join department_table d on d.dept_id = e.dept_id;

# 10. Get the list of employees whose immediate head working in location ‘madhapur’
#       and whose salary is less than twice the salary of their respective immediate heads.
select 
	e.emp_name as Employee,
    head.emp_name as 'Manager Name',
	o.place as Location,
    ei.salary as 'Employee Salary',
    eihead.salary as 'Manager Salary'
from employee_table e
join employee_table head on e.immediate_head_id = head.emp_id
join employee_info_table ei on ei.id = e.employee_info_id
join employee_info_table eihead on eihead.id = head.employee_info_id
join employee_office_table eo on eo.emp_id = e.emp_id
join office_table o on o.office_id = eo.office_id
where o.place = 'Madhapur' and (ei.salary*2) <= eihead.salary;