create or replace function sp_pedventas(ban integer,
vped_cod integer, vid_empleado integer, vcli_cod integer, id_institucion integer)
returns varchar as
$$
declare mensaje varchar;
begin
	if ban = 1 then --insertar
		INSERT INTO pedido_cabventa(ped_cod, ped_fecha, id_empleado, cli_cod, estado, 
		id_sucursal)
		    VALUES (calcular_ultimo('pedido_cabventa','ped_cod'), current_date,
		    vid_empleado, vcli_cod, 'P', id_institucion);
		    mensaje = 'Se inserto correctamente el pedido de venta';	
	end if; 
	if ban = 2 then --modificar
		update pedido_cabventa set cli_cod = vcli_cod
		where ped_cod = vped_cod;
		mensaje = 'Se modifico correctamente el pedido de venta';
	end if;
	if ban = 3 then --anular
		update pedido_cabventa set estado = 'A'
		where ped_cod = vped_cod;
		mensaje = 'Se anulo correctamente el pedido de venta';
	end if;	
	if ban = 4 then -- agregar cliente
	end if;
	return mensaje;
	
end;
$$
language plpgsql;
