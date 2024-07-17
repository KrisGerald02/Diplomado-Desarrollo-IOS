//Implementa una clase Temperatura con una propiedad celsius. Usa
//didSet para actualizar una propiedad fahrenheit cada vez que celsius cambie.
import Foundation

// Definición de la clase Temperatura
class Temperatura {
    // Propiedad celsius con observador didSet para actualizar fahrenheit
    var celsius: Decimal = 0.0 {
        didSet {
            fahrenheit = (celsius * Decimal(9/5)) + Decimal(32)
        }
    }
    
    // Propiedad fahrenheit con observador didSet para actualizar celsius
    var fahrenheit: Decimal = 32.0 {
        didSet {
            celsius = (fahrenheit - Decimal(32)) * Decimal(5/9)
        }
    }
    
    // Método para obtener la temperatura en Celsius
    func obtenerCelsius() -> Decimal {
        return celsius
    }
    
    // Método para obtener la temperatura en Fahrenheit
    func obtenerFahrenheit() -> Decimal {
        return fahrenheit
    }
}

// Crear una nueva temperatura
let temperatura = Temperatura()

// Establecer la temperatura en Celsius
temperatura.celsius = 25.0

//Ejecucion
// Imprimir las temperaturas
print("Temperatura en Celsius: \(temperatura.obtenerCelsius())")
print("Temperatura en Fahrenheit: \(temperatura.obtenerFahrenheit())")
