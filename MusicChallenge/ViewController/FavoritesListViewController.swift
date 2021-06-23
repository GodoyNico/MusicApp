////
////  FavoritesListViewController.swift
////  MusicChallenge
////
////  Created by Nicolas Godoy on 18/06/21.
////
//
//import UIKit
//
//class FavoritesListViewController: UIViewController {
//
//    @IBOutlet weak var musicImageView: UIImageView!
//    @IBOutlet weak var musicLabel: UILabel!
//    @IBOutlet weak var artistNameLabel: UILabel!
//    @IBOutlet weak var favoriteButton: UIButton!
//
//    var music: Music?
//    var musicService: MusicService?
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    func generate(image: UIImage, artistName: String, musicName: String, isFavorite: Bool) {
//        musicImageView.image = image
//        musicLabel.text = musicName
//        artistNameLabel.text = artistName
//        favoriteButton.setImage(isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"), for: .normal)
//        favoriteButton.tintColor = isFavorite ? .systemRed : .systemGray
//    }
//    @IBAction func likeMusic(_ sender: Any) {
//        guard let musicService = musicService, let music = music else {
//            return
//        }
//        var isFavorite = musicService.favoriteMusics.contains(music)
//        musicService.toggleFavorite(music: music, isFavorite: isFavorite)
//        isFavorite = !isFavorite
//        favoriteButton.setImage (isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"), for: .normal)
//        favoriteButton.tintColor = isFavorite ? .systemRed : .systemGray
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//}
