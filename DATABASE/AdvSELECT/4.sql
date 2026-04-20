
INSERT INTO t_empleado(cod_emple,nif,nombre,apellido1,apellido2,fecha_nacimiento,movil,poblacion,fecha_alta,cod_dep) SELECT 14,'85369785M','Margarita','Rodriguez','Garces','1975-9-20','689765409','Xirivella',(CURDATE()),e.cod_dep from t_empleado e where e.cod_dep is not null group by e.cod_dep ORDER BY count(e.cod_dep) limit 1;
