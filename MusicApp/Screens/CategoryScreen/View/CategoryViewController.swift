//
//  CategoryViewModel.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import Foundation
import Kingfisher
import UIKit

class CategoryViewController: UIViewController {
    
    private let cellId = "cellId"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: viewModel.leftRightContentInset, bottom: 10, right: viewModel.leftRightContentInset)
        return collectionView
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.text = "Kategoriler"
        return view
    }()
    
    let viewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        viewModel.getCategoryData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } onError: { error in
            
        }
        let button = UIButton()
        button.setTitle("back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didBackButtonTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        navigationItem.titleView = titleLabel

    }
    
    @objc private func didBackButtonTapped() {
        tabBarController?.navigationController?.popViewController(animated: true)
    }
    private func setupCell(cell: UICollectionViewCell, at indexPath: IndexPath) {
        if let cell = cell as? CategoryCollectionCell {
            cell.backgroundColor = .clear
            if let imageUrl = viewModel.getCategoryPicture(row: indexPath.row) {
                let url = URL(string: imageUrl)
                cell.imageView.kf.setImage(with: url)
            }
            if let name = viewModel.getCategoryItem(row: indexPath.row) {
                cell.labelView.text = name
            }
        }
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        setupCell(cell: cell, at: indexPath)
        return cell
    }
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        
        let genreId = viewModel.categoryResponseModel?.categoryList?[indexPath.row].id
        let genreName = viewModel.categoryResponseModel?.categoryList?[indexPath.row].name
        let artistsViewController = ArtistsViewController()
        artistsViewController.genreId = genreId
        artistsViewController.titleLabel.text = genreName
        navigationController?.pushViewController(artistsViewController, animated: true)
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt(width: view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        viewModel.minimumInteritemSpacingForSection
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        viewModel.minimumLineSpacingForSection
    }
}
