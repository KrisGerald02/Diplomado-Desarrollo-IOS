// Crear un struct Rectángulo con métodos para calcular el área y el
//perímetro
import Foundation
struct Rectangulo {
    var ancho: Double
    var alto: Double
    
    func calcularArea() -> Double {
        return ancho * alto
    }
    
    func calcularPerimetro() -> Double {
        return 2 * (ancho + alto)
    }
    
    init(ancho: Double, alto: Double) {
        self.ancho = ancho
        self.alto = alto
    }
}

//Ejecucion
let miRectangulo = Rectangulo(ancho: 5.0, alto: 10.0)
print("Área: \(miRectangulo.calcularArea())")
print("Perímetro: \(miRectangulo.calcularPerimetro())")
