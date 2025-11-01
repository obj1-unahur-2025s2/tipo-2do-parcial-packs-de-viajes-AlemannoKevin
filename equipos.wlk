class Equipo {
    const valoracionPlantel
    const jugadores = []

    method potencial() = valoracionPlantel

    method valoracionPlantel() = valoracionPlantel
}

class EquipoEuropeo inherits Equipo {
    const championsGanadas

    override method potencial() = super() * championsGanadas
}

class EquipoConmebol inherits Equipo {
    const popularidad
    var tipoHinchada

    method popularidad() = popularidad

    override method potencial() = super() * tipoHinchada.motivacion(self)
}

object hinchadaEntusiasta {
    
    method motivacion(unEquipoConmebol) = unEquipoConmebol.popularidad() ** 2
}

object hinchadaPechoFrio {
    
    method motivacion(unEquipoConmebol) = 1.max(unEquipoConmebol.popularidad() * 0.1)
}

object hinchadaMercenaria {
    
    method motivacion(unEquipoConmebol) = unEquipoConmebol.valoracionPlantel() * 0.01
}

class EquipoEstadounidense inherits Equipo {
    
}