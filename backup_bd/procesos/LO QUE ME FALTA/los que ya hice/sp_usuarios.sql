-- Function: sp_usuarios(integer, integer, character varying, character varying, integer, integer, integer)

-- DROP FUNCTION sp_usuarios(integer, integer, character varying, character varying, integer, integer, integer);

CREATE OR REPLACE FUNCTION sp_usuarios(
    ban integer,
    id_usuario integer,
    nick character varying DEFAULT NULL::character varying,
    clave character varying DEFAULT NULL::character varying,
    id_empleado integer DEFAULT NULL::integer,
    id_grupo integer DEFAULT NULL::integer,
    id_institucion integer DEFAULT NULL::integer)
  RETURNS character varying AS
$BODY$
-- declaracion de variables
declare mensaje varchar;
declare affectedRows integer;

begin 
-- inicio de logica
  if ban = 1 then
	PERFORM * FROM usuarios WHERE nick = trim(lower(nick));
	if NOT FOUND then
		INSERT INTO usuarios
		VALUES (
		  calcular_ultimo('usuarios','usu_cod'),
		  trim(lower(nick)), md5(clave), 
		  id_empleado, id_grupo, 
		  id_institucion
		 );  
		 mensaje = 'Se insertó correctamente el usuario '||vusu_nick;
	else 
		mensaje = 'Ya existe el usuario con el nick <strong>'||vusu_nick||'</strong>';
	end if;    
  
   elsif ban = 2 then --actualizar
	if length(clave) <= 20 then
		lave = md5(clave);
	end if;
	
	UPDATE usuarios
	SET 
          usu_nick = COALESCE(trim(lower(_nick)), usu_nick),
          usu_clave = vusu_clave, 
          emp_cod = COALESCE(id_empleado, id_empleado), 
          gru_cod = COALESCE(id_grupo, id_grupo), 
          id_sucursal = COALESCE(id_institucion, id_institucion)
        WHERE usu_cod = vusu_cod
	    AND (
	      vusu_nick IS NOT NULL AND nick IS DISTINCT FROM usu_nick OR
	      vusu_clave IS NOT NULL AND clave IS DISTINCT FROM usu_clave OR
	      vemp_cod IS NOT NULL AND id_empleado IS DISTINCT FROM emp_cod OR
	      vgru_cod IS NOT NULL AND id_grupo IS DISTINCT FROM gru_cod OR
	      vid_sucursal IS NOT NULL AND id_institucion IS DISTINCT FROM id_sucursal
	    );  

    GET DIAGNOSTICS affectedRows = ROW_COUNT;
        if affectedRows = 1 THEN
      mensaje = 'Se actualizo el usuario correctamente';
        else 
      mensaje = 'No se encontro el usuario con codigo '||id_usuario;
        end if;

  elsif ban = 3 then --borrar
    DELETE FROM usuarios 
    WHERE usu_cod = id_usuario;
  
  GET DIAGNOSTICS affectedRows = ROW_COUNT;
  if affectedRows = 1 THEN
    mensaje = 'Se borro el usuario correctamente';
  else mensaje = 'No se ha encontrado a el usuario';
  end if;

  end if;
  return mensaje;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sp_usuarios(integer, integer, character varying, character varying, integer, integer, integer)
  OWNER TO postgres;


  /*
	select * from  sp_usuarios(2,5,'1miro','123',3,3,1)
        select * from usuarios;
  */
