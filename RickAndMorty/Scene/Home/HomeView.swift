//
//  HomeView.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func setTitle(_ title: String)
    func setupUI()
}

class HomeView: UIViewController {

    var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        presenter.viewDidLoad()
        
    }

}

extension HomeView: HomeViewProtocol {
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    
}
