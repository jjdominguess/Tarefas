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
//        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let btn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentModalView))
        btn.title = "+"
        navigationItem.title = "Tarefas diárias"
        navigationItem.rightBarButtonItem = btn
    }
}

extension HomeViewController: HomeViewDelegate {
    @objc func presentModalView() {
        let modalView = ModalView()
        modalView.modalPresentationStyle = .pageSheet
        if let sheet = modalView.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        }
        modalView.present(HomeViewController(), animated: true, completion: nil)
    }
}

