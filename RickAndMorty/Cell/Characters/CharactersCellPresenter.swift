//
//  CharactersCellPresenter.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import Foundation

protocol CharactersCellPresenterProtocol: AnyObject {
    func load()
}


final class CharactersCellPresenter {
    weak var view: CharactersCellProtocol?
    
    private let characters: Character
    
    init(view: CharactersCellProtocol? = nil, characters: Character) {
        self.view = view
        self.characters = characters
    }
}

extension CharactersCellPresenter: CharactersCellPresenterProtocol {
    func load() {
        view?.setName(characters.name)
        view?.setStatus(characters.status)
        view?.setImageURL(characters.image)
    }
}
