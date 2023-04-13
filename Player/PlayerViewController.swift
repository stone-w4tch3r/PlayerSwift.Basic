import UIKit
import AVFoundation

class PlayerViewController : UIViewController{
    
    @IBOutlet weak var PlayButton: UIButton!
    
    var player: AVAudioPlayer?

    let volumeSlider = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 31))
    let durationSlider = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 31))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(volumeSlider)
        view.addSubview(durationSlider)
        
        durationSlider.translatesAutoresizingMaskIntoConstraints = false
        
        volumeSlider.center = view.center
        durationSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        durationSlider.topAnchor.constraint(equalTo: volumeSlider.bottomAnchor, constant: 20).isActive = true
        durationSlider.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        player = loadTrackDataFromAsset()
                .flatMapSafe(initPlayerFromData)

        setupVolumeSlider()
        setupDurationSlider()
        subscribeDurationSliderToPlayer()
    }
    
    private func subscribeDurationSliderToPlayer() {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let self = self else {
                return
            }
            self.durationSlider.value = Float(self.player?.currentTime ?? 0)
        }
    }

    private func setupDurationSlider() {
        durationSlider.minimumValue = 0
        durationSlider.maximumValue = Float(player?.duration ?? 0)
        durationSlider.value = 0
        durationSlider.addTarget(self, action: #selector(durationSliderValueChanged(_:)), for: .valueChanged)
        
        durationSlider.tintColor = .red
    }
    
    @objc func durationSliderValueChanged(_ sender: UISlider) {
        if sender == durationSlider {
            let wasPlaying = player?.isPlaying ?? false
            player?.pause()
            player?.currentTime = TimeInterval(sender.value)
            if wasPlaying {
                player?.play()
            }
        }
    }

    private func setupVolumeSlider() {
        volumeSlider.minimumValue = 0
        volumeSlider.maximumValue = 1
        volumeSlider.value = 0.5
        volumeSlider.addTarget(self, action: #selector(volumeSliderValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func volumeSliderValueChanged(_ sender: UISlider) {
        if sender == volumeSlider {
            player?.volume = sender.value
        }
    }

    func loadTrackDataFromAsset() -> Data? {
        guard let asset = NSDataAsset(name: "dick-tajik") else {
            return nil
        }
        return asset.data
    }
    
    func initPlayerFromData(trackData: Data) -> AVAudioPlayer? {
        do {
            return try AVAudioPlayer(data: trackData)
        } catch {
            return nil
        }
    }
    
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
