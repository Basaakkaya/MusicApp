//
//  TabBarController.swift
//  MusicApp
//
//  Created by Başak Kaya on 17.01.2024.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let songTab = CategoryViewController()
        let likeTab = LikedSongViewController()
        
        let songTabbarItem = UITabBarItem(title: "song", image: UIImage(systemName: "music.note"), selectedImage: UIImage(named: "song.fill"))
        songTab.tabBarItem = songTabbarItem
        
        let likeTabbarItem = UITabBarItem(title: "like", image: UIImage(systemName: "heart"), selectedImage: UIImage(named: "heart.fill"))
        
        likeTab.tabBarItem = likeTabbarItem
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        
        self.viewControllers = [songTab,likeTab]
        
    }
}
