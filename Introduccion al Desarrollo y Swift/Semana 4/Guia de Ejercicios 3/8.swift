//Crea un closure que calcule el factorial de un número dado y utilízalo para calcular el factorial de 5.
import Foundation

// Define una función closure que calcula el factorial de un número dado
let closure: (Int) -> Int = { n in
    // Si n es 0 o 1, devuelve 1 (caso base)
    if n == 0 || n == 1 {
        return 1
    }
    // De lo contrario, devuelve n * factorial(n-1) (caso recursivo)
    return n * closure(n - 1)
}

// Calcular el factorial de 5 utilizando la función closure
let factorial5 = closure(5)

//Ejecucion
// Imprimir el resultado
print("El factorial de 5 es: \(factorial5)") 
