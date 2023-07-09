//
//  SecondScreenViewController.swift
//  RockPaperScissors
//
//  Created by Tuba Nur  on 8.07.2023.
//

import UIKit

class SecondScreenViewController: UIViewController {
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    var user: String?
    var computer: String?
    
    var userElement: String?
    var computerElement: String?
    var result: String?
    var score: Int?
  
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var userResult: UILabel!
    @IBOutlet weak var computerClick: UILabel!
    @IBAction func btnBack(_ sender: Any) {
    }
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
              if let user, let computer, var score {
                  userLabel.text = user
                  computerLabel.text = computer
                  title = "Score: \(score)"
              }
        activityIndicatorFunc()
        // Do any additional setup after loading the view.
    }
    
    func activityIndicatorFunc() {
           activityIndicator.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(activityIndicator)
           activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ViewController" {
                   let destinationViewController = segue.destination as! ViewController
               destinationViewController.userElement = userElement!
               destinationViewController.computerElement = computerElement!
           }
       }

    

   
}
