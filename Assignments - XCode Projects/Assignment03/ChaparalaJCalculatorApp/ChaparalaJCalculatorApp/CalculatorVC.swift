//
//  ViewController.swift
//  ChaparalaJCalculatorApp
//
//  Created by Chaparala,Jyothsna on 2/13/23.
//

import UIKit
import MathExpression

class CalculatorVC: UIViewController {

    // Label for displaying the values
    @IBOutlet weak var mathExpressionLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Deletes everything from the display
    @IBAction func clearExpression(_ sender: UIButton) {
        self.mathExpressionLBL.text = "0"
    }
    
    // Deletes the last typed character from the display
    @IBAction func backspace(_ sender: UIButton) {
        self.mathExpressionLBL?.text?.removeLast()
    }
    
    // If number is positive => negative and vice versa
    @IBAction func flipSign(_ sender: UIButton) {
        guard let text = self.mathExpressionLBL, let value = text.text else {
            return
        }
        var number = evaluate(exp: value)
        if(number > 0 || number < 0) {
            number = -number
        } else {
            number = 0
        }
        self.mathExpressionLBL.text = isInteger(number: number) ? "\(Int(number))" : "\(number)"
    }
    
    // Calculates the percent for a given value (divides by 100)
    @IBAction func percent(_ sender: UIButton) {
        guard let text = self.mathExpressionLBL, let value = text.text else {
            return
        }
        let number = evaluate(exp: value)/100
        self.mathExpressionLBL.text = isInteger(number: number) ? "\(Int(number))" : "\(number)"
    }
    
    // Calculates the logarithmic value
    @IBAction func naturalLog(_ sender: UIButton) {
        guard let text = self.mathExpressionLBL, let value = text.text else {
            return
        }
        let lnValue = log(evaluate(exp: value))
        self.mathExpressionLBL.text = isInteger(number: lnValue) ? "\(Int(lnValue))" : "\(lnValue)"
    }
    
    // Calculates the factorial of a number
    @IBAction func factorial(_ sender: UIButton) {
        guard let text = self.mathExpressionLBL, let value = text.text else {
            return
        }
        
        var f : Double = 1, n: Double = evaluate(exp: value)
        while(n >= 1) {
            f = f * n
            n = n - 1
        }
        self.mathExpressionLBL.text = isInteger(number: f) ? "\(Int(f))" : "\(f)"
    
    }
    
    // Calculates the 10ˣ for given x value
    @IBAction func tenPow(_ sender: UIButton) {
        guard let text = self.mathExpressionLBL, let value = text.text else {
            return
        }
        let power = pow(10, evaluate(exp: value))
        self.mathExpressionLBL.text = isInteger(number: power) ? "\(Int(power))" : "\(power)"
    }
    
    // Calculates the sin(x) for given x value in Radians
    @IBAction func calcSin(_ sender: UIButton) {
        guard let text = self.mathExpressionLBL, let value = text.text else {
            return
        }
        
        let sinResult = sin(evaluate(exp: value))
        self.mathExpressionLBL.text = isInteger(number: sinResult) ? "\(Int(sinResult))" : "\(sinResult)"
    }
    
    // Calculates the cos(x) for given x value in Radians
    @IBAction func calcCos(_ sender: UIButton) {
        guard let text = self.mathExpressionLBL, let value = text.text else {
            return
        }
        
        let cosResult = cos(evaluate(exp: value))
        self.mathExpressionLBL.text = isInteger(number: cosResult) ? "\(Int(cosResult))" : "\(cosResult)"
    }
    
    // Calculates the tan(x) for given x value in Radians
    @IBAction func calcTan(_ sender: UIButton) {
        guard let text = self.mathExpressionLBL, let value = text.text else {
            return
        }
        
        let tanResult = tan(evaluate(exp: value))
        self.mathExpressionLBL.text = isInteger(number: tanResult) ? "\(Int(tanResult))" : "\(tanResult)"
    }
    
    // Calculates the 1/x for given x value
    @IBAction func inverse(_ sender: UIButton) {
        guard let text = self.mathExpressionLBL, let value = text.text else {
            return
        }
        
        let inverseResult = (1/evaluate(exp: value))
        self.mathExpressionLBL.text = isInteger(number: inverseResult) ? "\(Int(inverseResult))" : "\(inverseResult)"
    }
    
    // Dsiplays the final result of the expression
    @IBAction func result(_ sender: UIButton) {
        guard let exp = self.mathExpressionLBL.text else {
            return
        }
        
        let mathExp = self.evaluate(exp: exp)
        self.mathExpressionLBL.text = self.isInteger(number: mathExp) ? "\(Int(mathExp))" : "\(mathExp)"
    }
    
    // Checks for the button that is tapped and adds it to the label
    @IBAction func tappedChar(_ sender: UIButton) {
        guard let ch = sender.titleLabel, let value = ch.text else {
            return
        }
        
        guard let exp = self.mathExpressionLBL.text else {
            return
        }
        
        
        if (value == "x" || value == "÷" || value == "-" || value == "+") {
            let mathExp = self.evaluate(exp: exp)
            self.mathExpressionLBL.text = self.isInteger(number: mathExp) ? "\(Int(mathExp))" : "\(mathExp)"
            var symbol = ""
            switch value {
            case "x":
                symbol = "*"
            case "÷":
                symbol = "/"
            case "-":
                symbol = "-"
            case "+":
                symbol = "+"
            default:
                symbol = ""
            }
            self.mathExpressionLBL.text! += symbol
        } else {
            if self.mathExpressionLBL.text == "0" {
                self.mathExpressionLBL.text! = value
            } else {
                self.mathExpressionLBL.text! += value
            }
        }
    }
    
    // Evaluates the mathematical expression
    private func evaluate(exp: String) -> Double {
        do {
            let mathExp = try MathExpression(exp)
            
            return mathExp.evaluate()
        } catch {
            print("Invalid Expression")
        }
        return 0.0
    }
    
    // Checks if a value is integer or not
    private func isInteger(number : Double) -> Bool {
        number.truncatingRemainder(dividingBy: 1.0).isZero
    }
    
}

