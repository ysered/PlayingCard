//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Yurii Serediuk on 14.10.2019.
//  Copyright © 2019 Yurii Serediuk. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    
    var description: String {
        return "\(rank)\(suit)"
    }
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
        
        static var all: [Suit] = [.spades, .hearts, .diamonds, .clubs]
        
        var description: String {
            return self.rawValue
        }
    }
    
    enum Rank: CustomStringConvertible {
        case ace
        case king
        case queen
        case jack
        case numeric(Int)

        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .jack: return 11
            case .queen: return 12
            case .king: return 13
            }
        }
        
        static var all: [Rank] {
            var allRanks: [Rank] = [.ace, .king, .queen, .jack]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            return allRanks
        }
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .king: return "K"
            case .queen: return "Q"
            case .jack: return "J"
            case .numeric(let pips): return String(pips)
            }
        }
    }
}
