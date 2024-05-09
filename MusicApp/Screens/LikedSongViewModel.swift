//
//  LikedSongViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 6.05.2024.
//

import Foundation

class LikedSongViewModel {
    
    var songNameList: [String]? {
        let list = UserDefaults.standard.array(forKey: "songNameList") as? [String]
        return list
    }
    
    var numberOfItems: Int {
        return songNameList?.count ?? 0
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
