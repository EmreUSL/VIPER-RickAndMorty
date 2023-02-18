//
//  Episode.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
