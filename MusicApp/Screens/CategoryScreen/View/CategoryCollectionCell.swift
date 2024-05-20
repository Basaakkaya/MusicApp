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
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(imageView)
        contentView.addSubview(labelView)
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.systemGray2.cgColor
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOffset = .zero
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.left.right.equalToSuperview().inset(5)
        }
        
        labelView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(5)
        }
        
    }
    
    }





