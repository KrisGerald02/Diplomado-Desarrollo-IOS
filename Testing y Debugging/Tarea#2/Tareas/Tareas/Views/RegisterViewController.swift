//
//  RegisterViewController.swift
//  ClasePractica26OCT
//
//  Created by LABORATORIO MAC UAM on 26/10/24.
//

import Foundation
import UIKit

class RegisterViewController: ViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userIdLabel: UILabel!
    
    @IBOutlet weak var userIDTextField: UITextField!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var registerViewButton: UIButton!
    
    @IBOutlet weak var passwordRegisterTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Register"

        nameTextField.accessibilityIdentifier = "nameTextField"
        userIDTextField.accessibilityIdentifier = "userIDTextField"
        phoneTextField.accessibilityIdentifier = "phoneTextField"
        registerViewButton.accessibilityIdentifier = "registerViewButton"
        passwordRegisterTextField.accessibilityIdentifier = "passwordRegisterTextField"
        repeatPasswordTextField.accessibilityIdentifier = "repeatPasswordTextField"
        
    }
}
