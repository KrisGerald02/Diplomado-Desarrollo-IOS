import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    private let loginController = LoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        passwordTextField.text = ""
    }

    @IBAction func onTapLogin(_ sender: Any) {
        guard
            let username = usernameTextField.text,
            let password = passwordTextField.text
        else { return }
        
        Task {
            let isSuccess = await loginController.login(username: username, password: password)
            
            if (isSuccess != nil) {
                performSegue(withIdentifier: "goToMainView", sender: self)
            } else {
                let alert = UIAlertController(title: "Login Failure", message: "There was an error logging in.", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(action)
                
                present(alert, animated: true)
            }
        }
    }
}
