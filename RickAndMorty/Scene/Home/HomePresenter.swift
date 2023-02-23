//
//  HomePresenter.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func viewDidLoad()
    var numberOfItems: Int { get }
    func characters(_ index: Int) -> Character?
    func navigate(_ model: Character)
}

final class HomePresenter {
    
    unowned var view: HomeViewProtocol!
    let router: HomeRouterProtocol!
    let interactor: HomeInteractorProtocol!
    
    private var characters: [Character] = []
  
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
        view.setupSpinner()
        view.stopSpinner()
        fetchData()
    }
    
    private func fetchData() {
        interactor.fetchCharacters()
    }
    
    var numberOfItems: Int {
        return characters.count
    }
    
    func characters(_ index: Int) -> Character? {
        return characters[index]
    }
    
    func navigate(_ model: Character) {
        router.navigate(model: model)
    }

}

extension HomePresenter: HomeInteractorOutputProtocol {
    func fetchCharactersOutput(result: CharactersResult) {
        switch result {
            
        case .success(let result):
            characters = result.results
            view.reloadUI()
        case .failure(let error):
            print(error)
        }
    }
    
    
}
