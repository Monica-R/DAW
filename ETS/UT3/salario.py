def salario(precio_hora, horas):
    """
        cálculo del salario en función del precio de la hora y de las horas trabajadas
        :precio_hora: float
        :horas: int
        :return: float

        >>> salario(2, 49)
        118
        >>> salario(3, 47)
        162
        >>> salario(4,35)
        140
    """
    total = 0
    if horas <= 40:
        total = horas * precio_hora
    elif horas <= 48:
        horas_extra = horas - 40
        total = 40 * precio_hora + 2 * precio_hora * horas_extra
    else: 
        horas_extra_triple = horas - 48
        total = 40 * precio_hora + 2 * precio_hora * 8 + 3 * precio_hora * horas_extra_triple
    return total