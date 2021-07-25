//
//  StartViewController.swift
//  FrantsuzanYS_HW_Les_2.2
//
//  Created by emmisar on 25.07.2021.
//

import UIKit
 
protocol StartViewControllerDelegate {
    func setBackgroundColor(for color: UIColor)
}

class StartViewController: UIViewController {

    var startScreenColor: UIColor!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {return}
        
        settingsVC.startScreenColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension StartViewController: StartViewControllerDelegate {
    func setBackgroundColor(for color: UIColor) {
        view.backgroundColor = color
    }
}
