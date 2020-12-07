//
//  NetworkClient.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import Foundation
import Combine

protocol NetworkClientRequesting {
    mutating func request<T: Decodable>(router: Router, returnType: T.Type) -> AnyPublisher<T, Error>
}

protocol NetworkClient: NetworkClientRequesting {
    
}
