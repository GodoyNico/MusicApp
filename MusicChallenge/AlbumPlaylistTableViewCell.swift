import UIKit

class AlbumPlaylistTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    //MARK: - Properties
    var music: Music? {
        didSet { setupCell() }
    }

    //MARK: - Method
    func setupCell() {
        guard let model = music else { return }
        musicImage.image = UIImage(named: model.id)
        musicName.text = model.title
        artistName.text = model.artist
    }
}
