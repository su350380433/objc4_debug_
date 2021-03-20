//
//  RegisterVC.swift
//  Storyboard_demo
//
//  Created by ss on 2021/3/19.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var pswd: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBAction func registerAction(_ sender: Any) {
        print(userName.text!)
        print(email.text!)
        print(pswd.text!)
        
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
