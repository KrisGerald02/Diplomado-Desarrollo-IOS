// Calcular estadísticas básicas de un array de enteros
import Foundation

func calcularEstadisticas(_ numeros: [Double]) -> (suma: Double, media: Double, mediana: Double, moda: Double?) {
    // Calcular la suma
    let suma = numeros.reduce(0, +)
    
    // Calcular la media
    let media = suma / Double(numeros.count)
    
    // Calcular la mediana
    var ordenados = numeros.sorted()
    let medianaIndex = ordenados.count / 2
    let mediana = ordenados.count % 2 == 0 ?
        (ordenados[medianaIndex - 1] + ordenados[medianaIndex]) / 2 :
        ordenados[medianaIndex]
    
    // Calcular la moda
    var frecuencias: [Double: Int] = [:]
    for numero in numeros {
        frecuencias[numero] = (frecuencias[numero] ?? 0) + 1
    }
    let moda = frecuencias.max(by: { $0.value < $1.value })?.key
    
    return (suma, media, mediana, moda)
}

// Ejecucion
let numeros = [5.2, 3.8, 4.1, 5.2, 3.8, 2.9, 4.1, 5.2]
let (suma, media, mediana, moda) = calcularEstadisticas(numeros)
print("Suma: \(suma)")
print("Media: \(media)")
print("Mediana: \(mediana)")
print("Moda: \(moda ?? "N/A")")
