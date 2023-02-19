//
//  SplashInteractor.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

protocol SplashInteractorProtocol: AnyObject {
    func checkInternetConnection()
}

protocol SplashInteractorOutputProtocol: AnyObject {
    func internetConnection(status: Bool)
}

final class SplashInteractor {
    var output: SplashInteractorOutputProtocol?
}

extension SplashInteractor: SplashInteractorProtocol {
    
    func checkInternetConnection() {
        //To Do check network
        self.output?.internetConnection(status: true)
    }
}
