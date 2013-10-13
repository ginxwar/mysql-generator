use test;

drop temporary table if exists givenName;

create temporary table givenNames (
	 givenNameID int not null auto_increment primary key
	,name varchar(40) not null
);


insert into givenNames
	(name)
	values
	('kevin')
	,('wendy')
	,('george');


select * from givenNames;

/*
select 
union
select 2
union
select 3
*/