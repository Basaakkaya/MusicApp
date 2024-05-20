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
        collectionView.contentInset = UIEdgeInsets(top: 10, left: viewModel.leftRightContentInset, bottom: 10, right: viewModel.leftRightContentInset)
        return collectionView
        
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    
    let viewModel = ArtistsViewModel()
    
    var genreId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        viewModel.getArtistsData(genreId: genreId) {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } onError: { error in
            
        }
        navigationItem.titleView = titleLabel
        
    }
    
    private func setupCell(cell: UICollectionViewCell, at indexPath: IndexPath) {
        if let cell = cell as? ArtistsCollectionCell {
            cell.backgroundColor = .clear
            if let imageUrl = viewModel.getArtistsPicture(row: indexPath.row) {
                let url = URL(string: imageUrl)
                cell.imageView.kf.setImage(with: url)
            }
            
            if let name = viewModel.getArtistsItem(row: indexPath.row) {
                cell.labelView.text = name
            }
        }
    }
}
    
extension ArtistsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        setupCell(cell: cell, at: indexPath)
        return cell
    }
}

extension ArtistsViewController: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let artistDetailViewController = ArtistDetailViewController()
            artistDetailViewController.artistId = viewModel.artistsResponseModel?.artistsList?[indexPath.row].id
            let genreName = viewModel.artistsResponseModel?.artistsList?[indexPath.row].name
            artistDetailViewController.titleLabel.text = genreName
            
            navigationController?.pushViewController(artistDetailViewController, animated: true)
        }
}

extension ArtistsViewController: UICollectionViewDelegateFlowLayout {
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


