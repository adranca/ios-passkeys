//
//  RegisterViewController.swift
//  Shiny
//
//  Created by Alexandru Dranca on 04.08.2022.
//  Copyright © 2022 Apple. All rights reserved.
//

import UIKit

import os

class RegisterViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func register(_ sender: Any) {
        guard let userName = username.text else {
            Logger().log("No user name provided")
            return
        }
        
        guard let window = self.view.window else { fatalError("The view was not in the app's view hierarchy!") }
        (UIApplication.shared.delegate as? AppDelegate)?.accountManager.signUpWith(userName: userName, anchor: window)
    }
}
