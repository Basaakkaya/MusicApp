//
//  NetworkManager.swift
//  MusicApp
//
//  Created by Başak Kaya on 27.11.2023.
//

import Foundation

class NetworkManager {
    func fetchData(url: String, onSuccess: @escaping(Data) -> Void, onError: @escaping(String) -> Void) {
        
        let url = URL(string: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                onError(error!.localizedDescription)
            } else {
                // 2.
                if data != nil {
                    do {
                        //ASYNC
                        DispatchQueue.main.async {
                            onSuccess(data!)
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
