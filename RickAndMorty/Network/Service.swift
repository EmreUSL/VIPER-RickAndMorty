//
//  Service.swift
//  RickAndMorty
//
//  Created by emre usul on 22.02.2023.
//

import Foundation

final class Service {
    
    class func request<T: Codable>(router: Router, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = nil
        
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        print(urlRequest)
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in

            guard let data = data, error == nil else {
                completion(.failure(error.unsafelyUnwrapped))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(type.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
}
