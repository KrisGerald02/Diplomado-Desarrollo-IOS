// Escribe un closure que ordene un array de enteros en orden descendente y utilízalo para ordenar un array dado. 
import Foundation

// Define una función closure que ordena un array de enteros en orden descendente
let closure: (Int, Int) -> Bool = { a, b in
    return a > b
}

// Definir un array de enteros
let array: [Int] = [3, 1, 4, 1, 5, 9]

// Ordenar el array en orden descendente utilizando la función closure
let ordenado = array.sorted(by: closure)
//Ejecucion
// Imprimir el array ordenado
print(ordenado) 
