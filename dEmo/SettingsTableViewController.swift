//
//  SettingsTableViewController.swift
//  dEmo
//
//  Created by Calli Bates on 8/03/20.
//  Copyright © 2020 Calli Bates. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var mode = "Dice"
    @IBOutlet weak var diceSwitch:UISwitch?
    @IBOutlet weak var numbersSwitch:UISwitch?
    @IBOutlet weak var symbolsSwitch:UISwitch?
    
    @IBAction func diceModeSwitchChanged(_ sender: UISwitch){
        numbersSwitch?.setOn(false, animated: true)
        symbolsSwitch?.setOn(false, animated: true)
        self.mode = "Dice"
    }
    @IBAction func numbersModeSwitchChanged(_ sender: UISwitch){
        symbolsSwitch?.setOn(false, animated: true)
        diceSwitch?.setOn(false, animated: true)
        self.mode = "Numbers"
    }
    @IBAction func symbolsModeSwitchChanged(_ sender: UISwitch){
        numbersSwitch?.setOn(false, animated: true)
        diceSwitch?.setOn(false, animated: true)
        self.mode = "Symbols"
    }
    @IBAction func saveButtonClicked(_ sender: UISwitch){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Game") as! DiceGameViewController
        nextViewController.modalPresentationStyle = .fullScreen
        nextViewController.gameMode = mode
        self.present(nextViewController, animated:true, completion:nil)
    }
    @IBAction func backButtonClicked(_ sender: UISwitch){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Game") as! DiceGameViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()

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
        return 4
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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