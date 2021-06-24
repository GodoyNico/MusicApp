//
//  ArtistInfoTableViewCell.swift
//  MusicChallenge
//
//  Created by Nicolas Godoy on 24/06/21.
//

import UIKit

class ArtistInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var albumArtist: UILabel!
    @IBOutlet weak var artistDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
