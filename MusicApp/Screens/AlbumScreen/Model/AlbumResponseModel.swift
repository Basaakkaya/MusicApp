//
//  AlbumResponseModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 12.02.2024.
//

import Foundation

// MARK: - AlbumResponseModel
struct AlbumResponseModel: Codable {
    let id: Int?
    let title, upc: String?
    let link, share, cover: String?
    let coverSmall, coverMedium, coverBig, coverXl: String?
    let md5Image: String?
    let genreID: Int?
    let genres: Genres?
    let label: String?
    let nbTracks, duration, fans: Int?
    let releaseDate, recordType: String?
    let available: Bool?
    let tracklist: String?
    let explicitLyrics: Bool?
    let explicitContentLyrics, explicitContentCover: Int?
    let contributors: [Contributor]?
    let artist: AlbumArtistElement?
    let type: String?
    let tracks: Tracks?

    enum CodingKeys: String, CodingKey {
        case id, title, upc, link, share, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case genreID = "genre_id"
        case genres, label
        case nbTracks = "nb_tracks"
        case duration, fans
        case releaseDate = "release_date"
        case recordType = "record_type"
        case available, tracklist
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case contributors, artist, type, tracks
    }
}

// MARK: - Artist
struct AlbumArtistElement: Codable {
    let id: Int?
    let name: String?
    let picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let tracklist: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case tracklist, type
    }
}

// MARK: - Genres
struct Genres: Codable {
    let data: [ArtistElement]?
}

// MARK: - ArtistElement
struct ArtistElement: Codable {
    let id: Int?
    let name: String?
    let picture: String?
    let type: String?
    let tracklist: String?
}

// MARK: - Tracks
struct Tracks: Codable {
    let data: [TracksDatum]?
}

// MARK: - TracksDatum
struct TracksDatum: Codable {
    let id: Int?
    let readable: Bool?
    let title, titleShort, titleVersion: String?
    let link: String?
    let duration, rank: Int?
    let explicitLyrics: Bool?
    let explicitContentLyrics, explicitContentCover: Int?
    let preview: String?
    let md5Image: String?
    let artist: ArtistElement?
    let album: Album?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link, duration, rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
        case md5Image = "md5_image"
        case artist, album, type
    }
}
