//Crea una clase CuentaBancaria con una propiedad saldo. Utiliza didSet
//para imprimir un mensaje cada vez que el saldo cambie.
import Foundation

// Definición de la clase CuentaBancaria
class CuentaBancaria {
    // Propiedad saldo con observador didSet para imprimir mensaje cuando cambia
    var saldo: Decimal = 0.0 {
        didSet {
            print("El saldo ha cambiado a \(saldo)")
        }
    }
    
    // Método para realizar depósitos
    func depositar(_ monto: Decimal) {
        saldo += monto
    }
    
    // Método para realizar retiros
    func retirar(_ monto: Decimal) {
        saldo -= monto
    }
}

// Crear una nueva cuenta bancaria
let cuenta = CuentaBancaria()

// Realizar algunas operaciones en la cuenta
//Ejecucion
cuenta.depositar(100.0)
cuenta.retirar(50.0)
