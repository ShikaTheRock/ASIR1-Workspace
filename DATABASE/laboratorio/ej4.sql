USE laboratorio;
ALTER TABLE Medicos
    ADD CONSTRAINT nombre_apellidos
    UNIQUE (FirstName, LastName);
