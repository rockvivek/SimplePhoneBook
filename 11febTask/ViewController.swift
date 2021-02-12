//
//  ViewController.swift
//  11febTask
//
//  Created by IPHTECH 20 on 11/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var saveBuuttonOutlet: UIButton!
    
    var userInfo = ""
    var phoneInfo = ""
    var index = -1
    var isEditDataAvailable = false
    override func viewDidLoad() {
        super.viewDidLoad()
        if userInfo != "" && phoneInfo != "" {
            userNameTextField.text = userInfo
            phoneTextField.text = phoneInfo
            isEditDataAvailable = true
            saveBuuttonOutlet.setTitle("Edit", for: .normal)
            //saveBuuttonOutlet.text = "Edit"
        }
        // Do any additional setup after loading the view.
        
    }

    @IBAction func saveButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "UserDataTableViewController") as! UserDataTableViewController
        print(userData.count);
        if isEditDataAvailable {
            userData[index].0 = userNameTextField.text!
            userData[index].1 = phoneTextField.text!
        }
        else{
            userData.append((name:userNameTextField.text!,phone:phoneTextField.text!))
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

