import UIKit

class LibraryViewController: UIViewController {
    
    // MARK: - Properties
    private var collection: [MusicCollection] = []
    private let cellIdentifier = "library-cell"
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    func fetchData() {
        guard let service = try? MusicService() else {
            return
        }

        collection = service.loadLibrary()
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        guard let musicService = try? MusicService() else {
//            self.collection = []
//            return
//        }
//
//        self.collection = musicService.loadLibrary()
//        self.musicService = musicService
//
//        tableView.dataSource = self
//
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if let vc = segue.destination as? AlbumPlaylistViewController, segue.identifier == "navigatePlaylistController", let musicCollection = self.currentCollection {
//                vc.album = musicCollection
//            }
//        }
//
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return collection.count
//        }

//
//        extension LibraryViewController: LibraryCellDelegate {
//        func libraryCellDidTapNext(_ musicCollection: MusicCollection) {
//            self.currentCollection = musicCollection
//            performSegue(withIdentifier: "navigatePlaylistController", sender: nil)
//        }
//        }
}

// MARK: - DataSource
extension LibraryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        collection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LibraryCell else {
            return UITableViewCell()
        }
        cell.setupCell(music: collection[indexPath.row])
        return cell
    }
}

// MARK: - Delegate
extension LibraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Prepare for segue
        // let model = collection[indexPath.row]
    }
}
