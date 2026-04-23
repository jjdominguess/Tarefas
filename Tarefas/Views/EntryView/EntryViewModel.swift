//
//  EntryViewViewModel.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 30/12/25.
//

import Foundation

class EntryViewModel {
    
    weak var coordinator: AppCoordinator?
    
    func didTapEnter() {
        coordinator?.navigateToHome()
    }
}
