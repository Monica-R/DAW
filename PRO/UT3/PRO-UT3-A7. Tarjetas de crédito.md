# PRO-UT3-A7. Tarjetas de crédito
## Elementos curriculares

**RA 5**. Realiza operaciones de entrada y salida de información, utilizando procedimientos específicos del lenguaje y librerías de clases.

**Criterios de evaluación**

c) Se han reconocido las posibilidades de entrada / salida del lenguaje y las librerías asociadas.
d) Se han utilizado ficheros para almacenar y recuperar información.
e) Se han creado programas que utilicen diversos métodos de acceso al contenido de los ficheros.

**Contenidos**

5. Lectura y escritura de información:
* Tipos de flujos. Flujos de bytes y de caracteres.
* Clases relativas a flujos.
* Utilización de flujos.
* Salida a pantalla.
* Ficheros de datos. Registros.
* Apertura y cierre de ficheros. Modos de acceso.
* Escritura y lectura de información en ficheros.
* Utilización de los sistemas de ficheros.

## Descripción de la Actividad

* **Metodología**: Aprendizaje basa en problemas
* **Agrupamiento**: Parejas en "Pair programming"
* **Tiempo esperado**: 60 minutos
* **Producto**: Documento `md` (markdown) que se exportará a **PDF** para su entrega en la plataforma


## Evaluación

* **Código**:
    * El programa **funciona correctamente** y realiza todas las acciones solicitadas
    * Los **nombres** de variables y funciones son significativos sin ambigüedad la información que almacenan o la funcionalidad que realizan.
    * El código es **claro**, **eficiente** y **legible**
    * Se crean **funciones intermedias** que hacen el código más legible o refactorizan tareas que se hacen de forma repetitiva en diferentes apartados
* **Comentarios**:

  * El código uncluye comentarios para todos los elementos nuevos que se incluyen en el mismo.
  * El comentario está correctamente redactado.
  * El comentario expresa lo qué realmente hace la línea o líneas de cógo que comentan


* **Trabajo en grupo**:

  * Los apartados se elaboran de forma **cooperativa** poniéndose de acuerdo en cada uno de la información a incluir
  * Los dos miembros del grupo colaboran de forma activa en la resolución de la tarea e intercambian roles de forma periódica.
  * Se ha previsto el tiempo necesario y se ha cumplido con el plazo previsto.

## Recursos

* Usa los apuntes de la unidad colgados en la plataforma de clase cómo guía a la hora de resolver los apartados. 

* A tener en cuenta:
    * Utiliza `with` para abrir los ficheros.
    * Cuando tengas que leer el fichero ábrelo en modo lectura, lee línea por línea y usa `json.loads()` para convertir la línea leída en un diccionario del que poder consultar la información.
    * Cuando tengas que volcar datos en el fichero utiliza el método `json.dumps()`.
    * Si tienes que modificar alguna línea del fichero se recomienda hacerlo siguiendo los siguientes pasos:
        * Abre el fichero `tarjetas.txt` en modo lectura
        * Abre un fichero autiliar `aux.txt` en modo escritura.
        * Lee línea por línea el fichero `tarjetas.txt` averigua si tienes que modificarlas y escríbelas modificadas o no en `aux.txt`
        * Al finalizar renombra el fichero `aux.txt` a `tarjetas.txt` y elimina el fichero `aux.txt`
## Apartados

Un banco guarda la información de las tarjetas de un banco en un fichero de texto de nombre `tarjetas.txt`. En cada línea se incluye en formato **JSON** la información relevante de las tarjetas. Crea el fichero desde el explorador de archivos del sistema operativo e inserta en el mismo las siguientes líneas::

```
{"dni": "43899666A", "n_tarjeta": "2080-0001", "caducidad": "2022-06", "saldo": 1370.55, "operaciones": [-200.3, 500, -12.99, -45.28], "activa": true}
{"dni": "43899000B", "n_tarjeta": "2080-0002", "caducidad": "2023-03", "saldo": 300.28, "operaciones": [-2.3, -5.33, -120.49, 435], "activa": true}
{"dni": "43899111C", "n_tarjeta": "2080-0003", "caducidad": "2022-02", "saldo": 1250.37, "operaciones": [-20.8, 2020, 120.49, -43.58, -11.33, -24.59], "activa": true}
{"dni": "43899222D", "n_tarjeta": "2080-0004", "caducidad": "2022-10", "saldo": 50.05, "operaciones": [-234.89, 1100], "activa": true}
{"dni": "43899333E", "n_tarjeta": "2080-0005", "caducidad": "2024-01", "saldo": 500.15, "operaciones": [-234.89], "activa": false}
{"dni": "43899444F", "n_tarjeta": "2080-0006", "caducidad": "2023-05", "saldo": 673.95, "operaciones": [-34.66, -11.5, -35, -28.45, -112.2, -0.5], "activa": true}
```

Cómo se puede apreciar cada línea es un diccionario volcado en **JSON** que contiene:
* El **DNI** del cliente
* El **Número de la tarjeta**
* El **año** y **mes** de caducidad de la misma
* Si está **activa** o no.
* El **saldo** actual de la misma.
* Las **operaciones** realizadas con la tarjeta:
    * Valor **negativo** en caso de ser un gasto.
    * Valor **positivo** en caso de ser un ingreso.

Escribir las siguientes funciones:

### A1. `renombrar_fichero()`

Le pasamos el nombre actual y el nuevo nombre de un fichero y lo renombra.

### A2. `borrar_fichero()`

Le pasamos el nombre de un fichero y lo elimina del disco duro

### A3. `saldo_medio()`

Devuelve el saldo medio de las tarjetas guardadas en el fichero.

Resultado:

```python
import os
import json

DATOS_TARJETAS = "tarjetas.txt"
def renombrar_fichero(f, new_name):
    try:
        os.rename(f, new_name)

    except FileNotFoundError:
        print("Archivo no encontrado")

def borrar_fichero(f_to_del):
    try:
        os.remove(f_to_del)
    
    except FileNotFoundError:
        print("Archivo no encontrado")

def saldo_medio():
    try:
        with open(DATOS_TARJETAS, "r") as f:
            lineas = f.readlines()
            suma = contador = 0

            for linea in lineas:
                info_tarjeta = json.loads(linea)
                suma += info_tarjeta["saldo"]
                contador += 1

            return round(suma / contador, 2)
            
    except FileNotFoundError:
        print("Archivo no encontrado")
```

### A4. `caducadas()`

Devuelve una **lista** con los **números de las tarjetas** que están caducadas (Su año y mes de caducidad es anterior al actual).

Resultado:

```python
from datetime import datetime
import json

DATOS_TARJETAS = "tarjetas.txt"

def caducadas():
    try:
        with open(DATOS_TARJETAS) as f:
            info = f.readlines()
            fecha_actual = datetime.today().strftime("%Y-%m")
            caducadas = []

            for tarjeta in info:
                info_tarjeta = json.loads(tarjeta)

                if info_tarjeta["caducidad"] < fecha_actual:
                    caducadas.append(info_tarjeta["n_tarjeta"])
    
            return caducadas

    except FileNotFoundError:
        print("Archivo no encontrado")

print(caducadas())
```

### A5. `saldo_inicial()`

Se le pasa el número de tarjeta y devuelve el saldo que tenía la tarjeta antes de hacer todas las operaciones (ingresos y gastos). Calcular usando el saldo actual y el histórico de operaciones.

Resultado:

```python
from datetime import datetime
import os
import json

DATOS_TARJETAS = "tarjetas.txt"

def saldo_inicial(n_tj):
    try:
        with open(DATOS_TARJETAS) as f:
            info = f.readlines()
            operaciones = []
            saldo = 0

            for tarjeta in info:
                info_tarjeta = json.loads(tarjeta)

                if info_tarjeta["n_tarjeta"] == n_tj:
                    saldo = info_tarjeta["saldo"]
                    operaciones = info_tarjeta["operaciones"]
            
            return saldo - sum(operaciones)


    except FileNotFoundError:
        print("Archivo no encontrado")

print(saldo_inicial("2080-0001"))
```

### A6. `crear_tarjeta()`

Se pasa como parámetro a la función el dni, el número de tarjeta y el saldo inicial y se añade los datos de la tarjeta al fichero.

Por defecto:
* El estado de la tarjeta es `True`
* La tarjeta caduca 2 años después del mes actual
* La lista de operaciones está vacia.

Resultado:

```python
def two_years():
    fecha = datetime.now() + relativedelta(years = 2)
    
    return fecha.strftime("%Y-%m")

def crear_tarjeta(dni, n_tarjeta, saldo):
    try:
        with("tarjetas.txt", "a+") as f:
            caducidad = two_years()
            nueva_tarjeta = {
                "dni" : dni,
                "n_tarjeta" : n_tarjeta,
                "caducidad" : caducidad,
                "saldo" : saldo,
                "operaciones" : [],
                "activa" : True
            }
            
            f.write(json.dumps(f"\n{nueva_tarjeta}"))
            
    except FileNotFoundError:
        return "Error."
```

### A7. `desactivar()`

Pone a `False` el estado de todas las tarjetas que estén caducadas.

Resultado:

```python

from datetime import datetime
import os
import json

DATOS_TARJETAS = "tarjetas.txt"

def desactivada():
    try:
        with open(DATOS_TARJETAS, "r+") as f:
            info = f.readlines()
            fecha_actual = datetime.today().strftime("%Y-%m")
            tarjetas = []

            for tarjeta in info:
                info_tarjeta = json.loads(tarjeta)

                if info_tarjeta["caducidad"] < fecha_actual:
                    info_tarjeta["activa"] = False
                
                tarjetas.append(info_tarjeta)

            f.truncate(0)
            f.seek(0)

            for tarjeta in tarjetas:
                json_data = json.dumps(tarjeta)
                f.write(json_data + "\n")

                print(json_data)

    except FileNotFoundError:
        print("Archivo no encontrado")

desactivada()
```

### A8. `gastar()`

Se pasa como parámetro el número de la tarjeta y una cantidad y añade el valor del gasto (en negativo) a la lista de operaciones de tarjeta y actualiza el saldo de la misma.

En caso de estar desactivada la tarjeta no se realiza la operación y la función devuelve `False`

Resultado:

```python
import os
import json

DATOS_TARJETAS = "tarjetas.txt"

def gastar(n_tar, gasto):
    try:
        with open(DATOS_TARJETAS, "r+") as f:
            info = f.readlines()
            tarjetas = []

            for tarjeta in info:
                info_tarjeta = json.loads(tarjeta)

                if info_tarjeta["n_tarjeta"] == n_tar:
                    info_tarjeta["operaciones"].append(gasto)
                    info_tarjeta["saldo"] -= gasto
                
                tarjetas.append(info_tarjeta)

            f.truncate(0)
            f.seek(0)

            for tarjeta in tarjetas:
                json_data = json.dumps(tarjeta)
                f.write(json_data + "\n")

                print(json_data)

    except FileNotFoundError:
        print("Archivo no encontrado")

gastar("2080-0001", -240)
```

## Complementario

Se desea guardar de cada operación no solo el importe, sino la fecha en la que se realizó. Para ello se sustituye la lista de operaciones por una lista en la que se guarda en cada elemento un diccionario con dos elementos:
* **cantidad** de la operación.
* **fecha** de la operación.

El fichero queda de la forma:

```
{"dni": "43899666A", "n_tarjeta": "2080-0001", "caducidad": "2022-06", "saldo": 1370.55, "operaciones": [{"cantidad": -200.3, "fecha": "2021-12-15"}, {"cantidad": 500, "fecha": "2021-12-21"}, {"cantidad": -12.99, "fecha": "2022-02-15"}, {"cantidad": -45.28, "fecha": "2022-03-18"}], "activa": true}
{"dni": "43899000B", "n_tarjeta": "2080-0002", "caducidad": "2023-03", "saldo": 300.28, "operaciones": [{"cantidad": -2.3, "fecha": "2022-01-11"}, {"cantidad": -5.33, "fecha": "2022-01-11"}, {"cantidad": -120.49, "fecha": "2022-02-28"}, {"cantidad": 435, "fecha": "2022-02-28"}], "activa": true}
{"dni": "43899111C", "n_tarjeta": "2080-0003", "caducidad": "2022-02", "saldo": 1250.37, "operaciones": [{"cantidad": -20.8, "fecha": "2022-01-07"}, {"cantidad": 2020, "fecha": "2022-01-15"}, {"cantidad": 120.49, "fecha": "2022-02-03"}, {"cantidad": -43.58, "fecha": "2022-02-05"}, {"cantidad": -11.33, "fecha": "2022-02-12"}, {"cantidad": -24.59, "fecha": "2022-03-15"}], "activa": true}
{"dni": "43899222D", "n_tarjeta": "2080-0004", "caducidad": "2022-10", "saldo": 50.05, "operaciones": [{"cantidad": -234.89, "fecha": "2022-03-16"}, {"cantidad": 1100, "fecha": "2022-03-18"}], "activa": true}
{"dni": "43899333E", "n_tarjeta": "2080-0005", "caducidad": "2024-01", "saldo": 500.15, "operaciones": [{"cantidad": -234.89, "fecha": "2022-03-21"}], "activa": false}
{"dni": "43899444F", "n_tarjeta": "2080-0006", "caducidad": "2023-05", "saldo": 673.95, "operaciones": [{"cantidad": -120.3, "fecha": "2022-01-14"}, {"cantidad": -14.43, "fecha": "2022-01-18"}, {"cantidad": 220, "fecha": "2022-02-05"}, {"cantidad": -12.3, "fecha": "2022-03-14"}], "activa": true}
```

### A9. Modificar funciones `saldo_inicial()` y `gastar()`

Modificar la función `saldo_inicial()` de forma que funcione con los datos almacenados en el formato actual.

Resultado:

```python

```

Modificar la función `gastar()` de forma que funcione con los datos almacenados en el formato actual. A la función aparte de pasarle el número de tarjeta y la cantidad usará la fecha del día actual para la fecha de la operación.

### A10. `gastos_mes()`

A la función se le pasa una año y un mes ('yyyy-mm') y devuelve la cantidad total gastada por todas las tarjetas en dicho mes.

###### tags: `pro` `ut3` `archivos` `json` `ficheros`