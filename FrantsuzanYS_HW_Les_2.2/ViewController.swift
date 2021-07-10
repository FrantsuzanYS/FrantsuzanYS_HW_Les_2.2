//
//  ViewController.swift
//  FrantsuzanYS_HW_Les_2.2
//
//  Created by emmisar on 10.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        paintBackground()
    }

    @IBAction func colorSliderAction(_ sender: UISlider) {
        
        let sliderValue = round(sender.value * 100) / 100
        
        switch sender {
        case redSlider:
            redValueLabel.text = String(sliderValue)
        case greenSlider:
            greenValueLabel.text = String(sliderValue)
        default:
            blueValueLabel.text = String(sliderValue)
        }

        paintBackground()
    }
    
    private func paintBackground(){
       
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),                                              green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
        
    }
}

