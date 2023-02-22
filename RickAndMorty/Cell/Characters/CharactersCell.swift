//
//  CharactersCell.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import UIKit
import Kingfisher

protocol CharactersCellProtocol: AnyObject {
    func setImageURL(_ image: String)
    func setName(_ name: String)
    func setStatus(_ status: Status)
}

final class CharactersCell: UICollectionViewCell {
    
    var cellPresenter: CharactersCellPresenterProtocol! {
        didSet {
            cellPresenter.load()
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18,
                                 weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16,
                                 weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let cellIdentifier = "CharactersCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),
            
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    
}

extension CharactersCell: CharactersCellProtocol {
    func setImageURL(_ image: String) {
        let url = URL(string: image)
        imageView.kf.setImage(with: url)
    }
    
    func setName(_ name: String) {
        nameLabel.text = name
    }
    
    func setStatus(_ status: Status) {
        statusLabel.text = status.rawValue
    }
    
    
}
