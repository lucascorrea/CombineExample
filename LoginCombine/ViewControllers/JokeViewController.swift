//
//  JokeViewController.swift
//  LoginCombine
//
//  Created by Lucas Correa on 29/10/2020.
//

import UIKit
import Combine

final class JokeViewController: UIViewController {
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    private let viewModel: JokeViewModel
    private var bindings = Set<AnyCancellable>()
    
    init?(coder: NSCoder, viewModel: JokeViewModel = JokeViewModel()) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        viewModel.joke
        //            .receive(on: DispatchQueue.main)
        //            .assign(to: \.text, on: jokeLabel)
        //            .store(in: &bindings)
        
        viewModel.jokePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.text, on: jokeLabel)
            .store(in: &bindings)
    }
    
}
