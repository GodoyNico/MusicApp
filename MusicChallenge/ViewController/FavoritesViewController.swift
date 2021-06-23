////
////  FavoritesViewController.swift
////  MusicChallenge
////
////  Created by Nicolas Godoy on 22/06/21.
////
//
//import UIKit
//
//class FavoritesViewController: UIViewController {
//
//    @IBOutlet weak var tableView: UITableView!
//    var musicService: MusicService?
//    var favoriteMusics: [Music]?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        guard let musicService = try? MusicService() else {
//            self.musicService = nil
//            return
//        }
//        self.musicService = musicService
//        self.favoriteMusics = musicService.favoriteMusics
//        tableView.dataSource = self
//        navigationController?.navigationBar.prefersLargeTitles = true
//    }
//}
//
//extension FavoritesViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let count = favoriteMusics?.count else {
//            return 0
//        }
//        return count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let favoriteMusics = self.favoriteMusics, let musicService = musicService, let cell = tableView.dequeueReusableCell(withIdentifier: "music-favorite") as? FavoritesListViewController else {
//            return UITableViewCell()
//        }
//        guard let image = musicService.getCoverImage(forItemIded: favoriteMusics[indexPath.row].id) else {
//            return UITableViewCell()
//        }
//        let music = favoriteMusics[indexPath.row]
//        let isFavorite = musicService.favoriteMusics.contains(music)
//        cell.music = music
//        cell.musicService = musicService
//        cell.generate(image: image, artistName: music.artist, musicName: music.title, isFavorite: isFavorite)
//        return cell
//    }
//}
