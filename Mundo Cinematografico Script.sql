/*
				TRABAJO GRUPAL 
*/
-- Creacion de la base de dato
create database Mundo_Cinematografico character set utf32 collate utf32_spanish_ci;
-- Llamado a la clase para acceder a ella
use Mundo_Cinematografico;
-- Creacion de las tablas
CREATE TABLE Genero (
    ID_Genero INTEGER PRIMARY KEY,
    Genero VARCHAR(32)
);
CREATE TABLE Clasificacion (
    ID_Clasificacion INTEGER PRIMARY KEY,
    Clasificacion VARCHAR(32)
);
CREATE TABLE Peliculas (
    Peliculas_ID INTEGER PRIMARY KEY,
    ID_Genero INTEGER,
    Titulo VARCHAR(32),
    Año_Lanzamiento YEAR,
    duracion TIME,
    Idioma VARCHAR(32),
	Clasificacion VARCHAR(32)
);
CREATE TABLE Boleto (
    Boleto_ID INTEGER PRIMARY KEY,
    Peliculas_ID INTEGER,
    Fecha_Hora DATETIME,
    Sala INTEGER,
    Precio FLOAT,
    asiento VARCHAR(3),
    CONSTRAINT Bolet_Peli_FK FOREIGN KEY (Peliculas_ID)
        REFERENCES Peliculas (Peliculas_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Cine (
    Cine_ID INTEGER PRIMARY KEY,
    Peliculas_ID INTEGER,
    Cine VARCHAR(32),
    Avenida VARCHAR(32),
    CONSTRAINT Cine_Peli_FK FOREIGN KEY (Peliculas_ID)
        REFERENCES Peliculas (Peliculas_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Actores (
    ID_Actores INTEGER PRIMARY KEY,
    Peliculas_ID INTEGER,
    Nombre_Actor VARCHAR(32),
    Apellido_Actor VARCHAR(32),
    Edad INTEGER
);
-- Creacion de tablas intermedias
CREATE TABLE Clasific_Peli (
    ID_ClasiPeli INTEGER AUTO_INCREMENT PRIMARY KEY,
    Peliculas_ID INTEGER,
    ID_Clasificacion INTEGER,
    CONSTRAINT Clasi_Peli_FK FOREIGN KEY (Peliculas_ID)
        REFERENCES Peliculas (Peliculas_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Peli_Clasi_FK FOREIGN KEY (ID_Clasificacion)
        REFERENCES Clasificacion (ID_Clasificacion)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Gener_Peli (
ID_GenerPeli INTEGER AUTO_INCREMENT PRIMARY KEY,
    Peliculas_ID INTEGER,
    ID_Genero INTEGER,
    CONSTRAINT Gene_Peli_FK FOREIGN KEY (ID_Genero)
        REFERENCES Genero (ID_Genero)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Peli_Gene_FK FOREIGN KEY (Peliculas_ID)
        REFERENCES Peliculas (Peliculas_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Actor_Peli (
ID_ActorPeli INTEGER AUTO_INCREMENT PRIMARY KEY,
    Peliculas_ID INTEGER,
    ID_Actores INTEGER,
    CONSTRAINT Pelis_Actor_FK FOREIGN KEY (Peliculas_ID)
        REFERENCES Peliculas (Peliculas_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Actor_Pelis_FK FOREIGN KEY (ID_Actores)
        REFERENCES Actores (ID_Actores)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creacion de checks
-- El año de lanzamiento deben ser anterior a 2023
alter table peliculas 
add constraint Lanza_CK check (Año_Lanzamiento<2023);
-- El precio del boleto debe ser mayor que 0
alter table boleto 
add constraint Precio_CK check(Precio>0);
-- Que la clasificacion solo acepte las letras A, B y C
alter table clasificacion
add constraint clasi_ed_CK check(clasificacion in ("A","B","C","D","E"));
-- Que la edad de los actores sea mayor de 5 años 
alter table actores
add constraint edad_Act_CK check(Edad>5); 

-- Desactivacion del modo seguro
set sql_safe_updates= 0;

-- Insercion de datos en la tabla Genero
insert into Genero values (1,"Comedia");
insert into Genero values (2,"Terror");
insert into Genero values (3,"Acción");
insert into Genero values (4,"Romance");
insert into Genero values (5,"Misterio");
insert into Genero values (6,"Fantasia");
insert into Genero values (7,"Ciencia Ficcion");
insert into Genero values (8,"Aventuras");
insert into Genero values (9,"Drama");
insert into Genero values (10,"Musical");
insert into Genero values (11,"Suspenso");
insert into Genero values (12,"Documental");
insert into Genero values (13,"Deportivas");
insert into Genero values (14,"Religiosas");
insert into Genero values (15,"Animación");
-- Insecion de datos en la tabla clasificacion
insert into Clasificacion values (301,"C");
insert into Clasificacion values (302,"B");
insert into Clasificacion values (303,"D");
insert into Clasificacion values (304,"C");
insert into Clasificacion values (305,"A");
insert into Clasificacion values (306,"A");
insert into Clasificacion values (307,"B");
insert into Clasificacion values (308,"E");
insert into Clasificacion values (309,"C");
insert into Clasificacion values (310,"A");
insert into Clasificacion values (311,"C");
insert into Clasificacion values (312,"C");
insert into Clasificacion values (313,"A");
insert into Clasificacion values (314,"C");
insert into Clasificacion values (315,"A");
-- Insercion de datos en la tabla Pelicula
insert into Peliculas values (20, 1, "Means Girls", 2004, "01:37:00", "Ingles","C");
insert into Peliculas values (21, 3, "Rapidos y Fusiosos", 2001, "01:46:00", "Español","B");
insert into Peliculas values (22, 2, "Child's play 2019", 2019, "01:30:00", "Ingles","D");
insert into Peliculas values (23, 4, "Upside Down", 2012, "01:54:00", "Ingles","C");
insert into Peliculas values (24, 15, "Minions: nace un villano", 2022, "01:27:00", "Español","A");
insert into Peliculas values (25, 8, "Jumanji", 1995, "01:44:00", "Español","A");
insert into Peliculas values (26, 7, "Interstellar", 2014, "02:49:00", "Ingles","B");
insert into Peliculas values (27, 12, "Capturing the Friedmans", 2003, "01:47:00", "Ingles","E");
insert into Peliculas values (28, 5, "Monstrous", 2022, "01:29:00", "Ingles","C");
insert into Peliculas values (29, 6, "Aladdín", 2019, "01:37:00", "Ingles","A");
insert into Peliculas values (30, 14, "El irlandés", 2019, "03:29:00", "Español","C");
insert into Peliculas values (31, 9, "Parasite", 2019, "02:12:00", "Coreano","C");
insert into Peliculas values (32, 10, "The Greatest Showman", 2017, "01:45:00", "Ingles","A");
insert into Peliculas values (33, 11, "Guasón", 2019, "02:02:00", "Español","C");
insert into Peliculas values (34, 13, "Garra", 2022, "01:57:00", "Ingles","A");
-- Insercion de datos en la tabla Boletos
insert into Boleto values (001, 20, "2022-04-02 15:00:00", 5, "2.00", "A01");
insert into Boleto values (002, 21, "2022-06-04 15:30:00", 1, "2.00", "A02");
insert into Boleto values (003, 22, "2022-08-02 13:00:00", 2, "2.00", "A03");
insert into Boleto values (004, 23, "2022-10-05 13:30:00", 3, "2.00", "A04");
insert into Boleto values (005, 24, "2022-03-06 18:00:00", 4, "2.00", "A05");
insert into Boleto values (006, 25, "2022-12-06 19:00:00", 6, "2.00", "A06");
insert into Boleto values (007, 26, "2022-11-08 22:30:00", 7, "2.00", "A07");
insert into Boleto values (008, 27, "2022-03-02 14:00:00", 4, "2.00", "A08");
insert into Boleto values (009, 28, "2022-09-01 14:40:00", 1, "2.00", "B01");
insert into Boleto values (010, 29, "2022-12-06 20:00:00", 2, "2.00", "B02");
insert into Boleto values (011, 30, "2022-05-01 21:30:00", 4, "2.00", "B03");
insert into Boleto values (012, 31, "2022-02-03 11:00:00", 5, "2.00", "B04");
insert into Boleto values (013, 32, "2022-01-06 11:30:00", 7, "2.00", "B05");
insert into Boleto values (014, 33, "2022-05-07 12:00:00", 2, "2.00", "B06");
insert into Boleto values (015, 34, "2022-12-08 21:00:00", 3, "2.00", "B07");
-- Insercion de datos en la tabla Cine
insert into Cine values (011, 20, "SUPERCINES 8", "Paseo Shopping Portoviejo");
insert into Cine values (012, 21, "CINEMARK", "Mall del Sol");
insert into Cine values (013, 22, "MAXCINEMA", "Mall El Fortín");
insert into Cine values (014, 23, "CINEXT ", "Mall del Pacifico");
insert into Cine values (015, 24, "SUPERCINES 6", "Portal Shopping");
insert into Cine values (016, 25, "CINEPOLIS", "Metrocentro Santa Ana");
insert into Cine values (017, 26, "CINEPLAZA", "Meracado Futuristico Naranjal");
insert into Cine values (018, 27, "CINEMAS", "Plaza del Valle Shopping");
insert into Cine values (019, 28, "STAR CINES", "Centro Comercial Laguna Mall");
insert into Cine values (022, 29, "MEGA CINES", "C. Bolívar 1005-811");
insert into Cine values (023, 30, "SUPERCINES 7", "Paseo Shopping Manta");
insert into Cine values (024, 31, "CINEMAX", "PlazaMark El Fortín");
insert into Cine values (025, 32, "CINEXT 2", "Mall de la Perla");
insert into Cine values (026, 33, "CINEPOLIS 2", "Metrocentro Bahia");
insert into Cine values (027, 34, "AUTO CINE", "Paseo Centro Loja");
-- Insercion de datos en la tabla Actores
insert into Actores values (130, 20, "Rachel", "MacAdams", 43);
insert into Actores values (131, 21, "Vin", "Diesel", 55);
insert into Actores values (132, 22, "Mark", "Hamill", 67);
insert into Actores values (133, 23, "Blu", "Mankuma", 63);
insert into Actores values (134, 24, "Katy", "Mixon", 41);
insert into Actores values (135, 25, "Robin", "Williams", 63);
insert into Actores values (136, 26, "Matthew ", "McConaughey", 52);
insert into Actores values (137, 27, "Larry ", "King", 69);
insert into Actores values (138, 28, "Carol", "Anne Watts", 34);
insert into Actores values (139, 29, "Will", "Smith", 53);
insert into Actores values (140, 30, "Alfredo", "Pacino", 28);
insert into Actores values (141, 31, "Yeo-jeong", "Cho", 41);
insert into Actores values (142, 32, "Zac", "Efron", 34);
insert into Actores values (143, 33, "Joaquin", "Phoneix", 47);
insert into Actores values (144, 34, "Adam", "Sandler", 55);

-- Insercion de datos en tablas intermedias tabla Actor_Peli
insert into actor_peli values(100,20,130);
insert into actor_peli values(101,21,131);
insert into actor_peli values(102,22,132);
insert into actor_peli values(103,23,133);
insert into actor_peli values(104,24,134);
insert into actor_peli values(105,25,135);
insert into actor_peli values(106,26,136);
insert into actor_peli values(107,27,137);
insert into actor_peli values(108,28,138);
insert into actor_peli values(109,29,139);
insert into actor_peli values(110,30,140);
insert into actor_peli values(111,31,141);
insert into actor_peli values(112,32,142);
insert into actor_peli values(113,33,143);
insert into actor_peli values(114,34,144);


-- Insercion de datos en tablas intermedias tabla Gener_Peli
insert into gener_peli values (200,20,1);
insert into gener_peli values (201,21,2);
insert into gener_peli values (202,22,3);
insert into gener_peli values (203,23,4);
insert into gener_peli values (204,24,5);
insert into gener_peli values (205,25,6);
insert into gener_peli values (206,26,7);
insert into gener_peli values (207,27,8);
insert into gener_peli values (208,28,9);
insert into gener_peli values (209,29,10);
insert into gener_peli values (210,30,11);
insert into gener_peli values (211,31,12);
insert into gener_peli values (212,32,13);
insert into gener_peli values (213,33,14);
insert into gener_peli values (214,34,15);

-- Actualizacion de datos en las tablas
-- En la tabla boleto: Colocar los asientos en minusculas a los boletos en que su funcion
-- tengan hora a las 3 de la tarde o sean en el mes de Agosto
-- 
UPDATE boleto 
SET 
    asiento = LCASE(asiento)
WHERE
    Fecha_Hora LIKE '%15:00:00'
        OR Fecha_Hora LIKE '_____03%';
-- En la tabla Cine: Que en los cines en donde su nombre empiece con la letra "C"
-- agregar la palabra "SUPER"
UPDATE cine 
SET 
    cine = concat('SUPER ',cine)
WHERE
    Cine LIKE "C%";
-- En la tabla Actores: Todos los actores que su nombre comience con la Letra A poner en mayusculas
UPDATE actores 
SET 
    Nombre_Actor = UCASE(Nombre_Actor)
WHERE
    Nombre_Actor LIKE 'A%'; 
-- En la tabla peliculas: Todas las peliculas que su Nombre comience con la letra M o G cambie su idioma por Subtitulado
UPDATE peliculas 
SET 
    idioma = 'Subtitulado'
WHERE
    titulo REGEXP '^[MG]';

-- Eliminaciones
-- En la tabla peliculas: Sacar de cartelera a la peliculas que su nombre empiece con la letra C
DELETE FROM peliculas 
WHERE
    titulo LIKE 'C%';
-- En la tabla actores: Eliminar a los actores donde su apellido terminen en O
DELETE FROM actores 
WHERE
    Apellido_Actor LIKE '%o';
-- En la tabla actores: Eliminar a los actores donde su Nombre NO contega la letra A
DELETE FROM actores 
WHERE
    NOT Nombre_Actor LIKE '%A%';
-- En la tabla peliculas: Sacar de cartalera las peliculas que en su titulo contengan 6 caracteres
DELETE FROM peliculas 
WHERE
    titulo LIKE '______';
-- En la tabla boleto: Eliminar todos los boletos que su asiento que terminen en 5 y en 7
DELETE FROM boleto 
WHERE
    asiento LIKE '%5' OR asiento LIKE '%7';

-- Confirmar los checks 
-- El año de lanzamiento deben ser anterior a 2022
insert into peliculas values (35, 6, "Wonka", 2023, "1:52:00", "Ingles","B");
-- El precio del boleto debe ser mayor que 0
insert into boleto values (016, 24, "2022-08-08- 20:00:00",6,0.00,"B08");
-- Que la clasificacion solo acepte las letras A, B, C, D y E
insert into peliculas values (36, 6, "Harry Potter", 2001, "2:32:00", "Español","X");
-- Que la edad de los actores sea mayor de 5 años 
insert into actores values (145, 24, "Aiden","Brown",4);

-- ----------------------------------------------------------------------------------------------------------------------
-- Consultas 
-- 1. Realizar un informe donde se muestre las peliculas con su duracion donde su año de lanzamiento sea despues del 2004
SELECT 
    titulo AS 'Titulo de pelicula', duracion AS Duración
FROM
    peliculas
WHERE
    año_lanzamiento > '2004';
    

 -- 2. Mostrar a todos los actores que la edad sea mayor a 40
SELECT 
    Nombre_Actor AS 'Nombre ', Edad AS 'Edad del actor'
FROM
    actores
WHERE
    actores.Edad > 40;


-- 3. Realizar un informe de el promedio de las edades de los actores 
SELECT 
    AVG(edad) AS 'Promedio de Edades'
FROM
    actores;
    
-- 4. Mostrar los generos que contengan en su nombre, mas de 8 caracteres en mayusculas.
SELECT 
    UCASE(genero) AS Genero
FROM
    genero
WHERE
    CHAR_LENGTH(genero) > 8;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JOIN
# 1 JOIN
-- 1 Muestra el Codigo de los Actores y Nombre del Actor 
SELECT 
    ap.Peliculas_ID AS 'Codigo Actores',
    a.Nombre_Actor AS 'Nombre del Actor'
FROM
    actor_peli ap
        INNER JOIN
    Actores a ON a.ID_Actores = ap.ID_Actores
ORDER BY a.Nombre_Actor;


-- 2 Mostrar el nombre de la pelicula y su precio
SELECT 
    p.Titulo AS 'Titulo de Pelicula',
    b.Precio AS 'Precio del tiquet'
FROM
    Peliculas p
        INNER JOIN
    Boleto b ON p.Peliculas_ID = b.Peliculas_ID
ORDER BY b.Peliculas_ID;

-- 3 Muestra el Codigo de los Actores y el Apellido del Actor 
SELECT 
    gp.ID_Genero AS 'Codigo Actores',
    g.Genero AS 'Genero de Pelicula'
FROM
    gener_peli gp
        INNER JOIN
    Genero g ON g.ID_Genero = gp.ID_Genero
ORDER BY g.ID_Genero;

-- 4 Mostrar Codigo de Genero, Genero de Pelicula, Título de Pelicula
SELECT 
    gp.ID_Genero AS 'Codigo de Genero',
    g.Genero AS 'Genero de Pelicula',
    p.Titulo AS 'Titulo de Pelicula'
FROM
    gener_peli gp
        INNER JOIN
    Genero g 
		INNER JOIN
	peliculas p ON g.ID_Genero = gp.ID_Genero AND p.Peliculas_ID = gp.Peliculas_ID
ORDER BY g.ID_Genero;

-- 5 Mostrar el nombre de la pelicula y su precio
SELECT 
	b.Precio AS 'Precio del tiquet',
    p.Titulo AS 'Titulo de Pelicula',
    c.Cine AS 'Nombre Cine'
FROM
    Boleto b 
		INNER JOIN
    Peliculas p
        INNER JOIN
    Cine c
    ON p.Peliculas_ID = b.Peliculas_ID AND p.Peliculas_ID = c.Peliculas_ID
ORDER BY b.Peliculas_ID;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Pocedimientos almacenados
SET GLOBAL log_bin_trust_function_creators = 1;
-- Tabla para guardar los registros de cambios 

CREATE TABLE `mundo_cinematografico`.`acciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `accion` VARCHAR(200) NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

delimiter // 
CREATE PROCEDURE registrar_pelicula(IN genero_id INT, IN clasificacion_id INT, IN titulo VARCHAR(32), IN anio_lanzamiento YEAR, IN duracion TIME, IN idioma VARCHAR(32))
BEGIN
	DECLARE pelicula_id INT;
	INSERT INTO Peliculas(ID_Genero, Titulo, Año_Lanzamiento, duracion, Idioma, Clasificacion)
	VALUES(genero_id, titulo, anio_lanzamiento, duracion, idioma, (SELECT Clasificacion FROM Clasificacion WHERE ID_Clasificacion = clasificacion_id));
	SET pelicula_id = LAST_INSERT_ID();
	INSERT INTO Gener_Peli(Peliculas_ID, ID_Genero) VALUES(pelicula_id, genero_id);
	INSERT INTO Clasific_Peli(Peliculas_ID, ID_Clasificacion) VALUES(pelicula_id, clasificacion_id);
END//
delimiter ;

delimiter // 
CREATE PROCEDURE eliminar_pelicula(IN pelicula_id INT)
BEGIN
	DELETE FROM Gener_Peli WHERE Peliculas_ID = pelicula_id;
	DELETE FROM Clasific_Peli WHERE Peliculas_ID = pelicula_id;
	DELETE FROM Actor_Peli WHERE Peliculas_ID = pelicula_id;
	DELETE FROM Peliculas WHERE Peliculas_ID = pelicula_id;
END//
delimiter ;

delimiter // 
create procedure actores_letra(in letra char) 
begin
select * from Actores where Nombre_Actor like concat('%',letra,'%');
end//
delimiter ;

call actores_letra('A');
call actores_letra('R');
call actores_letra('I');

delimiter // 
create procedure contar_actores_por_su_letra(in letra char) 
begin
select count(*) AS Cuenta from Actores where Nombre_Actor like concat('%',letra,'%');
end//
delimiter ;

call contar_actores_por_su_letra('R');
call contar_actores_por_su_letra('A');
call contar_actores_por_su_letra('I');

delimiter // 
create procedure contar_actores_numero(in letra char, out numero int) 
begin
select count(*) into numero from Actores where Nombre_Actor like concat('%',letra,'%');
end//
delimiter ;

call contar_actores_numero('I',@cantidad_i);
call contar_actores_numero('A',@cantidad_a);
call contar_actores_numero('R',@cantidad_r);
select @cantidad_i as nombre_con_i, @cantidad_a as nombre_con_a, @cantidad_r as nombre_con_r;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Funciones
delimiter // 
CREATE FUNCTION contar_actores(pelicula_id INT)
RETURNS INT
BEGIN
	DECLARE num_actores INT;
	SELECT COUNT(*) INTO num_actores FROM Actor_Peli WHERE Peliculas_ID = pelicula_id;
	RETURN num_actores;
END//
delimiter ;

delimiter // 
CREATE FUNCTION precio_promedio(sala INT)
RETURNS FLOAT
BEGIN
	DECLARE promedio FLOAT;
	SELECT AVG(Precio) INTO promedio FROM Boleto WHERE Sala = sala;
	RETURN promedio;
END//
delimiter ;

delimiter // 
create function numero_letras(letra char) returns int
begin
declare numero int;
select count(*) into numero from Peliculas where Titulo like concat('%',letra,'%');
return numero;
end//
delimiter ;

select numero_letras('P');
select numero_letras('G');
select numero_letras('C');

delimiter //
CREATE FUNCTION tipo_precio(Precio FLOAT) 
RETURNS varchar(10) 
BEGIN
DECLARE a VARCHAR(10);
IF Precio>3.00 then
RETURN 'ALTO';
ELSE
RETURN 'BAJO';
END IF;
END	//
  delimiter ;
  
  select tipo_precio(2.00) AS precio;
  select tipo_precio(3.00) AS precio;
  select tipo_precio(4.00) AS precio;
  

  
  delimiter //
CREATE FUNCTION actores_como(cadena varchar(50)) 
RETURNS int
BEGIN
declare total int;
select count(ID_Actores) into total from Actores 
where Nombre_Actor like concat('%',cadena,'%');
RETURN total;
END//
delimiter ;

select actores_como('A') AS Actores_con_A;
select actores_como('J') AS Actores_con_J;
select actores_como('Z') AS Actores_con_Z;

-----------------------------------------------------------------------------------------------------------
-- Triggers
  delimiter //
CREATE TRIGGER actualizar_genero_pelicula
AFTER INSERT ON Gener_Peli
FOR EACH ROW
BEGIN
	UPDATE Peliculas
	SET ID_Genero = NEW.ID_Genero
	WHERE Peliculas_ID = NEW.Peliculas_ID;
END//
 delimiter ;
 
 
   delimiter //
 CREATE TRIGGER registrar_venta_boleto
AFTER INSERT ON Boleto
FOR EACH ROW
BEGIN
	UPDATE Boleto
	SET Fecha_Hora = NOW()
	WHERE Boleto_ID = NEW.Boleto_ID;
END//
 delimiter ;
 
  delimiter //
  create trigger log_tbl_actores after insert on Actores 
  for each row begin
  insert into acciones(accion) value('Se creo un registro en la tabla Actores');
  end//
  delimiter ;
  
  insert into Actores values (145, 35, "Adan", "Perez", 56);
  
  delimiter //
  create trigger log_actores after insert on Actores 
  for each row begin
  insert into acciones(accion) value(concat('Se creo un registro en la tabla Actores cuyo nombre es: ', NEW.Nombre_Actor, 'y ID: ', NEW.ID_Actores));
  end//
  delimiter ;

  insert into Actores values (146, 35, "Juan", "Cedeledon", 57);
  
  delimiter //
  create trigger before_peliculas_update before update on Peliculas 
  for each row begin
  insert into acciones(accion) value(concat('Se creo un registro en la tabla Peliculas cuyo nombre es: ', NEW.Titulo, 'y ID: ', NEW.Peliculas_ID));
  end//
  delimiter ;
  
UPDATE peliculas 
SET 
    idioma = 'Subtitulado'
WHERE
    titulo REGEXP '^[JI]';
  
  ----------------------------------------------------------------------------------------------------------------------------
  
  -- Eliminar tablas 

drop table actor_peli;
drop table Cine;
drop table gener_peli;
drop table clasific_peli;

  
  
  
  
  