//
//  CategoryViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import Foundation

class CategoryViewModel {
    
    func getCategoryData(onSuccess: @escaping([String : Any]) -> Void, onError: @escaping(String) -> Void) {
        let networkManager = NetworkManager()
        networkManager.fetchData(url: "https://api.deezer.com/genre") { responseDict in
        onSuccess(responseDict)
            
        } onError: { error in
            onError(error)
        }
        
      
              
    }
    
}
