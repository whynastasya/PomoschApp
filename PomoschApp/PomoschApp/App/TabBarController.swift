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
        wardsViewController.tabBarItem = UITabBarItem(title: "Wards", image: UIImage(systemName: "person.3"), tag: 0)

        let specialProjectsViewController = SpecialProjectsViewController()
        specialProjectsViewController.tabBarItem = UITabBarItem(title: "Projects", image: UIImage(systemName: "star"), tag: 1)

        viewControllers = [wardsViewController, specialProjectsViewController]
    }
}
