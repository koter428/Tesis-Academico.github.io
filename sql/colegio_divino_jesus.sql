/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     27/3/2023 16:26:09                           */
/*==============================================================*/


drop table ALUMNOS;

drop table BARRIOS;

drop table CARGOS;

drop table CIUDADES;

drop table CURSOS;

drop table DEPARTAMENTOS;

drop table ESCUELAS;

drop table FUNCIONARIOS;

drop table INSCRIPCIONES;

drop table MODULOS;

drop table OCUPACIONES;

drop table PAGINAS;

drop table PARENTESCOS;

drop table PERIODOS_LECTIVOS;

drop table PERMISOS;

drop table TIPOS_EDUCACION;

drop table TURNOS;

drop table TURNOS_ESCUELAS;

drop table TUTORES;

drop table TUTORESALUMNOS;

drop table USUARIOS;

drop table USUARIOS_GRUPOS;

drop domain D_BOOLEAN;

drop domain D_CHAR1;

drop domain D_DATE;

drop domain D_INT2;

drop domain D_INT4;

drop domain D_TIME;

drop domain D_TIMESTAMP;

drop domain D_VARCHAR120;

drop domain D_VARCHAR15;

drop domain D_VARCHAR300;

drop domain D_VARCHAR60;

drop sequence SEQUENCE_1;

create sequence SEQUENCE_1;

/*==============================================================*/
/* Domain: D_BOOLEAN                                            */
/*==============================================================*/
create domain D_BOOLEAN as BOOL;

/*==============================================================*/
/* Domain: D_CHAR1                                              */
/*==============================================================*/
create domain D_CHAR1 as CHAR(1);

/*==============================================================*/
/* Domain: D_DATE                                               */
/*==============================================================*/
create domain D_DATE as DATE;

/*==============================================================*/
/* Domain: D_INT2                                               */
/*==============================================================*/
create domain D_INT2 as INT2;

/*==============================================================*/
/* Domain: D_INT4                                               */
/*==============================================================*/
create domain D_INT4 as INT4;

/*==============================================================*/
/* Domain: D_TIME                                               */
/*==============================================================*/
create domain D_TIME as TIME;

/*==============================================================*/
/* Domain: D_TIMESTAMP                                          */
/*==============================================================*/
create domain D_TIMESTAMP as TIMESTAMP;

/*==============================================================*/
/* Domain: D_VARCHAR120                                         */
/*==============================================================*/
create domain D_VARCHAR120 as VARCHAR(120);

/*==============================================================*/
/* Domain: D_VARCHAR15                                          */
/*==============================================================*/
create domain D_VARCHAR15 as VARCHAR(15);

/*==============================================================*/
/* Domain: D_VARCHAR300                                         */
/*==============================================================*/
create domain D_VARCHAR300 as VARCHAR(300);

/*==============================================================*/
/* Domain: D_VARCHAR60                                          */
/*==============================================================*/
create domain D_VARCHAR60 as VARCHAR(60);

/*==============================================================*/
/* Table: ALUMNOS                                               */
/*==============================================================*/
create table ALUMNOS (
   ID_ALUMNO            SERIAL               not null,
   ID_ESCUELA           D_INT2               not null,
   NOMBRE               D_VARCHAR60          not null,
   APELLIDO             D_VARCHAR60          not null,
   FECHA_NACIMIENTO     D_DATE               not null,
   EDAD                 D_CHAR1              not null,
   DIRECCION            D_VARCHAR60          not null,
   ID_BARRIO            D_INT2               not null,
   NRO_TELEFONO         D_VARCHAR15          not null,
   SEXO                 D_CHAR1              not null,
   NRO_DOCUMENTO        D_VARCHAR60          not null,
   TIPO_DOCUMENTO       D_CHAR1              not null,
   FECHA_REGISTRO       D_DATE               not null,
   DESDE_GRADO          D_VARCHAR60          null,
   GRADO_ACTUAL         D_VARCHAR60          null,
   CERT_NACIMIENTO      D_VARCHAR15          null,
   constraint PK_ALUMNOS primary key (ID_ALUMNO)
);

/*==============================================================*/
/* Table: BARRIOS                                               */
/*==============================================================*/
create table BARRIOS (
   ID_BARRIO            SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   ID_CIUDAD            D_INT4               not null,
   constraint PK_BARRIOS primary key (ID_BARRIO)
);

/*==============================================================*/
/* Table: CARGOS                                                */
/*==============================================================*/
create table CARGOS (
   ID_CARGO             SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_CARGOS primary key (ID_CARGO)
);

/*==============================================================*/
/* Table: CIUDADES                                              */
/*==============================================================*/
create table CIUDADES (
   ID_CIUDAD            SERIAL               not null,
   ID_departamentos              INT4                 not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_CIUDADES primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CURSOS                                                */
/*==============================================================*/
create table CURSOS (
   ID_CURSO             SERIAL               not null,
   ID_ESCUELA           INT4                 not null,
   ID_TIPO              INT4                 not null,
   ID_TURNO             INT4                 not null,
   NOMBRE               D_VARCHAR60          not null,
   ACTIVO               D_CHAR1              not null,
   constraint PK_CURSOS primary key (ID_CURSO)
);

comment on table CURSOS is
'vigente: si/no';

/*==============================================================*/
/* Table: DEPARTAMENTOS                                         */
/*==============================================================*/
create table DEPARTAMENTOS (
   ID_departamentos              SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_DEPARTAMENTOS primary key (ID_departamentos)
);

/*==============================================================*/
/* Table: ESCUELAS                                              */
/*==============================================================*/
create table ESCUELAS (
   ID_ESCUELA           SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   DIRECCION            D_VARCHAR120         not null,
   ID_BARRIO            D_INT4               not null,
   TELEFONO             D_VARCHAR15          not null,
   EMAIL                D_VARCHAR60          not null,
   CORREO               D_VARCHAR15          not null,
   ESCUELA              D_CHAR1              not null,
   COLEGIO              D_CHAR1              not null,
   FECHA_INAUGURACION   D_DATE               null,
   ACTIVO               D_CHAR1              not null,
   constraint PK_ESCUELAS primary key (ID_ESCUELA)
);

comment on table ESCUELAS is
'escuela: Valores SI/NO
colegio: Valores SI/NO
al seleccionar la ciudad, ya trae el barrio y departamento.';

/*==============================================================*/
/* Table: FUNCIONARIOS                                          */
/*==============================================================*/
create table FUNCIONARIOS (
   ID_empleado          SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   APELLIDO             D_VARCHAR60          not null,
   NRO_DOCUMENTO        D_VARCHAR15          not null,
   TIPO_DOCUMENTO       D_CHAR1              not null,
   FECHA_NACIMIENTO     D_DATE               not null,
   DIRECCION            D_VARCHAR300         not null,
   ID_BARRIO            D_INT4               not null,
   ID_CARGO             D_INT4               not null,
   TELEFONO_PARTICULAR  D_VARCHAR15          not null,
   EMAIL_PARTICULAR     D_VARCHAR60          not null,
   SEXO                 D_CHAR1              not null,
   ESTADO               D_CHAR1              not null,
   FECHA_INGRESO        D_TIMESTAMP          not null,
   constraint PK_FUNCIONARIOS primary key (ID_empleado)
);

/*==============================================================*/
/* Table: INSCRIPCIONES                                         */
/*==============================================================*/
create table INSCRIPCIONES (
   ID_INSCRIPCION       SERIAL               not null,
   ID_PERIODO           D_INT4               not null,
   ID_ALUMNO            D_INT4               not null,
   ID_CURSO             D_INT4               not null,
   ID_TURNO             D_INT2               not null,
   LUGAR_NACIMIENTO     D_VARCHAR60          not null,
   PROCEDENCIA_ESCOLAR  D_VARCHAR60          null,
   VACUNA_RECIBIDO      D_VARCHAR60          null,
   EVALUACION_PSICOLOGICA D_CHAR1              not null,
   PRE_ESCOLAR          D_CHAR1              not null,
   TRANSPORTE           D_CHAR1              not null,
   ALERGIAS             D_VARCHAR60          not null,
   EDAD_PRIMER_GRADO    D_INT2               null,
   CURSO_REPITIO        D_CHAR1              not null,
   MOTIVO_REPETICION    D_VARCHAR60          null,
   ID_TUTOR1            INT4                 null,
   ID_OCUPACION_TUTOR1  INT4                 null,
   ID_TUTOR2            INT4                 null,
   ID_OCUPACION_TUTOR2  INT4                 null,
   TIEMPO_EN_FAMILIA    D_INT2               null,
   ID_USUARIO           INT4                 not null,
   FECHA_INSCRIPCION    D_TIMESTAMP          not null,
   constraint PK_INSCRIPCIONES primary key (ID_INSCRIPCION)
);

comment on table INSCRIPCIONES is
'Tutor1 y Tutor2 representan a padre y madre del formulario';

/*==============================================================*/
/* Table: MODULOS                                               */
/*==============================================================*/
create table MODULOS (
   ID_MODULO            SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_MODULOS primary key (ID_MODULO)
);

/*==============================================================*/
/* Table: OCUPACIONES                                           */
/*==============================================================*/
create table OCUPACIONES (
   ID_OCUPACION         SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_OCUPACIONES primary key (ID_OCUPACION)
);

comment on table OCUPACIONES is
'Ocupaciones de tutores.';

/*==============================================================*/
/* Table: PAGINAS                                               */
/*==============================================================*/
create table PAGINAS (
   ID_PAGINA            SERIAL               not null,
   DIRECCION            D_VARCHAR120         not null,
   NOMBRE               D_VARCHAR60          not null,
   ID_MODULO            INT4                 not null,
   constraint PK_PAGINAS primary key (ID_PAGINA)
);

/*==============================================================*/
/* Table: PARENTESCOS                                           */
/*==============================================================*/
create table PARENTESCOS (
   ID_PARENTEZCO        SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_PARENTESCOS primary key (ID_PARENTEZCO)
);

/*==============================================================*/
/* Table: PERIODOS_LECTIVOS                                     */
/*==============================================================*/
create table PERIODOS_LECTIVOS (
   ID_PERIODO           SERIAL               not null,
   ANO                  D_INT2               not null,
   VIGENTE              D_VARCHAR60          not null,
   constraint PK_PERIODOS_LECTIVOS primary key (ID_PERIODO)
);

/*==============================================================*/
/* Table: PERMISOS                                              */
/*==============================================================*/
create table PERMISOS (
   ID_PAGINA            INT4                 not null,
   ID_GRUPO             INT4                 not null,
   LEER                 D_BOOLEAN            not null,
   INSERTAR             D_BOOLEAN            not null,
   EDITAR               D_BOOLEAN            not null,
   BORRAR               D_BOOLEAN            not null,
   constraint PK_PERMISOS primary key (ID_PAGINA, ID_GRUPO)
);

/*==============================================================*/
/* Table: TIPOS_EDUCACION                                       */
/*==============================================================*/
create table TIPOS_EDUCACION (
   ID_TIPO              SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_TIPOS_EDUCACION primary key (ID_TIPO)
);

/*==============================================================*/
/* Table: TURNOS                                                */
/*==============================================================*/
create table TURNOS (
   ID_TURNO             SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_TURNOS primary key (ID_TURNO)
);

/*==============================================================*/
/* Table: TURNOS_ESCUELAS                                       */
/*==============================================================*/
create table TURNOS_ESCUELAS (
   ID_ESCUELA           INT4                 not null,
   ID_TURNO             INT4                 not null,
   DESDE                D_TIME               not null,
   HASTA                D_TIME               not null,
   constraint PK_TURNOS_ESCUELAS primary key (ID_ESCUELA, ID_TURNO)
);

/*==============================================================*/
/* Table: TUTORES                                               */
/*==============================================================*/
create table TUTORES (
   ID_TUTOR             SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   APELLIDO             D_VARCHAR60          not null,
   NRO_DOCUMENTO        D_VARCHAR15          not null,
   TIPO_DOCUMENTO       D_CHAR1              not null,
   FECHA_NACIMIENTO     D_DATE               not null,
   DIRECCION            D_VARCHAR300         not null,
   ID_BARRIO            D_INT4               not null,
   SEXO                 D_CHAR1              not null,
   TELEFONO_PARTICULAR  D_VARCHAR15          not null,
   EMAIL_PARTICULAR     D_VARCHAR60          not null,
   EMPRESA_TRABAJO      D_VARCHAR60          not null,
   DIRECCION_LABORAL    D_VARCHAR300         not null,
   EMAIL_ABORAL         D_VARCHAR60          not null,
   FECHA_REGISTRO       D_TIMESTAMP          not null,
   constraint PK_TUTORES primary key (ID_TUTOR)
);

/*==============================================================*/
/* Table: TUTORESALUMNOS                                        */
/*==============================================================*/
create table TUTORESALUMNOS (
   ID_ALUMNO            D_INT4               not null,
   ID_TUTOR             D_INT4               not null,
   ID_PARENTEZCO        D_INT4               not null,
   constraint PK_TUTORESALUMNOS primary key (ID_ALUMNO, ID_TUTOR)
);

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS (
   ID_USUARIO           SERIAL               not null,
   NICK                 D_VARCHAR15          not null,
   CLAVE                D_VARCHAR60          not null,
   ID_GRUPO             INT4                 not null,
   ID_empleado          INT4                 not null,
   ID_INSTITUCION       INT4                 not null,
   constraint PK_USUARIOS primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: USUARIOS_GRUPOS                                       */
/*==============================================================*/
create table USUARIOS_GRUPOS (
   ID_GRUPO             SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_USUARIOS_GRUPOS primary key (ID_GRUPO)
);

alter table BARRIOS
   add constraint FK_BARRIOS_REFERENCE_CIUDADES foreign key (ID_CIUDAD)
      references CIUDADES (ID_CIUDAD)
      on delete restrict on update restrict;

alter table CIUDADES
   add constraint FK_CIUDADES_REFERENCE_DEPARTAM foreign key (ID_departamentos)
      references DEPARTAMENTOS (ID_departamentos)
      on delete restrict on update restrict;

alter table CURSOS
   add constraint FK_CURSOS_REFERENCE_ESCUELAS foreign key (ID_ESCUELA)
      references ESCUELAS (ID_ESCUELA)
      on delete restrict on update restrict;

alter table CURSOS
   add constraint FK_CURSOS_REFERENCE_TIPOS_ED foreign key (ID_TIPO)
      references TIPOS_EDUCACION (ID_TIPO)
      on delete restrict on update restrict;

alter table CURSOS
   add constraint FK_CURSOS_REFERENCE_TURNOS foreign key (ID_TURNO)
      references TURNOS (ID_TURNO)
      on delete restrict on update restrict;

alter table ESCUELAS
   add constraint FK_ESCUELAS_REFERENCE_BARRIOS foreign key (ID_BARRIO)
      references BARRIOS (ID_BARRIO)
      on delete restrict on update restrict;

alter table FUNCIONARIOS
   add constraint FK_FUNCIONA_REFERENCE_CARGOS foreign key (ID_CARGO)
      references CARGOS (ID_CARGO)
      on delete restrict on update restrict;

alter table INSCRIPCIONES
   add constraint FK_INSCRIPC_REFERENCE_OCUPACIO1 foreign key (ID_OCUPACION_TUTOR1)
      references OCUPACIONES (ID_OCUPACION)
      on delete restrict on update restrict;

alter table INSCRIPCIONES
   add constraint FK_INSCRIPC_REFERENCE_OCUPACIO2 foreign key (ID_OCUPACION_TUTOR2)
      references OCUPACIONES (ID_OCUPACION)
      on delete restrict on update restrict;

alter table INSCRIPCIONES
   add constraint FK_INSCRIPC_REFERENCE_USUARIOS foreign key (ID_USUARIO)
      references USUARIOS (ID_USUARIO)
      on delete restrict on update restrict;

alter table INSCRIPCIONES
   add constraint FK_INSCRIPC_REFERENCE_PERIODOS foreign key (ID_PERIODO)
      references PERIODOS_LECTIVOS (ID_PERIODO)
      on delete restrict on update restrict;

alter table INSCRIPCIONES
   add constraint FK_INSCRIPC_REFERENCE_TURNOS foreign key (ID_TURNO)
      references TURNOS (ID_TURNO)
      on delete restrict on update restrict;

alter table INSCRIPCIONES
   add constraint FK_INSCRIPC_REFERENCE_TUTORES2 foreign key (ID_TUTOR1)
      references TUTORES (ID_TUTOR)
      on delete restrict on update restrict;

alter table INSCRIPCIONES
   add constraint FK_INSCRIPC_REFERENCE_TUTORES1 foreign key (ID_TUTOR2)
      references TUTORES (ID_TUTOR)
      on delete restrict on update restrict;

alter table PAGINAS
   add constraint FK_PAGINAS_REFERENCE_MODULOS foreign key (ID_MODULO)
      references MODULOS (ID_MODULO)
      on delete restrict on update restrict;

alter table PERMISOS
   add constraint FK_PERMISOS_REFERENCE_PAGINAS foreign key (ID_PAGINA)
      references PAGINAS (ID_PAGINA)
      on delete restrict on update restrict;

alter table PERMISOS
   add constraint FK_PERMISOS_REFERENCE_USUARIOS foreign key (ID_GRUPO)
      references USUARIOS_GRUPOS (ID_GRUPO)
      on delete restrict on update restrict;

alter table TURNOS_ESCUELAS
   add constraint FK_TURNOS_E_REFERENCE_ESCUELAS foreign key (ID_ESCUELA)
      references ESCUELAS (ID_ESCUELA)
      on delete cascade on update restrict;

alter table TURNOS_ESCUELAS
   add constraint FK_TURNOS_E_REFERENCE_TURNOS foreign key (ID_TURNO)
      references TURNOS (ID_TURNO)
      on delete cascade on update restrict;

alter table TUTORESALUMNOS
   add constraint FK_TUTORESA_REFERENCE_PARENTES foreign key (ID_PARENTEZCO)
      references PARENTESCOS (ID_PARENTEZCO)
      on delete restrict on update restrict;

alter table TUTORESALUMNOS
   add constraint FK_TUTORESA_REFERENCE_ALUMNOS foreign key (ID_ALUMNO)
      references ALUMNOS (ID_ALUMNO)
      on delete cascade on update restrict;

alter table TUTORESALUMNOS
   add constraint FK_TUTORESA_REFERENCE_TUTORES foreign key (ID_TUTOR)
      references TUTORES (ID_TUTOR)
      on delete restrict on update restrict;

alter table USUARIOS
   add constraint FK_USUARIOS_REFERENCE_USUARIOS foreign key (ID_GRUPO)
      references USUARIOS_GRUPOS (ID_GRUPO)
      on delete restrict on update restrict;

alter table USUARIOS
   add constraint FK_USUARIOS_REFERENCE_FUNCIONA foreign key (ID_empleado)
      references FUNCIONARIOS (ID_empleado)
      on delete restrict on update restrict;

alter table USUARIOS
   add constraint FK_USUARIOS_REFERENCE_ESCUELAS foreign key (ID_INSTITUCION)
      references ESCUELAS (ID_ESCUELA)
      on delete restrict on update restrict;

