//Crea una struct Rectangulo con propiedades ancho y alto. Implementa una propiedad calculada perimetro con getter y setter.
import Foundation

// Definición de la estructura Rectangulo
struct Rectangulo {
    // Propiedad ancho de tipo Decimal
    var ancho: Decimal = 0.0
    
    // Propiedad alto de tipo Decimal
    var alto: Decimal = 0.0
    
    // Propiedad calculada perimetro
    var perimetro: Decimal {
        // Getter para calcular el perímetro del rectángulo
        get {
            return 2 * (ancho + alto)
        }
        // Setter para establecer el ancho y alto a partir del perímetro
        set {
            ancho = newValue / 4
            alto = newValue / 4
        }
    }
}

//Ejecucion
// Crear un nuevo rectángulo con ancho 4.0 y alto 5.0
var rect = Rectangulo(ancho: 4.0, alto: 5.0)

// Imprimir el perímetro del rectángulo
print("Perímetro del rectángulo: \(rect.perimetro)")

// Establecer el perímetro del rectángulo a 36.0
rect.perimetro = 36.0

// Imprimir el nuevo ancho y alto del rectángulo
print("Nuevo ancho: \(rect.ancho), Nuevo alto: \(rect.alto)")
