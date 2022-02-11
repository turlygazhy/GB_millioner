//
//  Util.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 10.02.2022.
//

import Foundation

class DataUtil {
    
    func getQuestions() -> [Question] {
        if let fileLocation = Bundle.main.url(forResource: "questions", withExtension: "json") {
            do{
                let data = try Data(contentsOf: fileLocation)
                print(data)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Question].self, from: data)
                return dataFromJson
            } catch {
                print(error)
            }
        }
        return [Question]() //todo what should be here
    }
}
