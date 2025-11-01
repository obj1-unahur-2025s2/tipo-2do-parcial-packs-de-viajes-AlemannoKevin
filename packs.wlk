class Pack {
    const duracion
    const precioBase
    const coordinador
    const beneficios = []

    method esPremium()

    method tieneAlMenosCantidadDeBeneficiosVigentes(cantidad) = beneficios.filter({p => p.esVigente()}).size() >= cantidad
    method costoFinal() = precioBase + beneficios.sum({p => p.costo()})
}

class PackNacional inherits Pack {
    const provinciaDeDestino
    const actividades = []

    override method esPremium() = duracion > 10 and coordinador.esAltamenteCalificado()
}

class PackInternacional inherits Pack {
    const paisDeDestino
    const cantidadDeEscalas
    const esLugarDeInteres

    override method esPremium() = esLugarDeInteres and duracion > 20 and cantidadDeEscalas == 0
    override method costoFinal() = super() * 1.2
}

class PackProvincial inherits PackNacional {
    const cantidadDeCiudadesAVisitar

    override method esPremium() = actividades.size() >= 4 and cantidadDeCiudadesAVisitar > 5 and self.tieneAlMenosBeneficiosVigentes(3)
    override method costoFinal() = if (self.esPremium()) super() * 1.05 else super()
}

class Coordinador {
    const cantidadDeViajes
    const estaMotivado
    const añosDeExperiencia
    const roles = [rolGuia, rolAsistenteLogistico, rolAcompañante]
    var rolActual

    method añosDeExperiencia() = añosDeExperiencia
    method esRolValido(unRol) = roles.contains(unRol)
    method cambiarRol(nuevoRol) {
        if (self.esRolValido(nuevoRol))
            rolActual = nuevoRol
        else throw new DomainException(message = 'Rol no valido')
    }
}

object rolGuia {

    method estaAltamenteCalificado(unCoordinador) = unCoordinador.estaMotivado()
}

object rolAsistenteLogistico {

    method estaAltamenteCalificado(unCoordinador) = unCoordinador.añosDeExperiencia() >= 3
}

object rolAcompañante {

    method estaAltamenteCalificado(unCoordinador) = true
}

class Beneficios {
    const tipo
    const  costo
    const esVigente

    method costo() = costo
    method esVigente() = esVigente
}
