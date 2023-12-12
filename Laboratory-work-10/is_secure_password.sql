create or replace function is_secure_password(password varchar)
returns boolean as
$$
declare
    digits_length integer;
    lower_chars_length integer;
    upper_chars_length integer;
    special_chars_length integer;
begin

    if length(password) < 16 then
        return false;
    end if;

    select
        count(*) into digits_length
        from REGEXP_MATCHES(password, '\d', 'g');

    select
        count(*) into lower_chars_length
        from REGEXP_MATCHES(password, '[a-z]', 'g');

    select
        count(*) into upper_chars_length
        from REGEXP_MATCHES(password, '[A-Z]', 'g');

    select
        count(*) into special_chars_length
        from REGEXP_MATCHES(password, '[!@#$%^&*]', 'g');

    if digits_length < 2 or lower_chars_length < 4 or upper_chars_length < 4 or special_chars_length < 4 then
        return false;
    else
        return true;
    end if;
end;
$$ LANGUAGE plpgsql;