//
//  GameViewController.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 10.02.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var gameProgressLabel: UILabel!
    
    var gameSession: GameSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameSession = Game.instance.gameSession
        gameSession?.delegate = self
        
        gameSession?.startGame()
    }
    
    @IBAction func answer1Pressed(_ sender: Any) {
        gameSession?.answer1Chosen()
    }
    
    @IBAction func answer2Pressed(_ sender: Any) {
        gameSession?.answer2Chosen()
    }
    
    @IBAction func answer3Pressed(_ sender: Any) {
        gameSession?.answer3Chosen()
    }
    
    @IBAction func answer4Pressed(_ sender: Any) {
        gameSession?.answer4Chosen()
    }
    
    func updateGameProgressLabel(questionIndex: Int) {
        if gameProgressLabel == nil {
            return
        }
        gameProgressLabel.text = "Question #\(questionIndex+1) shown from \(Game.instance.gameSession!.questionsCount)"
    }
    
}

extension GameViewController: GameSessionDelegate {
    func didEndGame(withResult result: Int, win: Bool) {
        let record = Record(data: Date(), score: result)
        Game.instance.addRecord(record)
        Game.instance.gameSession = nil
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultVC = storyBoard.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
        resultVC.win = win
        resultVC.correctAnswersCount = result
        self.present(resultVC, animated: true, completion: nil)
    }
    
    func showQuestion(question: Question) {
        questionLabel.text = question.question
        answer1Button.setTitle(question.answer1, for: .normal)
        answer2Button.setTitle(question.answer2, for: .normal)
        answer3Button.setTitle(question.answer3, for: .normal)
        answer4Button.setTitle(question.answer4, for: .normal)
    }
    
}
