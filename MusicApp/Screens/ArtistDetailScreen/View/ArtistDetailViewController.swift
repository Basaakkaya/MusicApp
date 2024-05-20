//
//  ArtistDetailViewController.swift
//  MusicApp
//
//  Created by Başak Kaya on 12.02.2024.
//

import Foundation
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
        collectionView.contentInset = UIEdgeInsets(top: 10, left: viewModel.leftRightContentInset, bottom: 10, right: viewModel.leftRightContentInset)
        return collectionView
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    
    let viewModel = ArtistDetailViewModel()

    var artistId: Int?
            
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getArtistDetail()
        view.addSubview(imageView)
        view.addSubview(collectionView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        navigationItem.titleView = titleLabel
    }
    
    private func setupCell(cell: UICollectionViewCell, at indexPath: IndexPath) {
        if let cell = cell as? ArtistDetailCollectionCell {
            cell.backgroundColor = .clear
            if let imageUrl = viewModel.albumList?[indexPath.row].coverSmall {
                let url = URL(string: imageUrl)
                cell.imageView.kf.setImage(with: url)
            }
            
            if let name = viewModel.albumList?[indexPath.row].title {
                cell.albumNameLabelView.text = name
            }
            
        }
    }
    
    private func getArtistDetail() {
        viewModel.getArtistDetail(artistId: artistId) {
            self.getArtistDetailTracklist()
        } onError: { error in
            
        }
    }
    
    private func getArtistDetailTracklist() {
        viewModel.getArtistDetailTracklist() {
            DispatchQueue.main.async {
                if let imageUrlString = self.viewModel.artistDetailResponseModel?.pictureMedium {
                    let imageUrl = URL(string: imageUrlString)
                    self.imageView.kf.setImage(with: imageUrl)
                }
                self.collectionView.reloadData()
            }
        } onError: { error in
            
        }
    }
}


extension ArtistDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        setupCell(cell: cell, at: indexPath)
        return cell
    }
}

extension ArtistDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let albumViewController = AlbumViewController()
        let genreName = viewModel.albumList?[indexPath.row].title
        albumViewController.albumId = viewModel.albumList?[indexPath.row].id
        albumViewController.albumImage = viewModel.albumList?[indexPath.row].coverSmall
        albumViewController.title = genreName
        
        navigationController?.pushViewController(albumViewController, animated: true)
    }
}

extension ArtistDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.sizeForItemAt(width: view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        viewModel.minimumInteritemSpacingForSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        viewModel.minimumLineSpacingForSection
    }
}
