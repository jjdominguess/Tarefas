//
//  HomeView.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 18/01/26.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func presentModalView()
}

class HomeView: UIView {
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    private lazy var btn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Entrar", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.addTarget(self, action: #selector(aprint), for: .touchUpInside)
        return btn
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
        addSubview(mainView)
        mainView.addSubview(btn)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            btn.centerXAnchor.constraint(equalTo: centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    @objc func aprint() {
        print("AQUI!")
    }
}
