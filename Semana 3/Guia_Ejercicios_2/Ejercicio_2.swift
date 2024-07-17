//Ejercicio 2: Funciones Estáticas y Clases
import Foundation

// Clase Calculadora con funciones estáticas para sumar y restar
//Define métodos estáticos para operaciones matemáticas
class Calculadora {
    
    // Función estática para sumar dos enteros
    static func sumar(a: Int, b: Int) -> Int {
        return a + b
    }
    
    // Función estática para restar un entero de otro
    static func restar(a: Int, b: Int) -> Int {
        return a - b
    }
}

// Función para calcular la suma y resta total de los elementos de un array
func calcularSumaYRestaTotales(numeros: [Int]) -> (sumaTotal: Int, restaTotal: Int) {
    var sumaTotal = 0
    var restaTotal = 0
    
    // Iterar sobre cada número en el array
    for numero in numeros {
        sumaTotal = Calculadora.sumar(a: sumaTotal, b: numero)
        restaTotal = Calculadora.restar(a: restaTotal, b: numero)
    }
    
    // Retornar los resultados como una tupla
    return (sumaTotal, restaTotal)
}

// Devuelve una tupla con sumaTotal y restaTotal.
let numeros = [1, 2, 3, 4, 5]
let resultado = calcularSumaYRestaTotales(numeros: numeros)
print("Suma total: \(resultado.sumaTotal)")
print("Resta total: \(resultado.restaTotal)")
