/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     3/8/2022 01:30:11                            */
/*==============================================================*/


drop table ALUMNOS;

drop table AULAS;

drop table AULASXCURSOS;

drop table BARRIOS;

drop table CAPACIDADES;

drop table CARGOS;

drop table CIUDADES;

drop table CONTENIDOS;

drop table CURSOS;

drop table CURSOSPLANIFICACION;

drop table CURSOS_TURNOS;

drop table DEPARTAMENTOS;

drop table empleado;

drop table EXAMENES;

drop table EXAMENES_CONTENIDOS;

drop table FERIADOS;

drop table INSCRIPCIONES;

drop table INSCRIPCIONES_DETALLES;

drop table INSTITUCIONES;

drop table MATERIAS;

drop table MODALIDADES;

drop table NIVELES;

drop table PARENTESCOS;

drop table PERIODOS_ACADEMICOS;

drop table RECURSOS;

drop table RECURSOSXCONTENIDO;

drop table REQUISITOS_DETALLES;

drop table REQUISITO_INSCRIPCION;

drop table TURNOS;

drop table TUTORES;

drop table TUTORESALUMNOS;

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
/* Table: AULAS                                                 */
/*==============================================================*/
create table AULAS (
   ID_AULA              SERIAL               not null,
   ID_INSTITUCION       D_INT2               not null,
   NOMBRE               D_VARCHAR60          not null,
   ESTADO               D_CHAR1              not null,
   constraint PK_AULAS primary key (ID_AULA)
);

/*==============================================================*/
/* Table: AULASXCURSOS                                          */
/*==============================================================*/
create table AULASXCURSOS (
   ID_AULA_CURSO        SERIAL               not null,
   ID_PERIODO           INT4                 not null,
   ID_CURSO             INT4                 not null,
   ID_AULA              INT4                 not null,
   ID_TURNO             INT4                 not null,
   ID_PROFESOR          INT4                 not null,
   constraint PK_AULASXCURSOS primary key (ID_AULA_CURSO)
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
/* Table: CAPACIDADES                                           */
/*==============================================================*/
create table CAPACIDADES (
   ID_CAPACIDAD         SERIAL               not null,
   ID_CONTENIDO         INT4                 not null,
   NOMBRE               D_VARCHAR60          not null,
   DESCRIPCION          D_VARCHAR300         not null,
   constraint PK_CAPACIDADES primary key (ID_CAPACIDAD)
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
/* Table: CONTENIDOS                                            */
/*==============================================================*/
create table CONTENIDOS (
   ID_CONTENIDO         SERIAL               not null,
   ID_MATERIA           INT4                 not null,
   NOMBRE               D_VARCHAR60          not null,
   DESCRIPCION          D_VARCHAR300         not null,
   FECHA_DESARROLLO     D_DATE               null,
   constraint PK_CONTENIDOS primary key (ID_CONTENIDO)
);

/*==============================================================*/
/* Table: CURSOS                                                */
/*==============================================================*/
create table CURSOS (
   ID_CURSO             SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   ID_INSTITUCION       D_INT4               not null,
   ID_MODALIDAD         D_INT4               not null,
   ID_NIVEL             INT4                 not null,
   ID_CURSO_ANTERIOR    INT4                 null,
   VIGENTE              D_CHAR1              not null,
   constraint PK_CURSOS primary key (ID_CURSO)
);

comment on table CURSOS is
'vigente: si/no';

/*==============================================================*/
/* Table: CURSOSPLANIFICACION                                   */
/*==============================================================*/
create table CURSOSPLANIFICACION (
   ID_CALENDARIO        SERIAL               not null,
   ID_AULA_CURSO        INT4                 not null,
   DIA                  D_INT2               not null,
   MES                  D_INT2               not null,
   DESDE                D_TIME               not null,
   HASTA                D_TIME               not null,
   OBSERVACION          D_VARCHAR60          null,
   constraint PK_CURSOSPLANIFICACION primary key (ID_CALENDARIO)
);

comment on table CURSOSPLANIFICACION is
'dias: 1-domingo, 2-lunes, 3-martes, 4-mi�rcoles, 5-jueves, 6-viernes, 7-sabado';

/*==============================================================*/
/* Table: CURSOS_TURNOS                                         */
/*==============================================================*/
create table CURSOS_TURNOS (
   ID_CURSO             INT4                 not null,
   ID_TURNO             INT4                 not null,
   SECCION              D_CHAR1              not null,
   constraint PK_CURSOS_TURNOS primary key (ID_CURSO, ID_TURNO)
);

/*==============================================================*/
/* Table: DEPARTAMENTOS                                         */
/*==============================================================*/
create table DEPARTAMENTOS (
   ID_departamentos              SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_DEPARTAMENTOS primary key (ID_departamentos)
);

/*==============================================================*/
/* Table: empleado                                             */
/*==============================================================*/
create table empleado (
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
   constraint PK_empleado primary key (ID_empleado)
);

/*==============================================================*/
/* Table: EXAMENES                                              */
/*==============================================================*/
create table EXAMENES (
   ID_EXAMEN            SERIAL               not null,
   ID_CURSO             INT4                 not null,
   ID_MATERIA           INT4                 not null,
   FECHA                D_DATE               not null,
   constraint PK_EXAMENES primary key (ID_EXAMEN)
);

/*==============================================================*/
/* Table: EXAMENES_CONTENIDOS                                   */
/*==============================================================*/
create table EXAMENES_CONTENIDOS (
   ID_EXAMEN            INT4                 not null,
   ID_CONTENIDO         INT4                 not null,
   constraint PK_EXAMENES_CONTENIDOS primary key (ID_EXAMEN)
);

/*==============================================================*/
/* Table: FERIADOS                                              */
/*==============================================================*/
create table FERIADOS (
   ID_FERIADO           SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   DIA                  D_INT2               not null,
   MES                  D_INT2               not null,
   VIGENTE              D_CHAR1              not null,
   constraint PK_FERIADOS primary key (ID_FERIADO)
);

comment on table FERIADOS is
'Tabla Libre, no necesita relacionarse con ninguna otra, se consulta directo.';

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
   ID_TUTOR2            INT4                 null,
   TIEMPO_EN_FAMILIA    D_INT2               null,
   FECHA_INSCRIPCION    D_TIMESTAMP          null,
   constraint PK_INSCRIPCIONES primary key (ID_INSCRIPCION)
);

comment on table INSCRIPCIONES is
'Tutor1 y Tutor2 representan a padre y madre del formulario';

/*==============================================================*/
/* Table: INSCRIPCIONES_DETALLES                                */
/*==============================================================*/
create table INSCRIPCIONES_DETALLES (
   ID_INSCRIPCION       INT4                 not null,
   TIPO_DOCUMENTO       D_CHAR1              not null,
   IMAGEN_DOCUMENTO     BYTEA                not null,
   constraint PK_INSCRIPCIONES_DETALLES primary key (ID_INSCRIPCION, TIPO_DOCUMENTO)
);

comment on table INSCRIPCIONES_DETALLES is
'CI, Pasaporte, Certificado Nacimiento';

/*==============================================================*/
/* Table: INSTITUCIONES                                         */
/*==============================================================*/
create table INSTITUCIONES (
   ID_INSTITUCION       SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   DIRECCION            D_VARCHAR120         not null,
   ID_BARRIO            D_INT4               not null,
   TELEFONO             D_VARCHAR15          not null,
   EMAIL                D_VARCHAR60          not null,
   CORREO               D_VARCHAR15          not null,
   TIPO                 D_CHAR1              not null,
   constraint PK_INSTITUCIONES primary key (ID_INSTITUCION)
);

comment on table INSTITUCIONES is
'tipo: privado, p�blico';

/*==============================================================*/
/* Table: MATERIAS                                              */
/*==============================================================*/
create table MATERIAS (
   ID_MATERIA           SERIAL               not null,
   ID_CURSO             D_INT2               not null,
   NOMBRE               D_VARCHAR60          not null,
   OBSERVACION          D_VARCHAR300         null,
   ESTADO               D_CHAR1              not null,
   constraint PK_MATERIAS primary key (ID_MATERIA)
);

/*==============================================================*/
/* Table: MODALIDADES                                           */
/*==============================================================*/
create table MODALIDADES (
   ID_MODALIDAD         SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_MODALIDADES primary key (ID_MODALIDAD)
);

comment on table MODALIDADES is
'EI, EEB, EM, AA';

/*==============================================================*/
/* Table: NIVELES                                               */
/*==============================================================*/
create table NIVELES (
   ID_NIVEL             SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_NIVELES primary key (ID_NIVEL)
);

comment on table NIVELES is
'Primario, Secundario, Terciario';

/*==============================================================*/
/* Table: PARENTESCOS                                           */
/*==============================================================*/
create table PARENTESCOS (
   ID_PARENTEZCO        SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   constraint PK_PARENTESCOS primary key (ID_PARENTEZCO)
);

/*==============================================================*/
/* Table: PERIODOS_ACADEMICOS                                   */
/*==============================================================*/
create table PERIODOS_ACADEMICOS (
   ID_PERIODO           SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   VIGENTE              D_VARCHAR60          not null,
   constraint PK_PERIODOS_ACADEMICOS primary key (ID_PERIODO)
);

/*==============================================================*/
/* Table: RECURSOS                                              */
/*==============================================================*/
create table RECURSOS (
   ID_RECURSO           SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   DESCRIPCION          D_VARCHAR300         not null,
   constraint PK_RECURSOS primary key (ID_RECURSO)
);

/*==============================================================*/
/* Table: RECURSOSXCONTENIDO                                    */
/*==============================================================*/
create table RECURSOSXCONTENIDO (
   ID_CONTENIDO         INT4                 not null,
   ID_RECURSO           INT4                 not null,
   constraint PK_RECURSOSXCONTENIDO primary key (ID_RECURSO, ID_CONTENIDO)
);

/*==============================================================*/
/* Table: REQUISITOS_DETALLES                                   */
/*==============================================================*/
create table REQUISITOS_DETALLES (
   ID_REQUISITO         D_INT4               not null,
   ITEM                 D_INT4               not null,
   REQUISITO            D_VARCHAR300         not null,
   constraint PK_REQUISITOS_DETALLES primary key (ID_REQUISITO, ITEM)
);

/*==============================================================*/
/* Table: REQUISITO_INSCRIPCION                                 */
/*==============================================================*/
create table REQUISITO_INSCRIPCION (
   ID_REQUISITO         D_INT4               not null,
   ID_INSTITUCION       D_INT4               not null,
   ID_PERIODO           INT4                 not null,
   FECHA_DESDE          D_DATE               not null,
   FECHA_HASTA          D_DATE               not null,
   FECHA_REGISTRO       D_DATE               not null,
   constraint PK_REQUISITO_INSCRIPCION primary key (ID_REQUISITO)
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

alter table AULASXCURSOS
   add constraint FK_AULASXCU_REFERENCE_PERIODOS foreign key (ID_PERIODO)
      references PERIODOS_ACADEMICOS (ID_PERIODO)
      on delete restrict on update restrict;

alter table AULASXCURSOS
   add constraint FK_AULASXCU_REFERENCE_CURSOS foreign key (ID_CURSO)
      references CURSOS (ID_CURSO)
      on delete restrict on update restrict;

alter table AULASXCURSOS
   add constraint FK_AULASXCU_REFERENCE_AULAS foreign key (ID_AULA)
      references AULAS (ID_AULA)
      on delete restrict on update restrict;

alter table AULASXCURSOS
   add constraint FK_AULASXCU_REFERENCE_TURNOS foreign key (ID_TURNO)
      references TURNOS (ID_TURNO)
      on delete restrict on update restrict;

alter table AULASXCURSOS
   add constraint FK_AULASXCU_REFERENCE_empleado foreign key (ID_PROFESOR)
      references empleado (ID_empleado)
      on delete restrict on update restrict;

alter table BARRIOS
   add constraint FK_BARRIOS_REFERENCE_CIUDADES foreign key (ID_CIUDAD)
      references CIUDADES (ID_CIUDAD)
      on delete restrict on update restrict;

alter table CAPACIDADES
   add constraint FK_CAPACIDA_REFERENCE_CONTENID foreign key (ID_CONTENIDO)
      references CONTENIDOS (ID_CONTENIDO)
      on delete restrict on update restrict;

alter table CIUDADES
   add constraint FK_CIUDADES_REFERENCE_DEPARTAM foreign key (ID_departamentos)
      references DEPARTAMENTOS (ID_departamentos)
      on delete restrict on update restrict;

alter table CONTENIDOS
   add constraint FK_CONTENID_REFERENCE_MATERIAS foreign key (ID_MATERIA)
      references MATERIAS (ID_MATERIA)
      on delete restrict on update restrict;

alter table CURSOS
   add constraint FK_CURSOS_REFERENCE_NIVELES foreign key (ID_NIVEL)
      references NIVELES (ID_NIVEL)
      on delete restrict on update restrict;

alter table CURSOS
   add constraint FK_CURSOS_REFERENCE_MODALIDA foreign key (ID_MODALIDAD)
      references MODALIDADES (ID_MODALIDAD)
      on delete restrict on update restrict;

alter table CURSOS
   add constraint FK_CURSOS_REFERENCE_CURSOS foreign key (ID_CURSO_ANTERIOR)
      references CURSOS (ID_CURSO)
      on delete restrict on update restrict;

alter table CURSOS
   add constraint FK_CURSOS_REFERENCE_INSTITUC foreign key (ID_INSTITUCION)
      references INSTITUCIONES (ID_INSTITUCION)
      on delete restrict on update restrict;

alter table CURSOSPLANIFICACION
   add constraint FK_CURSOSPL_REFERENCE_AULASXCU foreign key (ID_AULA_CURSO)
      references AULASXCURSOS (ID_AULA_CURSO)
      on delete restrict on update restrict;

alter table CURSOS_TURNOS
   add constraint FK_CURSOS_T_REFERENCE_TURNOS foreign key (ID_TURNO)
      references TURNOS (ID_TURNO)
      on delete restrict on update restrict;

alter table CURSOS_TURNOS
   add constraint FK_CURSOS_T_REFERENCE_CURSOS foreign key (ID_CURSO)
      references CURSOS (ID_CURSO)
      on delete cascade on update restrict;

alter table empleado
   add constraint FK_empleado_REFERENCE_CARGOS foreign key (ID_CARGO)
      references CARGOS (ID_CARGO)
      on delete restrict on update restrict;

alter table EXAMENES
   add constraint FK_EXAMENES_REFERENCE_CURSOS foreign key (ID_CURSO)
      references CURSOS (ID_CURSO)
      on delete restrict on update restrict;

alter table EXAMENES
   add constraint FK_EXAMENES_REFERENCE_MATERIAS foreign key (ID_MATERIA)
      references MATERIAS (ID_MATERIA)
      on delete cascade on update restrict;

alter table EXAMENES_CONTENIDOS
   add constraint FK_EXAMENES_REFERENCE_EXAMENES foreign key (ID_EXAMEN)
      references EXAMENES (ID_EXAMEN)
      on delete restrict on update restrict;

alter table EXAMENES_CONTENIDOS
   add constraint FK_EXAMENES_REFERENCE_CONTENID foreign key (ID_CONTENIDO)
      references CONTENIDOS (ID_CONTENIDO)
      on delete restrict on update restrict;

alter table INSCRIPCIONES
   add constraint FK_INSCRIPC_REFERENCE_PERIODOS foreign key (ID_PERIODO)
      references PERIODOS_ACADEMICOS (ID_PERIODO)
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

alter table INSCRIPCIONES_DETALLES
   add constraint FK_INSCRIPC_REFERENCE_INSCRIPC foreign key (ID_INSCRIPCION)
      references INSCRIPCIONES (ID_INSCRIPCION)
      on delete restrict on update restrict;

alter table INSTITUCIONES
   add constraint FK_INSTITUC_REFERENCE_BARRIOS foreign key (ID_BARRIO)
      references BARRIOS (ID_BARRIO)
      on delete restrict on update restrict;

alter table MATERIAS
   add constraint FK_MATERIAS_REFERENCE_CURSOS foreign key (ID_CURSO)
      references CURSOS (ID_CURSO)
      on delete restrict on update restrict;

alter table RECURSOSXCONTENIDO
   add constraint FK_RECURSOS_REFERENCE_RECURSOS foreign key (ID_RECURSO)
      references RECURSOS (ID_RECURSO)
      on delete restrict on update restrict;

alter table RECURSOSXCONTENIDO
   add constraint FK_RECURSOS_REFERENCE_CONTENID foreign key (ID_CONTENIDO)
      references CONTENIDOS (ID_CONTENIDO)
      on delete restrict on update restrict;

alter table REQUISITOS_DETALLES
   add constraint FK_REQUISIT_REFERENCE_REQUISIT foreign key (ID_REQUISITO)
      references REQUISITO_INSCRIPCION (ID_REQUISITO)
      on delete restrict on update restrict;

alter table REQUISITO_INSCRIPCION
   add constraint FK_REQUISIT_REFERENCE_PERIODOS foreign key (ID_PERIODO)
      references PERIODOS_ACADEMICOS (ID_PERIODO)
      on delete restrict on update restrict;

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

