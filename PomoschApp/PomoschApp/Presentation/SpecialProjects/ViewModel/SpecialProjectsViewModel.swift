//
//  SpecialProjectsViewModel.swift
//  PomoschApp
//
//  Created by nastasya on 30.06.2024.
//

class SpecialProjectsViewModel: ISpecialProjectsViewModel {
    var specialProjects: [SpecialProject] = []
    var filteredSpecialProjects: [SpecialProject] = []
    let pageSize = 20
    var sortOrder: SortOrder = .alphabetical
    private var nextCursor: String? = nil
    private var isFetching = false
    
    func fetchSpecialProjects(completion: @escaping () -> Void) {
        guard !isFetching else { return }
        isFetching = true
        
        Service.shared.getSpecialProjects(pageSize: pageSize, after: nextCursor) { [weak self] fetchedWards, nextCursor in
            guard let self = self else { return }
            self.specialProjects.append(contentsOf: fetchedWards)
            self.filteredSpecialProjects = self.specialProjects
            self.nextCursor = nextCursor
            self.isFetching = false
            completion()
        }
    }
    
    func filterWards(by searchText: String) {
        if searchText.isEmpty {
            filteredWards = wards
        } else {
            filteredWards = wards.filter { $0.fullName.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func changeSortOrder(to newSortOrder: SortOrder) {
        sortOrder = newSortOrder
        sortWards()
    }
    
    private func sortWards() {
        switch sortOrder {
            case .alphabetical:
                wards.sort { $0.fullName < $1.fullName }
            case .random:
                wards.shuffle()
        }
        filteredWards = wards
    }
}

