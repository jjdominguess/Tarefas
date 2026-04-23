//
//  EntryViewController.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 20/12/25.
//

import UIKit

class EntryViewController: UIViewController {
    
    private let viewModel: EntryViewModel?
    
    private lazy var entryView: EntryView = {
        let view = EntryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    //Para inicializar a EntryController precisa de uma ViewModel
    init(viewModel: EntryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
    }
    
    func configLayout() {
        view.addSubview(entryView)
        
        NSLayoutConstraint.activate([
            entryView.topAnchor.constraint(equalTo: view.topAnchor),
            entryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            entryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            entryView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension EntryViewController: EntryViewDelegate {
    func didTapEnter() {
        viewModel?.didTapEnter()
    }
}
