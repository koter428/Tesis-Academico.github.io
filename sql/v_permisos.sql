CREATE OR REPLACE VIEW public.v_permisos
 AS
SELECT a.id_pagina,
    b.direccion,
    b.nombre as nombre_pagina,
    b.id_modulo,
    c.nombre as nombre_modulo,
    a.id_grupo,
    d.nombre as nombre_grupo,
    a.leer,
    a.insertar,
    a.editar,
    a.borrar
   FROM permisos a
     JOIN paginas b ON b.id_pagina = a.id_pagina
     JOIN modulos c ON c.id_modulo = b.id_modulo
     JOIN usuarios_grupos d ON d.id_grupo = a.id_grupo;
	 
ALTER TABLE public.v_permisos
OWNER TO postgres;