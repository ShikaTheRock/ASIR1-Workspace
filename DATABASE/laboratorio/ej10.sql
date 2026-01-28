USE laboratorio;
ALTER TABLE Autoanalizador
ADD CONSTRAINT uq_autoanalizadorname
UNIQUE (AutoanalizadorName);