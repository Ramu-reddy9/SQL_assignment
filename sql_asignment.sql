#  DATABASE,TABLE,CONSTRAINTS

# 1. Create new database create employee table ( primary key (EmployeeID))
create database assignment;
use assignment;
# create employee table ( primary key (EmployeeID))
create table employee
(
employee_id int primary key,
emp_name varchar(20),
gendar char(1)
);

describe employee;


# 2. Insert sample data into the table. 
insert into employee values(101,"ramu","M");
insert into employee values(102,"ram","M");
insert into employee values(103,"rams","M");
insert into employee values(104,"devi","F");

#   3. Write a query to create a clone of an existing table using Create Command.

create table employee_clone like employee;  
select * from employee_clone;

insert into employee_clone 
select * from employee;

select * from employee_clone;


#  4. Write a query to get all employee detail from "employee" table
select * from employee;


#   5. Select only top 1 record from employee table

select * from employee limit 1;

#   6. Select only bottom 1 record from employee table

select * from employee
order by emp_name asc limit 1;

#  7. How to select a random record from a table?  

#By using a WHERE clause we can select an rando record  from a table 

select * from employee where emp_name ="ramu" ;



describe emp_data;

 # 8 Write a query to get
 #  “first_name” in upper case as "first_name_upper"

select upper(first_name) as first_name_upper from emp_data ;

# ‘first_name’ in lower case as ‘first_name_lower”

select lower(first_name) as first_name_lower from emp_data ;

# Create a new column “full_name” by combining “first_name” & “last_name” with space as a separator.

select first_name , last_name,
concat(first_name,' ',last_name) as full_name 
from emp_data;

# Add 'Hello ' to first_name and display result.

select first_name ,
concat(first_name,'hello') from emp_data;


# 9. Select the employee details of
    # Whose “first_name” is ‘Malli’
select * from  emp_data where first_name ="malli";

    # Whose “first_name” present in ("Malli","Meena", "Anjali")
 
 select * from  emp_data where first_name in("malli","Meena", "Anjali");

     # Whose “first_name” not present in ("Malli","Meena", "Anjali")
 
  select * from  emp_data where first_name not in("malli","Meena", "Anjali");
 
	# Whose “first_name” starts with “v”
    
    select * from emp_data where first_name like "v%";
    
     #Whose “first_name” ends with “i”
         
    select * from emp_data where first_name like "i%";
    
     # Whose “first_name” contains “o”
     
    select * from emp_data where first_name like "%o%";
    
    # Whose "first_name" start with any single character between 'm-v'
        
    select * from emp_data where first_name regexp'[m-v]';
    
     # Whose "first_name" not start with any single character between 'm-v'
            
    select * from emp_data where first_name not  regexp'[m-v]';
    
    # Whose "first_name" start with 'M' and contain 5 letter
       
    select * from emp_data where first_name like "M____";
    
 # 10. Write a query to get all unique values of"department" from the employee table.
 
 select distinct(department) from emp_data;
 
 # 11. Query to check the total records present in a table.
 
 select count(*) from emp_data;
 

#  12. Write down the query to print first letter of a Name in Upper Case and all other letter in Lower Case.(EmployDetail table)
 
 select concat( upper(left(first_name,1)),lower(substring(first_name,2))) from emp_data;
 
 
 # 13. Write down the query to display all employee name in one cell separated by ','
       # ex:-"Vikas, nikita, Ashish, Nikhil , anish"(EmployDetail table).


select group_concat(first_name separator ',') from emp_data;

 # 14. Query to get the below values of "salary" from employee table Lowest salary,Highest salary,Average salary,Highest salary - Lowest salary as diff_salary
       # % of difference between Highest salary and lowest salary. (sample output format: 10.5%

select min(salary),max(salary),avg(salary) from emp_data;
select max(salary)-min(salary) as diff from emp_data;

#  15. Select “first_name” from the employee table after removing white spaces from
    #Right side spaces,Left side spaces,Both right & left side space
 
 select rtrim(first_name),ltrim(first_name), trim(first_name) from emp_data;
 
 # 16. Query to check no.of records present in a table where employees having 50k salary.
 
 select count(*) from emp_data where salary=50000;
 
 
 # 17. Find the most recently hired employee in each department.

select * from emp_data;

select * from emp_data where joining_date =(
select max(joining_date) from emp_data
);



#-------------------------------------------------------------------------------------------------

# CASE WHEN THEN END STATEMENT QUERIES

# 1.Display first_name and gender as M /F.(if male then M, if Female then F) 

select first_name,
case when gender='male' then "M"
    when gender='female' then "F"
    end  as gender_short
from emp_data;


 # 2.Display first_name, salary, and a salary category. (If salary is below 50,000, categorize
     # as 'Low'; between 50,000 and 60,000 as 'Medium'; above 60,000 as 'High')
 
 select first_name,salary,
 case when salary<50000 then 'low'
      when salary between 50000 and 60000 then 'medium' 
      else 'high'
      end as salary_category
      from emp_data;
 
 
 # 3.Display first_name, department, and a department classification. (If department is
     #'IT', display 'Technical'; if 'HR', display 'Human Resources'; if 'Finance', display
        # 'Accounting'; otherwise, display 'Other')


select first_name ,department,
case when department='IT' then 'Technical' 
  when department='HR' then 'Human Resources'
  when department='Finance' then 'Accounting'
  else 'other'
  end as department_classification
  from emp_data;
  
  
 # 4.Display first_name, salary, and eligibility for a salary raise. (If salary is less than
     #50,000, mark as 'Eligible for Raise'; otherwise, 'Not Eligible')

select first_name,salary,
case when salary<50000 then 'Eligible for Raise'
   else 'Not Eligible'
   end as eligibility_for_a_salary_raise
   from emp_data;


 # 5.Display first_name, joining_date, and employment status. (If joining date is before
    # '2022-01-01', mark as 'Experienced'; otherwise, 'New Hire')
 
 select first_name,joining_date,
 case when joining_date<'2022-01-01' then  'Experienced'
	else 'New hire'
    end as  employment_status
    from emp_data;
    
    
 # 6.Display first_name, salary, and bonus amount. (If salary is above 60,000, add10%
     #bonus; if between 50,000 and 60,000, add 7%; otherwise, 5%)
     
select first_name,salary,
  case when salary>60000 then 'add10%'
    when salary between 50000 and 60000 then 'add 7%'
    else 'add 5%'
    end as  bonus_amount
    from emp_data;

 #7.Display first_name, salary, and seniority level. 
     #(If salary is greater than 60,000, classify as 'Senior'; between 50,000 and 60,000 as 'Mid-Level'; below 50,000 as 'Junior')
 
 select first_name,salary,
  case when salary>60000 then 'Senoir'
    when salary between 50000 and 60000 then 'Mid-Level'
    when salary<50000 then 'junior'
    end as  seniority_level
    from emp_data;
 
 # 9. Display first_name, salary, and seniority level.

 select first_name,salary,
  case when salary>60000 then 'Senoir'
    when salary between 50000 and 60000 then 'Mid-Level'
    when salary<50000 then 'junior'
    end as  seniority_level
    from emp_data;


# 11. Display first_name, department, and job level for IT employees. (If department is 'IT'
           #and salary is greater than 55,000, mark as 'Senior IT Employee'; otherwise, 'Other').
 
 select first_name,department,
  case when department='It' and salary >55000 then 'Senoir IT Employee'
   else 'Other'
    end as job_level_for_IT_employees
    from emp_data;


# 12. Display first_name, joining_date, and recent joiner status. (If an employee joined
      #after '2024-01-01', label as 'Recent Joiner'; otherwise, 'Long-Term Employee')

select first_name,joining_date,
 case when joining_date>'2024-01-01' then  'Recent Joiner'
	else  'Long-Term Employee'
    end as  recent_joiner_status
    from emp_data;

#13. Display first_name, joining_date, and leave entitlement. (If joined before '2021-01-
  #01', assign    ; between '2021-01-01' and '2023-01-01', assign '20 Days Leave'; otherwise, '25 Days Leave')

 select first_name,joining_date,
 case when joining_date<'2021-01-01' then  '10 days leave'
	when joining_date between '2021-01-01' and '2023-01-01' then '20 Days Leave'
    else '25 Days Leave'
    end as  leave_entitlement
    from emp_data;


# 14. Display first_name, salary, department, and promotion eligibility. (If salary is above
    #60,000 and department is 'IT', mark as 'Promotion Eligible'; otherwise, 'Not Eligible')

 select first_name,salary,department,
  case when salary>60000 and department='IT' then 'Promotion Eligible'
   else 'Not Eligible'
    end as  promotion_eligibility
    from emp_data;

#  15. Display first_name, salary, and overtime pay eligibility. (If salary is below 50,000,
      #mark as 'Eligible for Overtime Pay'; otherwise, 'Not Eligible')
      
select first_name,salary,
  case when salary<50000 then ' Eligible for Overtime Pay'
   else 'Not Eligible'
    end as  overtime_pay_eligibility
    from emp_data;

# 16. Display first_name, department, salary, and job title. (If department is 'HR' and salary
   #is above 60,000, mark as 'HR Executive'; if department is 'Finance' and salary is above
       #55,000, mark as 'Finance Manager'; otherwise, 'Regular Employee')

 select first_name,department,salary,
  case when department='HR' and salary>60000 then'HR Executive'
  when department='Finance' and salary>55000 then'Finance Manager'
   else 'Regular Employee'
    end as  job_title
    from emp_data;
    
# 17. Display first_name, salary, and salary comparison to the company average. (If salary is
    #above the company’s average salary, mark assalary ; otherwise, 'Below Average')

      
select first_name,salary,
  case when salary>(
  select avg(salary) from  emp_data)   then 'Above Average'
   else 'Below Average'
    end as  salary_comparison_to_the_company_average
    from emp_data;


 #-----------------------------------------------------------------------------------------------
  
  
  
  #GROUP BY
  
  
# 1.Write the query to get the department and department wise total(sum) salary,
           #display it in ascending and descending order according to salary.
  
  select department,sum(salary) as total_salary
  from emp_data
  group by department
 order by total_salary asc;
 
 select department,sum(salary) as total_salary
  from emp_data
  group by department
 order by total_salary desc;
           
# 2.Write down the query to fetch Project name assign to more than one Employee

select * from pro_data;

select project_name, count(*) as emp_count
from pro_data
group by project_name
having count(*)>1;


# 3.Write the query to get the department, total no. of departments, total(sum) salary
           #with respect to department from "employee table" table.

select department,count(department),sum(salary)
from emp_data
group by department;

# 4.Get the department-wise salary details from the "employee table" table:
           #What is the average salary? (Order by salary ascending)
           #What is the maximum salary? (Order by salary ascending)

select department,
AVG(salary) as avg_salary
from emp_data
group by department
order by avg_salary asc;

select department,
max(salary) as avg_salary
from emp_data
group by department
order by avg_salary asc;

# 5. Display department-wise employee count and categorize based on size. (If a department
    #has more than 5 employees, label it as 'Large'; between 3 and 5 as 'Medium'; otherwise, 'Small')

select department,count(*) as emp_count,
case  when count(*)>5 then 'Large'
  when count(*) between 3 and 5 then 'Medium'
  else 'Small'
  end as categorize_based_on_size
  from emp_data
  group by department;


# 6. Display department-wise average salary and classify pay levels. (If the average salary in a
    #department is above 60,000, label it as 'High Pay'; between 50,000 and 60,000 as 'Medium Pay'; otherwise, 'Low Pay').

select department,avg(salary) as avg_salary,
case  when avg(salary)>60000 then 'HIgh pay'
  when avg(salary) between 50000 and 60000 then 'Medium pay'
  else 'Low pay'
  end as classify_pay_levels
  from emp_data
  group by department;

# 7. Display department, gender, and count of employees in each category. (Group by
    #department and gender, showing total employees in each combination)

select department,gender,count(*) 
from emp_data
group by department,gender;


# 8. Display the number of employees who joined each year and categorize hiring trends. (If a
    #year had more than 5 hires, mark as 'High Hiring'; 3 to 5 as 'Moderate Hiring'; otherwise,'Low Hiring')

select year(joining_date),count(*) as hires,
case when count(*)>5 then 'High hiring'
 when count(*) between 3 and 5 then 'Moderate hiring'
 else 'low hiring'
 end as hiring_trends
 from emp_data
 group by year(joining_date);


# 9. Display department-wise highest salary and classify senior roles. (If the highest salary in a
      #department is above 70,000, label as 'Senior Leadership'; otherwise, 'Mid-Level')

select department,max(salary) as highest_salary,
case when max(salary)>70000 then 'senior'
else 'Mid-level'
end as senior_roles
from emp_data
group by department;

# 10. Display department-wise count of employees earning more than 60,000. (Group
   #employees by department and count those earning above 60,000, labeling departments with more than 2 such employees as 'High-Paying Team')


select department, count(*) as high_earner,
case when count(*)>2 then 'High-Paying Team'
else 'other' 
end as dapar_type
from emp_data
where salary>60000
group by department;

#------------------------------------------------------------------------------------------------------
# DATE TIME RELATED QUERIES


# 1.Query to extract the below things from joining_date column. (Year, Month, Day, CurrentDate)

select joining_date,date_format(joining_date,"%Y") as year,
date_format(joining_date,"%M") as month,
date_format(joining_date,"%d") as day,
current_date()
from emp_data;




select date_format(now(),"%y");

# 2.Create two new columns that calculate the difference between joining_date and the
   #current date. One column should show the difference in months, and the other should show the difference in days

select joining_date,
timestampdiff(month,joining_date,now()) as diff_in_months,
datediff(now(),joining_date) as diff_in_days
 from emp_data;



# 3.Get all employee details from the employee table whose joining year is 2020.

select * from emp_data where year(joining_date)="2020";


# 4.Get all employee details from the employee table whose joining month is Feb.

select * from emp_data where month(joining_date)="02";



# 5.Get all employee details from employee table whose joining date between


select * from emp_data where joining_date between  "2021-01-01"  and "2021-12-01" ;

#-------------------------------------------------------------------------------------------------------------------
#JOINS RELATED QUERIES


# 1.get the employee name and project name from the "employee table" and
      #"ProjectDetail" for employees who have been assigned a project, sorted by first name.
use assignment;
select * from emp_data limit 5;
describe emp_data;
select * from pro_data;
describe pro_data;


select a.first_name,
a.last_name,
b.project_name
from emp_data a inner join pro_data b 
on a.emp_id =b.emp_id_no
order by a.first_name;

# 2.Get the employee name and project name from the "employee table" and
    #"ProjectDetail" for all employees, including those who have not been assigned a project,sorted by first name.

select a.first_name,
a.last_name,
b.project_name
from emp_data a left join pro_data b 
on a.emp_id =b.emp_id_no
order by a.first_name;


# 3.Get the employee name and project name from the "employee table" and
   # "ProjectDetail" for all employees. If an employee has no assigned project, display "-No
           #Project Assigned," sorted by first name.

select a.first_name,
a.last_name,

case when b.project_name is null then 'No Project assigned'
else b.project_name
end as project_name 

from emp_data a left join pro_data b 
on a.emp_id =b.emp_id_no
order by a.first_name;


# 4.Get all project names from the "ProjectDetail" table, even if they are not linked to any
   #employee, sorted by first name from the "employee table" and "ProjectDetail" table.

select distinct p.project_name
from  pro_data p left join  emp_data a 
on p.emp_id_no = a.emp_id 
order by a.first_name;


# 5.Find the project names from the "ProjectDetail" table that have not been assigned to
    #any employee using the "employee table" and "ProjectDetail" table.

select  b.project_name
from  pro_data b left join  emp_data a 
on b.emp_id_no = a.emp_id 
order by a.first_name;

# 6.Get the employee name and project name for employees who are assigned to more than one project.
select a.first_name,
a.last_name,
b.project_name,
count(b.project_name) as pro_count
from emp_data a join pro_data b
on a.emp_id = b.emp_id_no
group by a.emp_id
having count(*)>1;


# 7.Get the project name and the employee names of employees working on projects that have more than one employee assigned.

select b.project_name, 
       group_concat(concat(a.first_name, ' ', a.last_name) separator ', ') as employee_names
from emp_data a
join pro_data b on a.emp_id = b.emp_id_no
group by b.project_name
having count(distinct a.emp_id) > 1;

# 8.Get records from the "ProjectDetail" table where the corresponding employee ID does
   #not exist in the "employee table."

select * 
from pro_data p
where p.emp_id_no not in (select emp_id from emp_data);
----------------------------------------------------------------------------------------------------------------------------
#Ranking Functions


 #1.Get all project names from the "ProjectDetail" table, even if they are not linked to any
   #employee, sorted by first name from the "employee table" and "ProjectDetail" table.
   
select e.first_name,p.project_name
from pro_data p
left join emp_data e on p.emp_id_no = e.emp_id
order by e.first_name, p.project_name;
 
 
 
  #2.Find the project names from the "ProjectDetail" table that have not been assigned to
     #any employee using the "employee table" and "ProjectDetail" table.
     
select p.project_name
from pro_data p
left join emp_data e on p.emp_id_no = e.emp_id
where e.emp_id is null;
     

 #3.Get the employee name and project name for employees who are assigned to more thanone project.
 
 
 
 
 #4.Get the project name and the employee names of employees working on projects that have more than one employee assigned.
 select p.project_name,
group_concat(concat(e.first_name, ' ', e.last_name)  separator ', ') as employees
from pro_data p
join emp_data e on p.emp_id_no = e.emp_id
group by p.project_name
having count(distinct e.emp_id) > 1
order by p.project_name;
 
 
# 5.Get records from the "ProjectDetail" table where the corresponding employee ID does not exist in the "employee table.

select p.*
from pro_data p
where p.emp_id_no not in (select emp_id from emp_data);

#------------------------------------------------------------------------------------------------------------------------------

#Partitioning Data

#1.Assign a row number to each employee within their department based on salary in descending order.

select emp_id,
       first_name,
       department,
       salary,
       row_number() over (partition by department order by salary desc) as row_num
from emp_data;

 #2.Rank employees within each department based on salary using RANK(). 
 
 
 select emp_id,
       first_name,
       department,
       salary,
       rank() over (partition by department order by salary desc) as salary_rank
from emp_data;
 
 # 3.Rank employees within each department based on salary using DENSE_RANK().
 
 
 
 select emp_id,
       first_name,
       department,
       salary,
       dense_rank() over (partition by department order by salary desc) as salary_dense_rank
from emp_data;

 # 4.Find the highest-paid employee in each department using RANK().
 
 select *
from (
  select emp_id,
         first_name,
         department,
         salary,
         rank() over (partition by department order by salary desc) as rnk
  from emp_data
) t
where t.rnk = 1;


 # 5.Find the second highest-paid employee in each department using RANK().
 
 select *
from (
  select emp_id,
         first_name,
         department,
         salary,
         rank() over (partition by department order by salary desc) as rnk
  from emp_data
) t
where t.rnk = 2;

 
 
 # 6.Rank employees based on their years of experience within each department.
 
 
 
 #7.Find the employee with the earliest join date in each department using RANK().

select *
from (
  select emp_id,
         first_name,
         department,
         joining_date,
         rank() over (partition by department order by joining_date asc) as rnk
  from emp_data
) t
where t.rnk = 1;

#--------------------------------------------------------------------------------------------------------------------------------------




