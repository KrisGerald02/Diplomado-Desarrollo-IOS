//
//  RegisterViewController.swift
//  LoginExample
//
//  Created by Geraldine on 5/12/23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
        registerButton.addTarget(self, action: #selector(validateUser), for: .touchUpInside)
    }
    
    @objc func validateUser(sender: UIButton!) {
        guard let validEmail = passwordTextField.text?.contains("@") else {return}
        if userTextField.text == "" || !validEmail
        {
            errorLabel.text = "Error en el registro"
        } else {
            errorLabel.text = ""
        }
            
    }
    
    
}
