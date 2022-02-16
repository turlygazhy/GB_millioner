//
//  QuestionShuffledStrategy.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 13.02.2022.
//

import Foundation

class QuestionShuffledStrategy: QuestionOrderStrategy {
    func prepareQuestions(questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}
