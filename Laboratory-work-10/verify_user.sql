create or replace procedure verify_user(
    v_username varchar,
	v_token varchar
)
as $$
begin
	if not exists (select from users u, sso_tokens t
					where lower(u.username) = v_username and u.id = t.user_id and t.token = v_token) then
		RAISE EXCEPTION 'Auth Error';
	end if;
end;
$$ language plpgsql;