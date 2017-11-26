//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startOver()
    }
    
    // need this to be able to resize subviews at startup of app
    override func viewDidLayoutSubviews() {
        
        // resize the progressBar view
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)

    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        nextQuestion()
        
    }
    
    
    func updateUI() {
        
        // update the score
        scoreLabel.text = String(format: "Score: %03d", score)
        
        // if we have not wrapped
        if questionNumber < allQuestions.list.count{
            
            // update to the appropriate question
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            // update the progress display
            progressLabel.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
            
            //update the progress bar width
            progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
            //print("\(progressBar.frame.size.width)")
        }
        
    }
    

    func nextQuestion() {
        
        questionNumber += 1

        updateUI()

        if questionNumber >= allQuestions.list.count {

            if #available(iOS 8.0, *) {
                // create an alert styled controller
                let alert = UIAlertController(title: "Awesome", message: "You've finished with the questions, do you want to start over?", preferredStyle: .alert)
                
                // create actions with handlers
                let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (action) in
                    
                    // reset the quiz  to the beginning
                    self.startOver()
                })
                
                //add any actions to the alert
                alert.addAction(restartAction)
                
                // show the alert
                present(alert, animated: true, completion: {() in
                    //print("it happened")
                })
                
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            //print("you got it!")
            score += 1
        }
        else {
            //print("wrong!")
        }
    }
    

    func startOver() {
        
        //reset score and question to display
        score = 0
        questionNumber = 0
        
        // redraw the UI
        updateUI()
    }
    
}
