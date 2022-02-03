def valid_email(email):
    """
    validates email address
    :email:str
    :return:True|str
    """
    confirmar = []
    # Completar código de la función
    if len(email) < 6:
        confirmar.append("longitud no válida")
    
    if email.count("@") > 1:
        confirmar.append("@ no válida")
    
    for char in email:
        if email[0] == "@":
            confirmar.append("@ no válida")
            cuenta = cuenta + 1

    if confirmar == []:
        return True




# Ejemplos de ejecución y resultado
print(valid_email("a@a"))                    # 'longitud no válida'
print(valid_email("user@dom@dom.es"))        # '@ no válida'
print(valid_email("@user.com"))              # '@ no válida'
print(valid_email("user@ab.c"))              # 'dominio no válido'
print(valid_email("user@.com"))              # 'dominio no válido'
print(valid_email("user.2000@rediris.es"))   # True