//
//  Difficulty.swift
//  ScribbleDash
//
//  Created by Ismael Cordón Domínguez on 24/6/26.
//

import CoreFoundation

enum Difficulty: CaseIterable {
    case beginner, challenging, master
    
    var title: String {
        switch self {
        case .beginner: return "Beginner"
        case .challenging: return "Challenging"
        case .master: return "Master"
        }
    }
    
    var imageName: String {
        switch self {
        case .beginner: return "BeginnerDifficulty"
        case .challenging: return "ChallengingDifficulty"
        case .master: return "MasterDifficulty"
        }
    }
    
    var yOffset: CGFloat {
        switch self {
        case .beginner: return 0
        case .challenging: return -20
        case .master: return 0
        }
    }
}
