//Operaciones matriciales básicas (suma y multiplicación)
import Foundation

func multiplicarMatrices(_ matriz1: [[Double]], _ matriz2: [[Double]]) -> [[Double]] {
    // Verificar que las dimensiones de las matrices sean compatibles
    guard matriz1.first?.count == matriz2.count else {
        return []
    }
    
    // Crear una matriz resultado con las dimensiones apropiadas
    let filas1 = matriz1.count
    let columnas2 = matriz2[0].count
    var matrizResultado = Array(repeating: Array(repeating: 0.0, count: columnas2), count: filas1)
    
    // Calcular el producto de las matrices
    for i in 0..<filas1 {
        for j in 0..<columnas2 {
            for k in 0..<matriz1[i].count {
                matrizResultado[i][j] += matriz1[i][k] * matriz2[k][j]
            }
        }
    }
    
    return matrizResultado
}

// Ejecucion
let matriz1 = [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]]
let matriz2 = [[7.0, 8.0], [9.0, 10.0], [11.0, 12.0]]

let productoMatrices = multiplicarMatrices(matriz1, matriz2)
print("Producto de matrices:")
for fila in productoMatrices {
    print(fila)
}
