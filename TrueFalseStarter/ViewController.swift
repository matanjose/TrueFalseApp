//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//  Test being taken by José Portuondo-Dember


import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = masterTriviaDatabase.count
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var gameSound: SystemSoundID = 0
    
    let testQuestion = randomTriviaDatabase[0]
    

    
   
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var Answer2Button: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var Answer4Button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        func displayQuestion() {
            //Display prompt in question field
            var promptArray = testQuestion.promptArray()
            var answerArray = testQuestion.answersArray()
            var questionPrompt = promptArray[0]
            var correctAnswer = promptArray[1]
            
            questionField.text = questionPrompt
            
            //Display answers on buttons, in randomized order
            var randomAnswerArray = RandomDatabase(database: answerArray).generator()
            answer1Button.setTitle("\(randomAnswerArray[0])", for: UIControlState.normal)
            Answer2Button.setTitle("\(randomAnswerArray[1])", for: UIControlState.normal)
            Answer3.setTitle("\(randomAnswerArray[2])", for: UIControlState.normal)
            Answer4Button.setTitle("\(randomAnswevarray[3])", for: UIControlState.normal)
            
        playAgainButton.isHidden = true
    }
 
    func displayScore() {
        // Hide the answer buttons
        answer1Button.isHidden = true
        Answer2Button.isHidden = true
        Answer3.isHidden = true
        Answer4Button.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        var promptArray = testQuestion.promptArray()
        var answerArray = testQuestion.answersArray()
        var questionPrompt = promptArray[0]
        var correctAnswer = promptArray[1]
        let selectedAnswer = questionField.text
        
        if (sender === answer1Button &&  correctAnswer == questionField.text) ||
            (sender === Answer2Button &&  correctAnswer == questionField.text) ||
            (sender === Answer3 &&  correctAnswer == questionField.text) ||
            (sender === Answer4Button &&  correctAnswer == questionField.text)
        {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        randomTriviaDatabase.remove(at: 0)
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        answer1Button.isHidden = false
        Answer2Button.isHidden = false
        Answer3.isHidden = false
        Answer4Button.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

