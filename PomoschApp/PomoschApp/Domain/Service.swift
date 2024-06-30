//
//  Service.swift
//  PomoschApp
//
//  Created by nastasya on 29.06.2024.
//

import Foundation
import Apollo
import PomoschAPI

class Service {
    static let shared = Service()
    let apollo: ApolloClient
    
    private init() {
        let url = URL(string: "https://api.pomosch.app/graphql")!
        apollo = ApolloClient(url: url)
    }
    
    func getSpecialProjects(completion: @escaping ([SpecialProject]) -> Void) {
        apollo.fetch(query: GetPublishedSpecialProjectsQuery()) { result in
            switch result {
                case .success(let response):
                    var specialProjects: [SpecialProject] = []
                    if let nodes = response.data?.specialProjects?.nodes {
                        for project in nodes {
                            let title = project.title
                            let imageUrls = project.images.map { $0.url }
                            let specialProject = SpecialProject(title: title, imagesURL: imageUrls)
                            specialProjects.append(specialProject)
                        }
                        completion(specialProjects)
                    } else {
                        print("No special projects found")
                        completion(specialProjects)
                    }
                case .failure(let error):
                    print("Error fetching special projects: \(error)")
                    completion([])
            }
        }
    }
    
    func getWards(completion: @escaping ([Ward]) -> Void) {
        apollo.fetch(query: GetPublishedWardsQuery()) { result in
            switch result {
                case .success(let response):
                    var wards: [Ward] = []
                    if let nodes = response.data?.wards?.nodes {
                        for ward in nodes {
                            let fullName = ward.publicInformation.name.fullName
                            let photoUrl = ward.publicInformation.photo.url
                            let wardObject = Ward(fullName: fullName, photoURL: photoUrl)
                            wards.append(wardObject)
                        }
                        completion(wards)
                    } else {
                        print("No wards found")
                        completion(wards)
                    }
                case .failure(let error):
                    print("Error fetching wards: \(error)")
                    completion([])
            }
        }
    }
}

