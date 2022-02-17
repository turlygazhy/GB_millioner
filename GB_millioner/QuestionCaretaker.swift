//
//  QuestionCaretaker.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 13.02.2022.
//

import Foundation

class QuestionCaretaker {
    
    public enum Error: Swift.Error {
        case questionNotFound
    }
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "questions"
    
    func saveQuestions(questions: [Question]) throws {
        let data: Momento = try encoder.encode(questions)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func saveQuestion(question: Question) {
        var questions = try! loadQuestions()
        questions.append(question)
        try? saveQuestions(questions: questions)
    }
    
    func loadQuestions() throws -> [Question] {
        guard let data = UserDefaults.standard.value(forKey: key) as? Momento,
              let questions = try? decoder.decode([Question].self, from: data) else {
                  return []
              }
        return questions
    }
}
