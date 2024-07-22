//
//  TabBarController.swift
//  PomoschApp
//
//  Created by nastasya on 30.06.2024.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let wardsViewController = WardsViewController()
        let wardsNavigationController = UINavigationController(rootViewController: wardsViewController)
        wardsNavigationController.tabBarItem = UITabBarItem(title: "Подопечные", image: UIImage(systemName: "person.3"), tag: 0)

        let specialProjectsViewController = SpecialProjectsViewController()
        let specialProjectsNavigationController = UINavigationController(rootViewController: specialProjectsViewController)
        specialProjectsNavigationController.tabBarItem = UITabBarItem(title: "Проекты", image: UIImage(systemName: "star"), tag: 1)

        viewControllers = [wardsNavigationController, specialProjectsNavigationController]
    }
}
