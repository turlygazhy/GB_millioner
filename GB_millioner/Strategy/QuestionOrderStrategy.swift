//
//  QuestionOrderStrategy.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 13.02.2022.
//

import Foundation

protocol QuestionOrderStrategy {
    func prepareQuestions(questions: [Question]) -> [Question]
}

class QuestionShuffledStrategy: QuestionOrderStrategy {
    func prepareQuestions(questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}

class QuestionOrderedStrategy: QuestionOrderStrategy {
    func prepareQuestions(questions: [Question]) -> [Question] {
        return questions.sorted(by: {$0.question < $1.question})
    }
}
