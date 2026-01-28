USE laboratorio;
ALTER TABLE Pacientes
ADD CONSTRAINT chk_movil
CHECK (movil LIKE '6%' OR movil LIKE '7%');
