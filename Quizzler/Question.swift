//
//  Question.swift
//  Quizzler
//
//  Created by Larry Nickerson on 11/20/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}


class myOtherClass {
    static let question : Question = Question(text: "GRC, stands for Global RallyCross?", correctAnswer: true)
    
    static func printDescription(){
        print(question)
    }
}
