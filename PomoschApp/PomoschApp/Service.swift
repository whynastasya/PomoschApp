//
//  Service.swift
//  PomoschApp
//
//  Created by nastasya on 29.06.2024.
//

import Foundation
import Apollo
import PomoschAPI

class Network {
    static let shared = Network()
    let apollo: ApolloClient
    
    private init() {
        let url = URL(string: "https://api.pomosch.app/graphql")!
        apollo = ApolloClient(url: url)
    }
    
    func fetchWards() {
        Network.shared.apollo.fetch(query: GetPublishedWardsQuery()) { result in
            switch result {
            case .success(let response):
                if let nodes = response.data?.wards?.nodes {
                    for ward in nodes {
                        let publicInformation = ward.publicInformation
                        let name = publicInformation.name.fullName
                        let photoUrl = publicInformation.photo.url
                        print("Name: \(name), Photo URL: \(photoUrl)")
                    }
                } else {
                    print("No wards found")
                }
            case .failure(let error):
                print("Error fetching wards: \(error)")
            }
        }
    }


    
}

