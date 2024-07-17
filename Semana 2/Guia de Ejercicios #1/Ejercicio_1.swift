//Ejercicio 1: Calcular el área y el perímetro de un rectángulo
import Foundation
//Funcion calcular el area del perimetro
func calcularAreaYPerimetro(ancho: Double, alto: Double) -> (area: Double, perimetro: Double) {
    let area = ancho * alto
    let perimetro = 2 * (ancho + alto)
    return (area, perimetro)
}

//Ejecucion
let resultado = calcularAreaYPerimetro(ancho: 5, alto: 10)
print("Área: \(resultado.area)")
print("Perímetro: \(resultado.perimetro)")
