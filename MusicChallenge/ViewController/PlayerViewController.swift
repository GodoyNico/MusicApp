//
//  PlayerViewController.swift
//  MusicChallenge
//
//  Created by Nicolas Godoy on 24/06/21.
//

import UIKit

class PlayerViewController: UIViewController {

    //MARK: - Properties
    var music: Music?
    var musicService: MusicService?
    var isPlaying = true
    var isFavorite = false
    
    //MARK: - Outlets
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var favoriteButton: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBAction func playPauseButton(_ sender: UIButton) {
        isPlaying.toggle()
        playPauseButton.setImage(UIImage(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill"), for: .normal)
    }
    
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
