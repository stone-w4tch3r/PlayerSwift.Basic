import UIKit

class ImagesViewController : UIViewController{

    let mainImageView = UIImageView()
    let segmentControl = UISegmentedControl(items: ["1", "2", "3"])
    let animatedImageView = UIImageView()
    
    let images = [
        UIImage(named: "image-1")!,
        UIImage(named: "image-2")!,
        UIImage(named: "image-3")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstraints()
        
        setupAnimatedImageView()
        setupMainImageView()
        setupSegmentControl()
    }

    func setupConstraints() {
        view.addSubview(animatedImageView)
        view.addSubview(mainImageView)
        view.addSubview(segmentControl)

        animatedImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false

        animatedImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        animatedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animatedImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        animatedImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentControl.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 20).isActive = true
        segmentControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupAnimatedImageView() {
        animatedImageView.contentMode = .scaleAspectFit
        animatedImageView.animationImages = images
        animatedImageView.animationDuration = 2
        animatedImageView.startAnimating()
    }
    
    func setupMainImageView() {
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.image = images[0]
    }
    
    func setupSegmentControl() {
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func segmentControlValueChanged(_ sender: UISegmentedControl) {
        if sender == segmentControl {
            mainImageView.image = images[sender.selectedSegmentIndex]
        }
    }
}
