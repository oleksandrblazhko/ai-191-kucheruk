create or replace function get_data(employee_name varchar)
returns table(e_id integer, name character varying)
as $$

declare
    str varchar;
begin
    str := 'select e_id, name from employer where name = ''' || employee_name || '''';
    raise notice 'GET_DATA=%', str;
    return query execute str;
end;
$$ LANGUAGE plpgsql;