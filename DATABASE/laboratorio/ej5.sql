USE laboratorio;
ALTER TABLE Tecnicos
MODIFY Region VARCHAR(50),
ADD CONSTRAINT chk_region
CHECK (Region IN (
    'Andalucía',
    'Aragón',
    'Asturias',
    'Islas Baleares',
    'Canarias',
    'Cantabria',
    'Castilla-La Mancha',
    'Castilla y León',
    'Cataluña',
    'Comunidad Valenciana',
    'Extremadura',
    'Galicia',
    'La Rioja',
    'Comunidad de Madrid',
    'Región de Murcia',
    'Navarra',
    'País Vasco',
    'Ceuta',
    'Melilla'
));
