//
//  HomePresenter.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
   func viewDidLoad()
}

final class HomePresenter {
    
    unowned var view: HomeViewProtocol!
    let router: HomeRouterProtocol!
    let interactor: HomeInteractorProtocol!
  
    init(view: HomeViewProtocol!, router: HomeRouterProtocol!, interactor: HomeInteractorProtocol!) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        view.setupUI()
        view.setupCollectionView()
        view.stopSpinner()
    }
    

}

extension HomePresenter: HomeInteractorOutputProtocol {
    
}
