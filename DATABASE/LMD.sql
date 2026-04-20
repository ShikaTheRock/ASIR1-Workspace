USE dietaganadera;

-- Ejercicio 1 Muestra el código de toma de la toma 

SELECT cod_toma from toma;

-- Ejercicio 2 Muestra los animales nacidos en el año 202

select cod_animal from animal where 2020 = date_format(anyo_nacimiento, '%X');

-- Ejercicio 3 Muestra todos los alimentos que sean de grano

select nombre_alimento from alimento where tipo_alimento = 'grano';

-- Ejercicio 4 Muestra los alimentos y las observaciones, los alimentos que empiecen las observaciones por la palabra “grano”

select nombre_alimento, od_alimento from alimento where od_alimento LIKE 'grano%';

-- Ejercicio 5 Muestra los nutrientes que estén desactivos

select nombre_nutriente from nutriente where estado = 'desactivo';

-- Ejercicio 6 Muestra los nutrientes, que tengan en sus observaciones la palabra ‘grano’

select nombre_alimento, od_alimento from alimento where od_alimento LIKE '%grano%';

-- Ejercicio 7 Muestra los nutrientes cuya magnitud se encuentre entre 2 y 5, incluyendo estos valores

select nombre_nutriente from nutriente where magnitud_nutriente >= 2 AND magnitud_nutriente <= 5;

-- Ejercicio 8 Muestra los nutrientes que sean alguna vitamina B

select nombre_nutriente from nutriente where nombre_nutriente like 'vitamina B%';

-- Ejercicio 9 Muestra el código de animal y la fecha de inicio de la dieta cuyo código es 1

select cod_animal, fecha_inicio from dieta_animal_fechainicio where cod_dieta = 1;

-- Ejercicio 10 Muestra el código de dieta de los animales que se pusieron a dieta entre agosto de 2020 y febrero de 2021

select cod_animal from dieta_animal_fechainicio where date_format(fecha_inicio, '%X-%m') between '2020-10' and '2021-02';

-- Ejercicio 11 Muestra la suma de cantidad de la toma de cada alimento

select nombre_alimento, sum(cantidad_toma) from alimento_dieta_toma group by nombre_alimento;

-- Ejercicio 12 Muestra la suma de cantidad de la toma de cada alimento por tomas

select nombre_alimento, cod_toma, sum(cantidad_toma) from alimento_dieta_toma group by nombre_alimento, cod_toma;

-- Ejercicio 13 Muestra lo mismo que la consulta anterior, pero con el nombre de los alimentos de forma descendente

select nombre_alimento, cod_toma, sum(cantidad_toma) from alimento_dieta_toma group by nombre_alimento, cod_toma order by nombre_alimento DESC;

-- Ejercicio 14 Muestra la suma de cantidad de la toma de cada alimento por tomas, siempre que esta sea superior a 300

select nombre_alimento, cod_toma, sum(cantidad_toma) from alimento_dieta_toma group by nombre_alimento, cod_toma having sum(cantidad_toma) > '300';

-- Ejercicio 15 Muestra cuántas dietas se han aplicado a animales cada año (agrupado por años). Utiliza alias para los valores devueltos: número de dietas y año

select count(cod_dieta) as 'Num dietas', date_format(fecha_inicio, '%X') as 'Año inicio' from dieta_animal_fechainicio group by date_format(fecha_inicio, '%X');

-- Ejercicio 16 Muestra el código de las dietas que se hayan iniciado en julio

select cod_dieta as 'Dietas Julio', fecha_inicio from dieta_animal_fechainicio WHERE date_format(fecha_inicio, '%m') = '07';

-- Ejercicio 17 Muestra el número de alimentos diferentes que se dan por toma a los animales

select distinct count(nombre_alimento), cod_toma from alimento_dieta_toma group by cod_toma,nombre_alimento ;

-- Ejercicio 18 Muestra cuántas veces se administra cada nutriente a todos los animales

select cod_animal, count(nombre_nutriente) from animal_nutriente group by cod_animal;

-- Ejercicio 18 Muestra la consulta anterior, pero ordenado descendentemente por el número devuelto

select cod_animal, count(nombre_nutriente) from animal_nutriente group by cod_animal order by count(nombre_nutriente) DESC;

--Ejercicio 19 Añade 100 gramos a la cantidad contenida en el nutriente ‘fosforo’ del alimento ‘pienso

update nutriente_alimento set cantidad_contenida = cantidad_contenida+100 where nombre_nutriente = 'fosforo' AND nombre_alimento = 'pienso';

-- Ejercicio 20 Modifica la fecha de nacimiento del animal cuyo código es 1 al ’11-09-2020’

update animal set anyo_nacimiento  = '2020-09-11' where cod_animal  = 1;

-- Ejercicio 21 Aumenta en 50 gramos la cantidad necesaria del nutriente “vitamina B5” del animal cuyo código es 2

update animal_nutriente set cantidad_necesaria = cantidad_necesaria+50 where cod_animal = 2 AND nombre_nutriente = 'vitamina B5';

-- Ejercicio 22 Realiza un COMMIT Elimina la toma del nutriente “vitamina B9” al animal cuyo código es el 3 y comprueba que elimina el registro. Intenta realizar un ROLLBACK. ¿Qué sucede?

COMMIT;
delete from animal_nutriente where cod_animal = 3 and nombre_nutriente = 'vitamina B9';
rollback;

-- Ejercicio 23 Elimina el registro de la tabla dieta_animal_fechainicio, del animal que ha iniciado la dieta un dia 9

delete from dieta_animal_fechainicio WHERE date_format(fecha_inicio, '%d') = 09;

-- EJECUCIONES:

-- cod_toma
-- 1
-- 2
-- 3
-- 4
-- 5
-- cod_animal
-- 1
-- nombre_alimento
-- cebada
-- maiz
-- soja
-- trigo
-- nombre_alimento od_alimento
-- cebada  grano triturado
-- maiz    grano machacado
-- soja    grano entero
-- trigo   grano selecto
-- nombre_nutriente
-- calcio
-- fosforo
-- magnesio
-- nombre_alimento od_alimento
-- cebada  grano triturado
-- maiz    grano machacado
-- pienso  mezcla de granos
-- soja    grano entero
-- trigo   grano selecto
-- nombre_nutriente
-- calcio
-- fosforo
-- magnesio
-- potasio
-- vitamina E
-- zinc
-- nombre_nutriente
-- vitamina B1
-- vitamina B5
-- vitamina B7
-- vitamina B9
-- cod_animal      fecha_inicio
-- 1       2021-10-01
-- 5       2019-07-05
-- nombre_alimento sum(cantidad_toma)
-- cebada  900
-- soja    900
-- nombre_alimento cod_toma        sum(cantidad_toma)
-- cebada  1       400
-- cebada  3       200
-- cebada  5       300
-- soja    1       400
-- soja    3       200
-- soja    5       300
-- nombre_alimento cod_toma        sum(cantidad_toma)
-- soja    1       400
-- soja    3       200
-- soja    5       300
-- cebada  1       400
-- cebada  3       200
-- cebada  5       300
-- nombre_alimento cod_toma        sum(cantidad_toma)
-- cebada  1       400
-- soja    1       400
-- Num dietas      Año inicio
-- 1       2019
-- 3       2020
-- 1       2021
-- Dietas Julio    fecha_inicio
-- 1       2019-07-05
-- count(nombre_alimento)  cod_toma
-- 2       1
-- 2       3
-- 2       5
-- cod_animal      count(nombre_nutriente)
-- 1       5
-- 2       8
-- 3       7
-- 4       7
-- 5       8
-- 6       8
-- cod_animal      count(nombre_nutriente)
-- 2       8
-- 5       8
-- 6       8
-- 3       7
-- 4       7
-- 1       5