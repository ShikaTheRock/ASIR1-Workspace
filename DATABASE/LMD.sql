USE dietaganadera;

SELECT cod_toma from toma;

select cod_animal from animal where 2020 = date_format(anyo_nacimiento, '%X');

select nombre_alimento from alimento where tipo_alimento = 'grano';

select nombre_alimento, od_alimento from alimento where od_alimento LIKE 'grano%';

select nombre_nutriente from nutriente where estado = 'desactivo';

select nombre_alimento, od_alimento from alimento where od_alimento LIKE '%grano%';

select nombre_nutriente from nutriente where magnitud_nutriente >= 2 AND magnitud_nutriente <= 5;

select nombre_nutriente from nutriente where nombre_nutriente like 'vitamina B%';

select cod_animal, fecha_inicio from dieta_animal_fechainicio where cod_dieta = 1;

select cod_animal from dieta_animal_fechainicio where date_format(fecha_inicio, '%X-%m') between '2020-10' and '2021-02';

select nombre_alimento, sum(cantidad_toma) from alimento_dieta_toma group by nombre_alimento;