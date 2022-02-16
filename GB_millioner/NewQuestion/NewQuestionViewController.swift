//
//  NewQuestionViewController.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 13.02.2022.
//

import UIKit

class NewQuestionViewController: UIViewController {

    //todo every field should be mandatory
    @IBOutlet weak var questionInput: UITextField!
    @IBOutlet weak var correctAnswerInput: UITextField!
    @IBOutlet weak var answerInput1: UITextField!
    @IBOutlet weak var answerInput2: UITextField!
    @IBOutlet weak var answerInput3: UITextField!
    @IBOutlet weak var answerInput4: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func okPressed(_ sender: Any) {
        //todo check that correct answer exist in answers
        let question = questionInput.text
        let correctAnswer = correctAnswerInput.text
        let answer1 = answerInput1.text
        let answer2 = answerInput2.text
        let answer3 = answerInput3.text
        let answer4 = answerInput4.text
        let questionObject = Question(question: question!, answer1: answer1!, answer2: answer2!, answer3: answer3!, answer4: answer4!, correctAnswer: correctAnswer!)
        QuestionCaretaker().saveQuestion(question: questionObject)
        dismiss(animated: true)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}
