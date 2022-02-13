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
        var selectedSegmentIndex = 0
        if Game.instance.shuffleQuestions {
            selectedSegmentIndex = 1
        }
        orderSegment.selectedSegmentIndex = selectedSegmentIndex
    }
    
    @IBAction func okPressed(_ sender: Any) {
        var selectedSegmentIndex = orderSegment.selectedSegmentIndex
        var shuffle = false
        if selectedSegmentIndex == 1 {
            shuffle = true
        }
        Game.instance.shuffleQuestions = shuffle
        dismiss(animated: true)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
