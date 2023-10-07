//
//  Question.swift
//  Trivia
//
//  Created by Vasanth Banumurthy on 10/6/23.
//

//import Foundation
import UIKit

struct Question
{
    let artistImage: UIImage
    let answers: [String] // Represents possible answers
    let correctAnswerIndex: Int
}

func getQuestions() -> [Question] {
    
    return [
        Question(
            artistImage: UIImage(named: "beatles")!,
            answers: ["The Rolling Stones", "The Beatles", "The Beach Boys", "The Doors"],
            correctAnswerIndex: 1
        ),
        Question(
            artistImage: UIImage(named: "hole")!,
            answers: ["Hole", "Blondie", "Heart", "The Cranberries"],
            correctAnswerIndex: 0
        ),
        Question(
            artistImage: UIImage(named: "regrettes")!,
            answers: ["Skating Polly", "Beach Bunny", "The Regrettes", "Tacocat"],
            correctAnswerIndex: 2
        )
        // Add more questions as needed
    ]
    
}


