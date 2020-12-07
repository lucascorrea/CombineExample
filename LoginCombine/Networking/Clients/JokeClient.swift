//
//  JokeClient.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import Foundation
import Combine

struct JokeClient: NetworkClient {
    
    //
    // MARK: - Properties
    var session: URLSession
    var dataTask: URLSessionDataTask?
    
    /// Init
    /// - Parameter urlSession: URLSession
    init(urlSession: URLSession = URLSession.shared) {
        self.session = urlSession
    }
    
    //
    // MARK: - Public Functions
    
    mutating func request<T>(router: Router, returnType: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        
        guard let url = router.urlComponents.url else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)
        urlRequest.httpMethod = router.method
        
        for (key, value) in router.headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                if let response = response as? HTTPURLResponse {
                    // 200 OK, 201 Created, 202 Accepted, 204 No content (PUT, POST or DELETE)
                    if !(200...204 ~= response.statusCode) {
                        throw NetworkError.statusCodeError(message: "Unexpected statusCode", code: response.statusCode)
                    }
                }
                return data
            }
            .decode(type: returnType, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        //        dataTask = session.dataTask(with: urlRequest) { data, response, error in
        //            guard let data = data, error == nil else {
        //                if let error = error as NSError?, error.domain == NSURLErrorDomain {
        //                    completion(.failure(.domainError))
        //                }
        //                return
        //            }
        //
        //            if let response = response as? HTTPURLResponse {
        //                // 200 OK, 201 Created, 202 Accepted, 204 No content (PUT, POST or DELETE)
        //                if (200...204).contains(response.statusCode) {
        //                    do {
        //                        let object = try JSONDecoder().decode(returnType, from: data)
        //                        completion(.success(object))
        //                    } catch {
        //                        //                        print(error)
        //                        completion(.failure(.decodingError(message: error.localizedDescription)))
        //                    }
        //                } else {
        //                    completion(.failure(.statusCodeError(message: "Unexpected statusCode", code: response.statusCode)))
        //                }
        //            }
        //        }
        //
        //        dataTask?.resume()
    }
    
    //    func cancelRequest() {
    //        dataTask?.cancel()
    //    }
}
