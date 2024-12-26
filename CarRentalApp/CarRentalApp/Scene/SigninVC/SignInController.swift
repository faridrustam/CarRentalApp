//
//  ViewController.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 21.12.24.
//

import UIKit

class SignInController: UIViewController {
    
    let userDefaultsManger = UserDefaultsManager()

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        emailTextField.layer.cornerRadius = (emailTextField.frame.size.height) / 2
        passwordTextField.layer.cornerRadius = (passwordTextField.frame.size.height) / 2
        loginButton.layer.cornerRadius = (loginButton.frame.size.height) / 2
        
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.masksToBounds = true
        loginButton.layer.masksToBounds = true
        
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        if let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty {
            userDefaultsManger.setValue(value: true, key: .login)
            let controller = storyboard?.instantiateViewController(identifier: "\(HomeController.self)") as! HomeController
            
            navigationController?.show(controller, sender: nil)
        }
        
    }
    
}

