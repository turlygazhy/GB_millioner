//
//  GameSession.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 10.02.2022.
//

import UIKit

class GameSession {
    weak var delegate: GameSessionDelegate?
    var questions: [Question]
    var showedQuestionIndex: Observable<Int>
    var questionsCount: Int
    
    init(questions: [Question]) {
        self.questions = questions
        self.showedQuestionIndex = Observable(0)
        self.questionsCount = questions.count
    }
    
    func startGame() {
        showQuestion(index: 0)
    }
    
    func showQuestion(index: Int) {
        let question = questions[index]
        delegate?.showQuestion(question: question)
        showedQuestionIndex.value = index
    }
    
    func handleAnswer(answer: String) {
        let question = questions[showedQuestionIndex.value]
        if answer == question.correctAnswer {
            showNextQuestion()
        } else {
            delegate?.didEndGame(withResult: showedQuestionIndex.value, win: false)
        }
    }
    
    func showNextQuestion() {
        //todo check finished or not
        showedQuestionIndex.value = showedQuestionIndex.value + 1
        showQuestion(index: showedQuestionIndex.value)
    }
    
    func answer1Chosen() {
        handleAnswer(answer: questions[showedQuestionIndex.value].answer1)
    }
    
    func answer2Chosen() {
        handleAnswer(answer: questions[showedQuestionIndex.value].answer2)
    }
    
    func answer3Chosen() {
        handleAnswer(answer: questions[showedQuestionIndex.value].answer3)
    }
    
    func answer4Chosen() {
        handleAnswer(answer: questions[showedQuestionIndex.value].answer4)
    }
}

protocol GameSessionDelegate: AnyObject {
    
    func didEndGame(withResult result: Int, win: Bool)
    
    func showQuestion(question: Question)
    
}
