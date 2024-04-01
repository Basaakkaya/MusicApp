//
//  CategoryViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import Foundation

class CategoryViewModel {
    var categoryResponseModel: CategoryResponseModel?
    
    
    func getCategoryData(onSuccess: @escaping() -> Void, onError: @escaping(String) -> Void) {
        let networkManager = NetworkManager()
        networkManager.fetchData(url: "https://api.deezer.com/genre") { data in
            guard let categoryResponseModel = try? JSONDecoder().decode(CategoryResponseModel.self, from: data) else { return }
            self.categoryResponseModel = categoryResponseModel
            onSuccess()
        } onError: { error in
            onError(error)
        }
    }
    
    func getCategoryPicture(row: Int) -> String? {
        let categoryItem = categoryResponseModel?.categoryList?[row]
        return categoryItem?.picture
    }
    
    func getCategoryItem(row: Int) -> String? {
        let categoryItem = categoryResponseModel?.categoryList?[row]
        return categoryItem?.name
    }
    
    var numberOfItems: Int {
        categoryResponseModel?.categoryList?.count ?? 0
    }
    
    func getdidSelectItem(row: Int) {
        let genreId = categoryResponseModel?.categoryList?[row]
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

