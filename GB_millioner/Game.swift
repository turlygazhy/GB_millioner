//
//  Game.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 10.02.2022.
//

import Foundation

class Game {
    
    static let instance = Game()
    
    private var records: [Record] = []
    
    var gameSession: GameSession?
    var questionOrder = QuestionOrder.ordered
    
    private init() {}
    
    func addRecord(_ record: Record) {
        records.append(record)
        try? GameCaretaker().saveRecords(records)
    }
}
