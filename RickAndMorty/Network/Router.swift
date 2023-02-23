//
//  Router.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import Foundation

enum Router {
    
    case getCharacters
    
    var scheme: String {
        switch self {
            
        case .getCharacters:
            return "https"
        }
    }
    
    var host: String {
        switch self {
            
        case .getCharacters:
            return "rickandmortyapi.com"
        }
    }
    
    var path: String {
        switch self {
            
        case .getCharacters:
            return "/api/character"
        }
    }
    
    var method: String {
        switch self {
            
        case .getCharacters:
            return "GET"
        }
    }
}
