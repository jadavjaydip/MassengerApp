//
//  LoginViewController.swift
//  MassengerApp
//
//  Created by J  on 03/06/23.
//

import UIKit
import Combine
import GoogleSignIn
import Firebase


class LoginOptionTypeViewController: UIViewController, Instantiable {
    static var storyboardName: StringConvertible {
        StoryboardName.loginTypeOtion
    }

    private let backArrowBtn: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let logOutBtn: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    private let stackView: UIStackView = {
        let imageView = UIImageView(image: UIImage(named: "iconLogo"))
        imageView.contentMode = .scaleAspectFit
        imageView.height(200)
        imageView.width(237)
        
        let label = UILabel(frame: .zero)
        label.text = "Let’s you in"
        label.font = UIFont.boldSystemFont(ofSize: 44)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 38
        return stackView
        
    }()
    
    private let facebookSignBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setButtonProperty(title: "Continue with Facebook",tinColor: .black, image: "facebook", imgRightPadding: 50.0,cornerRadius: 5.0, borderColour: .lightGray.withAlphaComponent(0.5), borderWidth: 0.5, backgroundColour: .white)
        return button
    }()
    
    private let googleSignINBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setButtonProperty(title: "Continue with Google",tinColor: .black, image: "google", imgRightPadding: 50.0,cornerRadius: 5.0, borderColour: .lightGray.withAlphaComponent(0.5), borderWidth: 0.5, backgroundColour: .white)
        return button
    }()
    
    private let appleSignBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setButtonProperty(title: "Continue with Apple",tinColor: .black, image: "apple", imgRightPadding: 50.0,cornerRadius: 5.0, borderColour: .lightGray.withAlphaComponent(0.5), borderWidth: 0.5, backgroundColour: .white)
        return button
    }()
    
    private let lineView: UIView = {
        let view = UIView(frame: .zero)
        let lineView = UIView(frame: .zero)
        lineView.backgroundColor = .lightGray
        lineView.height(1)
        
        let label = UILabel(frame: .zero)
        label.text = "or"
        label.textColor = .lightGray.withAlphaComponent(0.5)
        label.width(30)
        
        let lineView2 = UIView(frame: .zero)
        lineView2.backgroundColor = .lightGray
        lineView2.height(1)
        
        view.addSubview(lineView)
        view.addSubview(label)
        view.addSubview(lineView2)
        lineView.edgesToSuperview(excluding: [.trailing])
        label.leadingToTrailing(of: lineView)
        lineView2.leadingToTrailing(of: label)
        return view
        
    }()
   
    private let signWithPasswordBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setButtonProperty(title: "Sign in with password", tinColor: .white, cornerRadius: 30, backgroundColour: UIColor.init(hexString: "#FB9400"))
        return button
    }()
  
    private let signUpBtn: UIButton = {
        let button = UIButton(frame: .zero)
        button.setButtonProperty(title: "Sign up",tinColor: UIColor.init(hexString: "#FB9400"))
        button.backgroundColor = .clear
        return button
    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        constraintConfigration()
        buildbuttonAction()
        
        
        
        
    }
    
   
    func constraintConfigration(){
        view.addSubview(backArrowBtn)
        backArrowBtn.edgesToSuperview(excluding: [.bottom, .trailing], insets: .uniform(28), usingSafeArea: true)
        backArrowBtn.height(19)
        backArrowBtn.width(16)
        
        view.addSubview(logOutBtn)
        logOutBtn.edgesToSuperview(excluding: [.bottom,.leading], insets: .uniform(28), usingSafeArea: true)
        logOutBtn.height(20)
        
//        view.addSubview(stackView)
//        stackView.edgesToSuperview(excluding: [.top, .bottom], insets: .uniform(24), usingSafeArea: false)
//        stackView.topToBottom(of: backArrowBtn, offset: 24)
        
        view.addSubview(facebookSignBtn)
        facebookSignBtn.edgesToSuperview(excluding: [.top, .bottom], insets: .uniform(24))
        facebookSignBtn.topToBottom(of: logOutBtn, offset: 26)
        facebookSignBtn.height(55)
        
        view.addSubview(googleSignINBtn)
        googleSignINBtn.edgesToSuperview(excluding: [.top, .bottom], insets: .uniform(24))
        googleSignINBtn.topToBottom(of: facebookSignBtn, offset: 16)
        googleSignINBtn.height(55)
        
        view.addSubview(appleSignBtn)
        appleSignBtn.edgesToSuperview(excluding: [.top, .bottom], insets: .uniform(24))
        appleSignBtn.topToBottom(of: googleSignINBtn, offset: 16)
        appleSignBtn.height(55)
        
        
        view.addSubview(signWithPasswordBtn)
        signWithPasswordBtn.edgesToSuperview(excluding: [.top, .bottom], insets: .uniform(24))
        signWithPasswordBtn.topToBottom(of: appleSignBtn, offset: 36)
        signWithPasswordBtn.height(55)
        
        let label = UILabel(frame: .zero)
        label.text = "Don’t have an account?"
        label.tintColor = UIColor.init(hexString: "#9E9E9E")
        
        let stackView = UIStackView(arrangedSubviews: [label, signUpBtn])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        view.addSubview(stackView)
        stackView.topToBottom(of: signWithPasswordBtn, offset: 36)
        stackView.centerXToSuperview()
        
    }
    
    func buildbuttonAction(){
        facebookSignBtn.addAction(.init(handler: { action in
            print("ok")
        }), for: .touchUpInside)
        
        googleSignINBtn.addTarget(self, action: #selector(onGooglSignIn(_ : )), for: .touchUpInside)
        
        
        signUpBtn.addAction(.init(handler: { action in
            let navigation = RegisterViewController.instantiateFromStoryboard()
            self.navigationController?.pushViewController(navigation, animated: true)

        }), for: .touchUpInside)
        
        
        logOutBtn.addAction(.init(handler: { action in
            GIDSignIn.sharedInstance.signOut()
            do {
                try FirebaseAuth.Auth.auth().signOut()
                self.navigationController?.popViewController(animated: true)
                print("successfully logout")

            }catch{
                print("logout error :- \(error.localizedDescription)")
            }
        }), for: .touchUpInside)
        
        signWithPasswordBtn.addAction(.init(handler: { [weak self] action in
            guard let self = self else { return }
            let navigation = LoginViewController.instantiateFromStoryboard()
            self.navigationController?.pushViewController(navigation, animated: true)
        }), for: .touchUpInside)
        
    }
    @objc func onGooglSignIn(_ sender: UIButton){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
          guard error == nil else {
           return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
           return
          }
            guard let email = user.profile?.email, let firstname = user.profile?.givenName, let lastName = user.profile?.familyName else {
                print("Failer to sign in wit google")
                return }
            print("Email:---\(email), name:-----\(firstname), lastName:------\(lastName)")
            
            var safeEmail = email.replacingOccurrences(of: ".", with: "-")
           safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
            DataBaseManager.sharedInstent.usesrExists(with: email) { exites in
                guard !exites else {
                    print("user already login")
                    return
                }
            }
            
            DataBaseManager.sharedInstent.insertUserData(data: CheatModel(email: safeEmail, name: firstname, lastName: lastName))
            
          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

            
            Auth.auth().signIn(with: credential) { result, error in
                if result != nil, error == nil {
                    print("Successully login with google")
                }
            }
        }
    }
    
    
    @objc func signUpUser(_ sender: UIButton) {
       
        
        
    }
    
}

