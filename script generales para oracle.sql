
// se crea tables space 
create tablespace tbs_oracle_demos datafile 'tbs_oracle_demos.dat' size 20M online;

// create un usuario y lo asginamos al tablespace creado
create user user_app_demo identified by "laclavedepapa" default tablespace tbs_oracle_demos;

// entregamos persimos al usuario
GRANT CONNECT, RESOURCE, DBA TO user_app_demo; 

// aplicamos cambios
commit


// recorrer un sp 
declare
  v sys_refcursor;
  vidusuario     tbl_usuarios.usuario_id%type;
  vnombreusuario tbl_usuarios.usuario_nombre%type;

begin
  sp_listarusuario(vrecordset => v);

  loop
    fetch v into vidusuario, vnombreusuario;
    exit when v%notfound;
    dbms_output.put_line(vidusuario ||' ' || vnombreusuario );  
  end loop;
  close v;
end;

// recorer tabla oracle
declare
  type xregistro  is ref cursor return tbl_usuarios%rowtype;
  vidusuario      tbl_usuarios.usuario_id%type;
  vnombreusuario  tbl_usuarios.usuario_nombre%type; 
  
  cursor usuarios is select * from tbl_usuarios;
  
begin
  
      for u in usuarios 
      loop
       dbms_output.put_line(u.usuario_id ||' ' || u.usuario_nombre );  
      end loop;        
    
  
    
  
end;
