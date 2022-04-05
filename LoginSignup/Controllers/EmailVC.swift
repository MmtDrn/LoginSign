//
//  EmailVC.swift
//  Auth Calismasi
//
//  Created by MacBook on 4.04.2022.
//

import UIKit
import FirebaseAuth
import MessageUI

class EmailVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        sendEmail()
    }
    
    @IBAction func buttonLogout(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func sendEmail(){
        
        if MFMailComposeViewController.canSendMail() {
            
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            
            if let email = Auth.auth().currentUser?.email {
                mail.setToRecipients([email])
            }
            mail.setMessageBody("<p>Your account is now logged in</p>", isHTML: true)
            present(mail, animated: true)
        }else{}
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
