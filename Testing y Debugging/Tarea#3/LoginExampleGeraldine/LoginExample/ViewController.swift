import UIKit

class ViewController: UIViewController {
    
    let error = UIError() 
    
    @IBOutlet var userTextFiel: UITextField!
    @IBOutlet var passwordTextFiel: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var loginValidationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self, action: #selector(naviagteToMainView), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(naviagteToRegisterView), for: .touchUpInside)
        setValidationLabel()
    }
    
    
    @objc func naviagteToMainView(sender: UIButton!) {
        if (userTextFiel.text == "Admin") && (passwordTextFiel.text == "Admin123") {
            let mainViewController = MainViewController()
            self.navigationController?.pushViewController(mainViewController, animated:true)
            setValidationLabel()
        } else {
            UIError.showAlert(error: Errors.invalidCredentials, in: self)
        }
    }
    
    @objc func naviagteToRegisterView(sender: UIButton!) {
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated:true)
    }
    
    func setValidationLabel(){
        loginValidationLabel.text = ""
        loginValidationLabel.textColor = .black
    }
    
    func setBadValidationLabel(){
        loginValidationLabel.text = "Error de Autenticacion"
        loginValidationLabel.textColor = .red
    }
    
    
}

