USE dieta_ganadera;

CREATE TABLE animal (
    cod_animal INT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    peso FLOAT NOT NULL,
    anyo_nac INT NOT NULL, 
    utilidad VARCHAR(100) NOT NULL,
    produccion VARCHAR(100) NOT NULL,
    od_animal VARCHAR(100)
);