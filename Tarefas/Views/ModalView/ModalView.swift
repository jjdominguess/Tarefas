//
//  ModalView.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 24/01/26.
//

import UIKit

class ModalView: UIView {
    
    var view: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Title"
        return title
    }()
    
    var subtitle: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Subtitle"
        return title
    }()
    
    var button: UIButton = {
        var button = UIButton()
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupLayout() {
        addSubview(view)
        
        configLayout()
    }
    
    func configLayout() {
        
        NSLayoutConstraint.activate([
            
            
        ])
    }
}
