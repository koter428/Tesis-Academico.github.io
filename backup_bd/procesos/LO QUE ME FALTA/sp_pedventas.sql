-- Function: sp_pedventas(integer, integer, integer, integer, integer)

-- DROP FUNCTION sp_pedventas(integer, integer, integer, integer, integer);

CREATE OR REPLACE FUNCTION sp_pedventas(
    ban integer,
    vped_cod integer DEFAULT 0,
    vid_empleado integer DEFAULT 0,
    vcli_cod integer DEFAULT 0,
    id_institucion integer DEFAULT 0)
  RETURNS character varying AS
$BODY$
declare mensaje varchar default null;
begin
	if ban = 1 then --insertar
		INSERT INTO pedido_cabventa(ped_cod, ped_fecha, id_empleado, cli_cod, estado, 
		id_sucursal)
		    VALUES (calcular_ultimo('pedido_cabventa','ped_cod'), current_date,
		    vid_empleado, vcli_cod, 'P', id_institucion);
		    mensaje = 'Se insertó correctamente el pedido de venta';	
	elsif ban = 2 then --modificar
		update pedido_cabventa set cli_cod = vcli_cod
		where ped_cod = vped_cod;
		mensaje = 'Se modificó correctamente el pedido de venta';
	elsif ban = 3 then --anular
		update pedido_cabventa set estado = 'A'
		where ped_cod = vped_cod;
		mensaje = 'Se anuló correctamente el pedido de venta';
	elsif ban = 4 then -- agregar cliente
	end if;
	return mensaje;
	
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sp_pedventas(integer, integer, integer, integer, integer)
  OWNER TO postgres;
