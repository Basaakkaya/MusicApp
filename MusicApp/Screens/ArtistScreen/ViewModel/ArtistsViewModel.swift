//
//  ArtistViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import Foundation

class ArtistsViewModel {
    var artistsResponseModel: ArtistsResponseModel?
    
    func getArtistsData(genreId: Int?, onSuccess: @escaping() -> Void, onError: @escaping(String) -> Void) {
        guard let genreId else { return }
        let networkManager = NetworkManager()
        networkManager.fetchData(url: "https://api.deezer.com/genre/\(genreId)/artists") { data in
           guard let artistsResponseModel = try? JSONDecoder().decode(ArtistsResponseModel.self, from: data) else {
               return }
            self.artistsResponseModel = artistsResponseModel
            onSuccess()
        } onError: { error in
            onError(error)
        }
    }
    
    func getArtistsPicture(row: Int) -> String? {
        let artistsItem = artistsResponseModel?.artistsList?[row]
        return artistsItem?.picture
    }
    
    func getArtistsItem(row: Int) -> String? {
        let artistsItem = artistsResponseModel?.artistsList?[row]
        return artistsItem?.name
    }
    
    var numberOfItems: Int {
        artistsResponseModel?.artistsList?.count ?? 0
    }
    
    func sizeForItemAt(width: CGFloat) -> CGSize {
        let width = (width - minimumInteritemSpacingForSection-2*leftRightContentInset)/2
        return CGSize(width: width, height: width)
    }
    
    var minimumInteritemSpacingForSection: CGFloat {
        20
    }
    
    var minimumLineSpacingForSection: CGFloat {
        20
    }
    
    var leftRightContentInset: CGFloat {
        10
    }
}
