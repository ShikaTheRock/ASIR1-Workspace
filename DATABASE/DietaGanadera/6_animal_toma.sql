USE dieta_ganadera;

CREATE TABLE animal_toma (
    cod_animal INT,
    cod_toma INT,
    PRIMARY KEY (cod_animal, cod_toma),
    FOREIGN KEY (cod_animal) REFERENCES animal(cod_animal),
    FOREIGN KEY (cod_toma) REFERENCES toma(cod_toma)
);