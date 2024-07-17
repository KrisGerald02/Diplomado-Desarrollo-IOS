//Ejercicio 4: Enums y Funciones Estáticas
// Enumeración OperacionMatematica
import Foundation
enum OperacionMatematica {
    case suma
    case resta
    case multiplicacion
    case division
}

// Clase OperadorMatematico
class OperadorMatematico {
    static func realizarOperacion(_ a: Double, _ b: Double, _ operacion: OperacionMatematica) -> Double {
        switch operacion {
        case .suma:
            return a + b
        case .resta:
            return a - b
        case .multiplicacion:
            return a * b
        case .division:
            if b != 0 {
                return a / b
            } else {
                print("Error: División por cero")
                return 0
            }
        }
    }
}

//Ejecucion
let resultadoSuma = OperadorMatematico.realizarOperacion(10, 5, .suma)
print("Resultado de la suma: \(resultadoSuma)")

let resultadoDivision = OperadorMatematico.realizarOperacion(10, 0, .division)
print("Resultado de la división: \(resultadoDivision)")
