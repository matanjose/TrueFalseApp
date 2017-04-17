//
//  recurring functions.swift
//  TrueFalseStarter
//
//  Created by Jose Portuondo-Dember on 4/17/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit



struct RandomDatabase {
    let database: [Any]
    
    ///For a given collection, returns a new collection with items
    ///in a random order
    func generator() -> [Any] {
        var initialDatabase = database
        var randomizedDatabase: [Any] = []
        for question in initialDatabase {
            let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: initialDatabase.count)
            randomizedDatabase.append(initialDatabase[randomNumber])
            initialDatabase.remove(at: randomNumber)
        }
        return randomizedDatabase
    }
    
}

struct Question {
    let prompt: String
    let correctAnswer: String
    let falseAnswer1: String
    let falseAnswer2: String
    let falseAnswer3: String
    
    func answersArray() -> [String] {
        let answersArray = [correctAnswer, falseAnswer1, falseAnswer2, falseAnswer3]
        return answersArray
    }
    
}
