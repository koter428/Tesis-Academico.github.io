-- Inserts de Accesos
delete from permisos;
delete from usuarios;
delete from usuarios_grupos;
delete from funcionarios;
delete from cargos;
delete from paginas;
delete from modulos;

insert into cargos
values(1,'Administración del Sistema');

-- funcionarios
insert into funcionarios
values
(1,'Administrador','Sistema','0','C','2021-08-04','Ninguna',1,1,'0','admin@admin.com','M','A',current_timestamp);

insert into usuarios_grupos
values(1,'Grupo Administrador');

insert into usuarios
values
(1,'root',md5('root123'),1,1,1);

-- modulos
insert into modulos
(id_modulo, nombre)
values
(1,'SISTEMA'),
(2,'ESCUELA'),
(3,'PERSONA'),
(4,'INSCRIPCIONES'),
(5,'INFORMES');

-- paginas
insert into paginas
(id_pagina, direccion, nombre, id_modulo)
values
(1,'paginas_index.php','PAGINAS',1),
(2,'grupos_index.php','GRUPOS',1),
(3,'usuarios_index.php','USUARIOS',1),
(4,'tipos_educacion_index.php','TIPOS DE EDUCACION',2),
(5,'periodos_lectivos_index.php','PERIODOS LECTIVOS',2),
(6,'turnos_index.php','TURNOS',2),
(7,'escuelas_index.php','ESCUELA',2),
(8,'cargos_index.php','CARGOS',3),
(9,'funcionarios_index.php','FUNCIONARIOS',3),
(10,'alumnos_index.php','ALUMNOS',3),
(11,'tutores_index.php','TUTORES',3),
(12,'parentescos_index.php','PARENTESCO',3),
(13,'departamentos_index.php','DEPARTAMENTOS',3),
(14,'ciudades_index.php','CIUDADES',3),
(15,'barrios_index.php','BARRIOS',3),
(16,'inscripciones_alumnos_index.php','INSCRIPCIONES DE ALUMNOS',4),
(17,'usuarios_rpt.php','USUARIOS',5),
(18,'turnos_rpt.php','TURNOS',5),
(19,'alumnos_rpt.php','ALUMNOS',5),
(20,'funcionarios_rpt.php','FUNCIONARIOS',5),
(21,'inscripciones_rpt.php','INSCRIPCIONES',5);


-- permisos
insert into permisos
(id_pagina,id_grupo,leer,insertar,editar,borrar)
values
(1,1,true,true,true,true),
(2,1,true,true,true,true),
(3,1,true,true,true,true),
(4,1,true,true,true,true),
(5,1,true,true,true,true),
(6,1,true,true,true,true),
(7,1,true,true,true,true),
(8,1,true,true,true,true),
(9,1,true,true,true,true),
(10,1,true,true,true,true),
(11,1,true,true,true,true),
(12,1,true,true,true,true),
(13,1,true,true,true,true),
(14,1,true,true,true,true),
(15,1,true,true,true,true),
(16,1,true,true,true,true),
(17,1,true,true,true,true),
(18,1,true,true,true,true),
(19,1,true,true,true,true),
(20,1,true,true,true,true),
(21,1,true,true,true,true);









