create or replace function get_data_secure(employee_name varchar, v_token varchar)
returns table(e_id integer, name character varying, salary integer)
as $$

declare
	str varchar;
begin
    call verify_user(employee_name, v_token);
	return query execute 'SELECT e_id, name, salary FROM employer';
end;
$$ LANGUAGE plpgsql;