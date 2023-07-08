//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Tuba Nur  on 8.07.2023.
//

import UIKit

enum MovementElement: String {
    case rock, paper, scissors
    
    static var allCases: [MovementElement] {
            return [.rock, .paper, .scissors]
        }
}

enum GameResult: String {
    case win, lose, draw
}


class ViewController: UIViewController {
    
    
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var computerScore: UILabel!
    @IBAction func rockClick(_ sender: Any) {
        var userElement = MovementElement.rock.rawValue
        var computerElement = computerPlay()
        
        var result = play(userElement, computerElement)
        print(userElement + computerElement + result.rawValue)
    }
    
    @IBAction func scissorsClick(_ sender: Any) {
        var userElement = MovementElement.scissors.rawValue
        var computerElement = computerPlay()
        
        var result = play(userElement, computerElement)
        print(userElement + computerElement + result.rawValue)
    }
    @IBAction func paperClick(_ sender: Any) {
        var userElement = MovementElement.paper.rawValue
        var computerElement = computerPlay()

        var result = play(userElement, computerElement)
        print(userElement + computerElement + result.rawValue)
    }
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func computerPlay() -> String {
        MovementElement.allCases.randomElement()?.rawValue ??  MovementElement.rock.rawValue
    }
    
    func play(_ usersChoice: String, _ computersChoice: String) -> GameResult {
        
        var gameResult = GameResult.draw
        
        
        switch (usersChoice, computersChoice) {
        case (MovementElement.rock.rawValue, MovementElement.paper.rawValue), (MovementElement.paper.rawValue, MovementElement.scissors.rawValue), (MovementElement.scissors.rawValue, MovementElement.rock.rawValue):
            score -= 1
            gameResult = GameResult.lose
        case (MovementElement.paper.rawValue, MovementElement.rock.rawValue), (MovementElement.rock.rawValue, MovementElement.scissors.rawValue), (MovementElement.scissors.rawValue, MovementElement.paper.rawValue):
            score += 1
            gameResult = GameResult.win
        default :
            gameResult = .draw
            
        }
        return gameResult
    }
    
}

