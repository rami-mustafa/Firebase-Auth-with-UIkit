

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        

        
        
                                                                                      
//        emailTextField.addBottomBorderWithColor(color: .lightGray, with: 0.5)
//        passwordTextField.addBottomBorderWithColor(color: .lightGray, with: 0.5)

        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onLoginButtonTap(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        if !email.isEmpty && !password.isEmpty  {
//            attempt login
            
            loadingIndicator.isHidden = false
            
            Auth.auth().signIn(withEmail: email, password: password) { auth, error in
                self.loadingIndicator.isHidden = true

                if error == nil {
//                    Navigate to the home page
                    self.navigateToHomePage()
                } else {
//                    present an error message
                    
                    self.presentInvalidLoginMessage()

                }
            }
            
        } else {
         presentEmptyErrorMessage()
            
        }
    }
    
    
    @IBAction func onSignUpButtonTap(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SignUpViewController")
        self.view.window?.rootViewController = vc
    }
    
    
    private func presentEmptyErrorMessage() {
        
        let alert = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert,animated: true)
    }

    
    private func presentInvalidLoginMessage() {
        
        let alert = UIAlertController(title: "Error", message: "Credentials you entered were invalid. Please check them and try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert,animated: true)
    }
    
    private func navigateToHomePage() {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "HomeViewController")
        self.view.window?.rootViewController = vc
    }
}

extension UIView {
    func addBottomBorderWithColor (color :UIColor , with:CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - with, width: self.frame.size.width - 25, height: with)
        
        self.layer.addSublayer(border)
    }
    
}


