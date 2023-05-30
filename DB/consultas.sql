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

