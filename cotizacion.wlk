// Producción
// El costo de producción depende de la calidad y cantidad de la cosecha.

// si se considera que la papa es buena son $3 por cada unidad
// si es regular se usa el valor que da PEPE 
// La calidad premium tiene un importe por unidad 50% mayor a la calidad buena.


object pepe {
    var property cotizacion = 2

    method cotizacion(unaCotizacion) {
      cotizacion = unaCotizacion
    }
}

object calidadBuena {
  method cotizacion() {
    return 3
  }
}

object calidadRegular {
  method cotizacion() {
    return pepe.cotizacion()
  }
}

object calidadPremium {
  // genera setter y getter para porcentajePremium
  const porcentajePremium = 1.5

  method cotizacion() {
    return calidadBuena.cotizacion() * porcentajePremium
  }
}

// Null Object
object calidadSinDeterminar {
  method cotizacion() {
    return 0
  }
}

object productor {
  var property impuestoAplicable = impuestoSimple
  var property calidad = calidadBuena
  method costoProduccion(cantidad) {
    return cantidad * calidad.cotizacion()
  }

  method calcularImpuesto(cantidad) {
    return impuestoAplicable.monto( self.costoProduccion(cantidad) )
  }
}

// cobra la suma de impuesto simple e impuesto con garantia
object impuestoCombinado {
  var property impuesto1 = impuestoSimple
  var property impuesto2 = impuestoConGarantia

  method monto(costoProduccion) {
    return impuesto1.monto(costoProduccion) + impuesto2.monto(costoProduccion)
  }
}

object impuestoSimple {
  method monto(costoProduccion) = costoProduccion * 0.1
}

object impuestoConGarantia {
  method monto(costoProduccion) {
    const impuesto = 0.5 * costoProduccion

    // opcion 1
    return impuesto.max(100)

    // opcion 2
    // if (impuesto < 100) {
    //   return 100
    // } else {
    //   return impuesto
    // }
  }
}

