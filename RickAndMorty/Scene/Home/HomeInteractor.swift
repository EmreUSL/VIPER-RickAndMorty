//
//  MainInteractor.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    
}

protocol HomeInteractorOutputProtocol: AnyObject {
    
}


final class HomeInteractor {
    var output: HomeInteractorOutputProtocol?
}


extension HomeInteractor: HomeInteractorProtocol {
    
}

