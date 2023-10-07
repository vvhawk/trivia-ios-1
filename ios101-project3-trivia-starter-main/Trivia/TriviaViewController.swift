//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Vasanth Banumurthy on 10/6/23.
//

import UIKit

class TriviaViewController: UIViewController 
{
    
    // UI Outlets
    
    
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var scoreBoard: UILabel!
    
    @IBOutlet weak var artist: UIImageView!
    
    
    
    @IBOutlet weak var a: UIButton!
    @IBAction func aTap(_ sender: UIButton)
    {
        guard currentQuestionIndex < questions.count
        else { return }
        
        check(selectedIndex: sender.tag)
    }
    
    
    @IBOutlet weak var b: UIButton!
    @IBAction func bTap(_ sender: UIButton)
    {
        guard currentQuestionIndex < questions.count
        else { return }
        
        check(selectedIndex: sender.tag)
    }
    
    
    @IBOutlet weak var c: UIButton!
    @IBAction func cTap(_ sender: UIButton)
    {
        guard currentQuestionIndex < questions.count
        else { return }
        
        check(selectedIndex: sender.tag)
    }
    
    
    @IBOutlet weak var d: UIButton!
    @IBAction func dTap(_ sender: UIButton)
    {
        guard currentQuestionIndex < questions.count
        else { return }
        
        check(selectedIndex: sender.tag)
    }
    
    @IBAction func tap(_ sender: UIButton)
    {
        guard currentQuestionIndex < questions.count
        else { return }
        
        check(selectedIndex: sender.tag)
    }
    
    
    
    // Model Data
    
    var questions: [Question] = []
    var currentQuestionIndex: Int = 0
    var score: Int = 0
    
    let vintagePastelRed = UIColor(red: 255/255, green: 105/255, blue: 97/255, alpha: 1.0)
    let vintagePastelGreen = UIColor(red: 108/255, green: 152/255, blue: 124/255, alpha: 1.0)
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        questions = getQuestions()
        loadQuestion()
    }
    
    func loadQuestion()
    {
        
        
        
        
        
        guard currentQuestionIndex < questions.count
        else
        {
            // Handle end of questions, maybe present final score or transition to another screen
            scoreBoard.text = "Score: \(score)/3"
            return
        }
        
        self.a.backgroundColor = UIColor.black
        self.b.backgroundColor = UIColor.black
        self.c.backgroundColor = UIColor.black
        self.d.backgroundColor = UIColor.black
        
        let q = questions[currentQuestionIndex]
        
        // Update UI elements with question data
        artist.image = q.artistImage
        a.setTitle(q.answers[0], for: .normal)
        b.setTitle(q.answers[1], for: .normal)
        c.setTitle(q.answers[2], for: .normal)
        d.setTitle(q.answers[3], for: .normal)
        
        questionNumber.text = "\(currentQuestionIndex + 1)/3"
        scoreBoard.text = "\(score)/3"
        
    }
    
    
    func check(selectedIndex: Int)
    {
        
        guard currentQuestionIndex < questions.count
        else
        {
            // Handle end of questions, maybe present final score or transition to another screen
            scoreBoard.text = "Score: \(score)/3"
            return
        }
        
        let currentQuestion = questions[currentQuestionIndex]
        
        // Check if selected answer is correct
        if selectedIndex == currentQuestion.correctAnswerIndex
        {
            score += 1
            getButton(withTag: selectedIndex).backgroundColor = vintagePastelGreen
        }
        else
        {
            getButton(withTag: selectedIndex).backgroundColor = vintagePastelRed
        }
        
        // Move on to the next question
//        currentQuestionIndex += 1
//        loadQuestion()
//    
        self.currentQuestionIndex += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // Move on to the next question
                
                self.loadQuestion()
            }
    }
    
    func getButton(withTag tag: Int) -> UIButton {
        // Make sure to set the tag property of each button in the storyboard
        // to match the index of its corresponding answer in the answers array
        switch tag {
        case 0:
            return a
        case 1:
            return b
        case 2:
            return c
        case 3:
            return d
        default:
            fatalError("Invalid tag")
        }
    }
    
    func trophy(score: Int) {
        // Ensure you have a UIImageView outlet named 'trophyImageView'
        // @IBOutlet weak var trophyImageView: UIImageView!

        if score <= 1 {
            artist.image = UIImage(named: "bronzeTrophy")
        } else if score == 2 {
            artist.image = UIImage(named: "silverTrophy")
        } else if score >= 3 {
            artist.image = UIImage(named: "goldTrophy")
        }
    }
    
}


