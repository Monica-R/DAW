# PRO-UT1-A12. Listas

## Criterios de calificación

* El programa realiza lo que se solicita
* El nombre de las variables expresa lo que van a contener las mismas
* Si se van a utilizar valores constantes estos se inicializan al principio del programa
* Dado que el tamaño de los programas va a ir siendo cada vez mayor, es importante que se comente el código.

## Tareas no evaluables (resuletos en clase)

Realizar los siguientes programas. **En ningún caso se deberán emplear elementos de Python que no hayamos visto en clase o que no se ofrezcan como recursos**.

### Operaciones sobre listas

1. Escribe un programa que permita crear una lista de números enteros. Para ello, el programa tiene que pedir un número y luego generar ese número de enteros al azar entre 1 y 20. Al final el programa mostrará la lista.

Inserta el resultado:

```python
from random import randint
n = int(input("Número de elementos: "))
lista = []
for i in range(n):
    num = randint(1, 20)
    lista += [num]
print(lista)
```
Alternativa usando el método `append()``
```python 
from random import randint
n = int(input("Número de elementos: "))
lista = []
for i in range(n):
    num = randint(1, 20)
    lista.append(num)
print(lista)
```

2. Escribe un programa que permita crear una lista de enteros al azar entre 1 y 20 y que, a continuación, pida un número y diga cuántas veces aparece ese número en la lista. 

Inserta el resultado:

```python
from random import randint
n = int(input("Número de elementos: "))

# Genero la lista
lista = []
for i in range(n):
    num = randint(1, 20)
    lista += [num]

# Busco un valor
num = int(input("Numero a buscar: "))
cont = 0
for i in lista:
    if num == i:
        cont += 1
print(f"{num} se repite {cont} veces en {lista}")
```
3. Escribe un programa que permita crear una lista números enteros al azar entre 1 y 20 y que, a continuación, pida dos números y sustituya todas las apariciones del primero por el segundo en la lista.

Inserta el resultado:

```python
from random import randint
import os
os.system("clear")
n = int(input("Número de elementos: "))

# Genero la lista
lista = []
for i in range(n):
    num = randint(1, 20)
    lista += [num]
print(lista)
# Sustituir un valor
num_buscar = int(input("Numero a buscar: "))
num_sustituir = int(input("Numero a sustituir: "))
cont = 0
l = len(lista)
for i in range(l):
    if lista[i] == num_buscar:
        lista[i] = num_sustituir
        cont += 1
print(f"{num_buscar} se sustituye {cont} veces por {num_sustituir} en la {lista}")
```

Alternativa con append, count e index:

```python
from random import randint
import os
os.system("clear")
n = int(input("Número de elementos: "))

# Genero la lista
lista = []
for i in range(n):
    num = randint(1, 20)
    lista.append(num)
print(lista)

# Sustituir un valor
num_buscar = int(input("Numero a buscar: "))
num_sustituir = int(input("Numero a sustituir: "))
num_veces = lista.count(num_buscar)
for i in range(num_veces):
    indice = lista.index(num_buscar)
    lista[indice] = num_sustituir

print(f"{num_buscar} se sustituye {num_veces} veces por {num_sustituir} en la {lista}")
```

4. Escribe un programa que permita crear una lista de números enteros al azar entre 1 y 20 y que, a continuación, pida un número y elimine ese número de la lista.

Inserta el resultado:

```python
import os
from random import randint
import platform


if platform.system() == "Linux":
    command = "clear"
elif platform.system() == "Windows":
    command = "cls"

os.system(command)


list = []

n_val = int(input("Inserte número de valores: "))

for i in range(n_val):
    list += [randint(1, 20)]

print(list)

n_buscar = int(input("Inserte valor a eliminar: "))

len_list = len(list)

for i in range(len_list - 1, -1, -1):
    if list[i] == n_buscar:
        del list[i]

print(list)
```

Alternativa con `count()`, `copy()` e `index()`

```python
from random import randint
import os
os.system("clear")
n = int(input("Número de elementos: "))

# Genero la lista
lista = []
for i in range(n):
    num = randint(1, 20)
    lista.append(num)
print(lista)

# Sustituir un valor
num_buscar = int(input("Numero a eliminar: "))
lista_original = lista.copy()
num_veces = lista.count(num_buscar)
for i in range(num_veces):
    indice = lista.index(num_buscar)
    del lista[indice]
print(f"La lista original es {lista_original}")
print(f"{num_buscar} se elimina {num_veces}. La lista final es: {lista}")
```

5. Escriba un programa que permita crear una lista de números al azar entre 1 y 20 y que, a continuación, cree una segunda lista igual a la primera, pero al revés (no se trata de escribir la lista al revés, sino de crear una lista distinta).

Inserta el resultado:

```python
from random import randint
import os
os.system("clear")

elementos = int(input("Introduce el número de elementos: "))

lista = []

for i in range(elementos):
    valor = randint(1, 20)
    lista += [valor]

# Alternativa 1 Recorremos por valor de cada item de la lista y añadimos
# a la nueva lista por el principio
lista2 = []

for i in lista:
    lista2 = [i] + lista2
    

# Alternativa 2. Recorremos por índice de atrás hacia delante la lista
l_lista = len(lista)
for i in range(l_lista - 1, -1, -1):

    # Añado los valores a lista2
    lista2 += [lista[i]]
# Alternativa 3. Usando el método reverse()

lista2 = lista1.reverse()

# Alternativa 4. Generando sublista por el final

lista2 = lista1[::-1]
print(lista)
print(lista2)
```

## Funciones de listas

1. Escribe una función `esta_ordenada()` que tome una lista como parámetro y devuelva `True` si la lista está ordenada en orden ascendente y devuelva `False` en caso contrario.

Escribe un programa que compruebe con varias listas el correcto funcionamiento de la función

Inserta el resultado:

```python
def esta_ordenada(lista):
    return lista == sorted(lista)
```

## Evaluables

2. Escribe una función llamada `tiene_duplicados()` que tome una lista y devuelva `True` si tiene algún elemento duplicado. La función no debe modificar la lista.

Crear una función que genere una lista de 23 números aleatorios del 1 al 100 y comprobar con la función anterior si existen elementos duplicados.

Inserta el resultado:

```python

```


### Listas de palabras

1. Escribe un programa que permita crear una lista de nombres. Para ello, el programa tiene que leer nombres y terminar cuando se introduzca una cadena de texto vacia. Al final el programa mostrará la lista. Utiliza el método `append()` para añadir elementos a la lista

Ejemplo de ejecución:

```
Inserta un nombre: Antonio
Inserta un nombre: María
Inserta un nombre: Silvia
Inserta un nombre: Juan
Inserta un nombre: Maria
Inserta un nombre: 
['Antonio', 'María', 'Silvia', 'Juan', 'María']
```

Inserta el resultado:

```python
nombre = input("Escribe un nombre: ")
lista = []

while nombre != "":
    lista.append(nombre)
    nombre = input("Escribe un nombre: ")

copia = lista.copy()
print(lista)

```

2. Modifica el apartado anterior de forma que después de generar la lista de nombres se pida un nombre y diga cuántas veces aparece esa palabra en la lista. El mensaje será distinto si **no aparece ninguna vez**, si **aparece 1 vez** o si aparece 2 o más **veces**.

a) Usando el método `count()`
Inserta el resultado:

```python

```
b) Sin usar el método `count()`
Inserta el resultado:

```python

```
3. Modifica el apartado 1 de forma que después de generar la lista de palabras se pidan dos nombres y se sustituyan todas las apariciones de la primera palabra por la segunda. Utiliza  método `insert()`

Inserta el resultado:

```python

```
4. Modifica el apartado 1 de forma que después de generar la lista de palabras se pidan un nombre y se eliminen todas las apariciones en la lista del nombre.

Inserta el resultado:

```python

```
### Comparar listas por contenido

Escribe una función `comparar_listas()` a la que le pasamos dos listas y devuelve `True` si el contenido de ambas listas es igual o `False` en caso contrario. La función deberá comparar primero la longitud de ambas listas y si es igual debe comparar ambas listas elemento a elmento.

**Recuerda que tanto en este como en el resto de ejercicios no se pueden usar funciones ni métodos que no se hayan visto en clase.**

Inserta el resultado:

```python

```

### Sublista en lista

Crea una función de nombre `es_sublista()` a la que le pasamos dos listas y nos devuelve `True` en caso de que la primera lista es una sublista de la segunda y `False` en caso contrario. 

Así, si por ejemplo `l1 = [2, 3, 4]` es una sublista de `l2 = [1, 2, 3, 4, 5]` porque `l1 == l2[1:4]` devuelve `True`

**Recuerda que tanto en este como en el resto de ejercicios no se pueden usar funciones ni métodos que no se hayan visto en clase.**

Inserta el resultado:

```python

```
### Investiga y contesta

Qué diferencia hay si comparamos dos listas utilizando el operador lógico `==` respecto a si las comparamos utilizando el operador lógico `is`. 

> R:

Pon un ejemplo usando código que deje clara la diferencia:

```python

```

## Evaluables complementarios

### Eliminar repetidos

Escribe una función `eliminar_repetidos()` a la que le pasemos una lista y que devuelva la misma lista sin elementos repetidos (dejando únicamente el primero de los elementos repetidos).

**Recuerda que tanto en este como en el resto de ejercicios no se pueden usar funciones ni métodos que no se hayan visto en clase.**

Para comprobar la función genera una lista de 30 números aleatorios del 1 al 15 y pásala como parámetro a la fucnión

Inserta el resultado:

```python

```

**TIP**: Una posible solución es ir recorriendo la lista elemento a elemento y para cada elemento recorrer, a su vez, la lista desde el final hasta siguiente al actual y eliminar todas las apariciones del valor actual en dicho recorrido inverso.

### Sublistas de lista

Escribe una función `sublistas()` a la que le pasemos una lista y un número y devuelva una lista con todas las sublistas de longitud el número pasado como parámetro.

Ejemplo:

Si a la función le pasamos la lista `[1, 2, "tres", 4, "cinco"]` y el número **3** la función nos devuelve la lista `[[1, 2, "tres"], [2, "tres", 4], ["tres, 4, "cinco"]]`

Inserta el resultado:

```python

```

### Ítems a lista no numerada
Escribe una función en Python a la que le pasemos una lista de palabras y devuelva el código HTML que muestra dichas palabras en una lista no numera de HTML

Inserta el resultado:

```python

```

### Lista de listas a tabla

Escribe un programa que reciba una lista de listas de palabras, todas de la misma longitud y genere el html para mostrar cada lista en una fila de una tabla HTML

```
Si la función recibe [["a", "b", "c"], ["uno", "dos", "tres"]]

Genera el una tabla en html similar a:

 <table>
  <tr>
    <td>a/td>
    <td>b</td>
    <td>c/td>
  </tr>
  <tr>
    <td>uno</td>
    <td>dos</td>
    <td>tres</td>
  </tr>
</table> 
```
Inserta el resultado:

```python

```

###### tags: `pro` `ut1` `ejercicios` `listas` `funciones`