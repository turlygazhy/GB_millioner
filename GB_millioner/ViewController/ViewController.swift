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
        Game.instance.gameSession = GameSession(questions: DataUtil().getQuestions())
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let gameVC = storyBoard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.present(gameVC, animated: true, completion: nil)
    }
    
}

