# PRO-UT3-AE1. Prueba práctica

## Recursos

* Podrás usar los apuntes de la unidad colgados en la plataforma en el apartado **Contenidos** de la unidad.
* Abre los mismos y cuando hayas terminado esconecta el cable de red del equipo. 


## Criterios de evaluación

* El programa o función **funciona correctamente** y realiza todas las acciones solicitadas
* Los **nombres** de variables y funciones son significativos y no son ambigüos respecto a la información que almacenan o la funcionalidad que realizan.
* El código es **claro**, **eficiente** y **legible**
* Si es necesario, se crean **funciones intermedias** que hacen el código más legible o refactorizan tareas que se hacen de forma repetitiva en diferentes apartados

## Enunciado

### Parte 1

En la cocina de restaurante se informatizan las recetas de los platos que se preparan. En la versión inicial del programa se usa como estructura de datos para almacenar una receta un diccionario con los elementos principales de la receta. Un ejemplo de la misma es la siguiente:

```python
receta = {
    "nombre" : "tortilla papas",                                        # Nombre de la receta
    "tiempo" : 30,                                                      # Tiempo en minutos de elaboración
    "ingredientes" : ["papas", "huevos", "cebolla", "aceite", "sal"]
}
```

En un fichero de nombre `recetas_v1.txt` se incluyen en cada línea del mismo y en formato `json` diferentes recetas. Crea el fichero desde el sistema operativo e inserta en el mismo el siguiente contenido:

```
{"nombre": "pollo verduras", "tiempo": 45, "ingredientes": ["pollo", "cebollas", "zanahorias", "calabacines"]}
{"nombre": "tortilla papas", "tiempo": 30, "ingredientes": ["papas", "huevos", "cebolla", "aceite", "sal"]}
{"nombre": "tortilla francesa", "tiempo": 10, "ingredientes": ["huevos", "aceite", "sal"]}
{"nombre": "arroz cubana", "tiempo": 30, "ingredientes": ["arroz", "huevos", "papas", "salchichas", "aceite", "sal"]}
```

Crea un fichero de nombre `recetas_v1.py` e inserta en el mismo las siguientes funciones:

#### `mostrar_receta()` **1p**

Le pasamos el **nombre de una receta** y muestra por pantalla la información de la misma de la forma:

```
Nombre: Tortilla papas
Tiempo: 30 minutos
Ingredientes:
* papas
* huevos
* cebolla
* aceite
* sal
```



#### `mostrar_receta_ingredientes()` **1,5p**

Se le pasa a la función un lista de ingredientes y muestra todas las recetas que incluyen todos los ingredientes de la lista.

#### `nueva_receta()` **1,5p**

Se le pasa como parámetros:
* El nombre de la receta
* El tiempo de preparación
* La lista de ingredientes

Añade la receta al fichero.

**Nota:** para evitar problemas de codificación de carácteres no utilices caracteres que no sean del alfabeto inglés en las recetas. (No usar ñ, á, é, í, ó, ú)

#### `anadir_ingrediente()` **1,5p**

Se le pasa como parámetro el nombre de la receta y el nombre de un ingrediente y se modifica la receta en el fichero añadiendo el nueva ingrediente a la lista de ingredientes de la misma.

#### `eliminar_receta()` **1,5p**

Se le pasa como parámetro el nombre de la receta y la elimina del fichero

### Parte 2

Con el fin de tener más información de las recetas se modifica la estructura de datos de forma que en la receta se indica para cuantas personas es y se dan más detalles de los ingredientes inluyendo aparte del nombre, la cantidad y la unidad de medida de los mismos. Un ejemplo sería el siguiente:

```python
receta = {
    "nombre" : "tortilla papas",                                    # Nombre de la receta
    "tiempo" : 30,                                                     # Tiempo en minutos de elaboración
    "personas" : 2,
    "ingredientes" : {
        "papas" : {"cantidad" : 300, "unidad" : "gramos"},
        "huevos" : {"cantidad" : 2, "unidad" : "unidades"},
        "cebolla" : {"cantidad" : 50, "unidad" : "gramos"},
        "aceite" : {"cantidad" : 100, "unidad" : "mililitros"},
        "sal" : {"cantidad" : 1, "unidad" : "pizca"}
    }
}
```

Ten en cuenta, que en el ejemplo anterior, si queremos mostrar la cantidad de `cebolla` a utilizar lo podríamos hacer ejecutando: 

```python
print(receta["ingredientes"]["cebolla"]["cantidad"])
```

Para esta segunda parte, crea un fichero de nombre `recetas_v2.txt` e inserta en el mismo el siguiente contenido:

```
{"nombre": "tortilla papas", "tiempo": 30, "personas": 2, "ingredientes": {"papas": {"cantidad": 300, "unidad": "gramos"}, "huevos": {"cantidad": 2, "unidad": "unidades"}, "cebolla": {"cantidad": 50, "unidad": "gramos"}, "aceite": {"cantidad": 100, "unidad": "mililitros"}, "sal": {"cantidad": 1, "unidad": "pizca"}}}
{"nombre": "tortilla francesa", "tiempo": 10, "personas": 1, "ingredientes": {"huevos": {"cantidad": 1, "unidad": "unidades"}, "aceite": {"cantidad": 10, "unidad": "mililitros"}, "sal": {"cantidad": 1, "unidad": "pizca"}}}
{"nombre": "espaguetis carbonara", "tiempo": 35, "personas": 4, "ingredientes": {"espaguetis": {"cantidad": 400, "unidad": "gramos"}, "queso parmesano": {"cantidad": 100, "unidad": "gramos"}, "huevos": {"cantidad": 2, "unidad": "unidades"}, "beicon": {"cantidad": 150, "unidad": "gramos"}}}
```

Crea un fichero de nombre `recetas_v2.py` e inserta en el mismo las siguientes funciones:


#### `mostrar_receta_personas()` **1,5p**

Le pasamos el nómbre de una receta y el número de personas para la que se quiere preparar y muestra la receta con las cantidades ajustadas al número de personas. 

Así, por ejemplo, se llamamos a la función `mostrar_receta_personas("tortilla papas", 3)` debería mostrar:

```
Nombre: Tortilla papas
Tiempo: 30 minutos
Personas: 3
Ingredientes:
* papas: 450 gramos
* huevos: 3 unidades
* cebolla: 75 gramos
* aceite: 150 mililitros
* sal: 1.5 pizca
```

#### `anadir_ingrediente()` **1,5p**

Se le pasa como parámetro el nombre de la receta y el nombre de un ingrediente, la cantidad y la unidad y se modifica la receta en el fichero añadiendo el nuevo ingrediente a la lista de ingredientes de la misma.

## Entrega

Comprime en formato `zip` la carpeta en la que están los ficheros `recetas_v1.py` y `recetas_v2.py` y entrega los mismos en el Aula Virtual