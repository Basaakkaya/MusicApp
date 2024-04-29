//
//  AlbumViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import Foundation

 class AlbumViewModel {
    
  //   var albumList: [Album]?
     var tracklist: [TracksDatum]?
     
     func getAlbumDetail(albumId: Int?, onSuccess: @escaping() -> Void, onError: @escaping(String) -> Void) {
         guard let albumId else { return }
         let networkManager = NetworkManager()
         networkManager.fetchData(url: "https://api.deezer.com/album/\(albumId)") { data in
             let albumDetail = try? JSONDecoder().decode(AlbumResponseModel.self, from: data)
             self.tracklist = albumDetail?.tracks?.data
             print(self.tracklist)
             onSuccess()
         } onError: { error in
             onError(error)
         }
     }
     
     var numberOfItems: Int {
         return tracklist?.count ?? 0
     }
     
     func sizeForItemAt(widht: CGFloat) -> CGSize {
         let fwidth = (widht - 5)
         return CGSize(width: fwidth, height: 100)
     }
     
     var minimumInteritemSpacingForSection: CGFloat {
         5
     }
     
     var minimumLineSpacingForSection: CGFloat {
         5
     }
 }
