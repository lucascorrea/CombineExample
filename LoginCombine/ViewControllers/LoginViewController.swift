//
//  LoginViewController.swift
//  LoginCombine
//
//  Created by Lucas Correa on 28/10/2020.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private let viewModel: LoginViewModel
    private var bindings = Set<AnyCancellable>()
    
    
    init?(coder: NSCoder, viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    private func bindViewToViewModel() {
        usernameText.textPublisher
            .print("Username")
            .sink { [weak self] in
                self?.viewModel.didChangeUsername(text: $0)
            }
            .store(in: &bindings)
        
        passwordText.textPublisher
            .assign(to: \.password.value, on: viewModel)
            .store(in: &bindings)
    }
    
    private func bindViewModelToView() {
        viewModel.validate
            .assign(to: \.isEnabled, on: loginButton)
            .store(in: &bindings)
    }

    @IBAction func loginAction(_ sender: Any) {
        viewModel.showAJoke()
    }
}

