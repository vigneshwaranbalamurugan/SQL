use ecommerce;

show tables;

select * from employees;

create index idx_employee_ID
on Employees(Employee_ID);

describe insert_log;

delimiter $$;
create trigger trg_trigger
after insert
on employees 
for each row
begin
insert into insert_log(actions,emp_id) values('inserted value on employees',NEW.employee_id);
end $$;

delimiter ; 

describe employees;

insert into employees (employee_name,degree,department,city,phone_number,address,salary,manager_ID) values
("Vigi" , "BE","Development","cbe","1234567890","cbe",25000,5);

select * from insert_log;

start transaction;
select * from orders;
insert into orders(product_id,customer_id) values(2,1);
insert into orders(product_id,customer_id) values(2,1);
commit;

select * from orders;
start transaction;
insert into orders(product_id,customer_id) values(2,1);
rollback;

create view order_view as
select o.product_id,o.customer_id,p.product_name from orders o
join product p on p.product_id=o.product_id;

select * from order_view;