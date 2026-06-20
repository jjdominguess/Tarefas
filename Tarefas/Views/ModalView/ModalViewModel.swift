//
//  ModalViewModel.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 16/06/26.
//

import Foundation

class ModalViewModel {

    weak var coordinator: AppCoordinator?
    
    var taskModel: TaskModel?
    
    func dismissModalView() {
        print("dismissModalView")
        coordinator?.dismissModal()
    }
        
    func stringConversion(date: Date?, hour: Date?) -> String {
        var stringConversioned: String = ""
        if let formatterHour = hour {
            DateFormatter.localizedString(from: formatterHour, dateStyle: .short, timeStyle: .none)
            stringConversioned = formatterHour.description
        }
        
        if let formatterDate = date {
            DateFormatter.localizedString(from: formatterDate, dateStyle: .short, timeStyle: .none)
            stringConversioned = formatterDate.description
        }
        return stringConversioned
    }
    
    func recordInfoTask(title: String, description: String, date: String, hour: String) {
        taskModel = TaskModel(title: title,
                              description: description,
                              date: date,
                              start: hour)
    }
}
