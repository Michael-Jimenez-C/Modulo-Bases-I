--create user bdmodulo identified by bdmodulo;
--grant connect, dba, resource to bdmodulo;
--start ./db.sqp;

insert into generoobra values ('1', 'Música Culta');
insert into generoobra values ('2', 'Música Folclórica');
insert into generoobra values ('3', 'Música Popular');

insert into pais values ('1','Alemania');
insert into pais values ('2','Italia');
insert into pais values ('3','Estados Unidos');
insert into pais values ('4','Francia');
insert into pais values ('5','Rusia');

insert into compositor values ('1','1','Ludwig van Beethoven');
insert into compositor values ('2','2','Giuseppe Verdi');
insert into compositor values ('3','3','George Gershwin');
insert into compositor values ('4','4','George Bizet');
insert into compositor values ('5','5','Dmitri shostakovich');

insert into obra values ('1','1',Null,'1','1',Date '1824-01-01','La novena sinfonía',1);
insert into obra values ('2','2',Null,'2','1',Date '1853-01-01','La traviata',1);
insert into obra values ('3','3',Null,'3','1',Date '1924-01-01','Rhapsody in blue',1);
insert into obra values ('4','4',Null,'4','1',Date '1875-01-01','Carmen',1);
insert into obra values ('5','5',Null,'5','1',Date '1937-01-01','Symphony No.5',1);

insert into instrumento values ('1','Violin');
insert into instrumento values ('2','Violin');
insert into instrumento values ('3','Piano');
insert into instrumento values ('4','Chelo');
insert into instrumento values ('5','Trompeta');
insert into instrumento values ('6','Flauta');
insert into instrumento values ('7','Guitarra');

insert into periodo values (1,'202301');
insert into periodo values (2,'202302');
insert into periodo values (3,'202401');
--valor /100->
insert into listaactividadud values (1,'1','Direccion musical',1500,2);
insert into listaactividadud values (1,'2','Evaluador musical',800,2);
insert into listaactividadud values (2,'3','Coordinador sinfonica',1000,2);
insert into listaactividadud values (3,'4','Auxiliar general',2500,2);
insert into listaactividadud values (3,'5','Auxiliar instrumentos',450,2);

insert into tipocalendario values ('1','Planeacion');
insert into tipocalendario values ('2','Convocatoria');
insert into tipocalendario values ('3','Seleccion');
insert into tipocalendario values ('4','Ensayo');
insert into tipocalendario values ('5','Funcion');

insert into tipounidad values ('1','Adm');
insert into tipounidad values ('2','Aca');

insert into unidad values ('1',Null,'1','Facultad de artes');
insert into unidad values ('2','1','1', 'Rectoría facultad de artes');
insert into unidad values ('3','1','2','Proyecto licenciatura en musica');
insert into unidad values ('4','1','2','Proyecto bellas artes');
insert into unidad values ('5','1','2','Proyecto artes escenicas');
insert into unidad values ('6','1','2','Proyecto ');
insert into unidad values ('7','1','2','Proyecto licenciatura en musica');
insert into unidad values ('8','1','2','Proyecto licenciatura en musica');
insert into unidad values ('9','1','2','Proyecto licenciatura en musica');
insert into unidad values ('10','1','2','Proyecto licenciatura en musica');


insert into estudiante values ('2017100400','3','juan felipe','fernandez rodriguez', date '2017-01-01',date '2001-01-01','jffernandezr@udistrital.edu.co');
insert into estudiante values ('2017100409','3','juan andres','perez dias', date '2017-01-01',date '2001-01-01','jffernandezr@udistrital.edu.co');
insert into estudiante values ('2017100429','4','juan carlos','fernandez rodriguez', date '2017-01-01',date '2001-01-01','jcfernandezr@udistrital.edu.co');
insert into estudiante values ('2017100408','5','juan camilo','rodriguez fernandez', date '2017-01-01',date '2001-01-01','jcrodriguezr@udistrital.edu.co');
insert into estudiante values ('2017100208','7','diego alberto','gonzales perez', date '2017-01-01',date '2001-01-01','dagonzalesp@udistrital.edu.co');
insert into estudiante values ('2017100406','3','luz daniela','gonzales dias', date '2017-01-01',date '2001-01-01','ldgonzalesd@udistrital.edu.co');
insert into estudiante values ('2019100403','3','pedro emilio','gonzales gonzales', date '2019-01-01',date '2001-01-01','pegonzalesg@udistrital.edu.co');
insert into estudiante values ('2019100406','3','alberto','garcia gaviria', date '2019-01-01',date '2001-01-01','agarciag@udistrital.edu.co');
insert into estudiante values ('2020100409','3','brian esteban','fernandez garcia', date '2020-01-01',date '2001-01-01','befernandezg@udistrital.edu.co');
insert into estudiante values ('2020100413','6','esteban alejandro','rodriguez gaviria', date '2020-01-01',date '2001-01-01','earodriguezg@udistrital.edu.co');
insert into estudiante values ('2020100414','3','alejandro','rodriguez garcia', date '2020-01-01',date '2001-01-01','arodriguezg@udistrital.edu.co');
insert into estudiante values ('2020100485','8','johan','fernandez rodriguez', date '2020-01-01',date '2001-01-01','jfernandezr@udistrital.edu.co');
insert into estudiante values ('2020100412','3','luz','dias rodriguez', date '2020-01-01',date '2001-01-01','ldiasr@udistrital.edu.co');
insert into estudiante values ('2020100422','3','Juan Armando','Paredes dias', date '2020-01-01',date '2001-01-01','japaredesd@udistrital.edu.co');
insert into estudiante values ('2021100423','7','Julian alejandro','puentes rodriguez', date '2021-01-01',date '2001-01-01','japuentesr@udistrital.edu.co');
insert into estudiante values ('2021100413','3','felipe andres','fernandez rodriguez', date '2021-01-01',date '2001-01-01','fafernandezr@udistrital.edu.co');

insert into convocatoriaestudiante values ('5','1','7','2017100400',date '2023-04-01',date '2023-05-01',3.6);
insert into convocatoriaestudiante values ('4','2','1','2017100409',date '2023-04-01',date '2023-05-01',3.4);
insert into convocatoriaestudiante values ('5','3','2','2017100429',date '2023-04-01',date '2023-05-01',4.3);
insert into convocatoriaestudiante values ('5','4','1','2017100408',date '2023-04-01',date '2023-05-01',4.4);
insert into convocatoriaestudiante values ('5','5','4','2021100413',date '2023-04-01',date '2023-05-01',4.5);
insert into convocatoriaestudiante values ('5','6','3','2021100423',date '2023-04-01',date '2023-05-01',4.3);
insert into convocatoriaestudiante values ('5','7','2','2020100422',date '2023-04-01',date '2023-05-01',4.8);
insert into convocatoriaestudiante values ('5','8','5','2020100412',date '2023-04-01',date '2023-05-01',4.5);
insert into convocatoriaestudiante values ('5','9','2','2020100485',date '2023-04-01',date '2023-05-01',4.2);
insert into convocatoriaestudiante values ('5','10','3','2020100413',date '2023-04-01',date '2023-05-01',4.9);

insert into rol values (1,'profesor');
insert into rol values (2,'director');
insert into rol values (3,'coordinador sin');
insert into rol values (4,'evaluador');
insert into rol values (5,'administrativo');
insert into rol values (6,'auxiliar genera');
insert into rol values (7,'axuliar instrum');

--10
insert into empleado values (1,'3','0001','alejandro','rodriguez','1000101001','aler@gmail.com');
insert into empleado values (1,'3','0002','pedro','gomez','1000102010','pedg@gmail.com');
insert into empleado values (1,'3','0003','alberto','jimenez','1000103010','albj@gmail.com');
insert into empleado values (1,'3','0004','camila','sanchez','1000104010','cams@gmail.com');
insert into empleado values (1,'3','0005','humberto','dias','1000105010','humd@gmail.com');
insert into empleado values (1,'3','0006','diego','gomez','1000106010','dieg@gmail.com');


insert into empleado values (2,'5','0007','diego','dias','1000107010','diegd@gmail.com');
insert into empleado values (4,'5','1007','diego','dias','1000107010','diagd@gmail.com');


insert into empleado values (3,'5','0008','santiago','ferndandez','1000108010','sanf@gmail.com');
insert into empleado values (4,'5','1008','santiago','fernandez','1000108010','sanf@gmail.com');

insert into empleado values (6,'1','0009','daniel','gomez','1000109010','dang@gmail.com');
insert into empleado values (7,'1','0010','fernando','hernandez','1000110010','ferh@gmail.com');
insert into empleado values (1,'1','0011','daniela','dias','1000109010','dand@gmail.com');
insert into empleado values (1,'1','0012','alejandra','gomez','1000110010','aleg@gmail.com');

--
#4 y 5 id obra
insert into personalobra values (1,'3','0001','1','4',date '2023-02-01', date '2023-05-31');
insert into personalobra values (1,'3','0002','2','4',date '2023-02-01', date '2023-05-31');
insert into personalobra values (1,'3','0003','3','4',date '2023-02-01', date '2023-05-31');
insert into personalobra values (1,'3','0004','4','5',date '2023-02-01', date '2023-05-31');
insert into personalobra values (1,'3','0005','5','5',date '2023-02-01', date '2023-05-31');
insert into personalobra values (1,'3','0006','6','5',date '2023-02-01', date '2023-05-31');

insert into personalobra values (2,'5','0007','7','5',date '2023-02-01', date '2023-05-31');

insert into personalobra values (3,'5','0008','8','5',date '2023-02-01', date '2023-05-31');

insert into personalobra values (6,'1','0009','9','5',date '2023-02-01', date '2023-05-31');
insert into personalobra values (7,'1','0010','10','5',date '2023-02-01', date '2023-05-31');

-- estados:

insert into estado values ('Activo');
insert into estado values ('Inactivo');