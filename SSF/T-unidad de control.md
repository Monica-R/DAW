 ### Unidad de control
Por:Laura María Sarmiento Melián,José David Falcón Sosa y Mónica Roka Paco

Unidad de Control en Procesador.
>La Unidad de Control (UC) es la parte “pensante” de un ordenador, por ello es considerado el cerebro. Dicha unidad es la encargada del gobierno y funcionamiento de los aparatos que la componen. Gracias a ella la CPU recibe los datos y ejecuciones de las instrucciones correctas en cada momento.
Su función es recibir información y después la interpreta. A continuación, la procesa mediante las órdenes que envía a los otros componentes del ordenador. Desde la UC se controlan las Unidades Aritmético Lógicas (UAL) y otras unidades de ejecución del procesador. Así mismo, la UC es la encargada de escribir los resultados en los registros, caches o en la dirección correspondiente de la RAM.



Elementos fundamentales de la Unidad de Control
* Registro contador de programas
* Registro de instrucción
* Decodificador
* Reloj
* Secuenciador

> Consta, de los siguientes elementos:
>
> 1. Registro contador de programa. Es un registro interno del ordenador que guarda la dirección de la última instrucción leída, de esta forma podrá saber cuál es la siguiente instrucción a ejecutar.
> 
> Un contador de programa también se conoce como *contador de instrucción*, *puntero de instrucción*, *registro de dirección de instrucción* o *registro de control de secuencia*. 
> 
> Para ejecutar una instrucción, se empieza por buscarla en memoria, el contador de programa indica la dirección de memoria  donde se encuentra la instrucción. Una vez la tenga, una señal de control incrementa el contador en una unidad, lo cual los programas deben estar cargados en posiciones concretas de la memoria.
> 
> 2. Registro de Instrucciones. Contiene la instrucción de máquina que se ejecuta en ese momento.
> 3. Decodificador. Está compuesto por los circuitos encargados de determinar qué se debe hacer teniendo en cuenta el código de la instrucción a ejecutar y los valores del registro de estado.
> 4. Reloj. Indica el momento en que se debe ejecutar cada paso de la ejecución de una instrucción. La velocidad del reloj se mide en Hertzios (pulsos de reloj por segundo).
> 5. Secuenciador. Genera las microórdenes microórdenes necesarias para ejecutar necesarias para ejecutar la instrucción.

>

![](https://hardysoftwareg2sr.blogia.com/upload/20110203023550-unidad-de-control.jpg)
 

Implementación de la Unidad de Control cableada y microprogramada (instrucciones, arquitectura, cisc y risc) 
>Unidades de control Cableadas: Este tipo de unidades se usan en procesadores simples, debido a que en estas las tablas de registros e instrucciones no cambian al encontrarse todos los caminos de datos cableados previamente de manera fija.Estas unidades no se pueden optimizar ni potenciar.

>Unidades de Control
microprogramdas: se usa un procesador que se encarga de hacer todas las funciones de la unidad de contro, esto optimiza la forma en la que se ejecutan las intrucciones y incluso tienes la posibilidad de añadir nuevas instrucciones

>Las instrucciones en una unidad de control se divide en 2 partes: el opcode y el dato.
>El opcode: Es la porción de una instrucción de lenguaje de máquina que especifica la operación a ser realizada.
>Los datos:los datos son representaciones simbólicas de un determinado atributo o variable cualitativa o cuantitativa.
>
>Arquitecturas
>Unidad de control cableada: La arquitectura de la unidad de control cableada es fija por lo que si el conjunto de instrucciones es modificado requirira la unidad de control requerira cambios en el cableado. 
>Unidad de control microprogramada:Esta unidad destaca por una estructura simple y ademas las salidas del controlador son organizadas en microinstrucciones y pueden ser reemplazadas fácilmente.

>CISC:El significado de sus siglas es Complex Instruction Set Computer. CISC es un sistema de instrucciones desarrollado por Intel que requieren de mucho tiempo para ser ejecutadas completamente.El problema del CISC es la reduccion de cantidad de instrucciones de un software y se ignorarn el numero de ciclos or instruccion.
>
>RISC:Significa Reduced Instruction Set Computer Processor.Este tipo de procesador se basa en minimizar el tiempo de ejecucion de una instruccion, optimizando y limitando las instrucciones.Este tipo de diseño de procesadores requiere menor cantidad de transistores, reduciendo costes y tiempos de fabricación pero hace que estos sean menos potentes que los CISC.
![IMG](https://is603arquicom2016.files.wordpress.com/2016/08/risc.gif?w=372)

Direccionamiento instrucciones (inmediato, absoluto, relativo, indirecto, implícito)

> Se denomina modo de direccionamiento a las diferentes maneras de especificar en informática un operando dentro de una instrucción en lenguaje ensamblador. A la hora de realizar una tarea específica es neceasario que el ordenador opere con una serie de datos almacenados en memoria. Las instrucciones que procesan datos contienen direccciones que permiten que el procesador localice los datos a utilizar en la instrucción a realizar.
> La dirección específica del dato es conocida como Dirección Efectiva (DE). El encargado de proveer una DE de una instrución es el modo de direccionamiento.
    > * Inmediato: En este modo de direccionamiento el operando se encuentra incluido en el operando. Es decir, contiene un campo de operando y no de dirección. Su valor es fijo (constante) y puede ser empleado para la definición de variales y constantes. Además, no es necesario un acceso adicional a memoria para obtener el dato, pero su tamaño está limitado por el tamaño del campo de direecionamiento.
    > * Absoluto: También conocido como directo, el modo de instrucción abosluto se caracteriza porque en el campo de operando en la instrucción contiene la dirección en memoria. La DE es igual a la parte de dirección de la instrucción. Básicamente, el operando reside en la memoria y su dirección es dada de manera directa por el campo de dirección de la instrucción.
    > Los modos de direccionamiento tienen una forma muy simple y no hay que hacer cálculos para obtener la dirección efectiva donde está el dato. Su tamaño varía del número de registros que tenga la máquina; en el direccionamiento directo a memoria, dependerá del tamaño de la memoria. 
    > * Relativo: Es el sustituto del direccionamiento directo pero genera un código independiente de la posición. En realidad se trata de direccionamiento por desplazamiento sobre el contador de programa. Este modo se utiliza para referirse a las direcciones del programa.
   > * Indirecto: La dirección contiene una dirección de memoria, en la que se encuentra la DE.
   > * Implícito: Se refiere, generalmente, a las instrucciones que utilizan un solo byte. El operando asociado a la Instrucción está contenido en un registro de CPU y, por ello, resulta implícito en el código de operación y no es necesario hacer referencia a nunguna dirección. El código de operación identifica a la operación a ejecutar y el o los registros que intervienen.


### Presentacion en Genially
https://view.genial.ly/615f995fc8416d0dff33449d/presentation-unidad-de-control-en-procesador



Webgrafia
Unidades de control cableadas y microprogramadas
https://hardzone.es/reportajes/que-es/unidad-control/
Unidades de control cableadas y microprogramadas
https://es.wikipedia.org/wiki/Unidad_de_control#:~:text=Unidad%20de%20control%20cableada,-En%20un%20tiempo&text=Su%20control%20est%C3%A1%20basado%20en,conjunto%20de%20instrucciones%20m%C3%A1s%20peque%C3%B1o.
Procesadores Risc y Cisc
https://www.profesionalreview.com/2021/07/18/risc-vs-cisc/
¿Que es un dato?
https://concepto.de/dato-en-informatica/
Direccion Relativa
https://www.infor.uva.es/~bastida/OC/modos.pdf
[Fuente](https://es.wikipedia.org/wiki/Modo_de_direccionamiento#Inmediato)
[Fuente 2](http://dea.unsj.edu.ar/mp1/APUNTES/Catedra%20Modos%20de%20Direccionamiento.pdf)
[Fuente 1](https://hardzone.es/reportajes/que-es/unidad-control/)
>[Fuente 2](https://edukativos.com/apuntes/archives/3641)
