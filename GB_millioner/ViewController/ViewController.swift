//
//  ViewController.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 10.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playButtonPressed(_ sender: Any) {
        var questionOrderStrategy: QuestionOrderStrategy = QuestionOrderedStrategy()
        if Game.instance.shuffleQuestions {
            questionOrderStrategy = QuestionShuffledStrategy()
        }
        let questions = questionOrderStrategy.prepareQuestions(questions: DataUtil().getQuestions())
        Game.instance.gameSession = GameSession(questions: questions)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let gameVC = storyBoard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.present(gameVC, animated: true, completion: nil)
    }
    
}

