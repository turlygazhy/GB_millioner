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
        let questionOrderStrategy: QuestionOrderStrategy = Game.instance.questionOrder.getStrategy()
        let questions = questionOrderStrategy.prepareQuestions(questions: DataUtil().getQuestions())
        Game.instance.gameSession = GameSession(questions: questions)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let gameVC = storyBoard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        Game.instance.gameSession?.showedQuestionIndex.addObserver(gameVC, options: [ObservableOptions.initial, .new, .old]) { value, prev in
            gameVC.updateGameProgressLabel(questionIndex: value)
            
        }
        
        self.present(gameVC, animated: true, completion: nil)
    }
    
}

