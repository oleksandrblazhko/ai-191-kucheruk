create or replace function change_data_secure (attr_1 varchar, attr_2 varchar)
returns varchar
as $$
declare
	str varchar;
begin
	str:= 'UPDATE employer SET name = $2 WHERE name = $1';
	raise notice 'CHANGE_DATA_SECURE query=%', str;
	execute str using attr_1, attr_2;
	return 'Name successfully updated';
end;
$$ LANGUAGE plpgsql;