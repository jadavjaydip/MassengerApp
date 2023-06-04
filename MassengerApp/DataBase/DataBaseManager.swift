//
//  DataBaseManager.swift
//  MassengerApp
//
//  Created by J  on 04/06/23.
//

import Foundation
import Firebase

class DataBaseManager {
    static let sharedInstent = DataBaseManager()
    let dataBase = Database.database().reference()
    
}

extension DataBaseManager {
    func usesrExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        var safeEmail = email.replacingOccurrences(of: "@", with: "-")
       safeEmail = safeEmail.replacingOccurrences(of: ".", with: "-")
        print(safeEmail)
        dataBase.child(safeEmail).observeSingleEvent(of: .value) { dataSnapshot in
            print(dataSnapshot.value)
            guard dataSnapshot.exists() else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    func insertUserData(data: CheatModel) {
        dataBase.child(data.safeEmail).setValue([
            "first_name" : data.name,
            "last_name": data.lastName,
        ])
    }
}
