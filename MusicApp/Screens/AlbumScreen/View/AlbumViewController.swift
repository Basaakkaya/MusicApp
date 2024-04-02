////
////  AlbumViewController.swift
////  MusicApp
////
////  Created by Başak Kaya on 3.11.2023.
////
//
//import Foundation
//import UIKit
//
//class AlbumViewController: UIViewController {
//    
//    private let cellId = "cellId"
//    
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(AlbumCollectionCell.self, forCellWithReuseIdentifier: cellId)
//        return collectionView
//        
//    }()
//    
//    var artist_id: Int?
//    
////    var albumResponseModel: AlbumResponseModel?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(collectionView)
//        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
//    
//    let viewModel = AlbumViewModel()
//    viewModel.getAlbumData { responseModel in
//        print(responseModel)
//        self.albumResponseModel = init(artist_id: Int? = nil, albumResponseModel: AlbumResponseModel? = nil) {
//            self.artist_id = artist_id
//            self.albumResponseModel = responseModel
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }, onError: { error in
//            
//        }
//    }
//}
//
//extension AlbumViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return albumResponseModel?.albumList?.count ?? 0
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AlbumCollectionCell
//        cell.textLabel.text = albumResponseModel[indexPath.item]
//        return cell
//    }
//}
//    
//extension AlbumViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItem indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width, height: 50)
//        }
//    }
//    
//
