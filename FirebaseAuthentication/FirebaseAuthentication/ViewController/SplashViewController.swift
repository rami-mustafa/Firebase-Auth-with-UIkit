 

import UIKit
import FirebaseAuth

class SplashViewController: UIViewController {

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
//                navigate to the login page
                let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "LoginViewController")
                self.view.window?.rootViewController = vc
            } else {
//                navigate to the Home page
                let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "HomeViewController")
                self.view.window?.rootViewController = vc

            }
        }
        
        
    }


}

