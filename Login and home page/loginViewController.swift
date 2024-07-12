//
//  loginViewController.swift
//  Login and home page
//
//  Created by irohub on 11/07/24.
//  Copyright © 2024 nimisha. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    
    @IBAction func signupbtn(_ sender: Any) {
        let mn = UIStoryboard(name: "Main", bundle: nil)
        let st = mn.instantiateViewController(identifier: "cell") as!ViewController
        self.navigationController?.pushViewController(st, animated: true)
        
    }
    
    @IBOutlet weak var passtxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var loginbtn: UIButton!
    var user=""
    var pass=""
    override func viewDidLoad() {
      
        self.user = UserDefaults.standard.string(forKey: "email")!
        self.pass = UserDefaults.standard.string(forKey: "password")!
        loginbtn.layer.cornerRadius = 25
        loginbtn.layer.masksToBounds = true
        super.viewDidLoad()
          emailtxt.text!=user

        // Do any additional setup after loading the view.
    }
    @IBAction func login(_ sender: Any) {
        
        if(emailtxt.text!.isEmpty || passtxt.text!.isEmpty){
            let alert = UIAlertController(title: "Alert", message: "empty fields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

            
            
        }else{
            if(emailtxt.text==user && passtxt.text==pass){
                let main = UIStoryboard(name: "Main", bundle: nil)
                                      let story = main.instantiateViewController(identifier: "home1") as!home_page_ViewController
                                      self.navigationController?.pushViewController(story, animated: true)
                
            }else{
                let alert = UIAlertController(title: "Alert", message: "user not found", preferredStyle: UIAlertController.Style.alert)
                           alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                           self.present(alert, animated: true, completion: nil)

                           
            }
            
            
        }
        }

        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



