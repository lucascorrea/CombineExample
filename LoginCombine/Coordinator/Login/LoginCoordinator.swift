//
//  LoginCoordinator.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import UIKit

class LoginCoordinator: BaseCoordinator {
    
    //
    // MARK: - Init DI
    
    /// Init
    /// - Parameters:
    ///   - navigationController: UINavigationController
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    //
    // MARK: - Life cycle
    deinit {
        print("deinit login coordinator")
    }
    
    //
    // MARK: - Public Functions
    
    /// Start
    override func start() {
        let loginViewController = UIStoryboard.instantiate(identifier: LoginViewController.className) { coder -> LoginViewController? in
            let loginViewModel = LoginViewModel()
            loginViewModel.coordinator = self
            
            // Dependency Injection
            return LoginViewController(coder: coder, viewModel: loginViewModel)
        }
        
        loginViewController.navigationItem.title = "Login"
        self.navigationController.viewControllers = [loginViewController]
    }

}

//
// MARK: - BookStoreCoordinatorDelegate
extension LoginCoordinator: LoginCoordinatorDelegate {
    
    func showAJoke() {
        let coordinator = JokeCoordinator(navigationController: self.navigationController)
        self.start(coordinator: coordinator)
    }
    
}
