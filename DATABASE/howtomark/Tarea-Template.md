---
title: "LA GUIA DEFINITIVA DE COMO GENERAR PDF's SUPER PEPINOS CON MARKDOWN"
author: ShikaTheRock!
date: "24.9.2025"
subject: "ShikaTutorials"

titlepage: true
titlepage-rule-height: 0
titlepage-background: ./portada.jpg
toc: true
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

# Que es markdown???

- Markdown es un lenguaje de marcado ligero, creado por John Gruber en 2004, que utiliza texto plano para añadir formato (negrita, cursiva, listas, etc.) de forma sencilla y rápida, ademas acepta etiquetas lenguajes más complejos como HTML o styles de css.

# Como usar markdown???

- Markdown, aun sin usar las caracteristicas de HTML o CSS, es una herramienta tremendamente poderosa, y con una curva de aprendizaje, mucho mas facil que dominar, que writter o word. 

Los comandos basicos son muy faciles, pues algunos ya han sido adoptados por whatsapp y ya sin darnos cuenta nos hemos acostumbrado

- **Pero, que programa debo instalar para markdown???**

**NINGUNO!!** Markdown es texto plano!!! Asi que puedes usar cualquier editor de texto plano para editarlo, para empezar os recomiendo ampliamente Codium, Vscode o similares, si os sentis atrevidos podeis probar con nvim + nvchad, Pero eso es un tema aparte, y si no teneis nada de eso, siempre teneis vim o nano

**Os recomiendo mucho, iniciaros con esta web, para aprender las bases**

Clica aqui abajo para aprender Markdown
[](https://www.markdowntutorial.com/)

Pero si no tienes tiempo o ganas, aqui tienes lo mas basicos

## Encabezados

Estos vendrian a remplazar los `<h1>, <h2>`...

```markdown
# Título 1
## Título 2
### Título 3
#### Título 4
##### Título 5
###### Título 6

```

## Texto 

```markdown
*Texto en cursiva*  
**Texto en negrita**  
***Negrita y cursiva***  
~~Texto tachado~~  
`Texto en línea (código)`
```

## Listas

### Lista desordenada

```markdown
- Elemento 1
- Elemento 2
  - Sub-elemento
    - Sub-sub-elemento

```
### Lista ordenada

```markdown
1. Primer elemento
2. Segundo elemento
3. Tercer elemento

```
## Enlaces

```markdown
[Texto del enlace](https://ejemplo.com)
```
## Imágenes

```markdown
![Texto alternativo](https://ruta/imagen.jpg)
```
## Citas

```markdown
> Esto es una cita
>> Esto es una cita anidada
```
## Bloques de código

## Tablas
```markdown
| Columna 1 | Columna 2 |
|-----------|-----------|
| Dato 1    | Dato 2    |
| Dato 3    | Dato 4    |

```
## Separadores
```markdown
---
```

# METADATOS, LA MAGIA

Los metadatos, son lo que nos va a dar el estilo, para que pandoc pueda leerlo luego, os dejo estos, para que podais empezar a darle estilo lo antes posible a vuestors PDF

```markdown
---
title: "COMO GENERAR PDF's SUPER PEPINOS CON MARKDOWN"
author: ShikaTheRock!
date: "24.9.2025"
subject: "ShikaTutorials"

titlepage: true
titlepage-rule-height: 0
titlepage-background: ./portada.jpg
toc: true
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---
```
Para portada.jpg y watermark.jpg podeis escojer cualquier imagen, ponerla en la misma ruta que el md, y renombrarlas

# EISVOGEL, NECESARIO

Eisvogel, es lo que junto con el md, va a hacer posible nuestro pdf, para instalarlo:

Descargaremos la ultima version de EISVOGEL

https://github.com/Wandmalfarbe/pandoc-latex-template/releases/

Creación del directorio de la plantilla
```bash 
mkdir -p $HOME/.pandoc/templates
```
Descomprimir el fichero de la plantilla, y copiar el fichero de la plantilla eisvogel.latex dentro de la ruta anteriormente creada,
```bash
unzip Eisvogel*
```
```bash
cp eisvogel.latex $HOME/.pandoc/templates/
```
# Transformar tu .md a un .PDF

- Vale, ya tenemos nuestro .md creado... Y ahora que???

Pues para este punto debemos necesitar dos paquetes clave que deberemos instalar, si no es usted capaz de instalar programas en su equipo, llame a su sysadmin para que los instale, o cree una maquina virtual

## Pandoc

pandoc va a ser la herramienta que nos permitira realizar las conversiones de un documento a ptro, tiene soporte para miles de formatos, es una herramienta muy interesante digna de investigar

```bash
sudo apt install pandoc
```

## Latex

Y luego, para darle ese formato tan guay a nuestros documentos, necesitaremos latex

```bash
#Instalación de entorno pipx,

sudo apt install pipx

#Instalación para que pandoc utilice latex (OJO!! Sin sudo),

pipx install pandoc-latex-environment

#Instalación de recursos de latex,

sudo apt install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra
```
O en su defecto, tambien podrias instalar el texlive-full, pero es muy pesado

## El comando

Estando en la ruta del .md, realizaremos este comando:

```bash
pandoc documento.md -o documento.pdf --template eisvogel.latex
```
