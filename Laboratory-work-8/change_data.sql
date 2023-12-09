create or replace function change_data(attr_1 varchar, attr_2 varchar)
returns varchar
as $$

declare
	str varchar;
begin
	str:= 'UPDATE employer SET name = ''' || attr_2 || ''' WHERE name = ''' || attr_1 ||'''';
	raise notice 'CHANGE DATA query=%', str;
	execute str;
	return 'Name successfully updated';
end;
$$ LANGUAGE plpgsql;