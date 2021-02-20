//
//  ViewController.swift
//  Airlift Pilot
//
//  Created by Saad on 2/18/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtFieldUserNumber: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RoutesVC")
        let navigationController = UINavigationController(rootViewController: vc)
        AppDelegate.shared?.window?.rootViewController = navigationController
        AppDelegate.shared?.window?.makeKeyAndVisible()
    }
    
}

