//
//  SignUpVC.swift
//  Auth Calismasi
//
//  Created by MacBook on 4.04.2022.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textPhoneNumber: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func buttonLogin(_ sender: Any) {
        
        if let email = textEmail.text, let password = textPassword.text {
            
            FirebaseAuthManger().CreateUser(email: email, password: password) { success in
                
                if (success) {
                    self.performSegue(withIdentifier: "toConfirm", sender: nil)
                }else{
                    
                    let alert = UIAlertController(title: nil, message: "There was an error", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "okey", style: .destructive,handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
}
