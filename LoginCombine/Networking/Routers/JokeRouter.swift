//
//  JokeRouter.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import Foundation

enum JokeRouter: Router {
    case joke
}

extension JokeRouter {
    
    //
    // MARK: - Properties
    var method: String {
        switch self {
            case .joke:
                return "GET"
        }
    }
    
    var host: String {
        switch self {
            case .joke:
                return "api.chucknorris.io"
        }
    }
    
    var path: String {
        switch self {
            case .joke:
                return "/jokes/random"
        }
    }
    
    var headers: [String: String] {
        return ["Accept": "application/json",
                "Content-Type": "application/json"]
    }
    
    var scheme: String {
        switch self {
            case .joke:
                return "https"
        }
    }
    
    var parameters: [String: String] {
        switch self {
            case .joke:
                return [:]
        }
    }
    
    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        
        switch self {
            case .joke:
                urlComponents.scheme = scheme
                urlComponents.host = host
                urlComponents.path = path
                if parameters.count > 0 {
                    urlComponents.setQueryItems(with: parameters)
                }
                return urlComponents
        }
    }
}
