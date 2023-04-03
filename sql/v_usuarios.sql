CREATE OR REPLACE VIEW public.vista_usuarios
 AS
 SELECT u.id_usuario,
    u.nick,
    u.clave,
    u.id_funcionario,
    c.id_cargo,
    c.nombre as nombre_cargo,
    (f.nombre::text || ' '::text) || f.apellido::text AS nombre_empleado,
    u.id_grupo,
    g.nombre as nombre_grupo,
    u.id_escuela,
    i.nombre as nombre_escuela
   FROM usuarios u
     JOIN funcionarios f ON u.id_funcionario = f.id_funcionario
     JOIN cargos c ON f.id_cargo = c.id_cargo
     JOIN usuarios_grupos g ON u.id_grupo = g.id_grupo
     JOIN escuelas i ON u.id_escuela = i.id_escuela;

ALTER TABLE public.vista_usuarios
    OWNER TO postgres;