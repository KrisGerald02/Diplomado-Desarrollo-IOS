//Implementar el algoritmo de búsqueda en profundidad (DFS) en un grafo
import Foundation

class Grafo {
    var adjList: [Int: [Int]] = [:]
    
    func agregarArista(from: Int, to: Int) {
        if adjList[from] == nil {
            adjList[from] = []
        }
        adjList[from]?.append(to)
    }
    
    func dfs(inicio: Int, visitados: [Int] = [], resultado: [Int] = []) -> [Int] {
        var visitados = visitados
        var resultado = resultado
        
        if !visitados.contains(inicio) {
            visitados.append(inicio)
            resultado.append(inicio)
            
            if let vecinos = adjList[inicio] {
                for vecino in vecinos {
                    dfs(inicio: vecino, visitados: visitados, resultado: resultado)
                }
            }
        }
        
        return resultado
    }
}

// Ejecucion
let grafo = Grafo()
grafo.agregarArista(from: 1, to: 2)
grafo.agregarArista(from: 1, to: 3)
grafo.agregarArista(from: 2, to: 4)
grafo.agregarArista(from: 2, to: 5)
grafo.agregarArista(from: 3, to: 6)
grafo.agregarArista(from: 3, to: 7)

let recorrido = grafo.dfs(inicio: 1)
print("Recorrido en profundidad:", recorrido)
