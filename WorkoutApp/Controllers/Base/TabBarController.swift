//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Andrey Bezrukov on 25.06.2023.
//

import UIKit

enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.barTintColor = .active
        tabBar.barTintColor = .inactive
        tabBar.backgroundColor = .white
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1))
        lineView.backgroundColor = UIColor.separator
        tabBar.insertSubview(lineView, at: 0)
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverViewController()
        let sessionController = SessionController()
        let progressController = ProgressController()
        let settingsController = SettingsController()
        
        let overviewNavigation = NavBarController(rootViewController: overviewController)
        let sessionNavigation = NavBarController(rootViewController: sessionController)
        let progressNavigation = NavBarController(rootViewController: progressController)
        let settingsNavigation = NavBarController(rootViewController: settingsController)
        
        overviewNavigation.tabBarItem = UITabBarItem(title: Resouces.String.TabBar.overview,
                                                     image: Resouces.Images.TabBar.overview,
                                                     tag: Tabs.overview.rawValue)
        sessionNavigation.tabBarItem = UITabBarItem(title: Resouces.String.TabBar.session,
                                                     image: Resouces.Images.TabBar.session,
                                                     tag: Tabs.session.rawValue)
        progressNavigation.tabBarItem = UITabBarItem(title: Resouces.String.TabBar.progress,
                                                     image: Resouces.Images.TabBar.progress,
                                                     tag: Tabs.progress.rawValue)
        settingsNavigation.tabBarItem = UITabBarItem(title: Resouces.String.TabBar.settings,
                                                     image: Resouces.Images.TabBar.settings,
                                                     tag: Tabs.settings.rawValue)
        
        setViewControllers([
            overviewNavigation,
            sessionNavigation,
            progressNavigation,
            settingsNavigation
        ], animated: false)
    }
}
