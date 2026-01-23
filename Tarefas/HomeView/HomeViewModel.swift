//
//  HomeViewModel.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 23/01/26.
//

import Foundation

class HomeViewModel {
    
    weak var coordinator: AppCoordinator? 
    
    func callModalView() {
        coordinator?.openModalView()

    }
    
}
