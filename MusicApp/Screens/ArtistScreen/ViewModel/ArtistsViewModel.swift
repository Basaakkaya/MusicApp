//
//  ArtistViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import Foundation

class ArtistsViewModel {
    
    func getArtistsData(genreId: Int?, onSuccess: @escaping(ArtistsResponseModel) -> Void, onError: @escaping(String) -> Void) {
        guard let genreId else { return }
        let networkManager = NetworkManager()
        networkManager.fetchData(url: "https://api.deezer.com/genre/\(genreId)/artists") { data in
            let artistsResponseModel = try? JSONDecoder().decode(ArtistsResponseModel.self, from: data)
            guard let artistsResponseModel else { return }
            onSuccess(artistsResponseModel)
        } onError: { error in
            onError(error)
        }
    }
}
