//
//  GameSession.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 10.02.2022.
//

import Foundation

class GameSession {
    weak var delegate: GameSessionDelegate?
    var questions: [Question]
    var showedQuestionIndex: Int
    
    init(questions: [Question]) {
        self.questions = questions
        self.showedQuestionIndex = 0
    }
    
    func startGame() {
        showQuestion(index: 0)
    }
    
    func showQuestion(index: Int) {
        let question = questions[index]
        delegate?.showQuestion(question: question)
        showedQuestionIndex = index
    }
    
    func handleAnswer(answer: String) {
        let question = questions[showedQuestionIndex]
        if answer == question.correctAnswer {
            showNextQuestion()
        } else {
            delegate?.didEndGame(withResult: showedQuestionIndex, win: false)
        }
    }
    
    func showNextQuestion() {
        //todo check finished or not
        showedQuestionIndex = showedQuestionIndex + 1
        showQuestion(index: showedQuestionIndex)
    }
    
    func answer1Chosen() {
        handleAnswer(answer: questions[showedQuestionIndex].answer1)
    }
    
    func answer2Chosen() {
        handleAnswer(answer: questions[showedQuestionIndex].answer2)
    }
    
    func answer3Chosen() {
        handleAnswer(answer: questions[showedQuestionIndex].answer3)
    }
    
    func answer4Chosen() {
        handleAnswer(answer: questions[showedQuestionIndex].answer4)
    }
}

protocol GameSessionDelegate: AnyObject {
    
    func didEndGame(withResult result: Int, win: Bool)
    
    func showQuestion(question: Question)
    
}
