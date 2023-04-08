import UIKit
import AVFoundation

class PlayerViewController : UIViewController{
    
    @IBOutlet weak var PlayButton: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = loadTrackFromAsset()
                .flatMapSafe(initPlayer)
    }

    func loadTrackFromAsset() -> Data? {
        guard let asset = NSDataAsset(name: "dick-tajik") else {
            return nil
        }
        return asset.data
    }
    
    func initPlayer(trackData: Data) -> AVAudioPlayer? {
        do {
            return try AVAudioPlayer(data: trackData)
        } catch {
            return nil
        }
    }

//    @IBAction func onPlayClick(_ sender: Any) {
//    }
    @IBAction func onPlayClick(_ sender: Any){
        if player == nil{
            return
        }
        
        if let playing = player?.isPlaying, playing {
            PlayButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            player?.pause()
        } else {
            PlayButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            player?.play()
        }
    }
}

extension Optional {
    @inlinable public func flatMapSafe<U>(_ transform: (Wrapped) -> U?) -> U? {
        guard let value = self else {
            return nil
        }
        return transform(value)
    }
}
