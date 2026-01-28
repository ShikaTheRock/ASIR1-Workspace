USE dieta_ganadera;

CREATE TABLE toma (
    cod_toma INT PRIMARY KEY,
    nom_toma VARCHAR(100) NOT NULL,
    hora_inicio INT NOT NULL,
    hora_fin INT,
    od_toma VARCHAR(100)
);