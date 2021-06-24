
import UIKit

class ArtistInfoTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var aboutArtist: UILabel!
    @IBOutlet weak var artistDescription: UILabel!
    
    //MARK: - Method
    func setupCell(collection: MusicCollection?) {
        guard let model = collection else { return }
        aboutArtist.text = model.albumArtistDescription
        artistDescription.text = model.albumDescription
    }
}
