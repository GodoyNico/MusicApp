//
//  DataFile.swift
//  MusicChallenge
//
//  Created by Nicolas Godoy on 18/06/21.
//

import UIKit

let url = Bundle.main.url(forResource: "data", withExtension: "json")
let data = NSData(contentsOf: url!)

struct Type: Codable {
    let type: String
    let id: String
    let title: String
    let mainPerson: String
    let referenceDate: Date
    let albumDescription: String
    let albumArtistDescription: String
    let musics: [Music]
    
    struct Music: Codable {
        let id: String
        let title: String
        let artist: String
        let length: Float //em segundos
    }
}


