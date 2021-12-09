import webbrowser # importamos la librería para navegador
# Creamos el HTML que queremos mostrar

titulo = "Tabla de multiplicar"
nombre_fichero = "hola.html"
estilos = '''
    \ttable, tr, td, th{
    \t\tborder: 1px solid;
    \t}
'''
################ CÓDIGO DEL CONTENIDO - TABLA DE MULTIPLICAR ####################
contenido = "<h1>Tabla de multiplicar</h1>\n"
contenido += "\t<table>\n"
for i in range(1, 10):
    contenido += "\t\t<tr>\n"
    contenido += f"\t\t\t<th>tabla del {i}</th>\n"
    for j in range(1, 10):
        contenido += f"\t\t\t<td>{i} x {j} = {i * j}</td>\n"
    contenido += "\n\t\t</tr>\n"
contenido += "\t</table>"
##################################################################################


# Definimos la plantilla de nuestra página

plantilla = f'''
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <title>{titulo}</title>
    <style>
        {estilos}
    </style>
</head>
<body>
    {contenido}
</body>
</html>
'''

# Creamos fichero con permiso de escritura, insertamos el contenido y luego cerramos
file = open(nombre_fichero, "w")
file.write(plantilla)
file.close()
#Abrimos el fichero en una nueva pestaña del navegador predeterminado del sistema
webbrowser.open_new_tab(nombre_fichero)
