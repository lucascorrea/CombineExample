//
//  AppCoordinator.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    //
    // MARK: - Properties
    var window: UIWindow!
    
    //
    // MARK: - Init DI
    
    /// Init
    /// - Parameters:
    ///   - window: UIWindow
    ///   - navigationController: UINavigationController
    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        navigationController.navigationBar.isTranslucent = false
        super.init(navigationController: navigationController)
        self.window = window
    }
    
    //
    // MARK: - Public Functions
    
    /// Start
    override func start() {
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
        
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.navigationController = self.navigationController
        self.start(coordinator: coordinator)
    }
}
