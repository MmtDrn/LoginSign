//
//  LoginVC.swift
//  Auth Calismasi
//
//  Created by MacBook on 4.04.2022.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonSignUp(_ sender: Any) {
        
        if let email = textEmail.text, let password = textPassword.text {
            
            FirebaseAuthManger().lognIn(email: email, password: password) { success in
                
                if (success) {
                    
                    if Auth.auth().currentUser?.isEmailVerified == true {
                        self.performSegue(withIdentifier: "toEmail", sender: nil)
                    }else{
                        
                        let alert = UIAlertController(title: nil, message: "Please check it your e-mail box and comfirm your account", preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "okey", style: .destructive,handler: nil))
                        self.present(alert, animated: true)
                    }
                    
                }else{
                    
                    let alert = UIAlertController(title: nil, message: "There was an error", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "okey", style: .destructive,handler: { UIAlertAction in
                        
                        if success{
                            self.performSegue(withIdentifier: "fromLogin", sender: nil)
                        }
                    }))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
}
