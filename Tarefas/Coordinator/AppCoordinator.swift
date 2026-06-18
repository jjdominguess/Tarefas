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
        let viewModel = EntryViewModel()
        viewModel.coordinator = self
        let vc = EntryViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToHome() {
        let viewModel = HomeViewModel()
        viewModel.coordinator = self
        let homeVC = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func routeToModalView() {
        let viewModel = ModalViewModel()
        viewModel.coordinator = self
        let modalView = ModalViewController(viewModel: viewModel)
        modalView.modalPresentationStyle = .pageSheet
        if let sheet = modalView.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
        }
        navigationController.present(modalView, animated: true)
    }
    
    func dismissModal() {
        navigationController.presentedViewController?.dismiss(animated: true)
    }
    
}
