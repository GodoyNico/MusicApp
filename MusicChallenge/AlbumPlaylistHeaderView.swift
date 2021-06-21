//
//  AlbumPlaylistHeaderView.swift
//  MusicChallenge
//
//  Created by Nicolas Godoy on 18/06/21.
//

import UIKit

class AlbumPlaylistHeaderView: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var countSongsLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    
    func setup (image: UIImage, albumTitle: String, artistName: String, songsCount: String, release: String) {
        albumImageView.image = image
        albumTitleLabel.text = albumTitle
        artistNameLabel.text = artistName
        countSongsLabel.text = songsCount
        releaseLabel.text = release
    }
}
