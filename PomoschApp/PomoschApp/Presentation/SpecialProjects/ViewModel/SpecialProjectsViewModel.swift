//
//  SpecialProjectsViewModel.swift
//  PomoschApp
//
//  Created by nastasya on 30.06.2024.
//

class SpecialProjectsViewModel: ISpecialProjectsViewModel {
    var specialProjects: [SpecialProject] = []

    func fetchSpecialProjects(completion: @escaping () -> Void) {
        Service.shared.getSpecialProjects(completion: { specialProjects in
            self.specialProjects = specialProjects
        })
    }
}
