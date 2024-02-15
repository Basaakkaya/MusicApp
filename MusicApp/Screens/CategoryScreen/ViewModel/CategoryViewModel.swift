//
//  CategoryViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import Foundation

class CategoryViewModel {
    
    func getCategoryData(onSuccess: @escaping(CategoryResponseModel) -> Void, onError: @escaping(String) -> Void) {
        let networkManager = NetworkManager()
        networkManager.fetchData(url: "https://api.deezer.com/genre") { data in
            guard let categoryResponseModel = try? JSONDecoder().decode(CategoryResponseModel.self, from: data) else { return }
            onSuccess(categoryResponseModel)
        } onError: { error in
            onError(error)
        }
    }
}
