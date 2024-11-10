//
//  Errors.swift
//  LoginExample
//
//  Created by Geraldine on 9/11/24.
//

import UIKit

enum Errors: LocalizedError {
    
    case invalidCredentials

       var errorDescription: String? {
           switch self {
           case .invalidCredentials:
               "Credenciales incorrectas"
           }
       }

       var failureReason: String? {
           switch self {
           case .invalidCredentials:
               "Usuario o contraseña incorrectos. Por favor, intente de nuevo."
           }
       }
}
