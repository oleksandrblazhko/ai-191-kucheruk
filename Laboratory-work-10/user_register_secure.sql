create or replace function user_register_secure(username varchar, password varchar) returns integer as $$
begin
    if not exists (select * from german_misc where value = password) then
        if password_is_correct(password) THEN
			INSERT INTO users (username, password_hash)
					VALUES (username, md5(password));
			return 1;
		else
			RAISE NOTICE 'Password is weak = % INCORRECT!', password;
			return 0;
		END IF;
    else
        return 0;
    end if;
end;
$$ LANGUAGE plpgsql;