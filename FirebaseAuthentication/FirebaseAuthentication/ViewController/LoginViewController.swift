

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onLoginButtonTap(_ sender: Any) {
    }
    
    
    @IBAction func onSignUpButtonTap(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SignUpViewController")
        self.view.window?.rootViewController = vc
    }
    

}
