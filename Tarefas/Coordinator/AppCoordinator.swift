//
//  AppCoordinator.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 16/01/26.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.window = UIWindow()
    }
    
    func start() {
        let viewModel = EntryViewViewModel()
        let vc = EntryViewController(viewModel: viewModel, coordinator: self)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToHome() {
        let homeVC = HomeViewController()
        navigationController.pushViewController(homeVC, animated: true)
    }
}
