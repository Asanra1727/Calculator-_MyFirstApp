//
//  MyCustomViewController.swift
//  MyFirstApp
//
//  Created by Sanra Mansoor on 4/22/22.
//

import UIKit

class MyCustomViewController: UIViewController {

    
    @IBOutlet weak var calculatorProblem: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var functions:String = ""
    
    override func viewDidLoad() {

        super.viewDidLoad()
        allClear()
    }
    
    func allClear() {
        
        functions = ""
        calculatorProblem.text = ""
        calculatorResult.text = ""
    }
    
    @IBAction func allClearButton(_ sender: Any) {
        
        allClear()
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        if(!functions.isEmpty) {
            
            functions.removeLast()
            calculatorProblem.text = functions
        }
    }
    
    func addToFunctions(value: String) {
        
        functions = functions + value
        calculatorProblem.text = functions
    }
    
    @IBAction func percentageButton(_ sender: Any) {
        
        addToFunctions(value: "%")
    }
    
    @IBAction func divideButton(_ sender: Any) {
        
        addToFunctions(value: "/")
    }
    
    @IBAction func multiplicationButton(_ sender: Any) {
        
        addToFunctions(value: "*")
    }
    
    @IBAction func minusButton(_ sender: Any) {
        
        addToFunctions(value: "-")
    }
    
    @IBAction func plusButton(_ sender: Any) {
        
        addToFunctions(value: "+")
    }
    
    @IBAction func equalsButton(_ sender: Any) {
        
        if(inputvalidation()) {
        
        let percentageWorkings = functions.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: percentageWorkings)
        let workingResult = expression.expressionValue(with: nil, context: nil) as! Double
        let stringResult = resultFormat(workingResult: workingResult)
        calculatorResult.text = stringResult
        }
        
        else {
            
            let alertMessage = UIAlertController(title: "Input not recognised", message: "Unable to validate input", preferredStyle: .alert)
            
            alertMessage.addAction(UIAlertAction(title: "Alright", style: .default))
            self.present(alertMessage, animated: true, completion: nil)
        }
    }
    
    func inputvalidation() -> Bool {
        
        var count = 0
        var charIndexes = [Int]()
        
        for char in functions {
            
            if(specialisedCharacters(char: char)) {
                
                charIndexes.append(count)
            }
            
            count += 1
        }
        
        var last: Int = -1
        
        for index in charIndexes {
            
            if(index == 0) {
                
                return false
            }
            
            if(index == functions.count - 1) {
                
                return false
            }
            
            if (last != -1) {
                
                if(index - last == 1) {
                    
                    return false
                }
            }
            
            last = index
        }
        
        return true
    }
    
    func specialisedCharacters (char: Character) -> Bool {
        
        if(char == "*") {
            
            return true
        }
        
        if(char == "/") {
            
            return true
        }
        
        if(char == "+") {
            
            return true
        }
        
        return false
    }
    
    func resultFormat(workingResult: Double) -> String {
        
        if(workingResult.truncatingRemainder(dividingBy: 1) == 0) {
            
            return String(format: "%.0f", workingResult)
        }
        
        else {
            
            return String(format: "%.2f", workingResult)
        }
    }
    
    @IBAction func decimalButton(_ sender: Any) {
        
        addToFunctions(value: ".")
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        
        addToFunctions(value: "0")
    }
    
    @IBAction func oneButton(_ sender: Any) {
        
        addToFunctions(value: "1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        
        addToFunctions(value: "2")
    }
    
    @IBAction func threeButton(_ sender: Any) {
        
        addToFunctions(value: "3")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        
        addToFunctions(value: "4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        
        addToFunctions(value: "5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        
        addToFunctions(value: "6")
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        
        addToFunctions(value: "7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        
        addToFunctions(value: "8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        
        addToFunctions(value: "9")
    }
}
