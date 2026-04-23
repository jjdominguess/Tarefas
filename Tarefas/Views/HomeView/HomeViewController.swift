//
//  HomeViewController.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 31/12/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel?
    var taskNumber: Int = 0
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        customNavbar()
        setup()
    }
    
    func customNavbar() {
        let btn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didClickAddTask))
        btn.title = "+"
        navigationItem.title = "Tarefas diárias"
        navigationItem.rightBarButtonItem = btn
    }
    
    func setup() {
        view.addSubview(homeView)
        
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        homeView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }
    
    @objc func didClickAddTask() {
        viewModel?.callModalView()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Fazer tarefas da faculdade."
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
