//
//  RootVCViewController.swift
//  ChaparalaJAlbumApp
//
//  Created by Chaparala,Jyothsna on 3/25/23.
//

import UIKit

class RootVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTF.isEnabled = false
        self.loginBTN.isEnabled = false
    }
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBAction func loginBTN(_ sender: UIButton) {
        guard let value = self.userNameTF, let username = value.text, !username.isEmpty else {
            return
        }
        
        self.passwordTF.isEnabled = true
        
        if(username == "admin" && passwordTF.text == "password") {
            self.performSegue(withIdentifier: "showAlbum", sender: self.loginBTN)
            
        }
    }
    
    @IBAction func userNameTF(_ sender: UITextField) {
        guard let value = self.userNameTF, let username = value.text, username == "admin" else {
            return
        }
        
        self.passwordTF.isEnabled = true
    }
    
    @IBAction func passwordTF(_ sender: UITextField) {
        guard let value = self.passwordTF, let password = value.text, password == "password" else {
            return
        }
        
        self.loginBTN.isEnabled = true
    }
}
