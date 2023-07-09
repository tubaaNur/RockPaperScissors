//
//  MovementElement.swift
//  RockPaperScissors
//
//  Created by Tuba Nur  on 9.07.2023.
//

import Foundation
enum MovementElement: String {
    case rock, paper, scissors
    
    static var allCases: [MovementElement] {
        return [.rock, .paper, .scissors]
    }
    
}
