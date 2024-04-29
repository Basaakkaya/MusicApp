//
//  CategoryCollectionCell.swift
//  MusicApp
//
//  Created by Başak Kaya on 16.01.2024.
//

import UIKit
import Kingfisher

class CategoryCollectionCell: UICollectionViewCell {
    
    //computed property
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = ...
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var labelView: UILabel = {
        let labelView = UILabel()
        return labelView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "Kategoriler"
        return titleLabel
    
}()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(imageView)
        contentView.addSubview(labelView)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray2.cgColor
        contentView.layer.cornerRadius = 10
        
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





