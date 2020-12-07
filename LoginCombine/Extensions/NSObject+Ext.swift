//
//  NSObject+Ext.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
