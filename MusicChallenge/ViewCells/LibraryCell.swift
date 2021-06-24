//
//  LibraryCell.swift
//  MusicChallenge
//
//  Created by Nicolas Godoy on 22/06/21.
//

import UIKit

class LibraryCell: UITableViewCell {
    // MARK: - Properties
    var music: MusicCollection? {
        didSet { load() }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var title: UILabel!

    // MARK: - Method
    func setupCell(music: MusicCollection) {
        self.music = music
    }

    private func load() {
        title.text = music?.title
        subtitle.text = music?.mainPerson
        if let id = music?.id,
            let image = UIImage(named: id) {
            imageCell.image = image
        }
    }
}
