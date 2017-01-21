import UIKit
import QuartzCore

enum Operation {
    case None, Plus, Minus, Multiply, Divide
}

class ViewController: UIViewController {
    
    @IBOutlet weak var chosenNumericalSystemLabel: UILabel!
    @IBOutlet weak var resultField: UITextField!
    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var buttonEquals: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonBIN: UIButton!
    @IBOutlet weak var buttonHEX: UIButton!
    @IBOutlet weak var buttonDEC: UIButton!

    var buttonsForActiveState = [UIButton]()
    let buttonDefaultBackgroundColor: UIColor = UIColor (red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0)
    var calculatorResult: Float = 0.0
    var isInOperationMode = false;
    var currentEnteredValue = ""
    
    var firstValue = ""
    var secondValue = ""
    
    var firstOperationMode: Operation = .None
    var secondOperationMode: Operation = .None
    
    var hasExecutedResult = false
    var selectedDefaultNumeralSystem = true
    var lastChosenNumericalSystem = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let allButtons: [UIButton] = [buttonClear, buttonEquals, button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, buttonPlus, buttonMinus, buttonMultiply, buttonDivide, buttonBIN, buttonHEX, buttonDEC]
        initButtons(buttons: allButtons)
    }
    
    func initButtons(buttons: [UIButton]) {
        let borderRadius: CGFloat = 5.0
        let borderWidth: CGFloat = 2
        let borderColor: CGColor = UIColor.black.cgColor
        
        for button in buttons {
            button.layer.cornerRadius = borderRadius
            button.layer.borderWidth = borderWidth
            button.layer.borderColor = borderColor
            button.backgroundColor = buttonDefaultBackgroundColor
        }
        
        buttonsForActiveState = [buttonBIN, buttonHEX, buttonDEC]
        
        selectActive(forButton: buttonDEC)
    }
    
    func selectActive(forButton: UIButton) {
        let activeBackgroundColor = UIColor.yellow
        
        for button in buttonsForActiveState {
            button.backgroundColor = buttonDefaultBackgroundColor
        }
        
        forButton.backgroundColor = activeBackgroundColor
        chosenNumericalSystemLabel.text = forButton.titleLabel?.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func calculateResultFor(operation: Operation, firstValue: String, secondValue: String) -> Float? {
        var result: Float? = nil
        
        switch operation {
        case .Plus:
            result = Float(firstValue)! + Float(secondValue)!
        case .Minus:
            result = Float(firstValue)! - Float(secondValue)!
        case .Multiply:
            result = Float(firstValue)! * Float(secondValue)!
        case .Divide:
            result = Float(firstValue)! / Float(secondValue)!
        case .None:
            print("Error! Cannot execute operation .None")
        }
        
        return result
    }
    
    func getOperationSymbol(operation: Operation) -> String {
        var result: String = ""
        
        switch operation {
        case .Plus:
            result = "+"
        case .Minus:
            result = "-"
        case .Multiply:
            result = "*"
        case .Divide:
            result = "/"
        case .None:
            print("Error! Invalid operation .None")
        }
        
        return result
    }
    
    func setIsInOperation(operation: Operation) {
        if !isInOperationMode {
            isInOperationMode = true
            firstOperationMode = operation
        } else {
            secondOperationMode = operation
            
            //calculate the first and second values
            calculatorResult = calculateResultFor(operation: firstOperationMode, firstValue: firstValue, secondValue: secondValue)!
            resultField.text = String(calculatorResult) + getOperationSymbol(operation: secondOperationMode)
            firstOperationMode = .None
        }
    }
    
    func clearResult() {
        resultField.text = ""
        firstOperationMode = .None
        secondOperationMode = .None
        isInOperationMode = false
        firstValue = ""
        secondValue = ""
        hasExecutedResult = false
        currentEnteredValue = ""
    }
    
    func showError () {
        let alert = UIAlertController(title: "Error!", message: "Result in text field is not valid. You should have numbers only inside it. Also it should not have floating points", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func isTextFieldIsValid() -> Bool {
        if resultField.text?.characters.count == 0 ||
        (resultField.text?.characters)!.contains(".") ||
        (resultField.text?.characters)!.contains("+") ||
        (resultField.text?.characters)!.contains("-") ||
        (resultField.text?.characters)!.contains("*") ||
        (resultField.text?.characters)!.contains("/")  {
            showError()
            return false
        }
        
        return true
    }
    
    func changeResultFieldAndSelectActive(fromClickedButton: UIButton) {
        switch fromClickedButton {
        case buttonBIN:
            if isTextFieldIsValid() {
                selectActive(forButton: fromClickedButton)
                selectedDefaultNumeralSystem = false
                //change text field text
                
                let number = Int(resultField.text!, radix: lastChosenNumericalSystem)
                resultField.text = String(number!, radix: 2)
                
                lastChosenNumericalSystem = 2

            }
        case buttonHEX:
            if isTextFieldIsValid() {
                selectActive(forButton: fromClickedButton)
                selectedDefaultNumeralSystem = false
                //change text field text
                
                let number = Int(resultField.text!, radix: lastChosenNumericalSystem)
                resultField.text = String(number!, radix: 16)
                
                lastChosenNumericalSystem = 16
            }
        case buttonDEC:
            if isTextFieldIsValid() {
                selectActive(forButton: fromClickedButton)
                selectedDefaultNumeralSystem = true
                //change text field text
                
                let number = Int(resultField.text!, radix: lastChosenNumericalSystem)
                resultField.text = String(number!, radix: 10)
                
                lastChosenNumericalSystem = 10
            }
        default:
            return
        }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        switch sender {
        case buttonBIN, buttonHEX, buttonDEC:
            changeResultFieldAndSelectActive(fromClickedButton: sender)
        case buttonClear:
            clearResult()
            
        case button0, button1, button2, button3, button4, button5, button6, button7, button8, button9:
        
            if !selectedDefaultNumeralSystem {
                selectedDefaultNumeralSystem = true
                selectActive(forButton: buttonDEC)
                resultField.text = ""
                lastChosenNumericalSystem = 10
            }
            
            if hasExecutedResult {
                clearResult()
                resultField.text = ""
                hasExecutedResult = false
            }
            
            currentEnteredValue.append((sender.titleLabel?.text)!)
            resultField.text?.append((sender.titleLabel?.text)!)
            
            if firstOperationMode != .None {
                secondValue = currentEnteredValue
            } else {
                if secondOperationMode != .None {
                    firstValue = String(calculatorResult)
                    secondValue = currentEnteredValue
                } else {
                    firstValue = currentEnteredValue
                }
            }
        case buttonPlus:
            guard resultField.text != "" else { break }
            
            if !selectedDefaultNumeralSystem {
                selectedDefaultNumeralSystem = true
                selectActive(forButton: buttonDEC)
                let number = Int(resultField.text!, radix: lastChosenNumericalSystem)
                resultField.text = String(number!, radix: 10)
                lastChosenNumericalSystem = 10
            }
            
            if resultField.text?.characters.last == "+" ||
                resultField.text?.characters.last == "-" ||
                resultField.text?.characters.last == "/" ||
                resultField.text?.characters.last == "*" {
                
                firstOperationMode = .Plus
                var resultText: String? = resultField.text
                var chars = Array((resultText?.characters)!)
                chars[(resultText?.characters.count)! - 1] = "+"
                resultField.text? = String(chars)
            } else {
                hasExecutedResult = false
                currentEnteredValue = ""
                
                resultField.text?.append("+")
                
                if firstOperationMode == .None && secondOperationMode != .None {
                    firstOperationMode = secondOperationMode
                }
                
                setIsInOperation(operation: .Plus)
            }
        case buttonMinus:
            guard resultField.text != "" else { break }
            
            if !selectedDefaultNumeralSystem {
                selectedDefaultNumeralSystem = true
                selectActive(forButton: buttonDEC)
                let number = Int(resultField.text!, radix: lastChosenNumericalSystem)
                resultField.text = String(number!, radix: 10)
                lastChosenNumericalSystem = 10
            }
            
            if resultField.text?.characters.last == "+" ||
                resultField.text?.characters.last == "-" ||
                resultField.text?.characters.last == "/" ||
                resultField.text?.characters.last == "*" {
                
                firstOperationMode = .Minus
                var resultText: String? = resultField.text
                var chars = Array((resultText?.characters)!)
                chars[(resultText?.characters.count)! - 1] = "-"
                resultField.text? = String(chars)
            } else {
                hasExecutedResult = false
                currentEnteredValue = ""
                resultField.text?.append("-")
            
                if firstOperationMode == .None && secondOperationMode != .None {
                    firstOperationMode = secondOperationMode
                }
            
                setIsInOperation(operation: .Minus)
            }
        case buttonDivide:
            guard resultField.text != "" else { break }
            
            if !selectedDefaultNumeralSystem {
                selectedDefaultNumeralSystem = true
                selectActive(forButton: buttonDEC)
                let number = Int(resultField.text!, radix: lastChosenNumericalSystem)
                resultField.text = String(number!, radix: 10)
                lastChosenNumericalSystem = 10
            }
            
            if resultField.text?.characters.last == "+" ||
                resultField.text?.characters.last == "-" ||
                resultField.text?.characters.last == "/" ||
                resultField.text?.characters.last == "*" {
                
                firstOperationMode = .Divide
                var resultText: String? = resultField.text
                var chars = Array((resultText?.characters)!)
                chars[(resultText?.characters.count)! - 1] = "/"
                resultField.text? = String(chars)
            } else {
                hasExecutedResult = false
                currentEnteredValue = ""
                resultField.text?.append("/")
            
                if firstOperationMode == .None && secondOperationMode != .None {
                    firstOperationMode = secondOperationMode
                }
            
                setIsInOperation(operation: .Divide)
            }
        case buttonMultiply:
            guard resultField.text != "" else { break }
            
            if !selectedDefaultNumeralSystem {
                selectedDefaultNumeralSystem = true
                selectActive(forButton: buttonDEC)
                let number = Int(resultField.text!, radix: lastChosenNumericalSystem)
                resultField.text = String(number!, radix: 10)
                lastChosenNumericalSystem = 10
            }
            
            if resultField.text?.characters.last == "+" ||
                resultField.text?.characters.last == "-" ||
                resultField.text?.characters.last == "/" ||
                resultField.text?.characters.last == "*" {
                
                firstOperationMode = .Multiply
                var resultText: String? = resultField.text
                var chars = Array((resultText?.characters)!)
                chars[(resultText?.characters.count)! - 1] = "*"
                resultField.text? = String(chars)
            } else {
                hasExecutedResult = false
                currentEnteredValue = ""
                resultField.text?.append("*")
            
                if firstOperationMode == .None && secondOperationMode != .None {
                    firstOperationMode = secondOperationMode
                }
            
                setIsInOperation(operation: .Multiply)
            }
        case buttonEquals:
            guard secondValue != "" else { break }
            
            if firstOperationMode == .None && secondOperationMode != .None {
                firstOperationMode = secondOperationMode
            }
            
            if firstOperationMode != .None {
                calculatorResult = calculateResultFor(operation: firstOperationMode, firstValue: firstValue, secondValue: secondValue)!
                firstOperationMode = .None
                secondOperationMode = .None
                isInOperationMode = false
                
                currentEnteredValue = String(calculatorResult)
                firstValue = currentEnteredValue
                secondValue = ""
                
                hasExecutedResult = true
                
                var stringResult = String(calculatorResult)
                
                let chars = Array(stringResult.characters)
                
                if let index = chars.index(of: ".") {
                    if index != -1 && index + 2 == chars.count {
                        var result: String = ""
                        
                        for i in 0...index - 1 {
                            result.append(chars[i])
                        }
                        
                        resultField.text = result
                    } else {
                        resultField.text = stringResult
                    }
                } else {
                    resultField.text = stringResult
                }
            }
        default:
                return
        }
    }
}

