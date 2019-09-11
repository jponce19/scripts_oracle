
// se crea tables space 
create tablespace tbs_oracle_demos datafile 'tbs_oracle_demos.dat' size 20M online;

// create un usuario y lo asginamos al tablespace creado
create user user_app_demo identified by "00.jponce" default tablespace tbs_oracle_demos;

// entregamos persimos al usuario
GRANT CONNECT, RESOURCE, DBA TO user_app_demo; 

// aplicamos cambios
commit