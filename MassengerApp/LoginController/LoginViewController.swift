//
//  LoginViewController.swift
//  MassengerApp
//
//  Created by J  on 04/06/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, Instantiable {
    static var storyboardName: StringConvertible {
        StoryboardName.loginScreen
    }
    
    private let email: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.placeholder = "Email"
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    private let password: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.placeholder = "Password"
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    private let signInBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setButtonProperty(title: "Sign In",tinColor: .white,cornerRadius: 25.0, backgroundColour: .init(hexString: "#E9A33F"))
        return button
    }()
    
    private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraintComponet()
        buildButtonAction()

    }
    func setConstraintComponet(){
        let stackView = UIStackView(arrangedSubviews: [email, password, signInBtn])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 24
        view.addSubview(stackView)
        stackView.edgesToSuperview(excluding: [.bottom], insets: .uniform(24), usingSafeArea: true)
        
        email.height(55)
        password.height(55)
        signInBtn.height(55)
    }
    
    
    
    func buildButtonAction() {
        signInBtn.addAction(.init(handler: { [weak self] action in
            guard let self = self else { return }
            viewModel.userLogin(email: email.text, password: password.text) { success in
                guard success else {
                    print("user not login ")
                    return
                }
                let homeNavigation = HomeViewController.instantiateFromStoryboard()
                self.navigationController?.pushViewController(homeNavigation, animated: true)
            }
        }), for: .touchUpInside)
    }

}
