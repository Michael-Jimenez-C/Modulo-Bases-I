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