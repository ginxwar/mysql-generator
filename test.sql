use test;

set @rowsToGenerate := 20;
set @seed := 1;

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
	-- ,('mike')
	-- ,('matt')
	-- ,('jerry')
	-- ,('sally')
	-- ,('emma')
	-- ,('gary')
	-- ,('randall')
	-- ,('scott')
	-- ,('barbara')
	-- ,('susan')
	-- ,('steve')
	-- ,('james')
	-- ,('cristina')
	-- ,('grant')
	-- ,('maria');

set @count := (select count(*) from givenNames);




select		gen.row, gn.*

from		givenNames	gn

inner join	(-- the generator
			select		 @row := @row + 1	row
						,floor(1 + rand(@seed) * @count) num

			from		(select @row := 0) v1
			cross join	information_schema.columns	c1
			cross join	information_schema.columns	c2

			limit 200
			) gen on gen.num = gn.givennameID


order by	row;


-- select		 @row := @row + 1	row
-- 			,floor(1 + rand(@seed) * @count) num

-- from		(select @row := 0) v1
-- cross join	information_schema.columns	c1
-- cross join	information_schema.columns	c2

-- limit 200



-- select	@row := @row + 1

-- from 	(select @row := 1) rg
-- limit 20;


/*
select 
union
select 2
union
select 3
*/