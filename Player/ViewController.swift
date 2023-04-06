import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    let mySwitch = UISwitch()
    
    let someLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 10
        button.setTitle("yo mom gay", for: .highlighted)
        
        someLabel.text = "text"
        someLabel.center = view.center
                    
        mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
        mySwitch.tintColor = UIColor.cyan
        mySwitch.onTintColor = UIColor.black
        mySwitch.thumbTintColor = UIColor.green
        mySwitch.addTarget(self, action: #selector(onSwitchChanged(sw:)), for: .valueChanged)
        
        self.view.addSubview(mySwitch)
        self.view.addSubview(someLabel)
    }
    
    @objc func onSwitchChanged(sw: UISwitch){
        someLabel.text = String(sw.isOn)
    }

    @IBAction func btnClick(_ sender: Any) {
        let text = mySwitch.isOn ? "on" : "off"
        
        let alert = UIAlertController(title: "hello", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "no", style: .default))
        
        self.present(alert, animated: true)
    }
}

