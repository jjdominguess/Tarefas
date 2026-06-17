//
//  ModalView.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 19/01/26.
//

import UIKit

protocol ModalVCDelegate: AnyObject {
    func didTapAdd(title: String, description: String, date: String, hour: String)
}

class ModalViewController: UIViewController, ModalVCDelegate {
    
    var model: ModalViewModel?
    
    private lazy var layout: ModalView = {
        let view = ModalView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(viewModel: ModalViewModel) {
        self.model = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        layout.delegate = self
    }
    
    private func setupLayout() {
        self.view = layout
    }
    
    func didTapAdd(title: String, description: String, date: String, hour: String) {
        print("Did tap add")
        model?.dismissModalView()
    }
}
