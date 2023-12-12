create or replace function get_data_secure(employee_name varchar)
returns table(e_id integer, name character varying, salary integer)
as $$

declare
	str varchar;
begin
	str:= 'SELECT e_id, name, salary FROM employer WHERE name = $1';
	raise notice 'GET_DATA_SECURE query = %', str;
	return query execute str using employee_name;
end;
$$ LANGUAGE plpgsql;