//
//  HomeRouter.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

protocol HomeRouterProtocol: AnyObject {
    
}

final class HomeRouter {
    
    weak var viewController: HomeView?

    static func createModule() -> HomeView {
        let view = HomeView()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
}

extension HomeRouter: HomeRouterProtocol {
    
}
