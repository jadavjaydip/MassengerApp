//
//  RegisterViewController.swift
//  MassengerApp
//
//  Created by J  on 04/06/23.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, Instantiable {
    static var storyboardName: StringConvertible {
        StoryboardName.registreScreen
    }
    
    private let backArrowBtn: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let profileImg: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Ellipse"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let editProfileBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Exclude"), for: .normal)
        return button
    }()
    
    private let fullName: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.placeholder = "full name"
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    private let nickName: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.placeholder = "Nick Name"
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    private let email: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.placeholder = "Email"
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    private let password: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.placeholder = "password"
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    private let signUpBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setButtonProperty(title: "Continue",tinColor: .white,cornerRadius: 25.0, backgroundColour: .init(hexString: "#E9A33F"))
        return button
    }()
    
    private let viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContraintComponet()
        
        signUpBtn.addAction(.init(handler: { [weak self] action in
            guard let self = self else { return }
            viewModel.userRegister(fullName: fullName.text, lastName: nickName.text, email: email.text, password: password.text) { success in
                guard success else {
                    print("data not save in data base")
                    return
                }
                let loginView = LoginViewController.instantiateFromStoryboard()
                self.navigationController?.pushViewController(loginView, animated: true)
            }
        }), for: .touchUpInside)
        
    }
    
    func setContraintComponet(){
        
        view.addSubview(backArrowBtn)
        backArrowBtn.edgesToSuperview(excluding: [.bottom, .trailing], insets: .uniform(28), usingSafeArea: true)
        backArrowBtn.height(19)
        backArrowBtn.width(16)
        
        profileImg.height(130)
        profileImg.width(130)
        fullName.height(55)
        nickName.height(55)
        email.height(55)
        password.height(55)
        let stackView = UIStackView(arrangedSubviews: [profileImg, fullName, nickName, email, password])
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .fill
        
        view.addSubview(stackView)
        stackView.edgesToSuperview(excluding: [.bottom,], insets: .uniform(24), usingSafeArea: true)
        stackView.topToBottom(of: backArrowBtn, offset: 26)
        
        view.addSubview(signUpBtn)
        signUpBtn.edgesToSuperview(excluding: [.top,], insets: .uniform(24), usingSafeArea: true)
        signUpBtn.height(55)
    }
    
    
}
