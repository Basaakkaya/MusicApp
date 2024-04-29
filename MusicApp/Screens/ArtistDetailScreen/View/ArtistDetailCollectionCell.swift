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
    
    var albumNameLabelView: UILabel = {
        let labelView = UILabel()
        return labelView
    }()
    
    var dateLabelView: UILabel = {
        let labelView = UILabel()
        return labelView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        albumNameLabelView.text = nil
        
    }
    
    private func setup() {
        contentView.addSubview(imageView)
        contentView.addSubview(albumNameLabelView)
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray2.cgColor
        contentView.layer.cornerRadius = 10
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
        }
        
        albumNameLabelView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(imageView.snp.right).offset(15)
        }
        

    }
}
