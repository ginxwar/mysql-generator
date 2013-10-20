use test;

-- create a sproc


delimiter //

drop procedure if exists test;
create procedure test ()
begin
	select 1 as num;
end//



drop procedure if exists test2;
create procedure test2 ()
begin
	select 2 as num;
end//
