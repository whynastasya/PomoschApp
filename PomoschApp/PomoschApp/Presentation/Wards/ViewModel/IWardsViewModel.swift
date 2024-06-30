//
//  IWardsViewModel.swift
//  PomoschApp
//
//  Created by nastasya on 30.06.2024.
//

protocol IWardsViewModel: AnyObject {
    var wards: [Ward] { get set }
    func fetchWards(completion: @escaping () -> Void)
}
