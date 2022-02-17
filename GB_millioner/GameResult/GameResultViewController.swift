//
//  GameResultViewController.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 11.02.2022.
//

import UIKit

class GameResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var win = false
    var correctAnswersCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if win {
            resultLabel.text = "You win"
            resultLabel.textColor = .green
        } else {
            resultLabel.text = "You lose"
            resultLabel.textColor = .red
        }
        
        scoreLabel.text = "Your score is  \(correctAnswersCount.description)"
    }

}
