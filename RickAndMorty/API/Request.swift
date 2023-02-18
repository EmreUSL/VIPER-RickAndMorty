//
//  Request.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

final class Request {
  
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
   
    private let endpoint: Endpoint
    
    private let pathComponents: [String]
    
    private let queryParamters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            string += "/"
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParamters.isEmpty {
            string += "?"
            let argumentString = queryParamters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(endpoint: Endpoint,
                pathComponents: [String] = [],
                queryParamters: [URLQueryItem] = []) {
        
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParamters = queryParamters
    }
   
}

extension Request {
    static let listCharactersRequest = Request(endpoint: .character)
}
