//
//  Location.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

struct Locations: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

