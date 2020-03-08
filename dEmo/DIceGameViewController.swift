//
//  ViewController.swift
//  dEmo
//
//  Created by Calli Bates on 14/12/19.
//  Copyright © 2019 Calli Bates. All rights reserved.
//

import UIKit

class DiceGameViewController: UIViewController {
    @IBOutlet weak var displayImage:UIImageView!
    var settingsViewController:SettingsTableViewController!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        startGame()
    }
    
    func startGame(){
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                if self.seconds <= 0 {
                    if(self.turnCount >= self.numDisplays){
                        self.finishGame()
                    }
                    print("Time is up!")
                    if self.displayingValue {
                        self.displayBlank()
                        self.displayingValue = false
                        self.seconds = self.blankTime
                    }else{
                        self.evaluate()
                        self.prevValue = self.currValue
                        self.displayValue()
                        self.sum = self.prevValue + self.currValue
                        self.seconds = self.displayTime
                        self.displayingValue = true
                    }
                } else {
                    self.seconds -= 0.1
                }
            }
        }
    }
    
    func evaluate(){
        self.timeCount += self.blankTime
        if(self.answer == self.sum){ //correct guess
            self.numCorrect += 1
            if (self.numWrong > 0){
                self.numWrong = 0
                self.numReversals += 1
            }
            if(self.shouldCount){
                self.score += 1
            }
            if(self.numReversals == 4){
                self.shouldCount = true
                self.score = 0
                self.turnCount = 0
                self.timeCount = 0.0
            }
            if(self.numCorrect == 2){
                self.blankTime -= 0.2
            }
        }
        else{ //incorrect guess
            self.numCorrect = 0
            if(self.numWrong == 0){
                self.numReversals += 1
            }
            if(self.numReversals == 4){
                self.shouldCount = true
                self.score = 0
                self.turnCount = 0
                self.timeCount = 0.0
            }
            self.numWrong += 1
            self.blankTime += 0.2
        }
        self.answer = 0
    }
    
    @IBAction func buttonWasClicked(_ sender: UIButton)
    {
        let numStr = sender.title(for: .normal)!
        self.answer = Int(numStr) ?? 0
    }
    
    @IBAction func onSettingsButtonClicked(_ sender: UIButton)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Settings") as! SettingsTableViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func displayBlank(){
        DispatchQueue.main.async{
            self.displayImage?.image = UIImage(named: "NoDice")
            self.displayImage?.setNeedsDisplay()
        }
    }
    
    func displayValue(){
        let num = getRandomNumber()
        self.currValue = num
        let name = String(num)+"Dice"
        self.turnCount += 1
        DispatchQueue.main.async{
            self.displayImage?.image = UIImage(named: name)
            self.displayImage?.setNeedsDisplay()
        }
    }
    
    var gameMode = "Dice"
    var score = 0
    var blankTime = 3.0
    var displayingValue = false
    let displayTime = 0.5
    var timer:Timer?
    var seconds = 2.0
    var prevValue = 0
    var currValue = 0
    var sum = 0
    var turnCount = 0
    var numReversals = 0
    var numWrong = 0
    var numCorrect = 0
    var shouldCount = false
    var answer = 0
    var timeCount = 0.0
    let numDisplays = 3
    
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
        let alert = UIAlertController(title: "Time's Up!", message: "Your time is up! You got a score of \(score) points and a mean time of \(self.timeCount / Double(self.numDisplays)). Awesome!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK, start new game", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
        
    }
    
    func getRandomNumber()-> Int{
        let num = Int.random(in: 1...6)
        return num
    }
}
