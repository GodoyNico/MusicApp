
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
        let isSearching = searchBar.text?.isEmpty == false
        let musics = isSearching ? filteredMusics : favorites

        if let index = findMusic(id: id, from: musics) {
            let indexPath = IndexPath(row: index, section: 0)
            if isSearching {
                filteredMusics.remove(at: index)
                if let favoriteIndex = findMusic(id: id, from: favorites) {
                    favorites.remove(at: favoriteIndex)
                }

            } else {
                favorites.remove(at: index)
            }

            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }

    func findMusic(id: String, from musics: [Music]) -> Int? {
        var musicIndex: Int?
        musics.enumerated().forEach { index, music in
            if music.id == id { musicIndex = index }
        }
        return musicIndex
    }
}
