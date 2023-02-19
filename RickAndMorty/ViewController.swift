//
//  ViewController.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Service.shared.getService(characterId: 1, type: GetAllCharactersResponse.self) { result in
            switch result {
            case .success(let result):
                print(result.results)
            case .failure(let error):
                print(error)
            }
        }
    
    }


}

