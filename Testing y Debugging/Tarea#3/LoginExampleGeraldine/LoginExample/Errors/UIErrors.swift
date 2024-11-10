//
//  UIErrors.swift
//  LoginExample
//
//  Created by Geraldine on 9/11/24.
//
import UIKit

final class UIError {
    static func showAlert(error: Error, in viewController: UIViewController) {
        let alert = UIAlertController(
            title: (error as? LocalizedError)?.errorDescription ?? "Ocurrió un error",
            message: (error as? LocalizedError)?.failureReason ?? "Inténtelo de nuevo",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true)
    }
}
