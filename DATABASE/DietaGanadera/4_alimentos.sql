USE dieta_ganadera;

CREATE TABLE alimentos (
    cod_alim INT PRIMARY KEY,
    nom_alim VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    coste FLOAT NOT NULL,
    UNIQUE (nom_alim)
);