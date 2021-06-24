//
//  FavoritesListViewController.swift
//  MusicChallenge
//
//  Created by Nicolas Godoy on 23/06/21.
//

import UIKit

class FavoritesListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var service: MusicService?
    var filteredMusics: [Music] = []
    var favorites: [Music] = []

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        service = try? MusicService()
        setupSearchBar()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavorites()
    }

    func fetchFavorites() {
        guard let service = service else { return }
        favorites = service.favoriteMusics
        tableView.reloadData()
    }

    func setupSearchBar() {
        searchBar.delegate = self
    }

    func setupTableView() {
        tableView.dataSource = self
    }
}

//MARK: - DataSource
extension FavoritesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchBar.text?.isEmpty == true ? favorites.count : filteredMusics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "music-cell", for: indexPath) as? AlbumPlaylistTableViewCell else {
            return UITableViewCell()
        }
        let selectedElements = searchBar.text?.isEmpty == true ? favorites : filteredMusics
        let music = selectedElements[indexPath.row]
        cell.service = service
        cell.setupCell(selectedMusic: music)
        cell.delegate = self
        return cell
    }
}

//MARK: - Delegate
extension FavoritesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var musics: [Music] = []
        favorites.forEach {
            if $0.title.contains(searchText) {
                musics.append($0)
            }
        }
        filteredMusics = musics
        tableView.reloadData()
    }
}

//MARK: - Protocol
extension FavoritesListViewController: AlbumPlayListCellProtocol {
    func didRemoveFavoriteMusic(_ id: String) {
        var musicIndex: Int?
        favorites.enumerated().forEach { index, music in
            if music.id == id {
                musicIndex = index
            }
        }

        if let index = musicIndex {
            let indexPath = IndexPath(row: index, section: 0)
            favorites.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}
