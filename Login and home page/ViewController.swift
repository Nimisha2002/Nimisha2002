//
//  ViewController.swift
//  Login and home page
//
//  Created by irohub on 11/07/24.
//  Copyright © 2024 nimisha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var signupbtn: UIButton!
    
    override func viewDidLoad() {
         
        signupbtn.layer.cornerRadius = 25
        signupbtn.layer.masksToBounds = true
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signup(_ sender: Any) {
      
        if(emailtext.text!.isEmpty || passwordtext.text!.isEmpty){
            let alert = UIAlertController(title: "Alert", message: "empty fields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            UserDefaults.standard.setValue(emailtext.text, forKey: "email")
                  UserDefaults.standard.setValue(passwordtext.text, forKey: "password")
                  
                  let top = UIStoryboard(name: "Main", bundle: nil)
                  let down = top.instantiateViewController(identifier: "home1") as!home_page_ViewController
                  self.navigationController?.pushViewController(down, animated: true)
                             }
    }
    
    func isValidPassword(_ password: String) -> Bool {
                   let minLength = 8
                   let passwordenter = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{\(minLength),}$"
                   
                   let passwordss = NSPredicate(format: "SELF MATCHES %@", passwordenter)
                   return passwordss.evaluate(with: password)
               }
     
    @IBAction func signin(_ sender: Any) {
        let topp = UIStoryboard(name: "Main", bundle: nil)
        let downn = topp.instantiateViewController(identifier: "log") as!loginViewController
        self.navigationController?.pushViewController(downn, animated: true)
    }
    
}

