//
//  ArtistsResponseModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 31.01.2024.
//

import Foundation

//   let artistsResponseModel = try? JSONDecoder().decode(ArtistsResponseModel.self, from: jsonData)

import Foundation

// MARK: - ArtistsResponseModel
struct ArtistsResponseModel: Codable {
    let artistsList: [ArtistsItemModel]?
    
    enum CodingKeys: String, CodingKey {
        case artistsList = "data"
    }
}

// MARK: - Datum
struct ArtistsItemModel: Codable {
    let id: Int?
    let name: String?
    let picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let radio: Bool?
    let tracklist: String?
    let type: TypeEnum?

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type
    }
}

enum TypeEnum: String, Codable {
    case artist = "artist"
}
