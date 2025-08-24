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
 
 #-----------------------------------------------------------------------------------------------
 