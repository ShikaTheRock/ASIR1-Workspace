/* Eliminación tablas*/
DROP TABLE IF EXISTS toma_alimentos;
DROP TABLE IF EXISTS toma;

/* Crear tabla toma INT 2 */
CREATE TABLE toma (
  cod_toma INT(11) NOT NULL,
  nom_toma VARCHAR(100) NOT NULL,
  hora_inicio INT(2) NOT NULL,
  hora_fin INT(2) NOT NULL,
  od_toma VARCHAR(100),
  PRIMARY KEY (cod_toma)
)

/*CHECK (0 a 23) */
ALTER TABLE toma
ADD CONSTRAINT chk_hora_inicio
CHECK (hora_inicio BETWEEN 0 AND 23),
ADD CONSTRAINT chk_hora_fin
CHECK (hora_fin BETWEEN 0 AND 23);

/* Recreación tabla toma_alimentos */
CREATE TABLE toma_alimentos (
  cod_toma INT(11) NOT NULL,
  cod_alim INT(11) NOT NULL,
  cantidad FLOAT NOT NULL,
  PRIMARY KEY (cod_toma, cod_alim),
  CONSTRAINT fk_toma
    FOREIGN KEY (cod_toma) REFERENCES toma (cod_toma),
  CONSTRAINT fk_alimento
    FOREIGN KEY (cod_alim) REFERENCES alimentos (cod_alim)
)

/*Inserción correcta (debe funcionar) */
INSERT INTO toma
VALUES (1, 'mañana', 8, 14, 'toma matinal');

/*Inserción incorrecta(debe fallar) */
INSERT INTO toma
VALUES (2, 'error_inicio', 25, 12, 'hora incorrecta');

/*Inserción incorrecta2(debe fallar) */
INSERT INTO toma
VALUES (3, 'error_fin', 10, 30, 'hora incorrecta');

/* Nueva toma (recena (03:00 - 04:00)) */
INSERT INTO toma (cod_toma, nom_toma, hora_inicio, hora_fin, od_toma)
VALUES (10, 'recena', 3, 4, 'toma nocturna');

/* Nuevo animal para carne animal */
INSERT INTO animal
(cod_animal, tipo, peso, anyo_nac, utilidad, produccion, od_animal)
VALUES
(8, 'equido', 900, YEAR(CURDATE()) - 1, 'carnica', 'comida animales', 'equino para alimento animal');

/* Dieta de engorde desde hoy */
INSERT INTO animal_dieta
(cod_animal, cod_dieta, f_ini)
VALUES
(8, 1, YEAR(CURDATE()));

/* Nuevo nutriente: hidratos de carbono */
INSERT INTO nutrientes
(cod_nutri, nom_nutri, magnitud)
VALUES
(14, 'hidratos de carbono', '1.3');

/* Relación nutriente - alimento (maíz y trigo) */
INSERT INTO nutrientes_alimentos
(cod_alim, cod_nutri)
VALUES
(4, 14),
(1, 14);

/* Corregir texto sin acentos */
UPDATE nutrientes
SET nom_nutri = 'aportacion'
WHERE cod_nutri = 1;

/* Corregir nombre de toma */
UPDATE toma
SET nom_toma = 'manyana'
WHERE nom_toma = 'ma?ana';

/*mCorrección de otros posibles textos  */
UPDATE alimentos
SET tipo = 'semillas de algodon'
WHERE tipo = 'semillas de algod?n';

UPDATE animal
SET produccion = 'carniceria'
WHERE produccion = 'carnicer?a';

/* 14. Solución: forzar UTF8  */
ALTER DATABASE dieta_ganadera
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

ALTER TABLE nutrientes CONVERT TO CHARACTER SET utf8mb4;
ALTER TABLE toma CONVERT TO CHARACTER SET utf8mb4;
ALTER TABLE animal CONVERT TO CHARACTER SET utf8mb4;
ALTER TABLE alimentos CONVERT TO CHARACTER SET utf8mb4;

/* Comprobación: inserción con acentos */
INSERT INTO nutrientes (cod_nutri, nom_nutri, magnitud)
VALUES (20, 'vitamina acción rápida', '2.5');
