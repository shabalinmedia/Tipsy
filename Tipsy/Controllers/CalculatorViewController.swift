
import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var splitNumber = 2
    var totalMoney = ""
    var result = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        billTextField.endEditing(true)
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
    }
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        
        totalMoney = billTextField.text ?? "Error"
        let totalMoneyDouble = Double(totalMoney) ?? 0.0
        
        result = (totalMoneyDouble + totalMoneyDouble * tip) / Double(splitNumber)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.resultToShow = String(result)
            destinationVC.reportToShow = "Split between \(String(splitNumber)) people, with \(String(tip * 100))% tip."
        }
    }
    
}

