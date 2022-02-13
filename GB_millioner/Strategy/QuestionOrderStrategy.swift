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

