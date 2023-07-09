import UIKit

class SecondScreenViewController: UIViewController {
    
  
    var userElement: String?
    var computerElement: String?
    var result: String?
  
    @IBOutlet weak var userSelection: UILabel!
    
    @IBOutlet weak var gameResult: UILabel!
    @IBOutlet weak var computerSelection: UILabel!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        userSelection.text = userElement
        computerSelection.text = computerElement
        gameResult.text = result
    }
}
