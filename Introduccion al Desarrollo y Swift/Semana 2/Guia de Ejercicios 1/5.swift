// Implementar un algoritmo de ordenamiento por selección
import Foundation

func intercambiar(_ array: inout [Int], _ i: Int, _ j: Int) {
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}

func ordenarPorSeleccion(_ array: inout [Int]) -> [Int] {
    for i in 0..<(array.count - 1) {
        var minIndex = i
        for j in (i + 1)..<array.count {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        intercambiar(&array, i, minIndex)
    }
    return array
}

// Ejecucion
var numeros = [64, 25, 12, 22, 11, 90]
let arrayOrdenado = ordenarPorSeleccion(&numeros)
print("Array ordenado por seleccion:", arrayOrdenado)
