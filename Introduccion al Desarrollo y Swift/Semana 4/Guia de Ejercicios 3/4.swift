//Crea una struct Vector con propiedades x e y. Implementa un método mutating llamado mover que traslade el vector por un desplazamiento dado.
import Foundation

// Definición de la estructura Vector
struct Vector {
    // Propiedad x de tipo Decimal
    var x: Decimal = 0.0
    
    // Propiedad y de tipo Decimal
    var y: Decimal = 0.0
    
    // Método mutating para mover el vector por un desplazamiento dado
    mutating func mover(dx: Decimal, dy: Decimal) {
        self.x += dx
        self.y += dy
    }
}

// Crear un nuevo vector
var vector = Vector(x: 1.0, y: 2.0)

// Imprimir las coordenadas iniciales del vector
print("Coordenadas iniciales del vector:")
print("x: \(vector.x), y: \(vector.y)")

// Mover el vector por un desplazamiento de (3.0, 4.0)
vector.mover(dx: 3.0, dy: 4.0)

//Ejecucion
// Imprimir las nuevas coordenadas del vector
print("Nuevas coordenadas del vector:")
print("x: \(vector.x), y: \(vector.y)")
