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
    
    @IBOutlet weak var button2:UIButton!
    @IBOutlet weak var button3:UIButton!
    @IBOutlet weak var button4:UIButton!
    @IBOutlet weak var button5:UIButton!
    @IBOutlet weak var button6:UIButton!
    @IBOutlet weak var button7:UIButton!
    @IBOutlet weak var button8:UIButton!
    @IBOutlet weak var button9:UIButton!
    @IBOutlet weak var button10:UIButton!
    @IBOutlet weak var button11:UIButton!
    @IBOutlet weak var button12:UIButton!
    
    let symbolsVals = [1, 5, 10, 50, 100, 6, 11, 55, 150, 101, 105]
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        startGame()
    }
    
    func startGame(){
        if (self.gameMode == "Roman"){
            self.button2.setImage(UIImage(named: "1Roman"), for: .normal)
            self.button2.setTitle("1", for: .normal)
            self.button3.setImage(UIImage(named: "5Roman"), for: .normal)
            self.button3.setTitle("5", for: .normal)
            self.button4.setImage(UIImage(named: "10Roman"), for: .normal)
            self.button4.setTitle("10", for: .normal)
            self.button5.setImage(UIImage(named: "50Roman"), for: .normal)
            self.button5.setTitle("50", for: .normal)
            self.button6.setImage(UIImage(named: "100Roman"), for: .normal)
            self.button6.setTitle("100", for: .normal)
            self.button7.setImage(UIImage(named: "6Roman"), for: .normal)
            self.button7.setTitle("6", for: .normal)
            self.button8.setImage(UIImage(named: "11Roman"), for: .normal)
            self.button8.setTitle("11", for: .normal)
            self.button9.setImage(UIImage(named: "55Roman"), for: .normal)
            self.button9.setTitle("55", for: .normal)
            self.button10.setImage(UIImage(named: "150Roman"), for: .normal)
            self.button10.setTitle("150", for: .normal)
            self.button11.setImage(UIImage(named: "101Roman"), for: .normal)
            self.button11.setTitle("101", for: .normal)
            self.button12.setImage(UIImage(named: "105Roman"), for: .normal)
            self.button12.setTitle("105", for: .normal)
        }else if(self.gameMode == "Number"){
            self.button2.setImage(UIImage(named: "2Number"), for: .normal)
            self.button3.setImage(UIImage(named: "3Number"), for: .normal)
            self.button4.setImage(UIImage(named: "4Number"), for: .normal)
            self.button5.setImage(UIImage(named: "5Number"), for: .normal)
            self.button6.setImage(UIImage(named: "6Number"), for: .normal)
            self.button7.setImage(UIImage(named: "7Number"), for: .normal)
            self.button8.setImage(UIImage(named: "8Number"), for: .normal)
            self.button9.setImage(UIImage(named: "9Number"), for: .normal)
            self.button10.setImage(UIImage(named: "10Number"), for: .normal)
            self.button11.setImage(UIImage(named: "11Number"), for: .normal)
            self.button12.setImage(UIImage(named: "12Number"), for: .normal)
            
        }
        
    }
    @IBAction func onStartButtonClick(_ sender: UIButton){
        sender.isHidden = true
        gamePlay()
    }
    func gamePlay(){
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
        print(timeCount)
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
        self.timer?.invalidate()
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
        let name = String(num)+self.gameMode
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
    let numDisplays = 20
    
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
        self.timer?.invalidate()
        self.timer = nil
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Results") as! ResultsTableViewController
        nextViewController.modalPresentationStyle = .fullScreen
        nextViewController.correctScore = self.score
        print(timeCount)
        nextViewController.thresholdScore = (self.timeCount/Double(self.numDisplays))
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    func getRandomNumber()-> Int{
        var num = Int.random(in: 1...6)
        if(self.gameMode == "Roman"){
            num = symbolsVals[num-1]
            if(num == 5){
                num -= 1
            }
        }
        return num
    }
}
