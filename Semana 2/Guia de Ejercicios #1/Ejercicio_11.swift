//Definir un protocolo Volable y conformar clases Pájaro y Avión
import Foundation
protocol Volable {
    func volar() -> String
}

class Pajaro: Volable {
    func volar() -> String {
        return "El pájaro está volando"
    }
}

class Avion: Volable {
    func volar() -> String {
        return "El avión está despegando"
    }
}

var miPajaro = Pajaro()
var miAvion = Avion()
//Ejecucion
print(miPajaro.volar()) 
print(miAvion.volar())  
