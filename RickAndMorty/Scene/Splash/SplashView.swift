//
//  SplashView.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import UIKit

protocol SplashViewProtocol: AnyObject {
    func noInternetConnection()
    func animateImage()
}

class SplashView: UIViewController {
    
    var presenter: SplashPresenterProtocol!
    
    @IBOutlet weak var splashImage: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.viewDidAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SplashView: SplashViewProtocol {
    
    func noInternetConnection() {
    }
    
    func animateImage() {
        splashImage.rotate()
    }
    
}
