//
//  MainInteractor.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    func fetchCharacters()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func fetchCharactersOutput(result: CharactersResult)
}


final class HomeInteractor {
    var output: HomeInteractorOutputProtocol?
}

typealias CharactersResult = Result<GetAllCharactersResponse, Error>

extension HomeInteractor: HomeInteractorProtocol {
    func fetchCharacters() {
        Service.request(router: Router.getCharacters,
                        type: GetAllCharactersResponse.self) {  [weak self] result in
            guard let self = self else { return }
            self.output?.fetchCharactersOutput(result: result)
        }
    }
    
}

