 

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func onSignUpTap(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let passwordConfirm = passwordConfirmationTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty && password == passwordConfirm   {
//            Sign Up
            
            Auth.auth().createUser(withEmail: email, password: password) { auth, error in
                
                if error == nil {
//                    Navigate Home
                    self.navigateToHomePage()
                }else {
//                    Display an error message 
                }
            }
        } else {
//            Display an error message
            presentEmptyErrorMessage()
        }

        
    }
    
    
    @IBAction func onLoginTap(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "LoginViewController")
        self.view.window?.rootViewController = vc
    }
    
    
    private func presentEmptyErrorMessage() {
        
        let alert = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert,animated: true)
    }
    
    
    private func presentSignUpErrorMessage() {
        
        let alert = UIAlertController(title: "Error", message: "Failed to create a new account. Please check credentials and try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert,animated: true)
    }
    
    

    private func navigateToHomePage() {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "HomeViewController")
        self.view.window?.rootViewController = vc
    }
}
