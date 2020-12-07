//
//  JokeViewModel.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import Foundation
import Combine

class JokeViewModel {
    
    private let service: JokeServiceProtocol
    private let joke = CurrentValueSubject<String?, Never>("Chuck Norris....")
    //    @Published var joke: String = ""
    private var bindings = Set<AnyCancellable>()
    var jokePublisher: AnyPublisher<String?, Never> {
        joke
            .filter { $0 != nil }
            .eraseToAnyPublisher()
    }
    
    init(service: JokeServiceProtocol = JokeService(client: JokeClient())) {
        self.service = service
        getJoke()
    }
    
    private func getJoke() {
        self.service.getJoke()
            .sink { completion in
                switch completion {
                    case let .failure(error):
                        print("Couldn't get users: \(error)")
                    case .finished: break
                }
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.joke.value = result.value
                print(result.value)
            }
            .store(in: &bindings)
        
    }
}
