--para el ingreso
select nombre, apellido, rol from empleado where lower(correo)=lower('correo') and rol=3;


--para el registro de fechas
insert into calendario values (tipocalendario,OBRA,(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),estado,fechainicio,fechafin);


select idestado,idestado from estado;
select idobra, titulo from obra;
select * from tipocalendario

--2.3
/*
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 IDTIPOCALEN                               NOT NULL VARCHAR2(2)
 IDOBRA                                    NOT NULL VARCHAR2(4)
 CONSECCALENDARIO                          NOT NULL NUMBER(4)
 IDESTADO                                  NOT NULL VARCHAR2(10)
 FECHAINICIO                               NOT NULL TIMESTAMP(6)
 FECHAFIN                                  NOT NULL TIMESTAMP(6)

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 IDTIPOCALEN                               NOT NULL VARCHAR2(2)
 DESCTIPOCALENDARIO                        NOT NULL VARCHAR2(40)
*/
select O.titulo, C.fechainicio, C.fechafin, C.conseccalendario from 
calendario C join tipocalendario T on C.idtipocalen=T.idtipocalen
join obra O on C.idobra=O.idobra
where C.idestado='Activo' and C.fechainicio<=sysdate and C.fechafin>=sysdate and T.DESCTIPOCALENDARIO='Planeacion';

update calendario
set idestado = 'Inactivo'
WHERE conseccalendario = N;

/*
CREATE INDEX index_name
ON table_name (column_name);
*/


---
/*
select E.nombre, E.apellido, E.codestudiante
from estudiante E, convocatoriaestudiante C
where E.codestudiante=C.codestudiante;

select U.codunidad c1, U.nomunidad proyecto, U1.nomunidad facultad 
from unidad U, unidad U1 
where U.uni_codunidad=U1.codunidad


select I.nominstrumento nominstrumento, max(C.calificacion) maxCal
from convocatoriaestudiante C join instrumento I
ON I.idinstrumento=C.idinstrumento
group by I.nominstrumento

*/


select E.nombre, E.apellido, C.codestudiante, O.proyecto, O.facultad, T.nominstrumento, T.maxCal
from 
estudiante E, (select I.nominstrumento nominstrumento, max(C.calificacion) maxCal
from convocatoriaestudiante C 
join instrumento I
ON I.idinstrumento=C.idinstrumento
group by I.nominstrumento) T, convocatoriaestudiante C, instrumento I,
(select U.codunidad c1, U.nomunidad proyecto, U1.nomunidad facultad 
from unidad U, unidad U1 
where U.uni_codunidad=U1.codunidad) O
where T.maxCal=C.calificacion 
and C.idinstrumento=I.idinstrumento 
and T.nominstrumento=I.nominstrumento 
and O.c1=E.codunidad
and C.codestudiante=E.codestudiante;

/*
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CONSECASIS                                NOT NULL NUMBER(4)
 CODESTUDIANTE                             NOT NULL VARCHAR2(10)
 IDTIPOCALEN                               NOT NULL VARCHAR2(2)
 IDOBRA                                    NOT NULL VARCHAR2(4)
 CONSECCALENDARIO                          NOT NULL NUMBER(4)
*/

insert into participacionEstudiante values ((select coalesce(v,0)+1 from (select max(consecasis) v from participacionEstudiante)), ,)

select C.idtipocalen,C.idobra,C.conseccalendario from calendario C, tipocalendario T where fechainicio<=sysdate and fechafin>=sysdate and C.idtipocalen=T.idtipocalen and C.idestado='Activo' and T.DESCTIPOCALENDARIO='Seleccion'

-------------------------------------------------------------------------------------


select count(conseccalendario)
from calendario
where fechainicio<=sysdate
and fechafin<=sysdate


select max(C.fechafin)
from calendario C, tipocalendario T
where C.fechafin<=sysdate
and C.idtipocalen=T.idtipocalen
and (T.DESCTIPOCALENDARIO='Ensayo' or T.DESCTIPOCALENDARIO='Funcion');


------------------------------------------------------------------------------------------
-- Requiero nombre, código, facultad, nohoras, periodo

/*
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CONSECASIS                                NOT NULL NUMBER(4)
 CODESTUDIANTE                             NOT NULL VARCHAR2(10)
 IDTIPOCALEN                               NOT NULL VARCHAR2(2)
 IDOBRA                                    NOT NULL VARCHAR2(4)
 CONSECCALENDARIO                          NOT NULL NUMBER(4)


  Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 IDOBRA                                    NOT NULL VARCHAR2(4)
 CODPAIS                                   NOT NULL VARCHAR2(3)
 IDPERIODO                                          NUMBER(4)
 IDCOMPOSITOR                              NOT NULL VARCHAR2(3)
 IDGENEROOBRA                              NOT NULL VARCHAR2(2)
 FECHAOBRA                                 NOT NULL DATE
 TITULO                                    NOT NULL VARCHAR2(30)
 ESTADO                                    NOT NULL NUMBER(38)

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 IDPERIODO                                 NOT NULL NUMBER(4)
 PERIODO                                   NOT NULL VARCHAR2(6)
*/

select P.periodo 
from calendario C, obra O, periodo P
where C.fechafin<sysdate 
and C.idobra=O.idobra
and O.idperiodo=P.idperiodo;



update calendario set idestado='Inactivo' where C.fechafin<sysdate


--Horas

select E.nombre||' '||E.apellido ,E.codestudiante, U.nomunidad ,sum(EXTRACT(HOUR FROM C.fechafin-C.fechainicio)+EXTRACT(Day FROM C.fechafin-C.fechainicio)*24+EXTRACT(HOUR FROM C.fechafin-C.fechainicio)*24*30) diferencia
from calendario C, estudiante E, participacionEstudiante P, unidad U
where C.conseccalendario=P.conseccalendario 
and E.codestudiante=P.codestudiante
and E.codunidad=U.codunidad
group by E.nombre||' '||E.apellido ,E.codestudiante, U.nomunidad;


----

select C.conseccalendario from calendario C join tipocalendario T on C.idtipocalen=T.idtipocalen where C.idestado='Activo' and C.fechainicio<=sysdate and C.fechafin>=sysdate and (T.DESCTIPOCALENDARIO='Ensayo' or T.DESCTIPOCALENDARIO='Funcion');



select E.nombre||' '||E.apellido, C.codestudiante from  estudiante E, (select I.nominstrumento nominstrumento, max(C.calificacion) maxCal from convocatoriaestudiante C  join instrumento I ON I.idinstrumento=C.idinstrumento group by I.nominstrumento) T, convocatoriaestudiante C, instrumento I where T.maxCal=C.calificacion and C.idinstrumento=I.idinstrumento  and T.nominstrumento=I.nominstrumento and C.codestudiante=E.codestudiante;