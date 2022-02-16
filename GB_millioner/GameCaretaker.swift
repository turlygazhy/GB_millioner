//
//  GameCaretaker.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 11.02.2022.
//

import Foundation

typealias Momento = Data

class GameCaretaker {
    
    public enum Error: Swift.Error {
        case recordNotFound
    }
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "game"
    
    func saveRecords(_ records: [Record]) throws {
        let data: Momento = try encoder.encode(records)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadRecords() throws -> [Record] {
        guard let data = UserDefaults.standard.value(forKey: key) as? Momento,
              let records = try? decoder.decode([Record].self, from: data) else {
                  throw Error.recordNotFound
              }
        return records
    }
}
