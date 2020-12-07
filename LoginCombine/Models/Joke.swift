//
//  Joke.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import Foundation

struct Joke: Decodable {
    
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case value = "value"
    }
}
