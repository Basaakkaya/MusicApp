////
////  AlbumViewController.swift
////  MusicApp
////
////  Created by Başak Kaya on 3.11.2023.
//

import Foundation
import UIKit
import Kingfisher

class AlbumViewController: UIViewController {
    
    private let cellId = "cellId"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AlbumCollectionCell.self, forCellWithReuseIdentifier: cellId)
        return collectionView
        
    }()
    
    let viewModel = AlbumViewModel()
    
    var albumId: Int?
    var albumImage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        getAlbumDetail()
        
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
    }
    
    private func setupCell(cell: UICollectionViewCell, at indexPath: IndexPath) {
        if let cell = cell as? AlbumCollectionCell {
            cell.backgroundColor = .clear
            let track = viewModel.tracklist?[indexPath.row]
            if let albumImage {
                let url = URL(string: albumImage)
                cell.imageView.kf.setImage(with: url)
            }
            cell.textLabel.text = track?.title
        }
    
    }
    
    private func getAlbumDetail() {
        viewModel.getAlbumDetail(albumId: albumId) {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } onError: { error in
            
        }
    }
    
}

extension AlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            viewModel.numberOfItems
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            setupCell(cell: cell, at: indexPath)
            return cell
        }
        
    }
    
    extension AlbumViewController: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        }
        
    }
    
    extension AlbumViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            viewModel.sizeForItemAt(widht: view.frame.width)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            viewModel.minimumInteritemSpacingForSection
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            viewModel.minimumLineSpacingForSection
        }
    }
    
    
    
    
