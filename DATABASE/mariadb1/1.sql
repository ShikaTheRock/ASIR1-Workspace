USE db_empresa
CREATE TABLE t_departamento
(
id_dep INT PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
CONSTRAINT uk_depart_nombre
	UNIQUE (nombre)
);

DESC t_departamento;
