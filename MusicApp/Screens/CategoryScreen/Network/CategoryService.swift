//
//  CategoryService.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import Foundation
import UIKit

class CategoryService {
    func fetchMusicData(url: String, onSuccess: @escaping(Dictionary<String, Any>) -> Void, onError: @escaping(String) -> Void) {
        
        let url = URL(string: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                onError(error!.localizedDescription)
            } else {
                // 2.
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        //ASYNC
                        DispatchQueue.main.async {
                        onSuccess(jsonResponse)
                            
                        }
                        
                    } catch {
                        onError(error.localizedDescription)
                    }
                }
            }
        }
        task.resume()
    }
    
}
