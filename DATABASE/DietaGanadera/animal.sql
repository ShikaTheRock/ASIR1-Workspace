USE dieta_ganadera;

CREATE DATABASE animal (
    cod_animal INT PRIMARY KEY,
    tipo VARCHAR NOT NULL,
    peso FLOAT NOT NULL,
    anyo_nac INT NOT NULL, 
    utilidad VARCHAR NOT NULL,
    produccion VARCHAR NOT NULL,
    od_animal VARCHAR,

);