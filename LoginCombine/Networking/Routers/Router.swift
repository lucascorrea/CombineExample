//
//  Router.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import Foundation

protocol Router {
    var method: String { get }
    var path: String { get }
    var scheme: String { get }
    var host: String { get }
    var headers: [String: String] { get }
    var parameters: [String: String] { get }
    var urlComponents: URLComponents { get }
}
