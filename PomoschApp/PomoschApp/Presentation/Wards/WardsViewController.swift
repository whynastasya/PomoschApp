//
//  WardsViewController.swift
//  PomoschApp
//
//  Created by nastasya on 30.06.2024.
//

import UIKit

final class WardsViewController: UIViewController {
    private let viewModel = WardsViewModel()
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wards"
        setupTableView()
        viewModel.fetchWards {
            self.tableView.reloadData()
        }
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
    }
}

extension WardsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.wards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let ward = viewModel.wards[indexPath.row]
        cell.textLabel?.text = ward.fullName
        return cell
    }
}
