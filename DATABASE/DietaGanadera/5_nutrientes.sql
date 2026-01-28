USE dieta_ganadera;

CREATE TABLE nutrientes (
    cod_nutri INT PRIMARY KEY,
    nom_nutri VARCHAR(100) NOT NULL,
    magnitud VARCHAR(100),
    UNIQUE (nom_nutri)
);