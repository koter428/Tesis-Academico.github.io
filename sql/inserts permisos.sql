-- Inserts de Accesos
delete from empleados;
delete from permisos;
delete from paginas;
delete from modulos;

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
(1,'paginas.php','PAGINAS',1),
(2,'grupos.php','GRUPOS',1),
(3,'usuarios.php','USUARIOS',1),
(4,'tipos_educacion.php','TIPOS DE EDUCACION',2),
(5,'periodos_lectivos.php','PERIODOS LECTIVOS',2),
(6,'turnos.php','TURNOS',2),
(7,'escuela.php','ESCUELA',2),
(8,'cargos.php','CARGOS',3),
(9,'funcionarios.php','FUNCIONARIOS',3),
(10,'alumnos.php','ALUMNOS',3),
(11,'tutores.php','TUTORES',3),
(12,'parentesco.php','PARENTESCO',3),
(13,'departamentos.php','DEPARTAMENTOS',3),
(14,'ciudades.php','CIUDADES',3),
(15,'barrios.php','BARRIOS',3),
(16,'inscripciones_alumnos.php','INSCRIPCIONES DE ALUMNOS',4),
(17,'usuarios.php','USUARIOS',5),
(18,'turnos.php','TURNOS',5),
(19,'alumnos.php','ALUMNOS',5),
(20,'funcionarios.php','FUNCIONARIOS',5),
(21,'inscripciones.php','INSCRIPCIONES',5);


-- permisos
insert into permisos
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

-- empleados
insert into empleados
values
(1,'Administrador','Sistema','0','C','2021-08-04','Ninguna',1,1,'0','admin@admin.com','M','A',current_timestamp);

insert into usuarios
values
(1,'root',md5('root123'),1,1,1);





