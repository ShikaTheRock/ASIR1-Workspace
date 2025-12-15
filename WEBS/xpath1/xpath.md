# Realiza las siguientes consultas XPath sobre data_c.xml

## 1. Seleccionar todos los propietarios (con sus subárboles completos)

```
//propietarios
```

## 2. Seleccionar los nombres de todas las agencias (solo contenido de texto)

```
//agencia/nombre
```

## 3. Seleccionar países de los propietarios sin valores duplicados

```
distinct-values(//propietario/direccion/pais)
```
Esto lo he sacado de https://stackoverflow.com/questions/2871707/how-to-select-distinct-values-from-xml-document-using-xpath , No se si esta en el documento y paso de comprobarlo

## 4. Seleccionar el nombre del propietario con id pr2

```
//propietario[@idpropietario="pr2"]/nombre
```

LO mismo de antes https://www.mclibre.org/consultar/xml/lecciones/xml-xpath.html

## 5. Seleccionar los códigos postales de todos los propietarios de Valencia

```
//propietario/direccion//cp
```

## 6. Seleccionar los valores de tipo de pisos con nivel de confort C de todos los inmuebles que no sean in1

```
//piso[@inmuebleRef!="in1"][@confort="C"]/tipo
```

## 7. Selecciona la tercera característica del primer inmueble

```
//inmueble[1]//caracteristica[3]
```

## 8. Selecciona los nombres de los inmuebles sin propietario y con dos características como mínimo

```
//inmueble[not(@propietarioRef)]/nombre
```

## 9. Selecciona los propietarios que no tienen inmuebles

```
//propietario[not(@idpropietario = //inmueble/@propietarioRef)]
```

## 10. Selecciona los nombres de los propietarios que poseen un piso con piscina

```
//propietario[@idpropietario = //inmueble[@idinmueble = //piso[caracteristicas/caracteristica = 'piscina']/@inmuebleRef]/@propietarioRef]/nombre
```

## 11. Selecciona los nombres del primer y último piso en todo el documento.

```
//pisos/piso[last()]/nombre | //pisos/piso[1]/nombre
```
esta al reves pero bueno


## 12. Dado el identificador de piso pi4, selecciona el nivel superior incluso cuando se busque pi4a, pi4a1, pi4b, …

```
//piso[@idpiso = 'pi4' or starts-with(@idpiso, 'pi4')][not(parent::piso)][1]
```