/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     3/05/2023 6:59:42 p. m.                      */
/*==============================================================*/


alter table ACTIVIDAD
   drop constraint FK_ACTIVIDA_PARTICIPA_PARTICIP;

alter table ACTIVIDAD
   drop constraint FK_ACTIVIDA_REALIZA_EMPLEADO;

alter table ACTIVIDAD
   drop constraint FK_ACTIVIDA_SE_RELACI_OBRA;

alter table EMPLEADO
   drop constraint FK_EMPLEADO_TIENE_EL__CARGO;

alter table PARTICIPANTE
   drop constraint FK_PARTICIP_PARTICIPA_ESTUDIAN;

alter table SOLICITUD
   drop constraint FK_SOLICITU_SOLICITA_EMPLEADO;

drop index PARTICIPA_EN_FK;

drop index SE_RELACIONAN_CON_FK;

drop index REALIZA_FK;

drop table ACTIVIDAD cascade constraints;

drop table CARGO cascade constraints;

drop index TIENE_EL_CARGO_FK;

drop table EMPLEADO cascade constraints;

drop table ESTUDIANTE cascade constraints;

drop table OBRA cascade constraints;

drop index PARTICIPA_COMO_FK;

drop table PARTICIPANTE cascade constraints;

drop index SOLICITA_FK;

drop table SOLICITUD cascade constraints;

/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
create table ACTIVIDAD (
   N_ACTIVIDAD          NUMBER                not null,
   CODIGO               VARCHAR2(10)          not null,
   TITULO               VARCHAR2(40),
   ID_PARTICIPANTE      VARCHAR2(40)          not null,
   NOMBRE_ACTIVIDAD     VARCHAR2(20)          not null,
   DETALLE_ACTIVIDAD    VARCHAR2(1024)        not null,
   DURACION             DATE                  not null,
   FECHA                DATE                  not null,
   constraint PK_ACTIVIDAD primary key (N_ACTIVIDAD)
);

/*==============================================================*/
/* Index: REALIZA_FK                                            */
/*==============================================================*/
create index REALIZA_FK on ACTIVIDAD (
   CODIGO ASC
);

/*==============================================================*/
/* Index: SE_RELACIONAN_CON_FK                                  */
/*==============================================================*/
create index SE_RELACIONAN_CON_FK on ACTIVIDAD (
   TITULO ASC
);

/*==============================================================*/
/* Index: PARTICIPA_EN_FK                                       */
/*==============================================================*/
create index PARTICIPA_EN_FK on ACTIVIDAD (
   ID_PARTICIPANTE ASC
);

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
   CODIGO               NUMBER                not null,
   NOMBRE               VARCHAR2(1024)        not null,
   SALARIO              NUMBER                not null,
   DETALLE              VARCHAR2(1024)        not null,
   constraint PK_CARGO primary key (CODIGO)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   CODIGO               VARCHAR2(10)          not null,
   CAR_CODIGO           NUMBER                not null,
   NOMBRE               VARCHAR2(10)          not null,
   APELLIDO             VARCHAR2(10)          not null,
   constraint PK_EMPLEADO primary key (CODIGO)
);

/*==============================================================*/
/* Index: TIENE_EL_CARGO_FK                                     */
/*==============================================================*/
create index TIENE_EL_CARGO_FK on EMPLEADO (
   CAR_CODIGO ASC
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE (
   CODIGO               VARCHAR2(10)          not null,
   NOMBRE               VARCHAR2(20)          not null,
   APELLIDO             VARCHAR2(20)          not null,
   FECHA_NACIMIENTO     DATE                  not null,
   PROYECTO_CURRICULAR  VARCHAR2(20)          not null,
   DOCUMENTO            VARCHAR2(10)          not null,
   TIPO_DE_DOCUMENTO    VARCHAR2(4)           not null,
   CORREO_PERSONAL      VARCHAR2(100),
   CORREO_INSTITUCIONAL VARCHAR2(40)          not null,
   CELULAR              VARCHAR2(14),
   constraint PK_ESTUDIANTE primary key (CODIGO)
);

/*==============================================================*/
/* Table: OBRA                                                  */
/*==============================================================*/
create table OBRA (
   TITULO               VARCHAR2(40)          not null,
   AUTOR                VARCHAR2(40)          not null,
   ANO_CREACION         DATE                  not null,
   PAIS_DE_REGISTRO     VARCHAR2(20)          not null,
   PRIMERA_PRESENTACION DATE                  not null,
   DURACION             DATE                  not null,
   constraint PK_OBRA primary key (TITULO)
);

/*==============================================================*/
/* Table: PARTICIPANTE                                          */
/*==============================================================*/
create table PARTICIPANTE (
   ID_PARTICIPANTE      VARCHAR2(40)          not null,
   CODIGO               VARCHAR2(10)          not null,
   INSTRUMENTO          VARCHAR2(20)          not null,
   SEMESTRE             NUMBER                not null,
   ESTADO               VARCHAR2(3)           not null,
   constraint PK_PARTICIPANTE primary key (ID_PARTICIPANTE)
);

/*==============================================================*/
/* Index: PARTICIPA_COMO_FK                                     */
/*==============================================================*/
create index PARTICIPA_COMO_FK on PARTICIPANTE (
   CODIGO ASC
);

/*==============================================================*/
/* Table: SOLICITUD                                             */
/*==============================================================*/
create table SOLICITUD (
   CODIGO               NUMBER                not null,
   EMP_CODIGO           VARCHAR2(10)          not null,
   DETALLE              VARCHAR2(1024)        not null,
   FECHA_DE_PETICION    DATE                  not null,
   ESTADO               VARCHAR2(3)           not null,
   constraint PK_SOLICITUD primary key (CODIGO)
);

/*==============================================================*/
/* Index: SOLICITA_FK                                           */
/*==============================================================*/
create index SOLICITA_FK on SOLICITUD (
   EMP_CODIGO ASC
);

alter table ACTIVIDAD
   add constraint FK_ACTIVIDA_PARTICIPA_PARTICIP foreign key (ID_PARTICIPANTE)
      references PARTICIPANTE (ID_PARTICIPANTE);

alter table ACTIVIDAD
   add constraint FK_ACTIVIDA_REALIZA_EMPLEADO foreign key (CODIGO)
      references EMPLEADO (CODIGO);

alter table ACTIVIDAD
   add constraint FK_ACTIVIDA_SE_RELACI_OBRA foreign key (TITULO)
      references OBRA (TITULO);

alter table EMPLEADO
   add constraint FK_EMPLEADO_TIENE_EL__CARGO foreign key (CAR_CODIGO)
      references CARGO (CODIGO);

alter table PARTICIPANTE
   add constraint FK_PARTICIP_PARTICIPA_ESTUDIAN foreign key (CODIGO)
      references ESTUDIANTE (CODIGO);

alter table SOLICITUD
   add constraint FK_SOLICITU_SOLICITA_EMPLEADO foreign key (EMP_CODIGO)
      references EMPLEADO (CODIGO);

