//
//  TabBarViewController.swift
//  UI elements
//
//  Created by Алексей Олудин on 09.08.2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private var isUserLogin: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !isUserLogin {
            showLogin()
            isUserLogin = true
        }
    }
    
    private func showLogin(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(identifier: "loginVC")
        
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: false)
    }

}
