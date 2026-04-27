//
//  ModalView.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 24/01/26.
//

import UIKit

class ModalView: UIView {
    
    private var customBlueColor = UIColor(red: 1.00/255.00, green: 144.00/255.00, blue: 189.00/255.00, alpha: 1.00)
    
    private lazy var container: UIView = {
        var container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = customBlueColor
        return container
    }()
    
    private lazy var title: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Title"
        return title
    }()
    
    private lazy var subtitle: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Subtitle"
        return title
    }()
    
    private lazy var button: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar tarefa", for: .normal)
        button.addTarget(self, action: #selector(didTapAddTask), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true

        return button
    }()
    
    private lazy var textField: UITextField = {
        var field = UITextField()
        
        return field
    }()
    
    private lazy var descriptionField: UITextField = {
        var field = UITextField()
        return field
    }()
    
    private lazy var date: UIDatePicker = {
        var datePicker = UIDatePicker()
        return datePicker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = customBlueColor
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupLayout() {
        addSubview(container)
        container.addSubview(title)
        container.addSubview(subtitle)
        container.addSubview(button)
        configLayout()
    }
    
    func configLayout() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            title.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 12),
            title.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            subtitle.leadingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            subtitle.trailingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            
            button.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor, constant: 12),
            button.centerXAnchor.constraint(equalTo: container.centerXAnchor),
        ])
    }
    
    @objc private func didTapAddTask() {
        print("AAAAAAAAA")
    }
}
