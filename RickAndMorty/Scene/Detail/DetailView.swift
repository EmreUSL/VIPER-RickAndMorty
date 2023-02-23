//
//  DetailView.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import UIKit
import Kingfisher

protocol DetailViewProtocol: AnyObject {
    func setupImage()
    func setupLabel()
}

class DetailView: UIViewController {

    var presenter: DetailPresenterProtocol!

    private var imageView: UIImageView!
    private var labelView = Detail()

    var characterDetail: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.9, green: 0.969, blue: 0.879, alpha: 1)
        presenter.viewDidLoad()
    }
    
}

extension DetailView: DetailViewProtocol {
    func setupImage() {
        imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1.5
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
        let url = URL(string: characterDetail.image)
        imageView.kf.setImage(with: url)
      

        view.addSubview(imageView)
      
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -50),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            imageView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func setupLabel() {
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.viewPresenter = DetailViewPresenter(view: labelView, character: characterDetail)
        view.addSubview(labelView)
    
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            labelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            labelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            labelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
