-- View: vista_usuarios

-- DROP VIEW vista_usuarios;

CREATE OR REPLACE VIEW vista_usuarios AS 
 SELECT a.usu_cod,
    a.usu_nick,
    a.usu_clave,
    a.id_empleado,
    b.car_cod,
    c.car_descri,
    (b.nombre_empleado::text || ' '::text) || b.nombre_empleado::text AS empleado,
    a.gru_cod,
    d.nombre_grupo,
    a.id_sucursal,
    e.suc_descri
   FROM usuarios a
     JOIN empleado b ON a.id_empleado = b.id_empleado
     JOIN cargo c ON b.car_cod = c.car_cod
     JOIN grupos d ON a.gru_cod = d.gru_cod
     JOIN sucursal e ON a.id_sucursal = e.id_sucursal;

ALTER TABLE vista_usuarios
  OWNER TO postgres;
