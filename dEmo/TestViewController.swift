//
//  ViewController.swift
//  dEmo
//
//  Created by Calli Bates on 14/12/19.
//  Copyright © 2019 Calli Bates. All rights reserved.
//

import UIKit
import Accelerate

class TestViewController: UIViewController {//Declares dice view structure...
    @IBOutlet weak var displayImage:UIImageView!//The display image..
    
    var settingsViewController:SettingsTableViewController!//The settings table..
    
    @IBOutlet weak var button1:UIButton!//10 dice-face response buttons
    @IBOutlet weak var button2:UIButton!
    @IBOutlet weak var button3:UIButton!//Check with Calli why 4 needs to be omitted.
    @IBOutlet weak var button4:UIButton!
    @IBOutlet weak var button5:UIButton!
    @IBOutlet weak var button6:UIButton!
    @IBOutlet weak var button7:UIButton!
    @IBOutlet weak var button8:UIButton!
    @IBOutlet weak var button9:UIButton!
    @IBOutlet weak var button10:UIButton!
    
    let symbolsValsResponses = [2, 11, 20, 51, 60, 100, 201, 210, 250, 400]//Array of values (constants) for the 10 response buttons in symbols mode.
    
    let symbolsVals = [1, 10, 50, 200]//Array of values (constants) for the 4 symbols in symbols mode.
    
    
    override func viewDidLoad() {//DEFINITION of override function.
        super.viewDidLoad()//CALLS 'view did load' function.
        startTest()//CALLS start test function
    }//ENDS override function.
    
    func startTest(){//DEFINES start test function...
        if (self.testMode == "Symbol"){//Response buttons if SYMBOLS mode is selected...
            self.button1.setImage(UIImage(named: "2Symbol"), for: .normal)
            self.button1.setTitle("2", for: .normal)
            self.button2.setImage(UIImage(named: "11Symbol"), for: .normal)
            self.button2.setTitle("11", for: .normal)
            self.button3.setImage(UIImage(named: "20Symbol"), for: .normal)
            self.button3.setTitle("20", for: .normal)
            self.button4.setImage(UIImage(named: "51Symbol"), for: .normal)
            self.button4.setTitle("51", for: .normal)
            self.button5.setImage(UIImage(named: "60Symbol"), for: .normal)
            self.button5.setTitle("60", for: .normal)
            self.button6.setImage(UIImage(named: "100Symbol"), for: .normal)
            self.button6.setTitle("100", for: .normal)
            self.button7.setImage(UIImage(named: "201Symbol"), for: .normal)
            self.button7.setTitle("201", for: .normal)
            self.button8.setImage(UIImage(named: "210Symbol"), for: .normal)
            self.button8.setTitle("210", for: .normal)
            self.button9.setImage(UIImage(named: "250Symbol"), for: .normal)
            self.button9.setTitle("250", for: .normal)
            self.button10.setImage(UIImage(named: "400Symbol"), for: .normal)
            self.button10.setTitle("400", for: .normal)
            }
        
        else if(self.testMode == "Number"){//Response buttons if NUMBERS mode is selected.
            self.button1.setImage(UIImage(named: "1Number"), for: .normal)
            self.button2.setImage(UIImage(named: "2Number"), for: .normal)
            self.button3.setImage(UIImage(named: "3Number"), for: .normal)
            self.button4.setImage(UIImage(named: "4Number"), for: .normal)
            self.button5.setImage(UIImage(named: "5Number"), for: .normal)
            self.button6.setImage(UIImage(named: "6Number"), for: .normal)
            self.button7.setImage(UIImage(named: "7Number"), for: .normal)
            self.button8.setImage(UIImage(named: "8Number"), for: .normal)
            self.button9.setImage(UIImage(named: "9Number"), for: .normal)
            self.button10.setImage(UIImage(named: "10Number"), for: .normal)
            }
        
    }//FUNCTION DEFINITION ENDS.
    
    @IBAction func onStartButtonClick(_ sender: UIButton){//Start button function...
        sender.isHidden = true
        preTest()
        //testBegins()//CALLS test begins function.
        
    }//Function ends.
    
    func preTest()
        {
            if pretimer == nil {//If the timer is set at nil ...
                pretimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { pretimer in
                    if self.seconds <= 0 {
                            if(self.numReversals == 4){
                                //Calls 'finish test' function in gameViewController
                                print("Pre-test complete")//Prints to console.
                                self.shouldCount = true
                                self.score = 0
                                self.turnCount = 0
                                self.timeCount = 0.0
                                self.numReversals = 0
                                self.pretimer?.invalidate()
                                print("Fourth reversal achieved during the correct answer condition - Test starts now!")
                                self.testBegins()
                        }//Length of test duration condition scope ends.
                        
                        if self.displayingValue {
                            self.displayBlank()//Calls displayBlank function in line 188.
                            self.displayingValue = false
                            self.seconds = self.blankTime//ISI duration saved to seconds.
                        }//if self.displayingValue condition ends.
                        else{
                            self.evaluate()//CALLS evaluate function.
                            self.prevValue = self.currValue//Sets current value as previous value.
                            self.displayValue()//CALLS display value function.
                            self.numTrials+=1
                            self.sum = self.prevValue + self.currValue//Correct answer is previous plus current value, saved as 'sum'
                            self.seconds = self.displayTime//Display time saved to 'seconds'.
                            self.displayingValue = true//Display next value
                        }//else ends.
                    }//if self.seconds <= 0 condition scope ends.
                    else {//if timer != nil...
                        self.seconds -= 0.1//If seconds are greater that 0, reduce seconds variable until the condition is met.
                    }//else ends.
                }//If seconds <=0 condition scope ends.
            }//if timer = nil condition scope ends.
            
        }//DEFINITION of test begins function ends.
    
    func testBegins()
    {//Definition of test begins function.
        if timer == nil {//If the timer is set at nil ...
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                if self.seconds <= 0 {//As the timer counts up in 0.1second intervals...
                    //if(self.turnCount >= self.numTrials){//Test continues until the number of required displays is reached
                        if(self.numReversals == 5){
                            self.timer?.invalidate()
                            print("Reversals met...moving into cool down")
                            self.coolDown()//Calls 'finish test' function in gameViewController
                    }//Length of test duration condition scope ends.
                    
                    if self.displayingValue {
                        self.displayBlank()//Calls displayBlank function in line 188.
                        self.displayingValue = false
                        self.seconds = self.blankTime//ISI duration saved to seconds.
                    }//if self.displayingValue condition ends.
                    else{
                        self.evaluate()//CALLS evaluate function.
                        self.prevValue = self.currValue//Sets current value as previous value.
                        self.displayValue()//CALLS display value function.
                        self.numTrials+=1
                        self.sum = self.prevValue + self.currValue//Correct answer is previous plus current value, saved as 'sum'
                        self.seconds = self.displayTime//Display time saved to 'seconds'.
                        self.displayingValue = true//Display next value
                    }//else ends.
                }//if self.seconds <= 0 condition scope ends.
                else {//if timer != nil...
                    self.seconds -= 0.1//If seconds are greater that 0, reduce seconds variable until the condition is met.
                }//else ends.
            }//If seconds <=0 condition scope ends.
        }//if timer = nil condition scope ends.
        
    }//DEFINITION of test begins function ends.
    
    func coolDown()
        {
            var coolDownTurns = 4
            if cooltimer == nil {//If the timer is set at nil ...
                cooltimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { cooltimer in
                    if self.seconds <= 0 {
                        coolDownTurns -= 1
                        if coolDownTurns == 0{
                            self.cooltimer?.invalidate()
                            self.finishTest()
                        }
                        if self.displayingValue {
                            self.displayBlank()//Calls displayBlank function in line 188.
                            self.displayingValue = false
                            self.seconds = self.blankTime//ISI duration saved to seconds.
                        }//if self.displayingValue condition ends.
                        else{
                            self.prevValue = self.currValue//Sets current value as previous value.
                            self.displayValue()//CALLS display value function.
                            self.numTrials+=1
                            self.sum = self.prevValue + self.currValue//Correct answer is previous plus current value, saved as 'sum'
                            self.seconds = self.displayTime//Display time saved to 'seconds'.
                            self.displayingValue = true//Display next value
                        }//else ends.
                    }//if self.seconds <= 0 condition scope ends.
                    else {//if timer != nil...
                        self.seconds -= 0.1//If seconds are greater that 0, reduce seconds variable until the condition is met.
                    }//else ends.
                }//If seconds <=0 condition scope ends.
            }//if timer = nil condition scope ends.
            
        }//DEFINITION of test begins function ends.
    
    func evaluate(){//DEFINITION of answer-evaluation function.
        self.timeCount += self.blankTime//The time-count is set as time-count plus ISI duration (ready to calculate the average).
        
        if(self.answer == self.sum && self.numTrials > 0){//If user input is CORRECT...
            self.numCorrect += 1//Note: Resets to 0 when 3 in-a-row correct.
            print("Number correct of three: ")//Print counter to console.
            print(self.numCorrect)
            self.numTrials += 1
            
            if (self.numWrong > 0 && self.numCorrect > 2){//If a previous answer was incorrect and 3 in a row are correct...
                self.numWrong = 0//reset 'wrong' counter to zero
                self.numReversals += 1//and add 1 to number of reversals.
                self.thresholdArray.append(self.blankTime)
                print("Current number of reversals (after 3 correct answers): ")
                print (self.numReversals)
                }
        
            if(self.shouldCount){//Start keeping score after the fourth reversal
                self.score += 1//add 1 to the score.
                }
        
            
            if(self.numCorrect == 3){//When there are three correct answers...
                self.blankTime -= 0.2//Reduce the ISI by .2 seconds
                print("...that's 3 in-a-row correct! An ISI reduction of 200 ms has been applied!")
                self.numCorrect = 0//Reset number correct to 0
                }
        }//END of IF correct condition for correct answer.
        
        else if(self.answer < self.sum || self.answer > self.sum){//For an INCORRECT answer (but not an omission)...
            self.numCorrect = 0//Reset 'number correct in a row' to zero.
            if(self.numWrong == 0){//If it's the first incorrect answer...
                self.numWrong += 1//Add 1 to the counter of wrong answers
                self.numReversals += 1//Add 1 to the reversals count
                print("Wrong answer!")
                print("Current number of reversals (after an incorrect answer): ")
                print(self.numReversals)
                }//END of ELSE IF condition for incorrect answer.
        
        else{//For omssions (no answer selected)...
            self.numCorrect = 0
            self.missedResponse += 1
            print("Current number of missed responses: ")
            print(self.missedResponse)
        }//END of missing response condition.
            
        self.blankTime += 0.2//And increase the ISI by .2 seconds.
        print("...an increase in ISI of 200 ms has been applied!")
        }
        self.answer = 0//Assign zero to answer variable ready for next trial.
    }//ENDS evaluate answer function.
    
    @IBAction func buttonWasClicked(_ sender: UIButton)//DEFINITION of button was clicked function.
    {
        let numStr = sender.title(for: .normal)!//Initialises variable for user input..
        self.answer = Int(numStr) ?? 0//Saves that data to 'answer'.
    }//END of function definition.
    
    @IBAction func onSettingsButtonClicked(_ sender: UIButton)//DEFINITION of setting selection function on iPad simulator.
    {
        self.timer?.invalidate()//Stops timer and requests its removal from its run loop.
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)//Storyboard.
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Settings") as! SettingsTableViewController//Settings.
        nextViewController.modalPresentationStyle = .fullScreen//Full-screen presentation.
        self.present(nextViewController, animated:true, completion:nil)
    }//END of function definition.
    
    func displayBlank(){//DEFINITION of display blank function (ISI).
        DispatchQueue.main.async{//Appears on screen...
            self.displayImage?.image = UIImage(named: "NoDice")//Image for blank dice face.
            self.displayImage?.setNeedsDisplay()//CALLS function to update main dice image.
        }
    }//END of function definition.
    
    func displayValue()//DEFINITION of display value function.
    {
        let num = getRandomNumber()//CALLS random number function and saves as 'num'.
        self.currValue = num//Save random number as current value.
        let name = String(num)+self.testMode//Saves random selection and mode to 'name'
        self.turnCount += 1//Adds one to turn counter.
        DispatchQueue.main.async{//Appears on screen.
            self.displayImage?.image = UIImage(named: name)//Image associated with random number plus test mode.
            self.displayImage?.setNeedsDisplay()//Dispays image.
        }
    }//END of 'display value' function definition.
    
    /*Initialisation of all necessary variables:*/
    
    var testMode = "Symbol"//An opportunity to overwrite 'test mode'
    var score = 0//Initialises 'score'.
    var blankTime = 3.0//Initialises ISI as 3 seconds.
    var displayingValue = false//Inialises displaying value variable (set as false).
    let displayTime = 0.5//Declares a constant .5 seconds display time.
    var timer:Timer?//Initialises a timer.
    var pretimer:Timer?
    var cooltimer:Timer?
    var seconds = 2.0//Initialises seconds, set at 2 seconds.
    var prevValue = 0//Initialises a previous value variable.
    var currValue = 0//Initialises a current value variable.
    var sum = 0//Initialises a sum variable.
    var turnCount = 0//Initialises a turn-count variable.
    var numReversals = 0//Initialises a number-of-reversals tracking variable.
    var numWrong = 0//Initialises a number-of-wrong-answers tracking variable.
    var numCorrect = 0//Initialises a number-of-correct-answers tracking variable.
    var missedResponse = 0
    var shouldCount = false//Should count? set as false.
    var answer = 0//Initialises user answer variable.
    var timeCount = 0.0//Initialises a time-count variable.
    var numTrials = 0//Initialises variable for number of trials.
    var thresholdArray: [Double] = []
    
    let dice1 = UIImage(named: "1Dice")//Images for dice faces...
    let dice2 = UIImage(named: "2Dice")
    let dice3 = UIImage(named: "3Dice")
    let dice4 = UIImage(named: "4Dice")
    let dice5 = UIImage(named: "5Dice")
    let dice6 = UIImage(named: "6Dice")
    let dice7 = UIImage(named: "7Dice")
    let dice8 = UIImage(named: "8Dice")
    let dice9 = UIImage(named: "9Dice")
    let blankDice = UIImage(named: "NoDice")//Image for blank dice (ISI).
    
    let number1 = UIImage(named: "1Number")//Images for number faces...
    let number2 = UIImage(named: "2Number")
    let number3 = UIImage(named: "3Number")
    let number4 = UIImage(named: "4Number")
    let number5 = UIImage(named: "5Number")
    let number6 = UIImage(named: "6Number")
    let number7 = UIImage(named: "7Number")
    let number8 = UIImage(named: "8Number")
    let number9 = UIImage(named: "9Number")
    let number10 = UIImage(named: "10Number")
    
    let symbol1 = UIImage(named: "1Symbol")//Images for 4 symbols
    let symbol10 = UIImage(named: "10Symbol")
    let symbol50 = UIImage(named: "50Symbol")
    let symbol200 = UIImage(named: "200Symbol")

    func finishTest()//DEFINITION of finish test function.
    {
        self.timer?.invalidate()//Stops timer and requests its removal from its run loop.
        self.timer = nil//Resets timer.
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)//Reset.
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Results") as! ResultsTableViewController//Results table.
        nextViewController.modalPresentationStyle = .fullScreen//Full-screen on iPad.
        nextViewController.correctScore = Float(self.score)/Float(self.turnCount) * 100.00//Assigns 'score' to 'correct score'.
        print(timeCount)//Print the time count to console (timecount previously adding ISI durations and average divides by number of trials.
        //let thresholdScoreRounded = Double(round((self.timeCount/Double(self.numTrials)) * 1000)/1000)
        var mean = 0.0
        var sddev = 0.0
        
        vDSP_normalizeD(thresholdArray,1,nil,1,&mean,&sddev,vDSP_Length(thresholdArray.count))
        sddev *= sqrt(Double(thresholdArray.count)/Double(thresholdArray.count - 1))
        print(self.thresholdArray)
        print(mean, sddev)
        nextViewController.stdDeviation = sddev
        nextViewController.mean = mean
        nextViewController.missedAnswers = self.missedResponse
        
        self.present(nextViewController, animated:true, completion:nil)//iPad output.
    }//END of finish test function.
    
    func getRandomNumber()-> Int{//Defines random number generator function.
        var num = 0
        if(self.testMode == "Dice"){
            num = Int.random(in: 1...5)
            
            //print(num)
        }
        if(self.testMode == "Number"){
            num = Int.random(in: 1...5)
            
           // print(num)
        }
        if(self.testMode == "Symbol"){//If in symbols mode...
            num = Int.random(in:1...4) //This grabs a random number from 1-4
            num = symbolsVals[num-1] //And then uses that number as an index to grab a symbol
                                     // number from the symbolsVals array
            //print(num)
        }
    return num//Returns the random number.
    }//END of random number generator function.
}
