//Ejercicio 3: Polimorfismo y Structs
// Protocolo Figura
protocol Figura {
    func calcularArea() -> Double
}

// Estructura Cuadrado
struct Cuadrado: Figura {
    var lado: Double
    
    func calcularArea() -> Double {
        return lado * lado
    }
}

// Estructura Rectangulo
struct Rectangulo: Figura {
    var ancho: Double
    var alto: Double
    
    func calcularArea() -> Double {
        return ancho * alto
    }
}

// Función calcularAreaTotal
func calcularAreaTotal(figuras: [Figura]) -> Double {
    var areaTotal: Double = 0.0
    
    for figura in figuras {
        areaTotal += figura.calcularArea()
    }
    
    return areaTotal
}
//Ejecucion
let cuadrado = Cuadrado(lado: 4.0)
let rectangulo = Rectangulo(ancho: 3.0, alto: 5.0)
let figuras: [Figura] = [cuadrado, rectangulo]

let areaTotalFiguras = calcularAreaTotal(figuras: figuras)
print("Área total: \(areaTotalFiguras)")
