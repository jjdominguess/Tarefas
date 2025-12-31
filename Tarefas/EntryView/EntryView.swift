//
//  EntryView.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 20/12/25.
//

import UIKit

class EntryView: UIView {
   
    private var customBlueColor = UIColor(red: 1.00/255.00, green: 144.00/255.00, blue: 189.00/255.00, alpha: 1.00)
    private var tickImage = UIImage(named: "tick.jpeg")
  
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .systemBackground
        stack.alignment = .center
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 20
        
        return stack
    }()
    
    private lazy var titleView: UILabel = {
        let lbl = UILabel()
        lbl.text = "Controlador de\n Tarefas"
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 40)
        
        return lbl
    }()
    
    private lazy var image: UIImageView = {
        let viewImage = UIImageView()
        viewImage.image = tickImage
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        viewImage.contentMode = .scaleAspectFit
        viewImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        viewImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return viewImage
    }()
    
    private lazy var enterButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = customBlueColor
        btn.bounds.size = CGSize(width: 300, height: 50)
        btn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        btn.setTitle("Entrar", for: .normal)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configLayout() {
     
        addSubview(stackView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(enterButton)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
    
}
