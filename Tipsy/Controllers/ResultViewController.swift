
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var resultToShow: String?
    var reportToShow: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = resultToShow
        settingsLabel.text = reportToShow
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
