//
//  RegisterViewModel.swift
//  MassengerApp
//
//  Created by J  on 04/06/23.
//

import Foundation
import Firebase

class RegisterViewModel: NSObject {
    
    
    func userRegister(fullName: String?, lastName: String?, email: String?, password: String?, completion: @escaping((Bool) -> Void)){
        guard let firstname = fullName, let lastName = lastName, let email = email, let passowrd = password, !firstname.isEmpty, !lastName.isEmpty, !email.isEmpty, !passowrd.isEmpty else {
            print("Pleace chek file and corrent filed required")
            completion(false)
            return
        }
        DataBaseManager.sharedInstent.usesrExists(with: email) { existes in
            guard !existes else {
                print("User Already exists")
                completion(false)
                return }
            
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: passowrd) { result, error in
                guard let authResult = result,  error == nil else {
                    print("user not Created succesfully:-----")
                    completion(false)
                    return
                }
                // remove to code only check data
                let user = authResult.user
                print("user data :- \(user)")
                
                DataBaseManager.sharedInstent.insertUserData(data: CheatModel(email: email, name: firstname, lastName: lastName))
                completion(true)
            }
        }
    }
}
