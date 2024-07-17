// Implementa una clase Circulo con una propiedad radio y una propiedad calculada area que usa getter y setter.
import Foundation

// Definición de la estructura Circulo
struct Circulo {
    // Propiedad radio de tipo Decimal
    var radio: Decimal = 0.0
    
    // Propiedad calculada area
    var area: Decimal {
        // Getter para calcular el área del círculo
        get {
            return Decimal.pi * radio * radio
        }
        // Setter para establecer el radio a partir del área
        set {
            radio = Decimal.sqrt(newValue / Decimal.pi)
        }
    }
}

// Crear un nuevo círculo con radio 5.0
var circulo = Circulo(radio: 5.0)
//Inicio de Ejecucion
// Imprimir el área del círculo
print("Área del círculo: \(circulo.area)")

// Establecer el área del círculo a 78.5
circulo.area = 78.5

// Imprimir el nuevo radio del círculo
print("Nuevo radio del círculo: \(circulo.radio)")
