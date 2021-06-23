import UIKit

class AlbumPlaylistViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var countSongs: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties
    var music: MusicCollection? {
        didSet { setup() }
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setup() {
        guard let model = music else { return }
        imageView.image = UIImage(named: model.album.id)
        albumTitle.text = model.title
        artistName.text = model.mainPerson
        countSongs.text = String(model.musics.count)
        releaseLabel.text = "\(model.referenceDate)"
//        albumImageView.image = image
//        albumTitleLabel.text = albumTitle
//        artistNameLabel.text = artistName
//        countSongsLabel.text = songsCount
//        releaseLabel.text = release
        tableView.reloadData()
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - DataSource
extension AlbumPlaylistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        music?.musics.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "music-cell", for: indexPath) as? AlbumPlaylistTableViewCell {
            let music = music?.musics[indexPath.row]
            cell.music = music
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - Delegate
extension AlbumPlaylistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let music = music else { return }
        let selectedMusic = music.musics[indexPath.row]
    }
}
