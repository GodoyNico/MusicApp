
import UIKit

class InfoViewController: UIViewController {

    //MARK: - Properties
    var musicCollection: MusicCollection?
    var musicService: MusicService?
    let cellAlbum = "album-Info-Cell"
    let cellArtist = "artist-Info-Cell"
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func doneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
    }
}
    
    //MARK: - DataSource
extension InfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        musicCollection != nil ? 2 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "album-Info-Cell") as? AlbumInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setupCell(collection: musicCollection)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "artist-Info-Cell") as? ArtistInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.setupCell(collection: musicCollection)
            return cell
        }
    }
}
