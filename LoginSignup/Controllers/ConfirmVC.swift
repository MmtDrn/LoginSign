//
//  ConfirmVC.swift
//  Auth Calismasi
//
//  Created by MacBook on 5.04.2022.
//

import UIKit
import FirebaseAuth

class ConfirmVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
    }
    
    @IBAction func buttonHomepage(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch{
            print(error.localizedDescription)
        }
    }
    

}
