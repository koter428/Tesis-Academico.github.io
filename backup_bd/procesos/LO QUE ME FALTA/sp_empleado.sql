﻿-- Function: sp_empleado(integer,integer, integer, character varying, character varying, character varying,character varying)

-- DROP FUNCTION sp_empleado(integer,integer, integer, character varying, character varying, character varying,character varying);

CREATE OR REPLACE FUNCTION sp_empleado(
    ban integer,
    vid_empleado integer DEFAULT 0,
    vcar_cod integer DEFAULT 0,
    vnombre_empleado character varying DEFAULT ''::character varying,
    vnombre_empleado character varying DEFAULT ''::character varying,
    vemp_direcc character varying DEFAULT ''::character varying,
    vemp_tel character varying DEFAULT ''::character varying)
  RETURNS character varying AS
$BODY$
declare mensaje varchar default null;
begin
	if ban = 1 then
		INSERT INTO empleado(id_empleado, car_cod, nombre_empleado, nombre_empleado, emp_direcc, emp_tel)
		VALUES (calcular_ultimo('empleado','id_empleado'),
		vcar_cod,
		trim(upper(vnombre_empleado)), 
		trim(upper(vnombre_empleado)), 
		vemp_direcc, 
		vemp_tel);	
		mensaje = 'Se guardó correctamente el empleado*empleado_index';	
	elsif ban = 2 then
		update empleado 
		set car_cod = vcar_cod, 
		nombre_empleado = trim(upper(vnombre_empleado)),
		nombre_empleado = trim(upper(vnombre_empleado)), 
		emp_direcc = vemp_direcc, 
		emp_tel = vemp_tel
		where id_empleado = vid_empleado;
		mensaje = 'Se modificó correctamente el empleado*empleado_index';
	elsif ban = 3 then
		delete from empleado where id_empleado = vid_empleado;
		mensaje = 'Se eliminó correctamente el empleado*empleado_index';
	end if;
	return mensaje;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sp_empleado(integer,integer, integer, character varying, character varying, character varying,character varying)
  OWNER TO postgres;

 /*
	Prueba del procedimiento
	1- grabar
		select  sp_empleado(1,3,1,'alison','Vargas','villa lisa','45353');
				                 
	2- modificar
		select sp_empleado(2,3,1,'descripcion','vergas','Vergaras','san lorenzo','5564723');

	3- eliminar
		select sp_empleado(3,3);

	select * from empleado order by 1


 */


 select sp_empleado(1,0,9,'xxx','xxx','nada','0000') as resul
 select * from empleado