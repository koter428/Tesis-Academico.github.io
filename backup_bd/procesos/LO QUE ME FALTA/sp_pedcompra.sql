﻿-- Function: sp_pedcompra(integer, integer, integer, integer, integer)

-- DROP FUNCTION sp_pedcompra(integer, integer, integer, integer, integer);

CREATE OR REPLACE FUNCTION sp_pedcompra(
    ban integer,
    vped_com integer,
    vid_empleado integer,
    vprv_cod integer,
    id_institucion integer)
  RETURNS character varying AS
$BODY$
declare mensaje varchar default null;
begin
	if ban = 1 then --insertar
		INSERT INTO pedido_cabcompra(ped_com, ped_fecha, id_empleado, prv_cod, estado, id_sucursal)
		VALUES (calcular_ultimo('pedido_cabcompra','ped_com'),current_date, vid_empleado,
		vprv_cod, 'P',id_institucion);
		mensaje = 'Se agregó correctamente el pedido de compra';	
	elsif ban  = 2 then 
		update pedido_cabcompra set prv_cod = vprv_cod
		where ped_com = vped_com;
		mensaje = 'Se actualizó correctamente el pedido de compra';	
	elsif ban = 3 then 
		update pedido_cabcompra set estado ='A'
		where ped_com = vped_com;
		mensaje = 'Se anuló correctamente el pedido de compra';	
	end if;	
	return mensaje;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sp_pedcompra(integer, integer, integer, integer, integer)
  OWNER TO postgres;
