// Crear una clase Coche y un método para describirlo
import Foundation
class Coche {
    var marca: String
    var modelo: String
    var año: Int
    
    init(marca: String, modelo: String, año: Int) {
        self.marca = marca
        self.modelo = modelo
        self.año = año
    }
    
    func describir() {
        print("Coche: \(marca) \(modelo), \(año)")
    }
}

let miCoche = Coche(marca: "Toyota", modelo: "Corolla", año: 2020)
miCoche.describir() 
