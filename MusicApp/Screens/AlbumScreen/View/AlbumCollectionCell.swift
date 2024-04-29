//
//  AlbumViewCell.swift
//  MusicApp
//
//  Created by Başak Kaya on 12.02.2024.
//

import Foundation
import UIKit

class AlbumCollectionCell: UICollectionViewCell {
    
    lazy var textLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "1,2,3"
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.addTarget(self, action: #selector(didButtonTapped(_ :)), for: .touchUpInside)
        return likeButton
    }()
    
    @objc func didButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
       print("Tapped")
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
        contentView.addSubview(textLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(likeButton)
         
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(4)
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.bottom.lessThanOrEqualToSuperview()
            make.left.equalTo(imageView.snp.right).offset(15)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(5)
            make.left.equalTo(imageView.snp.right).offset(10)
            make.right.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.equalTo(textLabel.snp.right).offset(50)
            make.bottom.lessThanOrEqualToSuperview()
            make.right.equalToSuperview()
            make.size.equalTo(50)
        }
    }
    
    
    
    
}
