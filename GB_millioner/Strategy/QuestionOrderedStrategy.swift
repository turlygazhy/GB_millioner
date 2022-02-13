//
//  QuestionOrderedStrategy.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 13.02.2022.
//

import Foundation

class QuestionOrderedStrategy: QuestionOrderStrategy {
    func prepareQuestions(questions: [Question]) -> [Question] {
        return questions.sorted(by: {$0.question < $1.question})
    }
}
