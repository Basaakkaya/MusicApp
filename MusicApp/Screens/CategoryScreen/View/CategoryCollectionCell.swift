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
    
    required init?(coder: NSCoder) {
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


//class MyCell: UICollectionViewCell {
//    
//    
//    static let reuseIdentifier = "MyCellReuseIdentifier"
//    
//    let textLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        return label
//    }()
//    
//}
