CREATE TABLE Maestros (
  idMaestros INTEGER NOT NULL AUTO_INCREMENT,
  foto LONGBLOB NULL,
  nombre VARCHAR(45) NULL,
  paterno VARCHAR(45) NULL,
  materno  VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  usuario VARCHAR(45) NULL,
  contrasena VARCHAR(45) NULL,
  PRIMARY KEY(idMaestros)
);

CREATE TABLE Idiomas (
  idIdiomas INTEGER NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NULL,
  niveles INTEGER UNSIGNED NULL,
  cupos INTEGER UNSIGNED NULL,
  PRIMARY KEY(idIdiomas)
);

CREATE TABLE Alumnos (
  idAlumnos INTEGER NOT NULL AUTO_INCREMENT,
  foto LONGBLOB NULL,
  nombre VARCHAR(45) NULL,
  paterno VARCHAR(45) NULL,
  materno VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  usuario VARCHAR(45) NULL,
  contrasena VARCHAR(45) NULL,
  PRIMARY KEY(idAlumnos)
);

CREATE TABLE Imparten (
  idImparten INTEGER NOT NULL AUTO_INCREMENT,
  idMaestros INTEGER NOT NULL,
  nombre VARCHAR(45) NULL,
  paterno VARCHAR(45) NULL,
  nombreIdio VARCHAR(45) NULL,
  nivel INTEGER UNSIGNED NULL,
  PRIMARY KEY(idImparten)
);


*********************************************************
TABLA Alumnos
**********************************************************
delimiter //
create procedure InsertAlu(
  img longblob, nom varchar(45), 
  ap varchar(45), am varchar(45), 
  correo varchar(50), 
    usu varchar(45), pass varchar(45) )
begin
  insert into Alumnos(foto, nombre, paterno, materno, email, usuario, contrasena) 
  values (img, nom, ap, am, correo, usu, pass);
end //
delimiter ;

call InsertAlu("","Admin","Admin","Admin","Admin@gmail.com","Erickburg","Erickburg");
***********************************************************
delimiter //
create procedure UpdateAlu(
  img longblob, nom varchar(45), 
  ap varchar(45), am varchar(45), 
  correo varchar(50), 
    usu varchar(45), pass varchar(45), id int )
begin
  update Alumnos set foto = img, nombre = nom, paterno = ap, materno = am, email = correo, usuario = usu, contrasena = pass where idAlumnos = id;
end //
delimiter ;

call UpdateAlu("","Erick","Burgos","Quintero","erickburg@hotmail","Erickburg","Erickburg",1);
*************************************************************
delimiter //
create procedure SelectAlu( id int )
begin
  select idAlumnos, foto, nombre, paterno, materno, email, usuario, contrasena from Alumnos where idAlumnos = id;
end //
delimiter ;

call SelectAlu(1);
***********************************************************
delimiter //
create procedure AllAlus()
begin
  select idAlumnos, foto, nombre, paterno, materno, email, usuario, contrasena from Alumnos;
end //
delimiter ;

call AllAlus();
************************************************************
delimiter //
create procedure DeleteAlu( id int )
begin
 delete from Alumnos where idAlumnos = id;
end //
delimiter ;

call DeleteAlu(2);
**************************************************************
TABLA MAESTROS 
**************************************************************
delimiter //
create procedure InsertMae(
  img longblob, nom varchar(45), 
  ap varchar(45), am varchar(45), 
  correo varchar(50), 
    usu varchar(45), pass varchar(45) )
begin
  insert into Maestros(foto, nombre, paterno, materno, email, usuario, contrasena) 
  values (img, nom, ap, am, correo, usu, pass);
end //
delimiter ;

call InsertMae("","Admin","Admin","Admin","Admin@gmail.com","Erickburg","Erickburg");
***********************************************************
delimiter //
create procedure UpdateMae(
  img longblob, nom varchar(45), 
  ap varchar(45), am varchar(45), 
  correo varchar(50), 
    usu varchar(45), pass varchar(45), id int )
begin
  update Maestros set foto = img, nombre = nom, paterno = ap, materno = am, email = correo, usuario = usu, contrasena = pass where idMaestros = id;
end //
delimiter ;

call UpdateMae("","Erick","Burgos","Quintero","erickburg@gmail","Erickburg","Erickburg",1);
*************************************************************
delimiter //
create procedure SelectMae( id int )
begin
  select idMaestros, foto, nombre, paterno, materno, email, usuario, contrasena from Maestros where idMaestros = id;
end //
delimiter ;

call SelectMae(1);
***********************************************************
delimiter //
create procedure AllMaes()
begin
  select idMaestros, foto, nombre, paterno, materno, email, usuario, contrasena from Maestros;
end //
delimiter ;

call AllMaes();
************************************************************
delimiter //
create procedure DeleteMae( id int )
begin
 delete from Maestros where idMaestros = id;
end //
delimiter ;

call DeleteMae(2);
call DeleteMae(3);
call DeleteMae(4);
call DeleteMae(5);
**********************************************************
TABLA Idiomas
**********************************************************
delimiter //
create procedure AllIdi()
begin
  select idIdiomas, nombre, niveles, cupos from Idiomas;  
end //
delimiter ;

insert into Idiomas values (1, "Ingles US", 15, 100);
insert into Idiomas values (2, "Frances", 18, 60);
insert into Idiomas values (3, "Portugues", 12, 60);
insert into Idiomas values (4, "Ruso", 18, 30);
insert into Idiomas values (5, "Italiano", 12, 60);
insert into Idiomas values (6, "Aleman", 18, 60);
insert into Idiomas values (7, "Ingles UK", 18, 100);
insert into Idiomas values (8, "Holandes", 18, 60);
insert into Idiomas values (9, "Arabe", 25, 30);
insert into Idiomas values (10, "Chino", 25, 30);
insert into Idiomas values (11, "Hindi", 25, 30);
insert into Idiomas values (12, "Bengalí", 25, 30);
insert into Idiomas values (13, "Japonés", 25, 30);
insert into Idiomas values (14, "Panyabí", 25, 30);
insert into Idiomas values (15, "Turco", 18, 60);

delete from Idiomas where idIdiomas = 1;
delete from Idiomas where idIdiomas = 2;
delete from Idiomas where idIdiomas = 3;
delete from Idiomas where idIdiomas = 4;
delete from Idiomas where idIdiomas = 5;
delete from Idiomas where idIdiomas = 6;
delete from Idiomas where idIdiomas = 7;
delete from Idiomas where idIdiomas = 8;
delete from Idiomas where idIdiomas = 9;
delete from Idiomas where idIdiomas = 10;

call AllIdi();
***********************************************************
Tabla Imparten
*********************************************************
delimiter //
create procedure InsertImp(
  id int, nom varchar(45), 
  ap varchar(45), idio varchar(45), 
  nivel int)
begin
  insert into Imparten(idMaestros, nombre, paterno, nombreIdio, nivel) 
  values (id, nom, ap, idio, nivel);
end //
delimiter ;

delete from Imparten where idImparten = 1;

call InsertImp(2,"Erick","Burgos","Ingles",5);
*********************************************************
delimiter //
create procedure AllImp()
begin
  select idImparten,idMaestros, nombre, paterno, nombreIdio, nivel from Imparten;
end //
delimiter ;

call AllImp();
*********************************************************
delimiter //
create procedure SelectImp( id int )
begin
  select idImparten, idMaestros, nombre, paterno, nombreIdio, nivel from Imparten where idMaestros = id;
end //
delimiter ;

call SelectImp(1);

*********************************************************
LOGIN ALUMNO
*********************************************************
delimiter //
create procedure LoginAlu( nu varchar(20) )
begin
  select idAlumnos, usuario, contrasena from Alumnos where usuario = nu;
end //
delimiter ;

call LoginAlu("Pach");
*********************************************************
LOGIN Maestros 
*********************************************************
delimiter //
create procedure LoginMae( nu varchar(20) )
begin
  select idMaestros, usuario, contrasena from Maestros where usuario = nu;
end //
delimiter ;

call LoginMae("Erickburg");
**********************************************************
***********************************
delimiter //
create procedure Grafica()
begin
  SELECT nombreIdio AS Idioma, count(*) AS Maestros FROM
  Imparten group by nombreIdio;
end //
delimiter ;
