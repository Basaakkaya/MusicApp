//
//  ArtistDetailViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 12.02.2024.
//

import Foundation

class ArtistDetailViewModel {
    private(set) var artistDetailResponseModel: ArtistDetailResponseModel?
    private(set) var albumList: [Album]?
    
    func getArtistDetail(artistId: Int?, onSuccess: @escaping() -> Void, onError: @escaping(String) -> Void) {
        guard let artistId else { return }
        let networkManager = NetworkManager()
        networkManager.fetchData(url: "https://api.deezer.com/artist/\(artistId)") { data in
            self.artistDetailResponseModel = try? JSONDecoder().decode(ArtistDetailResponseModel.self, from: data)
            onSuccess()
        } onError: { error in
            onError(error)
        }
    }
    
    func getArtistDetailTracklist(onSuccess: @escaping() -> Void, onError: @escaping(String) -> Void) {
        guard let artistId = artistDetailResponseModel?.id else { return }
        let networkManager = NetworkManager()
        networkManager.fetchData(url: "https://api.deezer.com/artist/\(artistId)/top?limit=50") { data in
            let artistDetailTracklistResponseModel = try? JSONDecoder().decode(ArtistDetailTracklistResponseModel.self, from: data)
            guard let artistDetailTracklistResponseModel else { return }
            self.albumList = artistDetailTracklistResponseModel.data?.compactMap({$0.album})
            onSuccess()
        } onError: { error in
            onError(error)
        }
    }
    
    func getArtistPicture(row: Int) -> String? {
        let pictureUrlStr = artistDetailResponseModel?.pictureXl
        return pictureUrlStr
    }
    
    func getArtistItem(row: Int) -> String? {
        let artistItem = artistDetailResponseModel?.name
        return artistItem!
    }
    
    func getAlbumId(row: Int) -> Int? {
        let albumId = albumList?[row].id
        return albumId
    }
    
    var numberOfItems: Int {
        return albumList?.count ?? 0
    }
    
    func sizeForItemAt(width: CGFloat) -> CGSize {
        let width = (width - minimumInteritemSpacingForSection)/2
        return CGSize(width: width, height: width)
    }
    
    var minimumInteritemSpacingForSection: CGFloat {
        5
    }
    
    var minimumLineSpacingForSection: CGFloat {
        5
    }
}
