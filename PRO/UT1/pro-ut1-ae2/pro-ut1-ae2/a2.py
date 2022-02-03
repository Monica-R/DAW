def cc2sc(identifier):
    """
    Converts text in camelCase format to snake_case format
    """
    # Completar código de la función
    lista = list(identifier)
    long = len(lista)
    for i in range(long):
        if i == 0:
            lista[i] = lista[i].lower()
        elif lista[i] == lista[i].upper():
            lista[i] = lista[i].lower()
            lista.insert(i, "_")
            i+=1
    conversion = "".join(lista)
    return conversion

print(cc2sc("nomVariable"))            # 'nom_variable'
print(cc2sc("NomVariable"))            # 'nom_variable'
print(cc2sc("nomVariableCompuesto"))   # 'nom_variable_compuesto'
print(cc2sc("variable"))               # 'variable'

