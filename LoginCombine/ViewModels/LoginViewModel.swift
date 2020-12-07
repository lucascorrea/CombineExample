//
//  LoginViewModel.swift
//  LoginCombine
//
//  Created by Lucas Correa on 28/10/2020.
//

import Foundation
import Combine

protocol LoginCoordinatorDelegate: AnyObject {
    func showAJoke()
}

final class LoginViewModel {
    
    weak var coordinator: LoginCoordinatorDelegate?
    
    @Published private var username: String = ""
    private(set) var password = CurrentValueSubject<String, Never>("")
    
    var validate: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($username, password)
            .print("Validate")
            .map { $0.count >= 4 && $1.count >= 4 }
            .eraseToAnyPublisher()
    }
    
    func didChangeUsername(text: String) {
        username = text
    }
    
    func showAJoke() {
        self.coordinator?.showAJoke()
    }
}
