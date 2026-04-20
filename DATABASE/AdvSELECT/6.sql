update t_nomina n join t_datos_bancarios d on n.cod_emple = d.cod_emple set n.sueldo_bruto = n.sueldo_bruto - 3  where n.mes = 2 and n.anyo = 2021 and d.nombre_banco = "Sabadell";
