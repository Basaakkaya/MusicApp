//
//  ArtistsCollectionCell.swift
//  MusicApp
//
//  Created by Başak Kaya on 30.01.2024.
//

import Foundation
import UIKit

class ArtistsCollectionCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var labelView: UILabel = {
        let labelView = UILabel()
        return labelView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(imageView)
        contentView.addSubview(labelView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        labelView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}


