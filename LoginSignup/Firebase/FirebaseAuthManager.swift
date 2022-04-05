//
//  FirebaseAuthManager.swift
//  Auth Calismasi
//
//  Created by MacBook on 4.04.2022.
//

import Foundation
import FirebaseAuth

class FirebaseAuthManger {
    
    func CreateUser(email:String,password:String,completionBlock: @escaping(_ success: Bool) -> Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult,error in
            
            if let user = authResult?.user {
                Auth.auth().currentUser?.sendEmailVerification()
                print(user)
                completionBlock(true)
            }else{
                completionBlock(false)
            }
        }
    }
    
    func lognIn(email:String,password:String,completionBlock: @escaping(_ success: Bool) -> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
    }
}
