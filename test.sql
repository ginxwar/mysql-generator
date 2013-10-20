use test;


set @rowsToGenerate := 200;
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




select		 gen.row
			,gen.dateCreated

			,gn.*

from		givenNames	gn

inner join	(-- generators
			select		 @row := @row + 1	row
						,floor(1 + rand(@seed) * @count) numGenerated

						-- generates a date (this is here because rand seed is preserved, outside of this join would result in un-duplicated values)
						,from_unixtime(floor(946684800 + rand(@seed) * 1209600)) dateCreated	-- epoch 20000101 through 20000115

			from		(select @row := 0) v1
			cross join	(select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9 union select 10)	c1	-- 10
			cross join	(select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9 union select 10)	c2	-- 100
			cross join	(select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9 union select 10)	c3	-- 1000
			cross join	(select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9 union select 10)	c4	-- 10000

			where		@row < @rowsToGenerate

			) gen on gen.numGenerated = gn.givennameID

order by	row;




-- select		 @row := @row + 1	row
-- 			,floor(1 + rand(@seed) * @count) num

-- from		(select @row := 0) v1
-- cross join	information_schema.columns	c1
-- cross join	information_schema.columns	c2

-- limit 200



/*
select 
union
select 2
union
select 3
*/
