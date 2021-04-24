//
//  ResultsTableViewController.swift
//  dEmo
//
//  Created by Calli Bates on 8/03/20.
//  Copyright © 2020 Calli Bates. All rights reserved.
//

import UIKit//Library.

class ResultsTableViewController: UITableViewController{//New structure for results table.
    @IBOutlet weak var correctLabel:UILabel?//Number of correct answers label.
    @IBOutlet weak var missedLabel:UILabel?//Threshold score label.
    @IBOutlet weak var thresholdLabel:UILabel?//Threshold score label.
    
    var correctScore:Float = 0.0//Initialises total correct score.
    var missedAnswers:Int = 0//Initialises number of missed answers.
    var thresholdScore:Double = 0.0//Initialises threshold score.
    var stdDeviation:Double = 0.0
    var mean: Double = 0.0
    

    override func viewDidLoad()//DEFINITION of 'view did load' function.
    {
        super.viewDidLoad()//CALLS view did load function.
        tableView.tableFooterView = UIView()//CALLS UIView function and saves to table view.
        correctLabel?.text = String(format: "%.02f %%", correctScore)//String(format: "%02d", min)Assigns total number correct to label.
        missedLabel?.text = String(missedAnswers)//Assigns total number missed to label.
        thresholdLabel?.text = String(thresholdScore)//Assigns threshold score to label.
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    @IBAction func restartButtonClicked(_ sender: UIButton){//DEFINITION of restart function.
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Test") as! TestViewController//Use dice test view controller program.
        nextViewController.modalPresentationStyle = .fullScreen//iPad output.
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        // #warning Incomplete implementation, return the number of rows
        return 1
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
