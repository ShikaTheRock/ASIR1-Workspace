USE dieta_ganadera;

CREATE TABLE dieta_alimentos (
    cod_dieta INT,
    cod_alim INT,
    PRIMARY KEY (cod_dieta, cod_alim),
    FOREIGN KEY (cod_dieta) REFERENCES dieta(cod_dieta),
    FOREIGN KEY (cod_alim) REFERENCES alimentos(cod_alim)
);