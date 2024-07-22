//
//  ISpecialProjectsViewModel.swift
//  PomoschApp
//
//  Created by nastasya on 30.06.2024.
//

protocol ISpecialProjectsViewModel: AnyObject {
    var specialProjects: [SpecialProject] { get set }
    func fetchNextPage(completion: @escaping () -> Void)
}
