//
//  EntryViewController.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 20/12/25.
//

import UIKit

class EntryViewController: UIViewController {
    
    private lazy var entryView: EntryView = {
        let view = EntryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
    }
    
    func configLayout() {
        view.addSubview(entryView)
        
        NSLayoutConstraint.activate([
            entryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            entryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            entryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            entryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
