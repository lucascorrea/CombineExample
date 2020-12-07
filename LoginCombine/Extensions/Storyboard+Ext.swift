//
//  Storyboard+Ext.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import UIKit

extension UIStoryboard {
    static func instantiate(identifier: String, storyboardName: String = "Main", creator block: ((NSCoder) -> UIViewController?)? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: identifier, creator: block)
    }
}
