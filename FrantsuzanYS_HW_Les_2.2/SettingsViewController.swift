//
//  ViewController.swift
//  FrantsuzanYS_HW_Les_2.2
//
//  Created by emmisar on 10.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var startScreenColor: UIColor!
    var delegate: StartViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.hidesBackButton = true
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil
                , queue: nil) { _ in
                    self.view.frame.origin.y = -100
                }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil
                , queue: nil) { _ in
                    self.view.frame.origin.y = 0
                }
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        colorView.backgroundColor = startScreenColor
        
        setSlidersValues()
        setLabelsText()
        setTextFields()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let startVC = segue.destination as? StartViewController else {return}
        
        startVC.startScreenColor = colorView.backgroundColor
    }
    
    @IBAction func colorSliderAction(_ sender: UISlider) {
        
        let sliderValue = round(sender.value * 100) / 100
        
        switch sender {
        case redSlider:
            redValueLabel.text = String(sliderValue)
            redTextField.text = String(sliderValue)
        case greenSlider:
            greenValueLabel.text = String(sliderValue)
            greenTextField.text = String(sliderValue)
        default:
            blueValueLabel.text = String(sliderValue)
            blueTextField.text = String(sliderValue)
        }

        paintBackground()
    }
    
    @IBAction func doneAction(_ sender: Any) {
        delegate.setBackgroundColor(for: UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1))
        
        dismiss(animated: true)
    }
   
    private func paintBackground(){
       
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
        
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        greenValueLabel.text = textField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
    
    func setSlidersValues(){
        redSlider.value = Float(startScreenColor.redValue)
        redValueLabel.text = String(Float(startScreenColor.redValue))
        
        greenSlider.value = Float(startScreenColor.greenValue)
        greenValueLabel.text = String(Float(startScreenColor.greenValue))
        
        blueSlider.value = Float(startScreenColor.blueValue)
        blueValueLabel.text = String(Float(startScreenColor.blueValue))
    }
    
    func setLabelsText(){
       
        redValueLabel.text = String(round(redSlider.value * 100) / 100)
        greenValueLabel.text = String(round(greenSlider.value * 100) / 100)
        blueValueLabel.text = String(round(blueSlider.value * 100) / 100)
        
    }
    
    func setTextFields(){
       
        redTextField.text = String(round(redSlider.value * 100) / 100)
        greenTextField.text = String(round(greenSlider.value * 100) / 100)
        blueTextField.text = String(round(blueSlider.value * 100) / 100)
        
    }
}

extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
}
