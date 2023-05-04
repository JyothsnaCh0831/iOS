//
//  ViewController.swift
//  ChaparalaJEngagement03
//
//  Created by Chaparala,Jyothsna on 4/6/23.
//

import UIKit

class BMIVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var weightTF: UITextField!
    
    @IBOutlet weak var heightPicker: UIPickerView!
    
    @IBOutlet weak var messageLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.heightPicker.delegate = self
        self.heightPicker.dataSource = self
    }
    
    var feet: Double = 0
    var inch: Double = 0


    @IBAction func onCalculate(_ sender: UIButton) {
        guard let age = self.ageTF.text, let _ = Double(age) else {
            return
        }
        guard let weight = self.weightTF.text, let weightValue = Double(weight) else {
            return
        }
        
        
        self.messageLBL.text = "Your Body Mass Index is " + String(format: "%.1f", (weightValue / pow(self.feet + self.inch, 2) * 703))
    }
    
    @IBAction func onReset(_ sender: UIButton) {
        self.messageLBL.text = ""
        self.weightTF.text = ""
        self.ageTF.text = ""
        
        self.heightPicker.selectRow(0, inComponent: 0, animated: true)
        self.heightPicker.selectRow(0, inComponent: 1, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0) {
            return 13
        } else {
            return 13
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0) {
            if(row == 0) {
                return "Feet"
            } else {
                return String(row)
            }
        } else {
            if(row == 0) {
                return "Inch"
            } else {
                return String(row-1)
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0) {
            if(row != 0) {
                self.feet = Double(row) * 12
            }
        } else {
            if(row != 0) {
                self.inch = Double(row-1)
            }
        }
    }
    
}

