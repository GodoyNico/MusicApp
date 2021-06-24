//
//  AlbumInfoTableViewCell.swift
//  MusicChallenge
//
//  Created by Nicolas Godoy on 24/06/21.
//

import UIKit

class AlbumInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var nameAlbum: UILabel!
    @IBOutlet weak var artistAlbum: UILabel!
    @IBOutlet weak var albumCountSongs: UILabel!
    @IBOutlet weak var albumReferenceDate: UILabel!
    @IBOutlet weak var aboutAlbum: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
