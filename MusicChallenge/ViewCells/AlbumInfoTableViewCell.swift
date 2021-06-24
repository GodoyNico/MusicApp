
import UIKit

class AlbumInfoTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var nameAlbum: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var countSongsAlbum: UILabel!
    @IBOutlet weak var releaseDateAlbum: UILabel!
    @IBOutlet weak var aboutAlbum: UILabel!
    
    //MARK: - Method
    func setupCell(collection: MusicCollection?) {
        guard let model = collection else { return }
        if let image = UIImage(named: model.id) {
            albumImage.image = image
        }
        nameAlbum.text = model.title
        artistName.text = model.mainPerson
        countSongsAlbum.text = "\(String(model.musics.count)) songs"
        
        if let date = collection?.referenceDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM-dd-yyyy"
            releaseDateAlbum.text = "Released \(dateFormatter.string(from: date))"
        }
        
        aboutAlbum.text = model.albumDescription
    }
}
