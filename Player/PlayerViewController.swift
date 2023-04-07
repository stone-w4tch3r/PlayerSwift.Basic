import UIKit
import AVFoundation

class PlayerViewController : UIViewController{
    
    @IBOutlet weak var PlayImage: UIImageView!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "dick-tajik", ofType: "mp3") {
            do {
                print("try")
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                PlayImage.image = UIImage(systemName: "link")
                print("success")
            } catch {
                PlayImage.image = UIImage(systemName: "globe")
                print("err")
            }
        }
        
        //create player
    }
    
}
