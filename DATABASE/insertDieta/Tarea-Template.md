---
title: "Inserts"
author: ShikaTheRock!
date: "24.9.2025"
subject: "ShikaTutorials"

titlepage: true
titlepage-rule-height: 0
titlepage-background: ./portada.jpg
toc: true
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

# 1er Bloque

```
TRUNCATE TABLE animal_nutriente;
TRUNCATE TABLE nutriente_alimento;
TRUNCATE TABLE dieta_animal_fechainicio;
TRUNCATE TABLE alimento_dieta_toma;
TRUNCATE TABLE dieta;
TRUNCATE TABLE toma;
TRUNCATE TABLE alimento;
TRUNCATE TABLE animal;
TRUNCATE TABLE nutriente;
```

##  Error 1: Muchos inserts estan en singular cuando deberian de estar en plural

**Ejemplo:**

Nutriente no exixte, es nutrientes

nutriente_alimento -> nutrientes_alimentos"
nutriente -> nutrientes

## Error 2: Faltan tablas

animal_dieta no consta
animal_toma no consta
dieta_alimentos no consta
toma_alimentos no consta

## Error 3: Sobran tables

**Estas tablas no pertenecen a dieta_ganadera:**

animal_nutrientes
dieta_animal_fechainicio
alimentos_dieta_toma

## Error 4: Truncate no funciona porque no puede borrar la FK

Cambiamos todos los truncate por **DELETE FROM**

**TRUNCATE TABLE** -> **DELETE FROM**

## Resolucion:

```
DELETE FROM dieta_alimentos;
DELETE FROM alimentos;
DELETE FROM animal;
DELETE FROM animal_dieta;
DELETE FROM animal_toma;
DELETE FROM dieta;
DELETE FROM nutrientes;
DELETE FROM nutrientes_alimentos;
DELETE FROM toma;
DELETE FROM toma_alimentos;
```

# 2do Bloque

```
INSERT INTO dieta(cod_dieta, finalidad, od_dieta) VALUES (1,'engorde','cereales para engorde');
INSERT INTO dieta(cod_dieta, finalidad, od_dieta) VALUES (2,'crecimiento','hormonas');
INSERT INTO dieta(cod_dieta, finalidad, od_dieta) VALUES (3,'adelgazamiento','hierba');
INSERT INTO dieta(cod_dieta, finalidad, od_dieta) VALUES (4,'mantenimiento','hierba con cerealies');
```

## Error 1: No exixte od_dieta

Pues aqui podemos ignorar el "od_dieta" o alterar la tabla para añadir ese campo, en este caso como supuestamente solo debemos de añadir o quitar los inserts nos decantaremos por la primera.

## Resolucion:

```
INSERT INTO dieta(cod_dieta, finalidad) VALUES (1,'engorde');
INSERT INTO dieta(cod_dieta, finalidad) VALUES (2,'crecimiento');
INSERT INTO dieta(cod_dieta, finalidad) VALUES (3,'adelgazamiento');
INSERT INTO dieta(cod_dieta, finalidad) VALUES (4,'mantenimiento');
```

# 3er Bloque

```
INSERT INTO alimento(nombre_alimento,tipo_alimento,magnitud_alimento,coste_alimento,od_alimento) VALUES('trigo','grano',300,0.3,"grano selecto");
INSERT INTO alimento(nombre_alimento,tipo_alimento,magnitud_alimento,coste_alimento,od_alimento) VALUES('cebada','grano',100,0.4,"grano triturado");
INSERT INTO alimento(nombre_alimento,tipo_alimento,magnitud_alimento,coste_alimento,od_alimento) VALUES('soja','grano',250,0.5,"grano entero");
INSERT INTO alimento(nombre_alimento,tipo_alimento,magnitud_alimento,coste_alimento,od_alimento) VALUES('maiz','grano',500,0.15,"grano machacado");
INSERT INTO alimento(nombre_alimento,tipo_alimento,magnitud_alimento,coste_alimento,od_alimento) VALUES('pienso','pienso',500,0.15,"mezcla de granos");
INSERT INTO alimento(nombre_alimento,tipo_alimento,magnitud_alimento,coste_alimento,od_alimento) VALUES('algodon','semillas de algodon',500,0.15,"alto contenido en fibra");
INSERT INTO alimento(nombre_alimento,tipo_alimento,magnitud_alimento,coste_alimento,od_alimento) VALUES('alfalfa','alfalfa deshidratada',500,0.15,"normativa de calidad");
```

## Error 1: Plurales (Otra vez)

alimento -> alimentos

## Error 2: Nombres cambiados (Aunque esto podria haber sido error mio al crear las tablas)

nombre_alimento -> nom_alim

tipo_alimento -> tipo

coste_alimento -> coste

## Error 3: Campos inexistentes

magnitud_alimento no existe.

od_alimento no existe.

## Error 4: cod_alim (PK) no existe

La primary key no exixste en los inserts, por lo que no tiene un value por default, vamos a arreglar eso. 

## Resolucion:

```
INSERT INTO alimentos(cod_alim,nom_alim,tipo,coste) VALUES(1,'trigo','grano',0.3);
INSERT INTO alimentos(cod_alim,nom_alim,tipo,coste) VALUES(2,'cebada','grano',0.4);
INSERT INTO alimentos(cod_alim,nom_alim,tipo,coste) VALUES(3,'soja','grano',0.5);
INSERT INTO alimentos(cod_alim,nom_alim,tipo,coste) VALUES(4,'maiz','grano',0.15);
INSERT INTO alimentos(cod_alim,nom_alim,tipo,coste) VALUES(5,'pienso','pienso',0.15);
INSERT INTO alimentos(cod_alim,nom_alim,tipo,coste) VALUES(6,'algodon','semillas de algodon',0.15);
INSERT INTO alimentos(cod_alim,nom_alim,tipo,coste) VALUES(7,'alfalfa','alfalfa deshidratada',0.15);
```

# 4to Bloque

```
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('zinc',3,'activo','aportación de la soja');
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('potasio',5,'activo','aportación de la soja');
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('hierro',20,'activo','aportación de la soja');
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('proteina',30,'activo','origen vegetal');
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('fibra',15);
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('vitamina E',2);
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('vitamina B1',1);
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('vitamina B5',0.3);
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('vitamina B7',0.1);
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('vitamina B9',0.2);
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('calcio',5,'desactivo','suplemento');
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('fosforo',3,'desactivo','suplemento');
INSERT INTO nutriente(nombre_nutriente,magnitud_nutriente,estado,od_nutriente) VALUES('potasio',2,'desactivo','procedente de la alfalfa');
```

## Error 1: ACENTOS NO!!!!!!!

aportación -> aportacion

## Error 2: Plurales (Otra vez)(Otra vez mas)

nutriente -> nutrientes

## Error 3: Nombres cambiados

nombre_nutriente -> nom_nutri

magnitud_nutriente -> magnitud

## Error 4: La mitad de las tablas no existen

(Estado y od_nutriente concretamente)

## Error 5: OTRA VEZ FALTA LA PRIMARY KEY

**QUIEN COJONES HA ESCRITO ESTO?**

## Error 6: UK (Unique key no reino unido)

Cambiamos patasio por legalmente no es potasio en el que tiene el id 13 pues el campo nombre ha de ser unique

## Resolucion:

```
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(1,'zinc',3);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(2,'potasio',5);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(3,'hierro',20);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(4,'proteina',30);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(5,'fibra',15);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(6,'vitamina E',2);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(7,'vitamina B1',1);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(8,'vitamina B5',0.3);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(9,'vitamina B7',0.1);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(10,'vitamina B9',0.2);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(11,'calcio',5);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(12,'fosforo',3);
INSERT INTO nutrientes(cod_nutri,nom_nutri,magnitud) VALUES(13,'legalmente no es potasio',2);
```

# 5to Bloque

```
INSERT INTO animal(cod_animal,tipo_animal,peso,anyo_nacimiento,utilidad_animal,produccion_animal,od_animal) VALUES(1,'bovino',900,"02-03-2012","carnica","carniceria","carne para carniceria");
INSERT INTO animal(cod_animal,tipo_animal,peso,anyo_nacimiento,utilidad_animal,produccion_animal,od_animal) VALUES(2,'bovino',800,"05-11-2019","reproduccion","semental","toro reproductor");
INSERT INTO animal(cod_animal,tipo_animal,peso,anyo_nacimiento,utilidad_animal,produccion_animal,od_animal) VALUES(3,'bovino',700,"08-10-2008","lactea","leche","leche entera");
INSERT INTO animal(cod_animal,tipo_animal,peso,anyo_nacimiento,utilidad_animal,produccion_animal,od_animal) VALUES(5,'bovino',800,"30-05-2017","reproduccion","embarazo","vaca reproductora");
INSERT INTO animal(cod_animal,tipo_animal,peso,anyo_nacimiento,utilidad_animal,produccion_animal,od_animal) VALUES(6,'bovino',800,"21-09-2012","lactea","queso","cabra para queso");
INSERT INTO animal(cod_animal,tipo_animal,peso,anyo_nacimiento,utilidad_animal,produccion_animal,od_animal) VALUES(7,'equido',1000,"11-02-2015","carnica","carniceria","caballo para carne");
```

## Error 1: Nombres cambiados

tipo_animal -> tipo

anyo_nacimiento -> anyo_nac

utilidad_animal -> utilidad

produccion_animal -> produccion

## Error 1: anyo_nac me consta como un int(11) y no como un Date

Asi que cambiaremos la fecha completa a solo el año

02-03-2012 -> 2012

## Resolucion:

```
INSERT INTO animal(cod_animal,tipo,peso,anyo_nac,utilidad,produccion,od_animal) VALUES(1,'bovino',900,"2012","carnica","carniceria","carne para carniceria");
INSERT INTO animal(cod_animal,tipo,peso,anyo_nac,utilidad,produccion,od_animal) VALUES(2,'bovino',800,"2019","reproduccion","semental","toro reproductor");
INSERT INTO animal(cod_animal,tipo,peso,anyo_nac,utilidad,produccion,od_animal) VALUES(3,'bovino',700,"2008","lactea","leche","leche entera");
INSERT INTO animal(cod_animal,tipo,peso,anyo_nac,utilidad,produccion,od_animal) VALUES(5,'bovino',800,"2017","reproduccion","embarazo","vaca reproductora");
INSERT INTO animal(cod_animal,tipo,peso,anyo_nac,utilidad,produccion,od_animal) VALUES(6,'bovino',800,"2012","lactea","queso","cabra para queso");
INSERT INTO animal(cod_animal,tipo,peso,anyo_nac,utilidad,produccion,od_animal) VALUES(7,'equido',1000,"2015","carnica","carniceria","caballo para carne");
```

# 6to Bloque

```
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (1,'proteina',200);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (1,'fibra',500);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (1,'hierro',300);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (1,'potasio',250);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (1,'zinc',5);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (2,'proteina',200);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (2,'fibra',500);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (2,'hierro',300);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (2,'potasio',250);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (2,'zinc',5);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (2,'vitamina B1',20);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (2,'vitamina B5',15);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (2,'vitamina B9',25);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (3,'proteina',200);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (3,'fibra',500);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (3,'hierro',300);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (3,'potasio',250);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (3,'vitamina B1',20);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (3,'vitamina B5',15);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (3,'vitamina B7',25);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (3,'vitamina B9',25);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (4,'proteina',200);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (4,'fibra',500);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (4,'hierro',300);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (4,'vitamina B1',20);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (4,'vitamina B5',50);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (4,'vitamina B7',250);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (4,'vitamina B9',30);

INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (5,'proteina',200);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (5,'fibra',500);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (5,'calcio',50);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (5,'hierro',300);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (5,'vitamina B1',20);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (5,'vitamina B5',50);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (5,'vitamina B7',250);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (5,'vitamina B9',30);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (6,'proteina',200);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (6,'fibra',500);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (6,'calcio',50);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (6,'hierro',300);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (6,'vitamina B1',20);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (6,'vitamina B5',50);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (6,'vitamina B7',250);
INSERT INTO animal_nutriente(cod_animal,nombre_nutriente,cantidad_necesitada) VALUES (6,'potasio',30);

```

## Error 1: La tabla animal_nutriente no existe.

**La tabla animal_nutriente no existe.**



# 7mo Bloque

```
INSERT INTO nutriente_alimento(nombre_nutriente,nombre_alimento,cantidad_contenida) VALUES('potasio','alfalfa',300);
INSERT INTO nutriente_alimento(nombre_nutriente,nombre_alimento,cantidad_contenida) VALUES('vitamina B1','maiz',50);
INSERT INTO nutriente_alimento(nombre_nutriente,nombre_alimento,cantidad_contenida) VALUES('vitamina B5','trigo',150);
INSERT INTO nutriente_alimento(nombre_nutriente,nombre_alimento,cantidad_contenida) VALUES('potasio','pienso',30);
INSERT INTO nutriente_alimento(nombre_nutriente,nombre_alimento,cantidad_contenida) VALUES('fosforo','pienso',30);
```

## Error 1: L O S  P L U R A L E S

nutriente_alimento -> nutrientes_alimentos

## Error 2: Campos

los unicos campos que contiene esta tabla son cod_alim y cod_nutri, correjimos como estan escritos y borramos cantidad_contenida

## Error 2: Valores de los campos

Deben de ser int(11) corijamos eso

## Resolucion:

```
INSERT INTO nutrientes_alimentos(cod_alim,cod_nutri) VALUES(1,1);
INSERT INTO nutrientes_alimentos(cod_alim,cod_nutri) VALUES(2,2);
INSERT INTO nutrientes_alimentos(cod_alim,cod_nutri) VALUES(3,3);
INSERT INTO nutrientes_alimentos(cod_alim,cod_nutri) VALUES(1,4);
INSERT INTO nutrientes_alimentos(cod_alim,cod_nutri) VALUES(4,4);
```


# 8vo Bloque

```
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(1,'cebada',1,200);
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(1,'cebada',3,100);
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(1,'cebada',5,150);
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(1,'soja',1,200);
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(1,'soja',3,100);
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(1,'soja',5,150);

INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(2,'cebada',1,200);
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(2,'cebada',3,100);
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(2,'cebada',5,150);
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(2,'soja',1,200);
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(2,'soja',3,100);
INSERT INTO alimento_dieta_toma(cod_dieta,nombre_alimento,cod_toma,cantidad_toma)VALUES(2,'soja',5,150);

INSERT INTO dieta_animal_fechainicio(cod_animal,fecha_inicio,cod_dieta) VALUES(1,"01-10-2021",1);
INSERT INTO dieta_animal_fechainicio(cod_animal,fecha_inicio,cod_dieta) VALUES(2,"09-01-2021",2);
INSERT INTO dieta_animal_fechainicio(cod_animal,fecha_inicio,cod_dieta) VALUES(3,"12-08-2020",4);
INSERT INTO dieta_animal_fechainicio(cod_animal,fecha_inicio,cod_dieta) VALUES(4,"20-02-2020",2);
INSERT INTO dieta_animal_fechainicio(cod_animal,fecha_inicio,cod_dieta) VALUES(5,"05-07-2019",1);
INSERT INTO dieta_animal_fechainicio(cod_animal,fecha_inicio,cod_dieta) VALUES(6,"01-05-2020",4);
```

## Error 1: Tablas no existentes

**Las tablas alimento_dieta_toma y dieta_animal_fechainicio no existen.**

