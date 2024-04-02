//
//  AlbümViewController.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import Foundation
import UIKit

class ArtistsViewController: UIViewController {
    
    private let cellId = "cellId"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArtistsCollectionCell.self, forCellWithReuseIdentifier: cellId)
        return collectionView
        
    }()
    
    
    var genreId: Int?
    
    var artistsResponseModel: ArtistsResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        let viewModel = ArtistsViewModel()
        viewModel.getArtistsData(genreId: genreId) { responseModel in
            print(responseModel)
            self.artistsResponseModel = responseModel
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } onError: { error in
            
        }
        
    }
}
    
extension ArtistsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistsResponseModel?.artistsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? ArtistsCollectionCell {
            cell.backgroundColor = .clear
            if let imageUrl = artistsResponseModel?.artistsList?[indexPath.row].picture {
                let url = URL(string: imageUrl)
                cell.imageView.kf.setImage(with: url)
            }
            if let name = artistsResponseModel?.artistsList?[indexPath.row].name {
                cell.labelView.text = name
            }
        }
        return cell
    }
}

extension ArtistsViewController: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let artistDetailViewController = ArtistDetailViewController()
            artistDetailViewController.artistId = artistsResponseModel?.artistsList?[indexPath.row].id
            navigationController?.pushViewController(artistDetailViewController, animated: true)
        }
            
            
}

extension ArtistsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/2) - 2, height: view.frame.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}


