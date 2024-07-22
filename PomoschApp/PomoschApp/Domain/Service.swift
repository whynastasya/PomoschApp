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
    
    func getSpecialProjects(pageSize: Int, offset: String? = nil, completion: @escaping ([SpecialProject], String?) -> Void) {
        let graphQLPageSize = GraphQLNullable<Int>(integerLiteral: pageSize)
        let graphQLOffset = offset != nil ? GraphQLNullable<String>(stringLiteral: offset!): nil
        
        apollo.fetch(query: GetPublishedSpecialProjectsQuery(first: graphQLPageSize, after: graphQLOffset)) { result in
            switch result {
            case .success(let response):
                var specialProjects: [SpecialProject] = []
                var nextCursor: String? = nil
                
                if let nodes = response.data?.specialProjects?.nodes {
                    for project in nodes {
                        let title = project.title
                        let imageUrls = project.images.map { $0.url }
                        let specialProject = SpecialProject(title: title, imagesURL: imageUrls)
                        specialProjects.append(specialProject)
                    }
                }
                    
                if let pageInfo = response.data?.specialProjects?.pageInfo {
                    nextCursor = pageInfo.endCursor
                }
                
                completion(specialProjects, nextCursor)
                
            case .failure(let error):
                print("Error fetching special projects: \(error)")
                completion([], nil)
            }
        }
    }
    
    func getWards(pageSize: Int, after: String? = nil, completion: @escaping ([Ward], String?) -> Void) {
        let graphQLPageSize = GraphQLNullable<Int>(integerLiteral: pageSize)
        let graphQLAfter = after != nil ? GraphQLNullable<String>(stringLiteral: after!) : nil
        
        apollo.fetch(query: GetPublishedWardsQuery(first: graphQLPageSize, after: graphQLAfter)) { result in
            switch result {
            case .success(let response):
                var wards: [Ward] = []
                var nextCursor: String? = nil
                
                if let nodes = response.data?.wards?.nodes {
                    for ward in nodes {
                        let fullName = ward.publicInformation.name.fullName
                        let photoUrl = ward.publicInformation.photo.url
                        let wardObject = Ward(fullName: fullName, photoURL: photoUrl)
                        wards.append(wardObject)
                    }
                }
                
                if let pageInfo = response.data?.wards?.pageInfo {
                    nextCursor = pageInfo.endCursor
                    print(nextCursor)
                }
               
                
                completion(wards, nextCursor)
                
            case .failure(let error):
                print("Error fetching wards: \(error)")
                completion([], nil)
            }
        }
    }
}
