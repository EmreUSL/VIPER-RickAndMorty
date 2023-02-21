//
//  Response.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

struct GetAllCharactersResponse: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
