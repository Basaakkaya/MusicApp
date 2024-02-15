//
//  ArtistDetailViewController.swift
//  MusicApp
//
//  Created by Başak Kaya on 12.02.2024.
//

import Kingfisher
import UIKit

class ArtistDetailViewController: UIViewController {
    
    private let cellId = "cellId"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArtistDetailCollectionCell.self, forCellWithReuseIdentifier: cellId)
        return collectionView
        
    }()
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private var albumList: [Album]?
    
    var artistId: Int?
        
    private let viewModel = ArtistDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getArtistDetail()
        setup()
    }
    
    private func setup() {
        view.addSubview(imageView)
        view.addSubview(collectionView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    
    private func getArtistDetail() {
        viewModel.getArtistDetail(artistId: artistId) { artistDetailResponseModel in
            guard let pictureUrlStr = artistDetailResponseModel.pictureXl else { return }
            let url = URL(string: pictureUrlStr)
            self.imageView.kf.setImage(with: url)
            self.getArtistDetailTracklist(id: artistDetailResponseModel.id)
        } onError: { error in
            
        }
    }
    
    private func getArtistDetailTracklist(id: Int?) {
        viewModel.getArtistDetailTracklist(artistId: id) { albumList in
            self.albumList = albumList
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } onError: { error in
            
        }
    }
}


extension ArtistDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        if let cell = cell as? ArtistDetailCollectionCell {
            cell.backgroundColor = .clear
            if let imageUrl = albumList?[indexPath.row].coverXl {
                
            }
        }
        return cell
    }
    
}

extension ArtistDetailViewController: UICollectionViewDelegate {
    
}
