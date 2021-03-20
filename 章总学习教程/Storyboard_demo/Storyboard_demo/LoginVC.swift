//
//  LoginVC.swift
//  Storyboard_demo
//
//  Created by ss on 2021/3/20.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var pswd: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func loginAction(_ sender: Any) {
        let alertView = UIAlertController.init(title: "我是标题",
                                                          message: "I am msg",
                                                          preferredStyle: .alert);
        let okAlert = UIAlertAction(title: "OK",
                                    style: .default,
                                    handler: {
                                  action in
                                  print("click ok")
        })
        let cannelAlert = UIAlertAction(title: "cancel",
                                        style: .cancel) { (action) in
            print("click cancel")
        }
        alertView .addAction(okAlert)
        alertView.addAction(cannelAlert)
        self.present(alertView, animated: true) {
            
        }
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true) {
            print(" 关闭")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
