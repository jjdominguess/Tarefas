//
//  HomeViewController.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 31/12/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Tarefas diárias/"
    }
    
    
}
