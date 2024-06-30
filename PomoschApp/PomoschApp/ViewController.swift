//
//  ViewController.swift
//  PomoschApp
//
//  Created by nastasya on 26.06.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        Network.shared.fetchWards()
    }


}

