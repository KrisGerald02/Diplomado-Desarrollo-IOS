//Ejercicio 5: Clases, Structs y Polimorfismo
// Protocolo Empleado
import Foundation
protocol Empleado {
    func calcularSalario() -> Double
}

// Clase EmpleadoBase
class EmpleadoBase: Empleado {
    var salarioBase: Double
    
    init(salarioBase: Double) {
        self.salarioBase = salarioBase
    }
    
    func calcularSalario() -> Double {
        return salarioBase
    }
}

// Struct EmpleadoContrato
struct EmpleadoContrato: Empleado {
    var tarifaHora: Double
    var horasTrabajadas: Double
    
    func calcularSalario() -> Double {
        return tarifaHora * horasTrabajadas
    }
}

// Función para calcular el salario total
func calcularSalarioTotal(empleados: [Empleado]) -> Double {
    var salarioTotal: Double = 0.0
    
    for empleado in empleados {
        salarioTotal += empleado.calcularSalario()
    }
    
    return salarioTotal
}

// Ejecucion
let empleadoBase = EmpleadoBase(salarioBase: 3000.0)
let empleadoContrato = EmpleadoContrato(tarifaHora: 20.0, horasTrabajadas: 100.0)
let empleados: [Empleado] = [empleadoBase, empleadoContrato]

let salarioTotal = calcularSalarioTotal(empleados: empleados)
print("Salario total: \(salarioTotal)")
