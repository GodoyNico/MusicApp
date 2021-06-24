
import UIKit

protocol AlbumPlayListCellProtocol: AnyObject {
    func didRemoveFavoriteMusic(_ id: String)
}

class AlbumPlaylistTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var artistName: UILabel!
    
    //MARK: - Properties
    weak var delegate: AlbumPlayListCellProtocol?
    var music: Music?
    var service: MusicService?

    @IBAction func favoriteMusic(_ sender: UIButton) {
        guard let service = service, let music = music else { return }
        var favorited = isFavorited()
        if favorited { delegate?.didRemoveFavoriteMusic(music.id) }
        favorited.toggle()
        service.toggleFavorite(music: music, isFavorite: favorited)
        favoriteButtonStyle()
        
    }

    func isFavorited() -> Bool {
        guard let service = service, let music = music else { return false }
        return service.favoriteMusics.contains(music)
    }

    func favoriteButtonStyle() {
        if isFavorited() {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tintColor = .red
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor = .black
        }
    }

    //MARK: - Method
    func setupCell(selectedMusic: Music?) {
        guard let music = selectedMusic else { return }
        musicImage.image = UIImage(named: music.id)
        musicName.text = music.title
        artistName.text = music.artist
        self.music = music
        favoriteButtonStyle()
    }
}
