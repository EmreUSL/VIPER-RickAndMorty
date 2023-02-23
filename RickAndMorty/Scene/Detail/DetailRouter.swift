//
//  DetailRouter.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import Foundation

protocol DetailRouterProtocol: AnyObject {

}


final class DetailRouter {
    
    weak var viewController: DetailView?
    
    static func createModule() -> DetailView {
        let view = DetailView()
        let router = DetailRouter()
        let presenter = DetailPresenter(view: view, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
}

extension DetailRouter: DetailRouterProtocol {

}
