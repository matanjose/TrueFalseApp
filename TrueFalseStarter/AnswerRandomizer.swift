//
//  AnswerRandomizer.swift
//  TrueFalseStarter
//
//  Created by Jose Portuondo-Dember on 4/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit
struct Question {
    let prompt: String
    let correctAnswer: String
    let falseAnswer1: String
    let falseAnswer2: String
    let falseAnswer3: String
    
    ///Randomizes the order of the answers returned, 
    ///so player doesn't memorize the order
    func randomize() -> [String] {
        let fullArray: [String] = [correctAnswer, falseAnswer1, falseAnswer2, falseAnswer3]
        var initialArray: [String] = fullArray
        var randomArray: [String] = []
        var maxBound = initialArray.count
        
        for answer in initialArray {
            var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: maxBound)
            randomArray.append(initialArray[randomNumber])
            initialArray.remove(at: randomNumber)
            maxBound -= 1
        }
        randomArray.insert(prompt, at: 0)
        return randomArray
    }
}

let judaismDefinition = Question(prompt: "Judaism is...", correctAnswer: "Awesome", falseAnswer1: "Boring", falseAnswer2: "Essentially Christianity, just without Jesus", falseAnswer3: "moribund")
let yomKippur = Question(prompt: "The holiest day in the Jewish year is..." , correctAnswer: "Yom Kippur", falseAnswer1: "Sukkot", falseAnswer2: "Tuesday", falseAnswer3: "The Fourth of July")
let dairyAndMeat = Question(prompt: "Which combination of food types is not kosher?", correctAnswer: "Meat and Dairy", falseAnswer1: "Fish and Dairy", falseAnswer2: "Meat and Vegetables", falseAnswer3: "Fruit and Vegetables")




