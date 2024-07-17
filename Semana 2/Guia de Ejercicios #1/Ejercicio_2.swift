//Ejercicio 2: Calcular el área de un triángulo utilizando la fórmula de Herón
import Foundation

func calcularAreaTriangulo(_ a: Double, _ b: Double, _ c: Double) -> Double? {
    // Verificar que los lados formen un triángulo válido
    if a <= 0 || b <= 0 || c <= 0 || a + b <= c || a + c <= b || b + c <= a {
        print("Los lados ingresados no forman un triángulo válido")
        return nil
    }
    
    // Calcular el semiperímetro
    let s = (a + b + c) / 2
    
    // Calcular el área usando la fórmula de Herón
    let area = sqrt(s * (s - a) * (s - b) * (s - c))
    
    return area
}

// Ejecucion 
let area = calcularAreaTriangulo(3, 4, 5)
if let area = area {
    print("El área del triángulo es \(area)")
} else {
    print("Datos inválidos para los lados del triángulo")
}
