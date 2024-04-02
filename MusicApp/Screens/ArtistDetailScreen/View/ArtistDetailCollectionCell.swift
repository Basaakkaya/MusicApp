//
//  ArtistDetailCollectionCell.swift
//  MusicApp
//
//  Created by Başak Kaya on 13.02.2024.
//

import Foundation
import UIKit
import Kingfisher

class ArtistDetailCollectionCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var labelView: UILabel {
        let labelView = UILabel()
        return labelView
    }
    
    var collectionView: UICollectionView {
        let collectionView = UICollectionView()
        return collectionView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        
    }
}
