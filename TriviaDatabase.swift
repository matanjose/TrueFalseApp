//
//  TriviaDatabase.swift
//  TrueFalseStarter
//
//  Created by Jose Portuondo-Dember on 4/14/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

// Working with info from
// https://stackoverflow.com/questions/28500278/array-of-struct-in-swift

import GameKit

struct Question {
    let prompt: String
    let correctAnswer: String
    let falseAnswer1: String
    let falseAnswer2: String
    let falseAnswer3: String
    
    
    
    /// correct answer location randomizer
    func shuffle() -> [String] {
        var unshuffledAnswers : [String] = [correctAnswer, falseAnswer1, falseAnswer2, falseAnswer3]
        var shuffledAnswers : [String] = []
        
        for answer in unshuffledAnswers {
            let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: unshuffledAnswers.count)
            shuffledAnswers.append("\(unshuffledAnswers[randomNumber])")
            unshuffledAnswers.remove(at: randomNumber)
        }
        return shuffledAnswers
    }
}

//Creating questions

let adjectiveOrder = Question(prompt: "What is the correct order for a string of adjectives before a given noun?", correctAnswer: "Opinion, size, age, shape, color, origin, material, purpose", falseAnswer1: "There is no required order", falseAnswer2: "Size, shape, origin, purpose, opinion, age, color, material", falseAnswer3: "Age, origin, opinion, shape, material, size, color, purpose")

let piraha = Question(prompt: "Which language has the fewest sounds?", correctAnswer: "Pirahã", falseAnswer1: "Hawaiian", falseAnswer2: "Japanese", falseAnswer3: "Old English")

let signLanguage = Question(prompt: "American Sign Language is most closely related to:", correctAnswer: "French Sign Language", falseAnswer1: "British Sign Language", falseAnswer2: "Nicaraguan Sign Language", falseAnswer3: "They're all the same")

let cherokee = Question(prompt: "Which indigenous North American language was the first to develop its own, original writing system?", correctAnswer: "Cherokee", falseAnswer1: "Iroquois", falseAnswer2: "Navajo", falseAnswer3: "Athabascan")

let spain = Question(prompt: "Which is not an officially recognized language in Spain?", correctAnswer: "Haketia", falseAnswer1: "Castellano", falseAnswer2: "Euskara", falseAnswer3: "Catalan")

let esperanto = Question(prompt: "Esperanto was designed...", correctAnswer: "in the hopes of ending conflict between different peoples.", falseAnswer1: "by a North African immigrant to Italy.", falseAnswer2: "by the UN to replace all natural languages", falseAnswer3: "to have at least one grammatical rule from every natural language in the world")

let masterTriviaDatabase: [Question] = [adjectiveOrder, piraha, signLanguage, cherokee, spain, esperanto]




// Question order randomizer

struct RandomDatabase {
    let database: [Question]
    
    ///Generates random number to use as index
    ///for taking items from masterTriviaDatabase
    ///in a random order, which then becomes new order
    ///for newly generated randomizedDatabase
    func generator() -> [[String]] {
        var initialDatabase = database
        var randomizedQuestionsAnswers: [[String]] = ["\(prompt)", "\(correctAnswer)"]
        for question in initialDatabase {
            let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: initialDatabase.count)
            let randomIndex = initialDatabase[randomNumber]
            
            randomizedQuestionsAnswers.append(randomIndex.shuffle())
            initialDatabase.remove(at: randomNumber)
        }
        return randomizedDatabase
    }
}

let triviaMaster = RandomDatabase(database: masterTriviaDatabase).generator()
var trivia = triviaMaster



