//
//  HomeView.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func setupUI()
    func setupSpinner()
    func setupCollectionView()
    func stopSpinner()
    func reloadUI()
}

class HomeView: UIViewController {

    var presenter: HomePresenterProtocol!
    
    private var spinner: UIActivityIndicatorView!
    private var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    
    func setupUI() {    
        title = "Characters"
        view.backgroundColor = UIColor(red: 0.9, green: 0.969, blue: 0.879, alpha: 1)
    }
    
    func setupSpinner() {
        spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        spinner.startAnimating()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(red: 0.9, green: 0.969, blue: 0.879, alpha: 1)
        collectionView.dataSource = self
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.register(CharactersCell.self,
                                forCellWithReuseIdentifier: CharactersCell.cellIdentifier)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func stopSpinner() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.spinner.stopAnimating()
            self.collectionView.isHidden = false
            
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        }
    }
    
    func reloadUI() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}


extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCell.cellIdentifier,
                                                      for: indexPath) as! CharactersCell
        if let characters = presenter.characters(indexPath.row) {
            cell.cellPresenter = CharactersCellPresenter(view: cell, characters: characters)
        }
        return cell
    }
    
    
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(width: width, height: width * 1.5)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let model = presenter.characters(indexPath.row) {
            presenter.navigate(model)
        }
    }
}


