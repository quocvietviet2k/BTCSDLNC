-- Bài Tập 1:
-- Tạo trigger:
DELIMITER $$
create trigger `trigger_insert`
before insert on  locations
for each row
begin
	insert into departments(
    department_id,
    department_name,
    location_id)
    values(
    '1',
    'Administrator',
    new.location_id);
end$$


DELIMITER $$
CREATE TRIGGER `trigger_delete` 
    AFTER DELETE ON locations
    FOR EACH ROW 
BEGIN
    INSERT INTO departments (    
        department_id,
		department_name,
		location_id
  ) 
  VALUES(
	'1',
    'Administrator',
    old.location_id,
        NOW()
  );
END$$

-- Tạo Event:
set global event_scheduler = on;
show processlist;

create event if not exists bt_event_01
on schedule at current_timestamp + interval 3 minute
do 
insert into departments(department_id, department_name, location_id)
value(1,'Administration',1700);

create event if not exists bt_event_02
on schedule at current_timestamp + interval 1 hour
do
	update jobs
    set job_title = 'Accounting Manager'
    where job_id = 19;
    
-- Bài Tập 2:
create event if not exists bt_event_03
on schedule at '2023-02-16 18:30:00'
on completion preserve 
do 
	insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
	values (172,'Do','Quoc Viet','quocviet.it.17@gmail.com','515.333.1702','2000-07-08',4,25000.00,103,6);

