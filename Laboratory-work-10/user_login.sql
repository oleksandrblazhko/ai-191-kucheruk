create or replace function user_login(v_username varchar, v_password varchar)
returns varchar
as $$

declare
	v_token varchar;
	v_user_id integer;
begin
	select id into v_user_id from users where username = v_username and password = v_password;
	if not found then
		return '';
	else
		select md5(inet_client_addr()::varchar || inet_client_port() ||
			pg_backend_pid()) into v_token;
		insert into sso_tokens (user_id, token) values (v_user_id,v_token);
		-- RAISE NOTICE 'TOKEN';
		return v_token;
	end if;
end;
$$ language plpgsql;