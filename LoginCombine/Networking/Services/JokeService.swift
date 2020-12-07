//
//  JokeService.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import Foundation
import Combine

protocol JokeServiceProtocol {
    func getJoke() -> AnyPublisher<Joke, Error>
}

class JokeService: Service {
    
    //
    // MARK: - Properties
    var client: NetworkClient
    
    //
    // MARK: - Initializer DI
    required init(client: NetworkClient) {
        self.client = client
    }
    
}

extension JokeService: JokeServiceProtocol {
    
    func getJoke() -> AnyPublisher<Joke, Error> {
        return client.request(router: JokeRouter.joke, returnType: Joke.self)
    }
}
