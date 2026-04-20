select * from t_empleado where cod_emple = all(select cod_emple from t_nomina where sueldo_bruto >= all(select sueldo_bruto from t_nomina)) ;
