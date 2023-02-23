//
//  SplashPresenter.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

protocol SplashPresenterProtocol: AnyObject {
    func viewDidAppear()
}

final class SplashPresenter {
    
    unowned var view: SplashViewProtocol!
    let router: SplashRouterProtocol!
    let interactor: SplashInteractorProtocol!
    
    init(view: SplashViewProtocol!, router: SplashRouterProtocol!, interactor: SplashInteractorProtocol!) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension SplashPresenter: SplashPresenterProtocol {
    
    func viewDidAppear() {
        interactor.checkInternetConnection()
        view.animateImage()
    }
}

extension SplashPresenter: SplashInteractorOutputProtocol {
    func internetConnection(status: Bool) {
        if status {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.router.navigate()
            }
        } else {
            view.noInternetConnection()
        }
    }
    
}
