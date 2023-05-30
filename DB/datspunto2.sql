/*
SQL> select * from tipocalendario;

ID DESCTIPOCALENDARIO
-- ----------------------------------------
1  Planeacion
2  Convocatoria
3  Seleccion
4  Ensayo
5  Funcion
*/

insert into calendario values (1,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-01 13:00:00',timestamp '2023-06-10 13:00:00');
insert into calendario values (2,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-01 13:00:00',timestamp '2023-06-10 13:00:00');
insert into calendario values (3,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-01 13:00:00',timestamp '2023-06-10 13:00:00');


insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-01 14:00:00',timestamp '2023-02-01 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-03 14:00:00',timestamp '2023-02-03 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-08 14:00:00',timestamp '2023-02-08 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-10 14:00:00',timestamp '2023-02-10 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-15 14:00:00',timestamp '2023-02-15 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-17 14:00:00',timestamp '2023-02-17 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-22 14:00:00',timestamp '2023-02-22 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-02-24 14:00:00',timestamp '2023-02-24 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-01 14:00:00',timestamp '2023-03-01 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-03 14:00:00',timestamp '2023-03-03 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-08 14:00:00',timestamp '2023-03-08 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-10 14:00:00',timestamp '2023-03-10 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-15 14:00:00',timestamp '2023-03-15 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-17 14:00:00',timestamp '2023-03-17 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-22 14:00:00',timestamp '2023-03-22 16:00:00');
insert into calendario values (4,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-24 14:00:00',timestamp '2023-03-24 16:00:00');

insert into calendario values (5,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-29 14:00:00',timestamp '2023-03-29 16:00:00');
insert into calendario values (5,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-31 14:00:00',timestamp '2023-03-31 16:00:00');
insert into calendario values (5,2,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'Activo',timestamp '2023-03-31 14:00:00',timestamp '2023-03-31 16:00:00');

