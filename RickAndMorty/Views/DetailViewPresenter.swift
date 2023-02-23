//
//  DetailPresenter.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import Foundation

protocol DetailViewPresenterProtocol: AnyObject {
    func load()
}

final class DetailViewPresenter {
    weak var view: DetailProtocol?
    
    private let character: Character
    
    init(view: DetailProtocol? = nil, character: Character) {
        self.view = view
        self.character = character
    }
}

extension DetailViewPresenter: DetailViewPresenterProtocol {
    func load() {
        view?.setName(character.name)
        view?.setStatus(character.status)
        view?.setType(character.type)
        view?.setGender(character.gender)
        view?.setOrigin(character.origin)
        view?.setSpecies(character.species)
        view?.setLocation(character.location)
    }
    
    
}
