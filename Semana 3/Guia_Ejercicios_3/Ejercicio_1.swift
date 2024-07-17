//Ejercicio 1: Enumeraciones y Delegación
import Foundation

// Enumeración que define los posibles estados de un pedido
enum EstadoPedido {
    case procesando
    case enviado
    case entregado
}

// Protocolo que define el método para notificar un cambio de estado
protocol NotificacionPedido {
    func notificarCambioDeEstado(nuevoEstado: EstadoPedido)
}

// Clase Pedido que contiene un estado y un delegado
class Pedido {
    var estado: EstadoPedido
    var delegado: NotificacionPedido?
    
    // Inicializador para establecer el estado inicial del pedido
    init(estado: EstadoPedido) {
        self.estado = estado
    }
    
    // Función para cambiar el estado del pedido y notificar al delegado
    func cambiarEstado(nuevoEstado: EstadoPedido) {
        self.estado = nuevoEstado
        // Si hay un delegado asignado, notificarle el cambio de estado
        if let delegado = delegado {
            delegado.notificarCambioDeEstado(nuevoEstado: nuevoEstado)
        }
    }
}

// Clase GestorPedido que implementa el protocolo NotificacionPedido
class GestorPedido: NotificacionPedido {
    // Implementación del método para notificar el cambio de estado
    func notificarCambioDeEstado(nuevoEstado: EstadoPedido) {
        print("El estado del pedido ha cambiado a: \(nuevoEstado)")
    }
}

// Ejemplo de uso:

// Crear una instancia de GestorPedido
let gestor = GestorPedido()
// Crear un pedido con el estado inicial procesando
let pedido = Pedido(estado: .procesando)
// Asignar el gestor como delegado del pedido
pedido.delegado = gestor
// Cambiar el estado del pedido a enviado, lo que notificará al delegado
pedido.cambiarEstado(nuevoEstado: .enviado)
