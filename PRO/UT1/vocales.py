frase_introducida=input("Introduce una frase: ")

print("Vocales en la frase:")

texto = f""

for i in "aeiou":
    
  if i in frase_introducida:

    if i == "u":
      texto = texto + f"{i}"

    else:
      texto = texto + f"{i} "

print(f"Tu frase tiene estas vocales: {texto}")
Delete
