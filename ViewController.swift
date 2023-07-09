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
    var userElement = ""
    var computerElement = ""
    var result = ""
    
    var pScore = 0
    var cScore = 0
    
   
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var computerScore: UILabel!
    @IBAction func rockClick(_ sender: Any) {
        userElement = MovementElement.rock.rawValue
        computerElement = computerPlay()
        
        result = play(userElement, computerElement).rawValue
        print(userElement + computerElement + result)
    }
    
    @IBAction func scissorsClick(_ sender: Any) {
        userElement = MovementElement.scissors.rawValue
        computerElement = computerPlay()
        
        result = play(userElement, computerElement).rawValue
        print(userElement + computerElement + result)
    }
    @IBAction func playButton(_ sender: Any) {
    }
    @IBAction func paperClick(_ sender: Any) {
         userElement = MovementElement.paper.rawValue
        computerElement = computerPlay()

        result = play(userElement, computerElement).rawValue
        print(userElement + computerElement + result)
    }
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        playerScore.text = "Your Score: \(pScore)"
        computerScore.text = "Computer Score: \(cScore)"
        // Do any additional setup after loading the view.
      
    }
    @IBAction func start(_ sender: Any) {
           playerScore.text = "Your Score: 0"
           computerScore.text = "Computer Score: 0"
           pScore = 0
           cScore = 0
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if(segue.identifier == "rockToResult"){
            let destinationViewController = segue.destination as! SecondScreenViewController
            destinationViewController.computerElement = computerElement
            destinationViewController.userElement = userElement
            destinationViewController.result = result
        }
        if(segue.identifier == "paperToResult"){
            let destinationViewController = segue.destination as! SecondScreenViewController
            destinationViewController.computerElement = computerElement
            destinationViewController.userElement = userElement
            destinationViewController.result = result
        }
        if(segue.identifier == "scisssorsToResult"){
            let destinationViewController = segue.destination as! SecondScreenViewController
            destinationViewController.computerElement = computerElement
            destinationViewController.userElement = userElement
            destinationViewController.result = result
        }
        
    }
    
}

