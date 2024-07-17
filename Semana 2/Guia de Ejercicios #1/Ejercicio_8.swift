 //Implementar la búsqueda binaria recursiva en un array ordenado
import Foundation

func busquedaBinariaRecursiva(_ array: [Int], _ valor: Int, _ inicio: Int, _ fin: Int) -> Int? {
    if inicio > fin {
        return nil
    }
    
    let medio = (inicio + fin) / 2
    
    if array[medio] == valor {
        return medio
    } else if array[medio] < valor {
        return busquedaBinariaRecursiva(array, valor, medio + 1, fin)
    } else {
        return busquedaBinariaRecursiva(array, valor, inicio, medio - 1)
    }
}

let numerosOrdenados = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let posicion = busquedaBinariaRecursiva(numerosOrdenados, 7, 0, numerosOrdenados.count - 1)

if let posicion = posicion {
    print("El valor se encuentra en la posición \(posicion)")
} else {
    print("El valor no se encuentra en el array")
}
