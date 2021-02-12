//
//  userDataTableViewCell.swift
//  11febTask
//
//  Created by IPHTECH 20 on 11/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit
protocol makeButtonClickableProtocol {
    func actionOnButtonClick(index:Int)
    func actionOnEditButtonClick(index:Int)
}
class userDataTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!

    //make a variable of protocal
    var cellDelegate:makeButtonClickableProtocol?
    var index:Int?
    @IBAction func cellDeleteButton(_ sender: UIButton) {
        
//
        cellDelegate?.actionOnButtonClick(index: index!)
        
    }
    @IBAction func cellEditButton(_ sender: UIButton) {
        print("edit")
        cellDelegate?.actionOnEditButtonClick(index: index!)
    }
}
