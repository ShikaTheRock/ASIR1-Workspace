USE dieta_ganadera;

CREATE TABLE toma_alimentos (
    cod_toma INT,
    cod_alim INT,
    cantidad FLOAT NOT NULL,
    PRIMARY KEY (cod_toma, cod_alim),
    FOREIGN KEY (cod_toma) REFERENCES toma(cod_toma),
    FOREIGN KEY (cod_alim) REFERENCES alimentos(cod_alim)
);