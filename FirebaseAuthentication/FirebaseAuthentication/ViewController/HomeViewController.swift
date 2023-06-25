 

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    
    @IBOutlet weak var homeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeLabel.text = "You are logged in with the following email: \(Auth.auth().currentUser?.email ?? "")"

     }
    

 
    @IBAction func onSignOutButton(_ sender: Any) {
        try? Auth.auth().signOut()
        
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "LoginViewController")
        self.view.window?.rootViewController = vc
    }
    

}
