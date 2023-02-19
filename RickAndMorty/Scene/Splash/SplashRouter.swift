//
//  SplashRouter.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import UIKit


protocol SplashRouterProtocol: AnyObject {
    func navigate()
}

final class SplashRouter {
    
    weak var viewController: SplashView?
    
    static func createModule() -> SplashView {
        let view = SplashView()
        let interactor = SplashInteractor()
        let router = SplashRouter()
        let presenter = SplashPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
}

extension SplashRouter: SplashRouterProtocol {
    
    func navigate() {
        guard let window = viewController?.view.window else { return }
        let homeVC = HomeRouter.createModule()
        let navigationController = UINavigationController(rootViewController: homeVC)
        window.rootViewController = navigationController
    }
    
    
}
