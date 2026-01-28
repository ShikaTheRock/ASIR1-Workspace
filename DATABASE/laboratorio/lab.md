# ej1.sql

```sql
USE laboratorio;
ALTER TABLE Pacientes
    MODIFY Address varchar(200) NULL,
    MODIFY City varchar(100) NOT NULL,
    MODIFY PostalCode varchar(100) NULL;


```

# ej2.sql

```sql
USE laboratorio;
ALTER TABLE Pacientes
    ADD movil int NOT NULL UNIQUE;


```

# ej3.sql

```sql
USE laboratorio;
ALTER TABLE Medicos
    MODIFY LastName varchar(100) NOT NULL;


```

# ej4.sql

```sql
USE laboratorio;
ALTER TABLE Medicos
    ADD CONSTRAINT nombre_apellidos
    UNIQUE (FirstName, LastName);

```

# ej5.sql

```sql
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

```

# ej6.sql

```sql
USE laboratorio;
ALTER TABLE Pacientes
ADD CONSTRAINT chk_movil
CHECK (movil LIKE '6%' OR movil LIKE '7%');

```

# ej7.sql

```sql
USE laboratorio;
ALTER TABLE Autoanalizador
CHANGE picture foto longblob;

```

# ej8.sql

```sql
USE laboratorio;
ALTER TABLE Pruebas
DROP COLUMN Discontinued;

```

# ej9.sql

```sql
USE laboratorio;
ALTER TABLE Autoanalizador
ADD jefe int(11);

ALTER TABLE Autoanalizador
ADD CONSTRAINT fk_autoanalizador_jefe
FOREIGN KEY (jefe)
REFERENCES Autoanalizador(AutoanalizadorID);
```

# ej10.sql

```sql
USE laboratorio;
ALTER TABLE Autoanalizador
ADD CONSTRAINT uq_autoanalizadorname
UNIQUE (AutoanalizadorName);
```

