/*//  ViewController.swift
//  dEmo
//
//  Created by Louise Patterson 19/04/2021
//  Copyright © 2021 Louise Patterson All Rights Reserved

import UIKit

class RatingScalesView: UIViewController {//Declares ration scale view structure...
    
    var settingsViewController:SettingsTableViewController!//The settings table..
    
    @IBOutlet weak var button1:UIButton!//11 dice-face response buttons
    @IBOutlet weak var button2:UIButton!
    @IBOutlet weak var button3:UIButton!
    @IBOutlet weak var button4:UIButton!
    @IBOutlet weak var button5:UIButton!
    @IBOutlet weak var button6:UIButton!
    
    let ResponseValues = [0, 1, 2, 3, 4, 5, 6]//Array of values (constants) for the rating scale.
    
    override func viewDidLoad() {//DEFINITION of override function.
        super.viewDidLoad()//CALLS 'view did load' function.
    }//ENDS override function.

    func rateExperience(){//DEFINES start test function...
            self.button1.setImage(UIImage(named: "VeryBad"), for: .normal)
            self.button2.setImage(UIImage(named: "Bad"), for: .normal)
            self.button3.setImage(UIImage(named: "FairlyBad"), for: .normal)
            self.button5.setImage(UIImage(named: "FairlyGood"), for: .normal)
            self.button6.setImage(UIImage(named: "Good"), for: .normal)
            self.button7.setImage(UIImage(named: "VeryGood"), for: .normal)
            }
        
    }//FUNCTION DEFINITION ENDS.
    
    let emoji1 = UIImage(named: "VeryBad")//Images for dice faces...
    let emoji2 = UIImage(named: "Bad")
    let emoji3 = UIImage(named: "FairlyBad")
    let emoji4 = UIImage(named: "FairlyGood")
    let emoji5 = UIImage(named: "Good")
    let emoji6 = UIImage(named: "VeryGood")*/
