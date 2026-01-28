USE dieta_ganadera;

CREATE TABLE nutrientes_alimentos (
    cod_alim INT,
    cod_nutri INT,
    PRIMARY KEY (cod_alim, cod_nutri),
    FOREIGN KEY (cod_alim) REFERENCES alimentos(cod_alim),
    FOREIGN KEY (cod_nutri) REFERENCES nutrientes(cod_nutri)
);
