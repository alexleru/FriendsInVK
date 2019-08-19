//
//  LoginController.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 10/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    //MARK: - outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - ControllerLifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService().request()
    }
    //MARK: - Actions
    @IBAction func loginButton(_ sender: Any) {

    }
    
    //MARK: - Fuctions
//    @objc func hideKeyboard() {
//        scrollView.endEditing(true)
//    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "Login Segue" else {return true}
        
        if usernameField.text == "" && passwordField.text == ""
        {
            return true
        }
        else {
            showLoginError()
            return false
        }
    }
    
    private func showLoginError() {
        let loginAlert = UIAlertController(title: "Error", message: "Wrong pair login and password", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) {_ in self.passwordField.text = ""}
        loginAlert.addAction(action)
        present(loginAlert, animated: true)
    }
}
