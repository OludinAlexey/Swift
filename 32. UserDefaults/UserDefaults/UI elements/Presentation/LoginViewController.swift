//
//  LoginViewController.swift
//  UI elements
//
//  Created by Алексей Олудин on 03.08.2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    let correctLogin: String = "admin"
    let correctPassword: String = "123"
    let minLoginLetterNumber: UInt8 = 2
    let minPasswordSymbolsNumber: UInt8 = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.isEnabled = false
    }

    
    @IBAction func didLoginButtonTouch(_ sender: UIButton) {
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if authentication(login: login, password: password) {
            print("Correct login! You has entered the Matrix!")
            dismiss(animated: true)
        }
        else{
            print("Incorrect login. You`ll never get into the Matrix! Ha-ha-ha!!!")
        }
    }
    
    
    @IBAction func isThereTextInLoginField(_ sender: UITextField) {
        
        changeLabelState(label: loginLabel, textField: sender, minSymbolsNumber: minLoginLetterNumber)
        changeLoginButtonState()
    }
    
    
    @IBAction func isThereTextInPasswordField(_ sender: UITextField) {
        
        changeLabelState(label: passwordLabel, textField: sender, minSymbolsNumber: minPasswordSymbolsNumber)
        changeLoginButtonState()
    }
    
    
    private func changeLabelState(label: UILabel, textField: UITextField, minSymbolsNumber: UInt8) {
        
        if (textField.text?.count ?? 0) > minSymbolsNumber {
            label.textColor = .blue
        }
        else{
            label.textColor = .black
        }
    }
    
    
    private func changeLoginButtonState ()
    {
        loginButton.isEnabled = (loginTextField.text?.count ?? 0) > minLoginLetterNumber && (passwordTextField.text?.count ?? 0) > minPasswordSymbolsNumber ? true : false
    }
    
    
    private func authentication (login: String, password: String) -> Bool{
        
        return login == correctLogin && password == correctPassword ? true : false
    }
    
}

