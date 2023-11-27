//
//  CategoryViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import Foundation
import UIKit

class CategoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let categoryService = CategoryService()
        categoryService.fetchMusicData(url: "https://api.deezer.com/genre") { responseDict in
            print(responseDict)
        } onError: { error in
            
        }

    }
}
