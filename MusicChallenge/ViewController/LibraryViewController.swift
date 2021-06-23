import UIKit

class LibraryViewController: UIViewController {
    
    // MARK: - Properties
    private var collection: [MusicCollection] = []
    private let cellIdentifier = "library-cell"
    private var music: MusicCollection?
    
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
        if let controller = segue.destination as? AlbumPlaylistViewController,
           let sender = sender as? MusicCollection {
            controller.music = sender
        }
    }
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
        let element = collection[indexPath.row]
        performSegue(withIdentifier: "AlbumPlaylistDetailSegue", sender: element)
    }
}
