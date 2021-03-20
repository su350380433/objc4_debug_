//
//  ViewController.swift
//  LoginModule
//
//  Created by ss on 2021/3/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var pswdText: UITextField!
    
    //注册按钮
    @IBAction func registerAction(_ sender: Any) {
        print(self.emailText!.text!)
        print(self.pswdText!.text!)
    }
}

