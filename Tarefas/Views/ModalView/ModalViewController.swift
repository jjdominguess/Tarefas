//
//  ModalView.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 19/01/26.
//

import UIKit

class ModalViewController: UIViewController {
    
    private lazy var layout: ModalView = {
        let view = ModalView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        self.view = layout
    }
}
