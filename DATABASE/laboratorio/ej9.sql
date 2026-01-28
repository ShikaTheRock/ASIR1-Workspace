USE laboratorio;
ALTER TABLE Autoanalizador
ADD jefe int(11);

ALTER TABLE Autoanalizador
ADD CONSTRAINT fk_autoanalizador_jefe
FOREIGN KEY (jefe)
REFERENCES Autoanalizador(AutoanalizadorID);