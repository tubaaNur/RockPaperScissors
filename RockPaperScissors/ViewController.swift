//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Tuba Nur  on 8.07.2023.
//

import UIKit




class ViewController: UIViewController {
    var userElement: String?
    var computerElement: String?
    var result: String?
    var playerScore = 0
    var computerScore = 0
   
    @IBOutlet weak var playerScoreLabel: UILabel!
    
    @IBOutlet weak var computerScoreLabel: UILabel!
   
    
    @IBAction func rockClick(_ sender: Any) {
        userElement = MovementElement.rock.rawValue
        computerElement = computerPlay()
        result = play(userElement!, computerElement!).rawValue
    }
    
    @IBAction func scissorsClick(_ sender: Any) {
        userElement = MovementElement.scissors.rawValue
        computerElement = computerPlay()
        result = play(userElement!, computerElement!).rawValue
    }
    
    @IBAction func paperClick(_ sender: Any) {
        userElement = MovementElement.paper.rawValue
        computerElement = computerPlay()
        result = play(userElement!, computerElement!).rawValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func computerPlay() -> String {
        return MovementElement.allCases.randomElement()?.rawValue ??  MovementElement.rock.rawValue
    }
    
    func play(_ usersChoice: String, _ computersChoice: String) -> GameResult {
        var gameResult : GameResult = .draw
               
            
        switch (usersChoice, computersChoice) {
        case (MovementElement.rock.rawValue, MovementElement.paper.rawValue), (MovementElement.paper.rawValue, MovementElement.scissors.rawValue), (MovementElement.scissors.rawValue, MovementElement.rock.rawValue):
            if playerScore != 0{
                playerScore -= 1
            }
            computerScore += 1
            gameResult = GameResult.lose
        case (MovementElement.paper.rawValue, MovementElement.rock.rawValue), (MovementElement.rock.rawValue, MovementElement.scissors.rawValue), (MovementElement.scissors.rawValue, MovementElement.paper.rawValue):
            if computerScore != 0{
                computerScore -= 1
            }
            playerScore += 1
            gameResult = GameResult.win
        default :
            gameResult = .draw
        }
        playerScoreLabel.text = String(playerScore)
        computerScoreLabel.text = String(computerScore)
        return gameResult
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "rockToResult"){
            let destinationViewController = segue.destination as! SecondScreenViewController
            rockClick(sender)
            destinationViewController.computerElement = computerElement
            destinationViewController.userElement = userElement
            destinationViewController.result = result
        }
        if(segue.identifier == "paperToResult"){
            let destinationViewController = segue.destination as! SecondScreenViewController
            paperClick(sender)
            destinationViewController.computerElement = computerElement
            destinationViewController.userElement = userElement
            destinationViewController.result = result
        }
        if(segue.identifier == "scissorsToResult"){
            let destinationViewController = segue.destination as! SecondScreenViewController
            scissorsClick(sender)
            destinationViewController.computerElement = computerElement
            destinationViewController.userElement = userElement
            destinationViewController.result = result
        }
    }
}

