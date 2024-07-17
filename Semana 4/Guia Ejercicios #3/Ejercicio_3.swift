// Define una struct Rectangulo con propiedades ancho y alto. Implementaun método mutating llamado cambiarDimensiones que permita cambiar ambos valores.
import Foundation

// Definición de la estructura Rectangulo
struct Rectangulo {
    // Propiedad ancho de tipo Decimal
    var ancho: Decimal = 0.0
    
    // Propiedad alto de tipo Decimal
    var alto: Decimal = 0.0
    
    // Método mutating para cambiar las dimensiones del rectángulo
    mutating func cambiarDimensiones(ancho: Decimal, alto: Decimal) {
        self.ancho = ancho
        self.alto = alto
    }
}

// Crear un nuevo rectángulo
var rect = Rectangulo(ancho: 5.0, alto: 10.0)

// Imprimir las dimensiones iniciales del rectángulo
print("Dimensiones iniciales del rectángulo:")
print("Ancho: \(rect.ancho), Alto: \(rect.alto)")

// Cambiar las dimensiones del rectángulo
rect.cambiarDimensiones(ancho: 7.0, alto: 14.0)

//Ejecucion Final
// Imprimir las nuevas dimensiones del rectángulo
print("Nuevas dimensiones del rectángulo:")
print("Ancho: \(rect.ancho), Alto: \(rect.alto)")
