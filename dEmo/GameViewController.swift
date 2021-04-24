//
//  ViewController.swift
//  dEmo
//
//  Created by Calli Bates on 14/12/19.
//  Copyright © 2019 Calli Bates. All rights reserved.
//

//import UIKit
//
//class GameViewController: UIViewController {//Declares structure for controller...
//    @IBOutlet weak var scoreLabel:UILabel?//Score label
//    @IBOutlet weak var timeLabel:UILabel?//Timer label
//    @IBOutlet weak var numberLabel:UILabel?//Number label
//    @IBOutlet weak var inputField:UITextField?//An input field.
//    @IBAction func inputFieldDidChange()//CALLS input changed function.
//    {
//        guard let numberText = numberLabel?.text, let inputText = inputField?.text else {
//            return//'guard let' statement transfers programme control out of a scope if a condition is not met.
//        }
//        let input = Int(inputText)//Initialises constant integer for input and saves user input to it.
//        let number = Int(numberText)!//Initialises constant integer  and saves the displayed number (numberlabel/numbertext) to it.
//        let answer = prevValue + number//Correct current answer is previous answer plus current display.
//        guard inputText.count == 1 + (answer / 10) else {//Check with Calli - is this a failsafe?
//            return
//        }
//        if answer == input {//If answer is correct, add one to the score.
//            score += 1
//        }
//        prevValue = input ?? 0//Assign the last user input to previous value.
////        updateNumberLabel()//CALLS for a new display number.
////        updateScoreLabel()//CALL to update the score label function.
////        inputField?.text = ""//Check with Calli - does this refresh the input stream?
////        if timer == nil {
////            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
////                if self.seconds == 0 {
////                    self.finishTest()//CALL to finish test function when time runs out but check with Calli as time only couts upward in the test.
////                } else if self.seconds <= 60 {//Up to 1 min on the timer...
////                    self.seconds -= 1//Reduce timer by 1 second for each iteration
////                    self.updateTimeLabel()//CALL to update time label in min:seconds format.
////                }
////            }
////        }
//    }
//
//    var score = 0//Initialise score counting variable.
//    var timer:Timer?//Initialise a timer.
////    var seconds = 0//Initialise a variable for seconds.
//    var prevValue = 0//initialise a variable for the previous value.
//
////    func updateScoreLabel() {//Definition of function to update the score lable.
////        scoreLabel?.text = String(score)//Save current score to score label.
////    }
////
////    func updateNumberLabel() {//Definition to update displaying diceface...
////        prevValue = Int(numberLabel?.text ?? "0") ?? 0//Save current displayed integer as previous...
////        numberLabel?.text = String.randomNumber(length: 1)//The new displayed dice face is randomly generated...
////    }
//
////    func updateTimeLabel() {//Definition of updating time lable...
////        let min = (seconds / 60) % 60//Constant definition of a minute.
////        let sec = seconds % 60//Constant definition of seconds.
////        timeLabel?.text = String(format: "%02d", min) + ":" + String(format: "%02d", sec)
////    }//How the time-label appears in debug, two spaces for minutes, colon, two spaces for seconds.
//
////    func finishTest()//DEFINITION of finish test function - another in TestView line 265
////    {
////        timer?.invalidate()//Stops timer and requests its removal from its run loop.
////        timer = nil//nil saved as timer
////        let alert = UIAlertController(title: "Time's Up!", message: "Your time is up! You got a score of \(score) points.", preferredStyle: .alert)//Not set to print
////        alert.addAction(UIAlertAction(title: "OK, start new test", style: .default, handler: nil))//Again, not appearing in debugger or on iPad.
////
////        self.present(alert, animated: true, completion: nil)//Presents a view controller.
////        score = 0//Assigns value of zero to score.
////        seconds = 60//Assigns value of 60 to seconds.
////        updateTimeLabel()//CALLS to update time, score, and number labels.
////        updateScoreLabel()
////        updateNumberLabel()
////
////    } //Does this function occur? Or is the local finishTest() in testView prioritised
//
//    override func viewDidLoad()//DEFINES view did load function...
//    {
//        super.viewDidLoad()//CALLS view did load function.
////        updateScoreLabel()//CALLS to update score, number, and time labels.
////        updateNumberLabel()
////        updateTimeLabel()
//    }
//}
//
