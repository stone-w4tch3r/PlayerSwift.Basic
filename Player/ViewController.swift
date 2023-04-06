import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    let mySwitch = UISwitch()
    let someLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
    let picker = UIPickerView()
    let datePicker = UIDatePicker()
    let flyingLabel = UILabel(frame: CGRect(x: 300, y: 500, width: 50, height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(picker)
        view.addSubview(mySwitch)
        view.addSubview(someLabel)
        view.addSubview(datePicker)
        view.addSubview(flyingLabel)
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 10
        button.setTitle("yo mom gay", for: .highlighted)
        
        someLabel.text = "text"
        someLabel.center = view.center
        
        flyingLabel.text = "ifly"
                    
        mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
        mySwitch.tintColor = UIColor.cyan
        mySwitch.onTintColor = UIColor.black
        mySwitch.thumbTintColor = UIColor.green
        mySwitch.addTarget(self, action: #selector(onSwitchChanged(sw:)), for: .valueChanged)
        
        picker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        picker.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        picker.dataSource = self
        picker.delegate = self
        
        let oneYearTime = TimeInterval(integerLiteral: 365 * 24 * 60 * 60)
        let todayDate = Date()
        let oneYearBeforeToday = todayDate.addingTimeInterval(-oneYearTime)
        let oneYearAfterToday = todayDate.addingTimeInterval(oneYearTime)
        
        datePicker.datePickerMode = .date
        datePicker.minimumDate = oneYearBeforeToday
        datePicker.maximumDate = oneYearAfterToday
        datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        datePicker.addTarget(self, action: #selector(onDatePickerChanged(picker:)), for: .valueChanged)
    }
    
    @objc func onSwitchChanged(sw: UISwitch){
        someLabel.text = String(sw.isOn)
    }
    
    @objc func onDatePickerChanged(picker: UIDatePicker){
        if picker.isEqual(datePicker){
            flyingLabel.frame = flyingLabel.frame.offsetBy(dx: 0, dy: -50)
        }
        
        if picker.datePickerMode != .countDownTimer{
            picker.datePickerMode = .countDownTimer
            picker.countDownDuration = 2 * 60
        }
    }

    @IBAction func btnClick(_ sender: Any) {
        let text = mySwitch.isOn ? "on" : "off"
        
        let alert = UIAlertController(title: "hello", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "no", style: .default))
        
        self.present(alert, animated: true)
    }
}

extension ViewController : UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController : UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "row #\(row)"
    }
}
