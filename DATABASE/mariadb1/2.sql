USE db_empresa
CREATE TABLE t_empleado
(
id_emple INT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
ap1 VARCHAR(30) NOT NULL,
ap2 VARCHAR(30),
id_depart INT NOT NULL,
f_nacimiento DATE NOT NULL,
CONSTRAINT uk_emple_nombre
	UNIQUE (nombre, ap1, ap2),
CONSTRAINT fk_emple_depart
	FOREIGN KEY (id_depart)
		REFERENCES t_departamento(id_dep)
);

DESC t_empleado;
