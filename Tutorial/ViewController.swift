import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counter: UILabel!
    var count = 0
    
    @IBAction func increment(_ sender: Any) {
        count += 1
        
        counter.text = String(count)
        // OR
        counter.text = "\(count)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch(segue.identifier) {
        case "Screen1ToScreen2":
            let destination = segue.destination // of type UIViewController
            let castAttempt = destination as? Screen2 // make generic UIViewController to SPECIFIC Screen2
            guard let finalDestination = castAttempt else {
                NSLog("Bad segue.") // NSLog is like print but prints more accurate data like timestamp, etc.
                return
            }
            finalDestination.dataFromScreen1 = count
        default:
            NSLog("Unknown segue.")
        }
    }


}

