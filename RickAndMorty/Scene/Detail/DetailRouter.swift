//
//  DetailRouter.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import Foundation

final class DetailRouter {
    
    weak var viewController: DetailView?
    
    static func createModule() -> DetailView {
        let view = DetailView()
        let presenter = DetailPresenter(view: view)
        view.presenter = presenter
        return view
    }
}

