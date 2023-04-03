delete from escuelas;
delete from barrios;
delete from ciudades;
delete from departamentos;

insert into departamentos
(id_departamentos, nombre)
values 
(1,'Concepción'),
(2,'San Pedro'),
(3,'Cordillera'),
(4,'Guairá'),
(5,'Caaguazú'),
(6,'Itapúa'),
(7,'Misiones'),
(8,'Paraguarí'),
(9,'Alto Paraná'),
(10,'Central'),
(11,'Ñeembucú'),
(12,'Amambay'),
(13,'Canindeyú'),
(14,'Presidente Hayes'),
(15,'Boquerón'),
(16,'Alto Paraguay');

insert into  ciudades
(id_ciudad,nombre,id_departamentos)
values
(1,'Asunción',10);

insert into barrios
(id_barrio,id_ciudad,nombre)
values
(1,1,'Barrio Tacumbú');

insert into escuelas
(id_escuela, nombre, direccion, id_barrio, telefono, 
 email, correo, escuela, colegio, fecha_inauguracion, 
 activo)
values(1,'Escuela Divino Jesús','Ayolas & Teniente Gregorio Benitez', 1,'(021) 372 912',
	   'divijesus@email.com','NN','S','S','1965-03-21',
	  'S');

