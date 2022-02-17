//
//  QuestionOrder.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 13.02.2022.
//

import Foundation

enum QuestionOrder {
    case ordered, shuffled
    
    func getStrategy() -> QuestionOrderStrategy {
        switch self {
        case .ordered:
            return QuestionOrderedStrategy()
        case .shuffled:
            return QuestionShuffledStrategy()
        }
    }
    
    static func getSegmentIndex(questionOrder: QuestionOrder) -> Int {
        switch questionOrder {
        case .ordered:
            return 0
        case .shuffled:
            return 1
        }
    }
    
    static func getEnumByIndex(_ index: Int) -> QuestionOrder {
        switch index {
        case 1:
            return .shuffled
        default:
            return .ordered
        }
    }
}
