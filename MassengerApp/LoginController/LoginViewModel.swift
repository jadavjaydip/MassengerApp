//
//  LoginViewModel.swift
//  MassengerApp
//
//  Created by J  on 03/06/23.
//

import UIKit
import Firebase

class LoginViewModel: NSObject {
    
    func userLogin(email: String?, password: String?, completion: @escaping((Bool) -> Void)){
        guard let email = email, let password = password, !email.isEmpty, !password.isEmpty else {
            print("pleace enter all filed is requierd")
            completion(false)
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard let result = result, error == nil else {
                print("user not successfully login with email and password:-  \(error?.localizedDescription)")
                completion(false)
                return
            }
            
            let user = result.user
            print("user is:- \(user)")
            print("user succesfully login to sign in......")
            completion(true)
        }
    }
    
}
