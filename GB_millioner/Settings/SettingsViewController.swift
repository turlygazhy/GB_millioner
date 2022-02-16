//
//  SettingsViewController.swift
//  GB_millioner
//
//  Created by Ерасыл Турлыгажы on 13.02.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var orderSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderSegment.selectedSegmentIndex = QuestionOrder.getSegmentIndex(questionOrder: Game.instance.questionOrder)
    }
    
    @IBAction func okPressed(_ sender: Any) {
        Game.instance.questionOrder = QuestionOrder.getEnumByIndex(orderSegment.selectedSegmentIndex)
        dismiss(animated: true)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func removeAllUsersQuestions(_ sender: Any) {
        try? QuestionCaretaker().saveQuestions(questions: [])
        dismiss(animated: true)
    }
}
