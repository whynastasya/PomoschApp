//
//  WardsViewController.swift
//  PomoschApp
//
//  Created by nastasya on 30.06.2024.
//

import UIKit

final class WardsViewController: UIViewController {
    
    private let viewModel = WardsViewModel()
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 300)
        return layout
    }()
    private let searchController = UISearchController(searchResultsController: nil)
    private var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupConstraints()
        setupNavigationBar()
        fetchData()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Подопечные"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Поиск"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let sortButton = UIBarButtonItem(title: "Сортировка", style: .plain, target: self, action: #selector(showSortOptions))
        navigationItem.rightBarButtonItem = sortButton
    }
    
    private func fetchData() {
        isLoading = true
        
        viewModel.fetchWards { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                let startIndex = self.viewModel.wards.count - self.viewModel.pageSize
                let endIndex = self.viewModel.wards.count
                let indexPaths = (startIndex..<endIndex).map { IndexPath(item: $0, section: 0) }
                self.collectionView.performBatchUpdates({
                    self.collectionView.insertItems(at: indexPaths)
                }, completion: { _ in
                    self.isLoading = false
                })
            }
        }
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray6
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.identifier)
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func updateCollectionViewWithAnimation() {
        collectionView.performBatchUpdates({
            collectionView.reloadSections(IndexSet(integer: 0))
        }, completion: { _ in
            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        })
    }
    
    @objc private func showSortOptions() {
        let alert = UIAlertController(title: "Сортировка", message: "Выберите порядок сортировки", preferredStyle: .actionSheet)
        
        let alphabeticalAction = UIAlertAction(title: "По алфавиту", style: .default) { _ in
            self.viewModel.changeSortOrder(to: .alphabetical)
            self.updateCollectionViewWithAnimation()
        }
        
        let randomAction = UIAlertAction(title: "Случайно", style: .default) { _ in
            self.viewModel.changeSortOrder(to: .random)
            self.updateCollectionViewWithAnimation()
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(alphabeticalAction)
        alert.addAction(randomAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

extension WardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.wards.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as? ItemCell
        let ward = viewModel.filteredWards[indexPath.item]
        cell?.configure(with: ward)
        return cell ?? UICollectionViewCell()
    }
}

extension WardsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.wards.count - 5 && !isLoading {
            fetchData()
        }
    }
}

extension WardsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        viewModel.filterWards(by: searchText)
        collectionView.reloadData()
    }
}
