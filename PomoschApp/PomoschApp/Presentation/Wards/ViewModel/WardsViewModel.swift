//
//  WardsViewModel.swift
//  PomoschApp
//
//  Created by nastasya on 30.06.2024.
//

class WardsViewModel: IWardsViewModel {
    var wards: [Ward] = []

    func fetchWards(completion: @escaping () -> Void) {
        Service.shared.getWards(completion: { wards in
            self.wards = wards
        })
    }
}
