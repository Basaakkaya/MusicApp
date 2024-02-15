//
//  ArtistDetailResponseModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 12.02.2024.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let artistDetailResponseModel = try? JSONDecoder().decode(ArtistDetailResponseModel.self, from: jsonData)

import Foundation

// MARK: - ArtistDetailResponseModel
struct ArtistDetailResponseModel: Codable {
    let id: Int?
    let name: String?
    let link, share, picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let nbAlbum, nbFan: Int?
    let radio: Bool?
    let tracklist: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case nbAlbum = "nb_album"
        case nbFan = "nb_fan"
        case radio, tracklist, type
    }
}
