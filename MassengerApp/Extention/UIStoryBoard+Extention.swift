//
//  UIStoryBoard+Extention.swift
//  MassengerApp
//
//  Created by J  on 04/06/23.
//

import UIKit

enum StoryboardName: String, StringConvertible {
    case loginTypeOtion = "LoginOptionTypeViewController"
    case loginScreen = "LoginViewController"
    case registreScreen = "RegisterViewController"
    case homeScreen = "HomeViewController"
    
    /// represents the storyboard name for ``ServiceLoginViewController``.
    
}

/// Protocol represents the string convetible.
/// returns `rawValue`.
public protocol StringConvertible {
    var rawValue: String {get}
}

/// Protocol represents the Instanitable controller.
/// returns storyboard name.
public protocol Instantiable: AnyObject {
    static var storyboardName: StringConvertible {get}
}

extension Instantiable {
    
   public static func instantiateFromStoryboard() -> Self {
        return instantiateFromStoryboardHelper()
    }
    
    private static func instantiateFromStoryboardHelper<T: AnyObject>() -> T {
        let identifier = String(describing: self)
        let storyboard =  UIStoryboard(name: storyboardName.rawValue, bundle: Bundle(for: LoginOptionTypeViewController.self))
        print(storyboardName.rawValue)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}

extension String: StringConvertible {
   public  var rawValue: String {
        return self
    }
}
