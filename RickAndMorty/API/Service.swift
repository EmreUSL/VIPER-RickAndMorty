//
//  Service.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import Foundation

enum ServiceError: Error {
    case failedToCreateRequest
    case failedToGetData
    case jsonDecodeError
}

final class Service {
    
    static let shared = Service()
    
    private init() {}
    
    public func execute<T: Codable>(_ request: Request, type: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void) {
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(ServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(ServiceError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
                
            } catch {
                completion(.failure(ServiceError.jsonDecodeError))
            }
        }
        task.resume()
    }
    
    private func request(from request: Request) -> URLRequest? {
        guard let url = request.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = request.httpMethod
        return request
    }
    
    
}
