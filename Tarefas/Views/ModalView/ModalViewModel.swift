//
//  ModalViewModel.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 16/06/26.
//

import Foundation

class ModalViewModel {

    weak var coordinator: AppCoordinator?
    
    func dismissModalView() {
        print("dismissModalView")
        coordinator?.dismissModal()
    }
    
    func recordInfoTask(/*title: String, description: String, date: String, hour: String*/) {
        print("Record info task")
    }
}
