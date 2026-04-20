---
title: "Empresa"
author: "ShikaTheRock!"

titlepage: true
titlepage-rule-height: 0
toc: true
toc-own-page: true
titlepage-text-color: #000000
lang: es
---

# 1.sql

```

select nif, nombre, apellido1, apellido2, nombre_banco from t_empleado e join t_datos_bancarios db on e.cod_emple = db.cod_emple and nombre_banco = 'BBVA';
```

## Resultados de 1.sql

```

nif	nombre	apellido1	apellido2	nombre_banco
37894532R	Francisco	García	Piqueres	BBVA
20847563Y	Isabel	Romeu	Sánchez	BBVA
20866162L	Lola	Godoy	Marín	BBVA

```

# 2.sql

```

select * from t_empleado where cod_emple = all(select cod_emple from t_nomina where sueldo_bruto >= all(select sueldo_bruto from t_nomina)) ;

```

## Resultados de 2.sql

```

cod_emple	nif	nombre	apellido1	apellido2	fecha_nacimiento	movil	direccion	poblacion	email	fecha_alta	cod_dep
4	30794932W	Leonor	Perales	Martínez	1990-06-07	667945674	C/Picassent, num 10	Alcàsser	fsahuquillo@yahoo.es	2022-02-01	3

```

# 3.sql

```

select n.cod_emple, e.nombre, e.apellido1, TRUNCATE(n.sueldo_bruto - ((sueldo_bruto * porcentaje_irpf / 100 )+(sueldo_bruto * porcentaje_segursocial / 100)), 2) as SueldoNeto from t_nomina n join t_empleado e on n.cod_emple = e.cod_emple where mes = 12 and anyo = 2020 and date_format(e.fecha_nacimiento, '%x') = '1980';

```

## Resultados de 3.sql

```

cod_emple	nombre	apellido1	SueldoNeto
3	Francisco	García	1422.00

```

# 4.sql

```


INSERT INTO t_empleado(cod_emple,nif,nombre,apellido1,apellido2,fecha_nacimiento,movil,poblacion,fecha_alta,cod_dep) SELECT 14,'85369785M','Margarita','Rodriguez','Garces','1975-9-20','689765409','Xirivella',(CURDATE()),e.cod_dep from t_empleado e where e.cod_dep is not null group by e.cod_dep ORDER BY count(e.cod_dep) limit 1;

```

# 5.sql

```

insert into t_nomina select 14,(select mes from t_nomina where cod_emple = 8 and mes = 2 and anyo = 2021), (select anyo from t_nomina where cod_emple = 8 and mes = 2 and anyo = 2021), (select sueldo_bruto from t_nomina where cod_emple = 8 and mes = 2 and anyo = 2021), (select porcentaje_irpf from t_nomina where cod_emple = 8 and mes = 2 and anyo = 2021), (select porcentaje_segursocial from t_nomina where cod_emple = 8 and mes = 2 and anyo = 2021) ;
```

# 6.sql

```

update t_nomina n join t_datos_bancarios d on n.cod_emple = d.cod_emple set n.sueldo_bruto = n.sueldo_bruto - 3  where n.mes = 2 and n.anyo = 2021 and d.nombre_banco = "Sabadell";

```

# 7.sql

```

 update t_nomina n join t_empleado e on e.cod_emple = n.cod_emple join t_departamento d on d.cod_dep = e.cod_dep set sueldo_bruto = sueldo_bruto + 2 where n.mes = 2 and n.anyo = 2021 and d.nom_dep = "rrhh";
 
```

# 8.sql

```

delete e from t_empleado e join t_departamento d on e.cod_dep = d.cod_dep and d.nom_dep = "calidad";
```

