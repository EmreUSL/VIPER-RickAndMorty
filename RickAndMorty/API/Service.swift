//
//  Service1.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

enum ServiceError: Error {
    case failedToCreateRequest
    case jsonDecodeError
}

protocol ServiceProtocol {
     func getService<T: Decodable>(characterId: Int?, type: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void)
}

final class Service: ServiceProtocol {

    static let shared = Service()
    
    private init() {}
    
   func getService<T: Decodable>(characterId: Int?, type: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void) {
        
        let urlString = getUrlString(id: characterId)
        
        guard let url = URL(string: urlString) else { return }
        
        print(url)
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data , error == nil else {
                completion(.failure(ServiceError.failedToCreateRequest))
                return }
            
            do {
                let response = try JSONDecoder().decode(type.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(ServiceError.jsonDecodeError))
            }
        }
        task.resume()
    }
    
    private func getUrlString(id: Int?) -> String {
        var urlString = "\(Constants.baseURL)/character/"
        urlString.append(contentsOf: id == nil ? "" : String(describing: id!))
        return urlString
    }
}

