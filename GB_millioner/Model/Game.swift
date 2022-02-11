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
    
    private init() {}
    
    func addRecord(_ record: Record) {
        records.append(record)
        try? GameCaretaker().saveRecords(records)
    }
}
