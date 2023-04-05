import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    let alert =
    UIAlertController(title: "hello", message: "buy me", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert.addAction(UIAlertAction(title: "no", style: .default))
    }

    @IBAction func btnClick(_ sender: Any) {
        self.present(alert, animated: true)
    }
}

