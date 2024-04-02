//
//  CategoryResponseModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 31.01.2024.
//

import Foundation


// MARK: - CategoryResponseModel
struct CategoryResponseModel: Codable {
    let categoryList: [CategoryItemModel]?
    
    enum CodingKeys: String, CodingKey {
        case categoryList = "data"
    }
}

// MARK: - Datum
struct CategoryItemModel: Codable {
    let id: Int?
    let name: String?
    let picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let type: CategoryItemType?

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case type
    }
}

enum CategoryItemType: String, Codable {
    case genre = "genre"
}
