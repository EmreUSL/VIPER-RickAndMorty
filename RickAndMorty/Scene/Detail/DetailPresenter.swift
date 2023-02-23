//
//  DetailPresenter.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import Foundation


protocol DetailPresenterProtocol: AnyObject {
    func viewDidLoad()
}

final class DetailPresenter {
    
    unowned var view: DetailViewProtocol!
    let router: DetailRouterProtocol!
    
    private var characterDetail: Character?
    
    init(view: DetailViewProtocol!, router: DetailRouterProtocol!) {
        self.view = view
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
   
    func viewDidLoad() {
        view.setupImage()
        view.setupLabel()
    }
    
} 

