//
//  ViewController.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.backgroundColor = .white
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(100)
        }
        
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func didTapButton(sender: UIButton!) {
        navigationController?.pushViewController(TabBarViewController(), animated: true)
    }

}

