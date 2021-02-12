//
//  UserDataTableViewController.swift
//  11febTask
//
//  Created by IPHTECH 20 on 11/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

class UserDataTableViewController: UITableViewController {
    
   
    @IBOutlet var userDataTableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDataTableViewOutlet.delegate = self
        userDataTableViewOutlet.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userData.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "User Data"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userDataTableViewCell", for: indexPath) as! userDataTableViewCell
        cell.usernameLabel.text = userData[indexPath.item].0
        cell.phoneLabel.text = userData[indexPath.item].1
        cell.cellDelegate = self
        cell.index = indexPath.row
        return cell
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //self.tableView.reloadData()
//    }
    
   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UserDataTableViewController: makeButtonClickableProtocol {
    func actionOnButtonClick(index: Int) {
        if userData.count > 0 {
            userData.remove(at: index)
            tableView.reloadData()
        }
    }
    func actionOnEditButtonClick(index:Int){
        let vc = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.userInfo = userData[index].0
        vc.phoneInfo = userData[index].1
        vc.index = index
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
