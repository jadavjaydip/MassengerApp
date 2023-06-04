//
//  DatabaseModel.swift
//  MassengerApp
//
//  Created by J  on 04/06/23.
//

import Foundation

struct CheatModel {
    let email: String
    let name: String
    let lastName: String
    
    var safeEmail: String {
        var safeEmail = email.replacingOccurrences(of: "@", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: ".", with: "-")
        return safeEmail
    }
}
