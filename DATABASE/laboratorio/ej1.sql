USE laboratorio;
ALTER TABLE Pacientes
    MODIFY Address varchar(200) NULL,
    MODIFY City varchar(100) NOT NULL,
    MODIFY PostalCode varchar(100) NULL;

