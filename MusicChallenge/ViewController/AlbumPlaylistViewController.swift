
import UIKit

class AlbumPlaylistViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumCreator: UILabel!
    @IBOutlet weak var countSongs: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoButton: UIBarButtonItem!
    
    //MARK: - Properties
    var musicService: MusicService?
    var musicCollection: MusicCollection?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: musicCollection!.id)
        albumTitle.text = musicCollection?.title
        albumCreator.text = musicCollection?.mainPerson
        countSongs.text = "\(String(musicCollection!.musics.count)) songs"
    
        if let date = musicCollection?.referenceDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM-dd-yyyy"
            releaseLabel.text = "Released \(dateFormatter.string(from: date))"
        }
        
        if musicCollection?.type.rawValue == "playlist" {
            infoButton.isEnabled = false
        }
        
        setupTableView()
    }

    @IBAction func openDetail(_ sender: Any) {
        performSegue(withIdentifier: "InfoViewControllerSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController,
           let controller = nav.children.first as? InfoViewController,
           let collection = musicCollection {
            controller.musicCollection = collection
        }
    }

    func setupTableView() {
        tableView.dataSource = self
    }
}

// MARK: - DataSource
extension AlbumPlaylistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        musicCollection?.musics.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "music-cell", for: indexPath) as? AlbumPlaylistTableViewCell else {
            return UITableViewCell()
        }
        let music = musicCollection?.musics[indexPath.row]
        cell.service = musicService
        cell.setupCell(selectedMusic: music)
        return cell
    }
}
