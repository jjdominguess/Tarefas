//
//  HomeView.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 18/01/26.
//

import UIKit

class HomeView: UIView {
       
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [date,tableView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .systemBackground
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var bt: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("AAAAAAAAAAAA", for: .normal)
        
        return btn
    }()

    private lazy var date: UILabel = {
        let date = UILabel()
        date.text = "23 de janeiro de 2026"
        date.font = .systemFont(ofSize: 14)
        date.textAlignment = .center
        return date
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        backgroundColor = .systemBackground
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
