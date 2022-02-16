//
//  Util.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 10.02.2022.
//

import Foundation

class DataUtil {
    
    func getQuestions() -> [Question] {
        let usersQuestions = try? QuestionCaretaker().loadQuestions()
        if let fileLocation = Bundle.main.url(forResource: "questions", withExtension: "json") {
            do{
                let data = try Data(contentsOf: fileLocation)
                print(data)
                let jsonDecoder = JSONDecoder()
                var dataFromJson: [Question] = try jsonDecoder.decode([Question].self, from: data)
                dataFromJson.append(contentsOf: usersQuestions!)
                return dataFromJson
            } catch {
                print(error)
            }
        }
        return usersQuestions!
    }
}
