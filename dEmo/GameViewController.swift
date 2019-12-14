//
//  ViewController.swift
//  dEmo
//
//  Created by Calli Bates on 14/12/19.
//  Copyright © 2019 Calli Bates. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var scoreLabel:UILabel?
    @IBOutlet weak var timeLabel:UILabel?
    @IBOutlet weak var numberLabel:UILabel?
    @IBOutlet weak var inputField:UITextField?
    @IBAction func inputFieldDidChange()
    {
        guard let numberText = numberLabel?.text, let inputText = inputField?.text else {
            return
        }
        let input = Int(inputText)
        let number = Int(numberText)!
        let answer = prevValue + number
        guard inputText.count == 1 + (answer / 10) else {
            return
        }
        if answer == input {
            score += 1
        }
        prevValue = input ?? 0
        updateNumberLabel()
        updateScoreLabel()
        inputField?.text = ""
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.seconds == 0 {
                    self.finishGame()
                } else if self.seconds <= 60 {
                    self.seconds -= 1
                    self.updateTimeLabel()
                }
            }
        }
    }
    
    var score = 0
    var timer:Timer?
    var seconds = 60
    var prevValue = 0
    
    func updateScoreLabel() {
        scoreLabel?.text = String(score)
    }
    
    func updateNumberLabel() {
        prevValue = Int(numberLabel?.text ?? "0") ?? 0
        numberLabel?.text = String.randomNumber(length: 1)
    }
    
    func updateTimeLabel() {

        let min = (seconds / 60) % 60
        let sec = seconds % 60

        timeLabel?.text = String(format: "%02d", min) + ":" + String(format: "%02d", sec)
    }
    func finishGame()
    {
        timer?.invalidate()
        timer = nil
        let alert = UIAlertController(title: "Time's Up!", message: "Your time is up! You got a score of \(score) points. Awesome!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK, start new game", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
        score = 0
        seconds = 60
        updateTimeLabel()
        updateScoreLabel()
        updateNumberLabel()
        
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()

        updateScoreLabel()
        updateNumberLabel()
        updateTimeLabel()
    }
}

