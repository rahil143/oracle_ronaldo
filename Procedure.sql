SET SERVEROUTPUT ON;

create or replace procedure c_roles(
  	p_r_name in roles.r_name%type,
  	p_result out number
)
is

p_role_id roles.role_id%type;
p_count number:=0;

begin
  --Checking if Role Name is not null
  if (p_r_name is null or p_r_name = '') then 
    p_result :=1;
    return;
  end if;

  --Checking if the Role already Exist in the Database
  select count(*) into p_count from roles where r_name = p_r_name;

  if p_count > 0 then
    p_result :=1;
    return;
  end if;

  --Setting Role Id for new Record
  select max(role_id) into p_role_id from roles;
  if p_role_id is null then p_role_id := 1; else p_role_id := p_role_id + 1; end if;

  --Inserting the new Record in Roles Table
  insert into roles values(
  	p_role_id,
    p_r_name
  );

  commit;

  p_result :=0;
end;

create or replace procedure c_user_roles(
  p_role_id in user_roles.user_roles_id%type,
  p_access_id in user_roles.access_id%type,
  p_result out number
)
is 

p_user_roles_id user_roles.user_roles_id%type;
p_role_count number:=0;

begin

  --Verifying if Role Id is not null and empty
  if (p_role_id is null or p_role_id='')  or (p_access_id is null or p_access_id='') then 
    p_result :=1; 
    return; 
  end if;

  --Checking if Role already axits
  select count(*) into p_role_count from user_roles where role_id = p_role_id and access_id = p_access_id;
  if p_role_count >0 then
    p_result :=1; 
    return; 
  end if;

  --Setting User Roles ID
  select max(user_roles_id) into p_user_roles_id from user_roles;
  if p_user_roles_id is null then p_user_roles_id := 1; else p_user_roles_id := p_user_roles_id + 1; end if;

  --Inserting data in User Roles Table
  insert into user_roles values(
  	p_user_roles_id,
    p_role_id,
    p_access_id
  );
  commit;
  p_result:=0;

end;






