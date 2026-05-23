//
//  ModalView.swift
//  Tarefas
//
//  Created by João José Domingues Silva on 24/01/26.
//

import UIKit

class ModalView: UIView {
    //TODO: -- Refatorar essa classe posteriormente para criar um modelo de que ao passar informações já devolve label, tipo de calendário, tipo de hora desejada. Pois houve muito código repetido em função de ter que criar botão para ativar o UIDatePicker, configurá-lo como false isHidden na closure, depois de ser feita a escolha da data/hora pegar o valor de depois passá-lo como isHidden true de novo.
    
    //MARK: -- Vars
    let dateNow = Date.now
    let dateNowFormatted = Date.now.formatted(date: .abbreviated, time: .omitted)
    let dateTomorrow = Date.now.addingTimeInterval(84_600)
    let dateTomorrowFormatted = Date.now.addingTimeInterval(84_600).formatted(date: .abbreviated, time: .omitted)
    let hourNow = Date.now.formatted(date: .omitted, time: .shortened)
    private var customBlueColor = UIColor(red: 1.00/255.00, green: 144.00/255.00, blue: 189.00/255.00, alpha: 1.00)
    
    
    //MARK: -- ContainerView
    private lazy var container: UIView = {
        var container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = customBlueColor
        return container
    }()
    
    //MARK: -- TextFields
    private lazy var titleTaskField: UITextField = {
        var field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Título"
        field.borderStyle = .roundedRect
        field.target(forAction: #selector(didSelectedDateStart), withSender: .none)
        field.keyboardType = .asciiCapable
        field.heightAnchor.constraint(equalToConstant: 40).isActive = true
        field.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        return field
    }()
    
    private lazy var descriptionTaskField: UITextField = {
        var field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Descrição"
        field.borderStyle = .roundedRect
        field.target(forAction: #selector(didTapEnterTaskFieldDescription), withSender: .none)
        field.heightAnchor.constraint(equalToConstant: 40).isActive = true
        field.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        return field
    }()
    
    //MARK: -- DatePickers
    private lazy var startDate: UIDatePicker = {
        var date = UIDatePicker()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.date = dateNow
        date.datePickerMode = .date
        date.preferredDatePickerStyle = .inline
        date.isHidden = true
        date.tintColor = .white
        date.minimumDate = dateNow
        date.addTarget(self, action: #selector(chooseDateStartCalendar), for: .valueChanged)
        date.layer.masksToBounds = true
        date.layer.cornerRadius = 10
        date.backgroundColor = .yellow
        //TODO: - Entender como implementar o dismiss do calendário quando clicar fora do mesmo
//        date.addTarget(self, action: #selector(didClickOutsideOffCalendar), for: .touchUpOutside)
        
        return date
    }()
    
    private lazy var endDate: UIDatePicker = {
        var date = UIDatePicker()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.date = dateNow
        date.datePickerMode = .date
        date.preferredDatePickerStyle = .inline
        date.isHidden = true
        date.tintColor = .white
        date.minimumDate = dateTomorrow
        date.bringSubviewToFront(self)
        date.layer.masksToBounds = true
        date.layer.cornerRadius = 10
        date.backgroundColor = .yellow
        date.addTarget(self, action: #selector(chooseDateEndCalendar), for: .valueChanged)
        
        return date
    }()
    
    private lazy var startHour: UIDatePicker = {
        var hour = UIDatePicker()
        hour.translatesAutoresizingMaskIntoConstraints = false
        hour.datePickerMode = .time
        hour.isHidden = true
        hour.preferredDatePickerStyle = .wheels
        //TODO: -- Corrigir comportamento do Picker pois ao girar as roletas e cair em qualquer horário, fecha o picker, melhor seria se houvesse um botão para quando o usuário desse ok pegasse ambos, hora e minutos corretos, e não tivesse que abrir duas vezes o picker para acertar o horário.
        hour.addTarget(self, action: #selector(chooseHourOfTask), for: .valueChanged)
        hour.backgroundColor = .yellow
        hour.layer.masksToBounds = true
        hour.layer.cornerRadius = 10
        
        return hour
    }()
    
    //MARK: -- Buttons
    private lazy var addButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar", for: .normal)
        button.addTarget(self, action: #selector(didTapAddTask), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private lazy var buttonStartDate: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("\(dateNowFormatted)", for: .normal)
        button.addTarget(self, action: #selector(openStartCalendar), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        return button
    }()
    
    private lazy var buttonEndDate: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("\(dateTomorrowFormatted)", for: .normal)
        button.addTarget(self, action: #selector(openEndCalendar), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true

        return button
    }()
    
    private lazy var buttonHour: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("\(hourNow)", for: .normal)
        button.addTarget(self, action: #selector(openHourWheel), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        return button
    }()
    
    //MARK: -- Labels
    let titleText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Adicione sua tarefa"
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data de início"
        label.font = UIFont.systemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data de término"
        label.font = UIFont.systemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    private lazy var starHourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hora de início"
        label.font = UIFont.systemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        
        return label
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
        container.addSubview(titleTaskField)
        container.addSubview(descriptionTaskField)
        container.addSubview(titleText)
        container.addSubview(startDateLabel)
        container.addSubview(buttonStartDate)
        container.addSubview(startDate)
        container.addSubview(endDateLabel)
        container.addSubview(buttonEndDate)
        container.addSubview(endDate)
        container.addSubview(startHour)
        container.addSubview(starHourLabel)
        container.addSubview(buttonHour)
        container.addSubview(addButton)
        configLayout()
    }
    
    func configLayout() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleText.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleText.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            titleTaskField.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 24),
            titleTaskField.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            descriptionTaskField.topAnchor.constraint(equalTo: titleTaskField.bottomAnchor, constant: 12),
            descriptionTaskField.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            buttonStartDate.topAnchor.constraint(equalTo: descriptionTaskField.bottomAnchor, constant: 12),
            buttonStartDate.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            
            startDateLabel.centerYAnchor.constraint(equalTo: buttonStartDate.centerYAnchor),
            startDateLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            
            buttonEndDate.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            buttonEndDate.topAnchor.constraint(equalTo: buttonStartDate.bottomAnchor, constant: 20),
            
            endDateLabel.centerYAnchor.constraint(equalTo: buttonEndDate.centerYAnchor),
            endDateLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            
            buttonHour.topAnchor.constraint(equalTo: buttonEndDate.bottomAnchor, constant: 20),
            buttonHour.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            
            starHourLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            starHourLabel.topAnchor.constraint(equalTo: buttonEndDate.bottomAnchor, constant: 30),
            
            addButton.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor, constant: 12),
            addButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
        ])
    }
    
    @objc private func openStartCalendar() {
        startDate.isHidden = false
        container.bringSubviewToFront(startDate)
        NSLayoutConstraint.activate([
            startDate.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            startDate.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
    }
    
    @objc private func openEndCalendar() {
        endDate.isHidden = false
        container.bringSubviewToFront(endDate)
        NSLayoutConstraint.activate([
            endDate.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            endDate.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
    }
    
    @objc private func openHourWheel() {
        startHour.isHidden = false
        container.bringSubviewToFront(startHour)
        NSLayoutConstraint.activate([
            startHour.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            startHour.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        ])
    }
    
    @objc private func chooseDateStartCalendar() {
        let selectedDate = startDate.date
        let formattedDate = DateFormatter.localizedString(from: selectedDate, dateStyle: .medium, timeStyle: .none)
        buttonStartDate.setTitle(formattedDate, for: .normal)
        startDate.isHidden = true
    }
    
    @objc private func chooseDateEndCalendar() {
        let selectedDate = endDate.date
        let formattedDate = DateFormatter.localizedString(from: selectedDate, dateStyle: .medium, timeStyle: .none)
        buttonEndDate.setTitle(formattedDate, for: .normal)
        endDate.isHidden = true
    }
    
    @objc private func chooseHourOfTask() {
        let selectedHour = startHour.date
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        let formatterString = formatter.string(from: selectedHour)
        buttonHour.setTitle(formatterString, for: .normal)
        startHour.isHidden = true
    }
    
    @objc private func didTapAddTask() {
        print("didTapAddTask")
    }
    
    @objc private func didTapEnterTaskFieldTitle() {
        print("didTapEnterTaskFieldTitle")
    }
    
    @objc private func didTapEnterTaskFieldDescription() {
        print("didTapEnterTaskFieldDescription")
    }
    
    @objc private func didSelectedDateStart() {
        print("didClickDateStart")
        startDate.isHidden = true
    }
    
    @objc private func didClickHourStart() {
        print("didClickHourStart")
    }
    
    @objc private func didClickDateEnd() {
        print("didClickDateEnd")
    }
    
    @objc private func didClickOutsideOffCalendar() {
        startDate.isHidden = true
        print("AAA")
    }
    //TODO: implementar dismiss na tela quando clicar em adicionar
}
