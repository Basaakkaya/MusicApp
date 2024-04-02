//
//  ArtistDetailViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 12.02.2024.
//

import Foundation

class ArtistDetailViewModel {
    
    func getArtistDetail(artistId: Int?, onSuccess: @escaping(ArtistDetailResponseModel) -> Void, onError: @escaping(String) -> Void) {
        guard let artistId else { return }
        let networkManager = NetworkManager()
        networkManager.fetchData(url: "https://api.deezer.com/artist/\(artistId)") { data in
            let artistDetailResponseModel = try? JSONDecoder().decode(ArtistDetailResponseModel.self, from: data)
            guard let artistDetailResponseModel else { return }
            onSuccess(artistDetailResponseModel)
        } onError: { error in
            onError(error)
        }
    }
    
    func getArtistDetailTracklist(artistId: Int?, onSuccess: @escaping([Album]) -> Void, onError: @escaping(String) -> Void) {
        guard let artistId else { return }
        let networkManager = NetworkManager()
        networkManager.fetchData(url: "https://api.deezer.com/artist/\(artistId)/top?limit=50") { data in
            let artistDetailTracklistResponseModel = try? JSONDecoder().decode(ArtistDetailTracklistResponseModel.self, from: data)
            guard let artistDetailTracklistResponseModel else { return }
            guard let albumList = artistDetailTracklistResponseModel.data?.compactMap({$0.album}) else { return }
            onSuccess(albumList)
        } onError: { error in
            onError(error)
        }
    }
}
