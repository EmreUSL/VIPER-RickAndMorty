//
//  Router.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import Foundation

enum Router {
    
    case getCharacters
    case getCharacter(id: Int)
    
    var scheme: String {
        switch self {
            
        case .getCharacters, .getCharacter:
            return "https"
        }
    }
    
    var host: String {
        switch self {
            
        case .getCharacters, .getCharacter:
            return "rickandmortyapi.com"
        }
    }
    
    var path: String {
        switch self {
            
        case .getCharacters:
            return "/api/character"
        case .getCharacter(id: let id):
            return "/api/character/\(id)"
        }
    }
    
    var method: String {
        switch self {
            
        case .getCharacters, .getCharacter:
            return "GET"
        }
    }
}
