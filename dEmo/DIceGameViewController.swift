//
//  ViewController.swift
//  dEmo
//
//  Created by Calli Bates on 14/12/19.
//  Copyright © 2019 Calli Bates. All rights reserved.
//

import UIKit

class DiceGameViewController: UIViewController {
    @IBOutlet weak var scoreLabel:UILabel?
    @IBOutlet weak var timeLabel:UILabel?
    @IBOutlet weak var numberLabel:UILabel?
    @IBOutlet weak var inputField:UITextField?
    @IBOutlet weak var displayImage:UIImageView?
    
    @IBAction func buttonWasClicked(_ sender: UIButton)
    {
        print(sender.title(for: .normal)!)
        
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                if self.seconds <= 0 {
                    print("Time is up!")
                    if self.displayingValue {
                        print("Displaying a blank")
                        self.displayBlank()
                        self.displayingValue = false
                        self.seconds = self.blankTime
                    }else{
                        print("displaying a value")
                        self.displayValue()
                        self.seconds = self.displayTime
                        self.displayingValue = true
                    }
                } else {
                    self.seconds -= 0.1
                    print("Counting down "+String(self.seconds))
                }
            }
        }
    }
    
    func displayBlank(){
        DispatchQueue.main.async{
            self.displayImage?.image = UIImage(contentsOfFile: "NoDice")
            self.displayImage?.setNeedsDisplay()
        }
    }
    
    func displayValue(){
        DispatchQueue.main.async{
            self.displayImage?.image = UIImage(contentsOfFile: "1Dice")
            self.displayImage?.setNeedsDisplay()
        }
    }
    
    var score = 0
    var blankTime = 3.0
    var displayingValue = false
    let displayTime = 0.5
    var timer:Timer?
    var seconds = 2.0
    var prevValue = 0
    
    let dice1 = UIImage(named: "1Dice")
    let dice2 = UIImage(named: "2Dice")
    let dice3 = UIImage(named: "3Dice")
    let dice4 = UIImage(named: "4Dice")
    let dice5 = UIImage(named: "5Dice")
    let dice6 = UIImage(named: "6Dice")
    let dice7 = UIImage(named: "7Dice")
    let dice8 = UIImage(named: "8Dice")
    let dice9 = UIImage(named: "9Dice")
    let blankDice = UIImage(named: "NoDice")

    func finishGame()
    {
        timer?.invalidate()
        timer = nil
        let alert = UIAlertController(title: "Time's Up!", message: "Your time is up! You got a score of \(score) points. Awesome!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK, start new game", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
        score = 0
        seconds = 60
        
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    func getRandomNumber()-> Int{
        let num = Int.random(in: 0...9)
        return num
    }
}

