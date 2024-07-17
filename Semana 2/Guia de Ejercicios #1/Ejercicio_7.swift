//Calcular la suma de los primeros N números utilizando recursión y no recursion
import Foundation
func sumaRecursiva(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    return n + sumaRecursiva(n - 1)
}

func sumaIterativa(_ n: Int) -> Int {
    var suma = 0
    for i in 1...n {
        suma += i
    }
    return suma
}

let resultadoRecursivo = sumaRecursiva(10)
let resultadoIterativo = sumaIterativa(10)

print("Suma recursiva: \(resultadoRecursivo)")
print("Suma iterativa: \(resultadoIterativo)")
