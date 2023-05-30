/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     22/05/2023 12:39:47 a. m.                    */
/*==============================================================*/


alter table CALENDARIO
   drop constraint FK_CALENDAR_RELATIONS_ESTADO;

alter table CALENDARIO
   drop constraint FK_CALENDAR_RELATIONS_TIPOCALE;

alter table CALENDARIO
   drop constraint FK_CALENDAR_RELATIONS_OBRA;

alter table COMPOSITOR
   drop constraint FK_COMPOSIT_RELATIONS_PAIS;

alter table CONVOCATORIAESTUDIANTE
   drop constraint FK_CONVOCAT_RELATIONS_ESTUDIAN;

alter table CONVOCATORIAESTUDIANTE
   drop constraint FK_CONVOCAT_RELATIONS_OBRA;

alter table CONVOCATORIAESTUDIANTE
   drop constraint FK_CONVOCAT_RELATIONS_INSTRUME;

alter table EMPLEADO
   drop constraint FK_EMPLEADO_RELATIONS_ROL;

alter table EMPLEADO
   drop constraint FK_EMPLEADO_RELATIONS_UNIDAD;

alter table ESTUDIANTE
   drop constraint FK_ESTUDIAN_RELATIONS_UNIDAD;

alter table GASTOOBRA
   drop constraint FK_GASTOOBR_RELATIONS_OBRA;

alter table GASTOOBRA
   drop constraint FK_GASTOOBR_RELATIONS_LISTAGAS;

alter table INVENTARIOINSTRUMENTO
   drop constraint FK_INVENTAR_RELATIONS_ESTADOIN;

alter table INVENTARIOINSTRUMENTO
   drop constraint FK_INVENTAR_RELATIONS_INSTRUME;

alter table LABORPERSONALOBRA
   drop constraint FK_LABORPER_RELATIONS_LISTAACT;

alter table LABORPERSONALOBRA
   drop constraint FK_LABORPER_RELATIONS_PERSONAL;

alter table LABORPERSONALOBRA
   drop constraint FK_LABORPER_RELATIONS_CALENDAR;

alter table LISTAACTIVIDADUD
   drop constraint FK_LISTAACT_RELATIONS_PERIODO;

alter table LISTAGASTOUD
   drop constraint FK_LISTAGAS_RELATIONS_PERIODO;

alter table OBRA
   drop constraint FK_OBRA_RELATIONS_GENEROOB;

alter table OBRA
   drop constraint FK_OBRA_RELATIONS_PAIS;

alter table OBRA
   drop constraint FK_OBRA_RELATIONS_PERIODO;

alter table OBRA
   drop constraint FK_OBRA_RELATIONS_COMPOSIT;

alter table PARTICIPACIONESTUDIANTE
   drop constraint FK_PARTICIP_RELATIONS_CALENDAR;

alter table PARTICIPACIONESTUDIANTE
   drop constraint FK_PARTICIP_RELATIONS_ESTUDIAN;

alter table PERSONALOBRA
   drop constraint FK_PERSONAL_RELATIONS_OBRA;

alter table PERSONALOBRA
   drop constraint FK_PERSONAL_RELATIONS_EMPLEADO;

alter table RELATIONSHIP_24
   drop constraint FK_RELATION_RELATIONS_INSTRUME;

alter table RELATIONSHIP_24
   drop constraint FK_RELATION_RELATIONS_OBRA;

alter table UNIDAD
   drop constraint FK_UNIDAD_RELATIONS_UNIDAD;

alter table UNIDAD
   drop constraint FK_UNIDAD_RELATIONS_TIPOUNID;

drop index RELATIONSHIP_16_FK;

drop index RELATIONSHIP_15_FK;

drop index RELATIONSHIP_13_FK;

drop table CALENDARIO cascade constraints;

drop index RELATIONSHIP_3_FK;

drop table COMPOSITOR cascade constraints;

drop index RELATIONSHIP_31_FK;

drop index RELATIONSHIP_23_FK;

drop index RELATIONSHIP_19_FK;

drop table CONVOCATORIAESTUDIANTE cascade constraints;

drop index RELATIONSHIP_33_FK;

drop index RELATIONSHIP_30_FK;

drop table EMPLEADO cascade constraints;

drop table ESTADO cascade constraints;

drop table ESTADOINSTRUMENTO cascade constraints;

drop index RELATIONSHIP_20_FK;

drop table ESTUDIANTE cascade constraints;

drop index RELATIONSHIP_6_FK;

drop index RELATIONSHIP_5_FK;

drop table GASTOOBRA cascade constraints;

drop table GENEROOBRA cascade constraints;

drop table INSTRUMENTO cascade constraints;

drop index RELATIONSHIP_32_FK;

drop index RELATIONSHIP_26_FK;

drop table INVENTARIOINSTRUMENTO cascade constraints;

drop index RELATIONSHIP_14_FK;

drop index RELATIONSHIP_11_FK;

drop index RELATIONSHIP_10_FK;

drop table LABORPERSONALOBRA cascade constraints;

drop index RELATIONSHIP_8_FK;

drop table LISTAACTIVIDADUD cascade constraints;

drop index RELATIONSHIP_7_FK;

drop table LISTAGASTOUD cascade constraints;

drop index RELATIONSHIP_27_FK;

drop index RELATIONSHIP_4_FK;

drop index RELATIONSHIP_2_FK;

drop index RELATIONSHIP_1_FK;

drop table OBRA cascade constraints;

drop table PAIS cascade constraints;

drop index RELATIONSHIP_18_FK;

drop index RELATIONSHIP_17_FK;

drop table PARTICIPACIONESTUDIANTE cascade constraints;

drop table PERIODO cascade constraints;

drop index RELATIONSHIP_29_FK;

drop index RELATIONSHIP_28_FK;

drop table PERSONALOBRA cascade constraints;

drop index RELATIONSHIP_25_FK;

drop index RELATIONSHIP_24_FK;

drop table RELATIONSHIP_24 cascade constraints;

drop table ROL cascade constraints;

drop table TIPOCALENDARIO cascade constraints;

drop table TIPOUNIDAD cascade constraints;

drop index RELATIONSHIP_22_FK;

drop index RELATIONSHIP_21_FK;

drop table UNIDAD cascade constraints;

/*==============================================================*/
/* Table: CALENDARIO                                            */
/*==============================================================*/
create table CALENDARIO (
   IDTIPOCALEN          VARCHAR2(2)           not null,
   IDOBRA               VARCHAR2(4)           not null,
   CONSECCALENDARIO     NUMBER(4,0)           not null,
   IDESTADO             VARCHAR2(10)          not null,
   FECHAINICIO          TIMESTAMP                  not null,
   FECHAFIN             TIMESTAMP                  not null,
   constraint PK_CALENDARIO primary key (IDTIPOCALEN, IDOBRA, CONSECCALENDARIO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_13_FK on CALENDARIO (
   IDESTADO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_15_FK on CALENDARIO (
   IDTIPOCALEN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_16_FK on CALENDARIO (
   IDOBRA ASC
);

/*==============================================================*/
/* Table: COMPOSITOR                                            */
/*==============================================================*/
create table COMPOSITOR (
   IDCOMPOSITOR         VARCHAR2(3)           not null,
   CODPAIS              VARCHAR2(3)           not null,
   NOMCOMPOSITOR        VARCHAR2(30)          not null,
   constraint PK_COMPOSITOR primary key (IDCOMPOSITOR)
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on COMPOSITOR (
   CODPAIS ASC
);

/*==============================================================*/
/* Table: CONVOCATORIAESTUDIANTE                                */
/*==============================================================*/
create table CONVOCATORIAESTUDIANTE (
   IDOBRA               VARCHAR2(4)           not null,
   CONSECESTUDIANTE     NUMBER(3,0)           not null,
   IDINSTRUMENTO        VARCHAR2(4)           not null,
   CODESTUDIANTE        VARCHAR2(10)          not null,
   FECHAINICIO          DATE                  not null,
   FECHAFIN             DATE                  not null,
   CALIFICACION         NUMBER(3,1)           not null,
   constraint PK_CONVOCATORIAESTUDIANTE primary key (IDOBRA, CONSECESTUDIANTE)
);

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_19_FK on CONVOCATORIAESTUDIANTE (
   CODESTUDIANTE ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_23_FK on CONVOCATORIAESTUDIANTE (
   IDOBRA ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_31_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_31_FK on CONVOCATORIAESTUDIANTE (
   IDINSTRUMENTO ASC
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ROL                  NUMBER(4)             not null,
   CODUNIDAD            VARCHAR2(5)           not null,
   ICODEMPLEADO         VARCHAR2(4)           not null,
   NOMBRE               VARCHAR2(30)          not null,
   APELLIDO             VARCHAR2(30)          not null,
   CEDULA               VARCHAR2(15)          not null,
   CORREO               VARCHAR2(40)          not null,
   constraint PK_EMPLEADO primary key (ROL, CODUNIDAD, ICODEMPLEADO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_30_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_30_FK on EMPLEADO (
   ROL ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_33_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_33_FK on EMPLEADO (
   CODUNIDAD ASC
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO (
   IDESTADO             VARCHAR2(10)          not null,
   constraint PK_ESTADO primary key (IDESTADO)
);

/*==============================================================*/
/* Table: ESTADOINSTRUMENTO                                     */
/*==============================================================*/
create table ESTADOINSTRUMENTO (
   IDESTADOINSTRUMENTO  VARCHAR2(3)           not null,
   DESCESTADOINSTRU     VARCHAR2(15)          not null,
   constraint PK_ESTADOINSTRUMENTO primary key (IDESTADOINSTRUMENTO)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE (
   CODESTUDIANTE        VARCHAR2(10)          not null,
   CODUNIDAD            VARCHAR2(5)           not null,
   NOMBRE               VARCHAR2(30)          not null,
   APELLIDO             VARCHAR2(30)          not null,
   FECHAINSCRIPCION     DATE                  not null,
   FECHANACIMIENTO      DATE                  not null,
   CORREO               VARCHAR2(40)          not null,
   constraint PK_ESTUDIANTE primary key (CODESTUDIANTE)
);

/*==============================================================*/
/* Index: RELATIONSHIP_20_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_20_FK on ESTUDIANTE (
   CODUNIDAD ASC
);

/*==============================================================*/
/* Table: GASTOOBRA                                             */
/*==============================================================*/
create table GASTOOBRA (
   IDPERIODO            NUMBER(4)             not null,
   CODGASTO             VARCHAR2(5)           not null,
   CONSEC               NUMBER(5,0)           not null,
   IDOBRA               VARCHAR2(4)           not null,
   FECHAGASTO           DATE                  not null,
   constraint PK_GASTOOBRA primary key (IDPERIODO, CODGASTO, CONSEC)
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on GASTOOBRA (
   IDOBRA ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on GASTOOBRA (
   IDPERIODO ASC,
   CODGASTO ASC
);

/*==============================================================*/
/* Table: GENEROOBRA                                            */
/*==============================================================*/
create table GENEROOBRA (
   IDGENEROOBRA         VARCHAR2(2)           not null,
   DESCGENERO           VARCHAR2(30)          not null,
   constraint PK_GENEROOBRA primary key (IDGENEROOBRA)
);

/*==============================================================*/
/* Table: INSTRUMENTO                                           */
/*==============================================================*/
create table INSTRUMENTO (
   IDINSTRUMENTO        VARCHAR2(4)           not null,
   NOMINSTRUMENTO       VARCHAR2(40)          not null,
   constraint PK_INSTRUMENTO primary key (IDINSTRUMENTO)
);

/*==============================================================*/
/* Table: INVENTARIOINSTRUMENTO                                 */
/*==============================================================*/
create table INVENTARIOINSTRUMENTO (
   CONSECINVENTARIO     NUMBER(4,0)           not null,
   IDESTADOINSTRUMENTO  VARCHAR2(3)           not null,
   IDINSTRUMENTO        VARCHAR2(4)           not null,
   FECHAINGRESO         DATE                  not null,
   constraint PK_INVENTARIOINSTRUMENTO primary key (CONSECINVENTARIO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_26_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_26_FK on INVENTARIOINSTRUMENTO (
   IDESTADOINSTRUMENTO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_32_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_32_FK on INVENTARIOINSTRUMENTO (
   IDINSTRUMENTO ASC
);

/*==============================================================*/
/* Table: LABORPERSONALOBRA                                     */
/*==============================================================*/
create table LABORPERSONALOBRA (
   CONSECLABOR          NUMBER(4,0)           not null,
   IDPERIODO            NUMBER(4)             not null,
   CODACTIVIDAD         VARCHAR2(5)           not null,
   ROL                  NUMBER(4),
   CODUNIDAD            VARCHAR2(5),
   ICODEMPLEADO         VARCHAR2(4),
   IDPERSONAOBRA        NUMBER(4,0),
   IDTIPOCALEN          VARCHAR2(2),
   IDOBRA               VARCHAR2(4),
   CONSECCALENDARIO     NUMBER(4,0),
   NOHORAS              NUMBER(2,0)           not null,
   constraint PK_LABORPERSONALOBRA primary key (CONSECLABOR)
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on LABORPERSONALOBRA (
   IDPERIODO ASC,
   CODACTIVIDAD ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on LABORPERSONALOBRA (
   ROL ASC,
   CODUNIDAD ASC,
   ICODEMPLEADO ASC,
   IDPERSONAOBRA ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_14_FK on LABORPERSONALOBRA (
   IDTIPOCALEN ASC,
   IDOBRA ASC,
   CONSECCALENDARIO ASC
);

/*==============================================================*/
/* Table: LISTAACTIVIDADUD                                      */
/*==============================================================*/
create table LISTAACTIVIDADUD (
   IDPERIODO            NUMBER(4)             not null,
   CODACTIVIDAD         VARCHAR2(5)           not null,
   DESCACTIVIDAD        VARCHAR2(40)          not null,
   VALORHORA            NUMBER(4,0)           not null,
   MAXHORAS             NUMBER(3,0)           not null,
   constraint PK_LISTAACTIVIDADUD primary key (IDPERIODO, CODACTIVIDAD)
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on LISTAACTIVIDADUD (
   IDPERIODO ASC
);

/*==============================================================*/
/* Table: LISTAGASTOUD                                          */
/*==============================================================*/
create table LISTAGASTOUD (
   IDPERIODO            NUMBER(4)             not null,
   CODGASTO             VARCHAR2(5)           not null,
   constraint PK_LISTAGASTOUD primary key (IDPERIODO, CODGASTO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on LISTAGASTOUD (
   IDPERIODO ASC
);

/*==============================================================*/
/* Table: OBRA                                                  */
/*==============================================================*/
create table OBRA (
   IDOBRA               VARCHAR2(4)           not null,
   CODPAIS              VARCHAR2(3)           not null,
   IDPERIODO            NUMBER(4),
   IDCOMPOSITOR         VARCHAR2(3)           not null,
   IDGENEROOBRA         VARCHAR2(2)           not null,
   FECHAOBRA            DATE                  not null,
   TITULO               VARCHAR2(30)          not null,
   ESTADO               SMALLINT              not null,
   constraint PK_OBRA primary key (IDOBRA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on OBRA (
   IDGENEROOBRA ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on OBRA (
   CODPAIS ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on OBRA (
   IDCOMPOSITOR ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_27_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_27_FK on OBRA (
   IDPERIODO ASC
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   CODPAIS              VARCHAR2(3)           not null,
   NOMPAIS              VARCHAR2(30)          not null,
   constraint PK_PAIS primary key (CODPAIS)
);

/*==============================================================*/
/* Table: PARTICIPACIONESTUDIANTE                               */
/*==============================================================*/
create table PARTICIPACIONESTUDIANTE (
   CONSECASIS           NUMBER(4,0)           not null,
   CODESTUDIANTE        VARCHAR2(10)          not null,
   IDTIPOCALEN          VARCHAR2(2)           not null,
   IDOBRA               VARCHAR2(4)           not null,
   CONSECCALENDARIO     NUMBER(4,0)           not null,
   constraint PK_PARTICIPACIONESTUDIANTE primary key (CONSECASIS)
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_17_FK on PARTICIPACIONESTUDIANTE (
   IDTIPOCALEN ASC,
   IDOBRA ASC,
   CONSECCALENDARIO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_18_FK on PARTICIPACIONESTUDIANTE (
   CODESTUDIANTE ASC
);

/*==============================================================*/
/* Table: PERIODO                                               */
/*==============================================================*/
create table PERIODO (
   IDPERIODO            NUMBER(4)             not null,
   PERIODO              VARCHAR2(6)          not null,
   constraint PK_PERIODO primary key (IDPERIODO)
);

/*==============================================================*/
/* Table: PERSONALOBRA                                          */
/*==============================================================*/
create table PERSONALOBRA (
   ROL                  NUMBER(4)             not null,
   CODUNIDAD            VARCHAR2(5)           not null,
   ICODEMPLEADO         VARCHAR2(4)           not null,
   IDPERSONAOBRA        NUMBER(4,0)           not null,
   IDOBRA               VARCHAR2(4)           not null,
   FECHAINICIO          DATE                  not null,
   FECHAFIN             DATE,
   constraint PK_PERSONALOBRA primary key (ROL, CODUNIDAD, ICODEMPLEADO, IDPERSONAOBRA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_28_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_28_FK on PERSONALOBRA (
   IDOBRA ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_29_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_29_FK on PERSONALOBRA (
   ROL ASC,
   CODUNIDAD ASC,
   ICODEMPLEADO ASC
);

/*==============================================================*/
/* Table: RELATIONSHIP_24                                       */
/*==============================================================*/
create table RELATIONSHIP_24 (
   IDINSTRUMENTO        VARCHAR2(4)           not null,
   IDOBRA               VARCHAR2(4)           not null,
   constraint PK_RELATIONSHIP_24 primary key (IDINSTRUMENTO, IDOBRA)
);

/*==============================================================*/
/* Index: RELATIONSHIP_24_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_24_FK on RELATIONSHIP_24 (
   IDINSTRUMENTO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_25_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_25_FK on RELATIONSHIP_24 (
   IDOBRA ASC
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL (
   ROL                  NUMBER(4)             not null,
   DESCROL              VARCHAR2(15)          not null,
   constraint PK_ROL primary key (ROL)
);

/*==============================================================*/
/* Table: TIPOCALENDARIO                                        */
/*==============================================================*/
create table TIPOCALENDARIO (
   IDTIPOCALEN          VARCHAR2(2)           not null,
   DESCTIPOCALENDARIO   VARCHAR2(40)          not null,
   constraint PK_TIPOCALENDARIO primary key (IDTIPOCALEN)
);

/*==============================================================*/
/* Table: TIPOUNIDAD                                            */
/*==============================================================*/
create table TIPOUNIDAD (
   TIPOUNIDAD           VARCHAR2(2)           not null,
   DESCTIPOUNI          VARCHAR2(3)           not null,
   constraint PK_TIPOUNIDAD primary key (TIPOUNIDAD)
);

/*==============================================================*/
/* Table: UNIDAD                                                */
/*==============================================================*/
create table UNIDAD (
   CODUNIDAD            VARCHAR2(5)           not null,
   UNI_CODUNIDAD        VARCHAR2(5),
   TIPOUNIDAD           VARCHAR2(2)           not null,
   NOMUNIDAD            VARCHAR2(40)          not null,
   constraint PK_UNIDAD primary key (CODUNIDAD)
);

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_21_FK on UNIDAD (
   UNI_CODUNIDAD ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_22_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_22_FK on UNIDAD (
   TIPOUNIDAD ASC
);

alter table CALENDARIO
   add constraint FK_CALENDAR_RELATIONS_ESTADO foreign key (IDESTADO)
      references ESTADO (IDESTADO);

alter table CALENDARIO
   add constraint FK_CALENDAR_RELATIONS_TIPOCALE foreign key (IDTIPOCALEN)
      references TIPOCALENDARIO (IDTIPOCALEN);

alter table CALENDARIO
   add constraint FK_CALENDAR_RELATIONS_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table COMPOSITOR
   add constraint FK_COMPOSIT_RELATIONS_PAIS foreign key (CODPAIS)
      references PAIS (CODPAIS);

alter table CONVOCATORIAESTUDIANTE
   add constraint FK_CONVOCAT_RELATIONS_ESTUDIAN foreign key (CODESTUDIANTE)
      references ESTUDIANTE (CODESTUDIANTE);

alter table CONVOCATORIAESTUDIANTE
   add constraint FK_CONVOCAT_RELATIONS_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table CONVOCATORIAESTUDIANTE
   add constraint FK_CONVOCAT_RELATIONS_INSTRUME foreign key (IDINSTRUMENTO)
      references INSTRUMENTO (IDINSTRUMENTO);

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_ROL foreign key (ROL)
      references ROL (ROL);

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_UNIDAD foreign key (CODUNIDAD)
      references UNIDAD (CODUNIDAD);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_RELATIONS_UNIDAD foreign key (CODUNIDAD)
      references UNIDAD (CODUNIDAD);

alter table GASTOOBRA
   add constraint FK_GASTOOBR_RELATIONS_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table GASTOOBRA
   add constraint FK_GASTOOBR_RELATIONS_LISTAGAS foreign key (IDPERIODO, CODGASTO)
      references LISTAGASTOUD (IDPERIODO, CODGASTO);

alter table INVENTARIOINSTRUMENTO
   add constraint FK_INVENTAR_RELATIONS_ESTADOIN foreign key (IDESTADOINSTRUMENTO)
      references ESTADOINSTRUMENTO (IDESTADOINSTRUMENTO);

alter table INVENTARIOINSTRUMENTO
   add constraint FK_INVENTAR_RELATIONS_INSTRUME foreign key (IDINSTRUMENTO)
      references INSTRUMENTO (IDINSTRUMENTO);

alter table LABORPERSONALOBRA
   add constraint FK_LABORPER_RELATIONS_LISTAACT foreign key (IDPERIODO, CODACTIVIDAD)
      references LISTAACTIVIDADUD (IDPERIODO, CODACTIVIDAD);

alter table LABORPERSONALOBRA
   add constraint FK_LABORPER_RELATIONS_PERSONAL foreign key (ROL, CODUNIDAD, ICODEMPLEADO, IDPERSONAOBRA)
      references PERSONALOBRA (ROL, CODUNIDAD, ICODEMPLEADO, IDPERSONAOBRA);

alter table LABORPERSONALOBRA
   add constraint FK_LABORPER_RELATIONS_CALENDAR foreign key (IDTIPOCALEN, IDOBRA, CONSECCALENDARIO)
      references CALENDARIO (IDTIPOCALEN, IDOBRA, CONSECCALENDARIO);

alter table LISTAACTIVIDADUD
   add constraint FK_LISTAACT_RELATIONS_PERIODO foreign key (IDPERIODO)
      references PERIODO (IDPERIODO);

alter table LISTAGASTOUD
   add constraint FK_LISTAGAS_RELATIONS_PERIODO foreign key (IDPERIODO)
      references PERIODO (IDPERIODO);

alter table OBRA
   add constraint FK_OBRA_RELATIONS_GENEROOB foreign key (IDGENEROOBRA)
      references GENEROOBRA (IDGENEROOBRA);

alter table OBRA
   add constraint FK_OBRA_RELATIONS_PAIS foreign key (CODPAIS)
      references PAIS (CODPAIS);

alter table OBRA
   add constraint FK_OBRA_RELATIONS_PERIODO foreign key (IDPERIODO)
      references PERIODO (IDPERIODO);

alter table OBRA
   add constraint FK_OBRA_RELATIONS_COMPOSIT foreign key (IDCOMPOSITOR)
      references COMPOSITOR (IDCOMPOSITOR);

alter table PARTICIPACIONESTUDIANTE
   add constraint FK_PARTICIP_RELATIONS_CALENDAR foreign key (IDTIPOCALEN, IDOBRA, CONSECCALENDARIO)
      references CALENDARIO (IDTIPOCALEN, IDOBRA, CONSECCALENDARIO);

alter table PARTICIPACIONESTUDIANTE
   add constraint FK_PARTICIP_RELATIONS_ESTUDIAN foreign key (CODESTUDIANTE)
      references ESTUDIANTE (CODESTUDIANTE);

alter table PERSONALOBRA
   add constraint FK_PERSONAL_RELATIONS_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table PERSONALOBRA
   add constraint FK_PERSONAL_RELATIONS_EMPLEADO foreign key (ROL, CODUNIDAD, ICODEMPLEADO)
      references EMPLEADO (ROL, CODUNIDAD, ICODEMPLEADO);

alter table RELATIONSHIP_24
   add constraint FK_RELATION_RELATIONS_INSTRUME foreign key (IDINSTRUMENTO)
      references INSTRUMENTO (IDINSTRUMENTO);

alter table RELATIONSHIP_24
   add constraint FK_RELATION_RELATIONS_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table UNIDAD
   add constraint FK_UNIDAD_RELATIONS_UNIDAD foreign key (UNI_CODUNIDAD)
      references UNIDAD (CODUNIDAD);

alter table UNIDAD
   add constraint FK_UNIDAD_RELATIONS_TIPOUNID foreign key (TIPOUNIDAD)
      references TIPOUNIDAD (TIPOUNIDAD);

