//
//  MainTabBarController.swift
//  Campit
//
//  Created by Erik on 19.09.2023.
//

import UIKit

enum Tabs: Int {
    case all
    case today
    case settings
}

final class MainTabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.backgroundColor = Resources.Colors.primary
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = UIColor.clear
        
        let allController = AllViewController()
        let todayController = TodayController()
        let settingsController = SettingsController()
        
        allController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.all, image: UIImage(systemName: "square.grid.3x3"), selectedImage: UIImage(systemName: "square.grid.3x3.fill"))
        todayController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.today, image: UIImage(systemName: "square"), selectedImage: UIImage(systemName: "square.fill"))
        settingsController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.settings, image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        
        setViewControllers([allController, todayController, settingsController], animated: true)
    }
    
}
