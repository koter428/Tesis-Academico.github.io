CREATE OR REPLACE VIEW public.v_usuarios
 AS
 SELECT u.id_usuario,
    u.nick,
    u.clave,
    u.id_empleado,
    c.id_cargo,
    c.nombre as nombre_cargo,
    (e.nombre::text || ' '::text) || e.apellido::text AS nombre_empleado,
    u.id_grupo,
    g.nombre as nombre_grupo,
    u.id_institucion,
    i.nombre as nombre_institucion
   FROM usuarios u
     JOIN empleados e ON u.id_empleado = e.id_empleado
     JOIN cargos c ON e.id_cargo = c.id_cargo
     JOIN usuarios_grupos g ON u.id_grupo = g.id_grupo
     JOIN instituciones i ON u.id_institucion = i.id_institucion;

ALTER TABLE public.v_usuarios
    OWNER TO postgres;

