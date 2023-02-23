//
//  Detail.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import UIKit

protocol DetailProtocol: AnyObject {
    func setName(_ text: String)
    func setStatus(_ status: Status)
    func setSpecies(_ species: String)
    func setType(_ type: String?)
    func setGender(_ gender: Gender)
    func setOrigin(_ origin: Origin)
    func setLocation(_ location: Location)
}

class Detail: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var viewPresenter: DetailViewPresenterProtocol! {
        didSet {
            viewPresenter.load()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewInit() {
        let xibView = Bundle.main.loadNibNamed("Detail", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
}

extension Detail: DetailProtocol {
    func setName(_ text: String) {
        nameLabel.text = text
    }
    
    func setStatus(_ status: Status) {
        statusLabel.text = status.rawValue
    }
    
    func setSpecies(_ species: String) {
        speciesLabel.text = species
    }
    
    func setType(_ type: String?) {
        if type == "" {
            typeLabel.text = "Unknown"
        } else {
            typeLabel.text = type
        }
       
    }
    
    func setGender(_ gender: Gender) {
        genderLabel.text = gender.rawValue
    }
    
    func setOrigin(_ origin: Origin) {
        originLabel.text = origin.name
    }
    
    func setLocation(_ location: Location) {
        locationLabel.text = location.name
    }
    
    
}
