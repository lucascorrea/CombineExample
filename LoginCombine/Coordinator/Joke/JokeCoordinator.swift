//
//  JokeCoordinator.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import UIKit

class JokeCoordinator: BaseCoordinator {
    
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
        print("deinit joke coordinator")
    }
    
    //
    // MARK: - Public Functions
    
    /// Start
    override func start() {
        let jokeViewController = UIStoryboard.instantiate(identifier: JokeViewController.className) { coder -> JokeViewController? in
            let jokeViewModel = JokeViewModel()
//            loginViewModel.coordinator = self
            
            // Dependency Injection
            return JokeViewController(coder: coder, viewModel: jokeViewModel)
        }
        
        jokeViewController.navigationItem.title = "Joke"
        self.navigationController.pushViewController(jokeViewController, animated: true)
    }

}
