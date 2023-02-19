//
//  HomeView.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    
}

class HomeView: UIViewController {

    var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }

}

extension HomeView: HomeViewProtocol {
    
}
