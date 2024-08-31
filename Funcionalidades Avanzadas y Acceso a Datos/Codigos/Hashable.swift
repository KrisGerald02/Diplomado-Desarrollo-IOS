import UIKit

struct Person {
    let id: String
    let name: String
}

//Ejemplo Comparacion Sin Clase
//let a = 1
//let b = 2
//let foo = a == b

//Ejemplo de Error
//let maria = Person(id: "100", name: "Maria")
//let maria2 = Person(id: "101", name: "Maria")
//let result = maria == maria2

//Esto es para comparar 2 elementos diferentes dentro de una misma clase POA
//Corrigiendo Error ()
//Conformando a Hashable
extension Person: Hashable{
    //hash es una cadena de caracteres
    //Equietable
    static func == (l:Person, r:Person)-> Bool {
        return l.id == r.id
    }
    //Todas clases estructuras que hereden de ese protocolo necesitan una funcion/metodo hash
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)//el hash que se construya sera apaetir del id
    }
}
