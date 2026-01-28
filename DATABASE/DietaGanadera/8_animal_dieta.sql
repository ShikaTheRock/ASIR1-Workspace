USE dieta_ganadera;

CREATE TABLE animal_dieta (
    cod_animal INT,
    cod_dieta INT,
    f_ini INT NOT NULL,
    f_fin INT,
    PRIMARY KEY (cod_animal, cod_dieta),
    FOREIGN KEY (cod_animal) REFERENCES animal(cod_animal),
    FOREIGN KEY (cod_dieta) REFERENCES dieta(cod_dieta)
);