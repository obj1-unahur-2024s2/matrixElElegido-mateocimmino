// matrix.wlk
// matrix.wlk
// matrix.wlk
// matrix.wlk
object nave {
  const property pasajeros = [neo, morfeo, trinity]
  
  method subirA(unPasajero) {
    pasajeros.add(unPasajero)
  }
  
  method bajarA(unPasajero) {
    pasajeros.remove(unPasajero)
  }
  
  method cantidadPasajeros() = pasajeros.size()
  
  method pasajeroConMasVitalidad() = pasajeros.max({ p => p.vitalidad() })
  
  method pasajeroConMenosVitalidad() = pasajeros.min({ p => p.vitalidad() })
  
  method estaEquilibrada() = self.pasajeroConMasVitalidad().vitalidad() <= (self.pasajeroConMenosVitalidad().vitalidad() * 2)
  
  method estaElElegido() = pasajeros.any({ p => p.esElElegido() })
  
  method naveChoca() {
    pasajeros.forEach({ p => p.saltar() })
    pasajeros.clear()
  }
  
  method pasajerosSinElegido() = pasajeros.filter({ p => !p.esElElegido() })
  
  method naveAcelera() {
    self.pasajerosSinElegido().forEach({ p => p.saltar() })
  }
}

object neo {
  var energia = 100
  
  method energia() = energia
  
  method saltar() {
    energia *= 0.5
  }
  
  method esElElegido() = true
  
  method vitalidad() = energia * 0.1
}

object morfeo {
  var vitalidad = 8
  var estaCansado = false
  
  method vitalidad() = vitalidad
  
  method estaCansado() = estaCansado
  
  method saltar() {
    vitalidad = 0.max(vitalidad - 1)
    estaCansado = not estaCansado
  }
  
  method esElElegido() = false
}

object trinity {
  method vitalidad() = 0
  
  method saltar() {
    
  }
  
  method esElElegido() = false
}