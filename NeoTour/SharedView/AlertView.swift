//
//  AlertViewController.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 24.02.2024.
//

import UIKit

class AlertViewController: UIViewController {
    
    private let messageLabel = UILabel()
    private let okButton = UIButton()
    private let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        // Настройка контейнера
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20
        view.addSubview(containerView)
        
        // Настройка текстовой метки
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = "Your trip has been booked!"
        messageLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        containerView.addSubview(messageLabel)
        
        // Настройка кнопки
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.setTitle("Ok", for: .normal)
        okButton.backgroundColor = .accentColor
        okButton.setTitleColor(.white, for: .normal)
        okButton.layer.cornerRadius = 25
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        containerView.addSubview(okButton)
        
        // Установка constraints для контейнера
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            containerView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        // Установка constraints для messageLabel
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
        
        // Установка constraints для okButton
        NSLayoutConstraint.activate([
            okButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 32),
            okButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            okButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            okButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            okButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func okButtonTapped() {
        dismiss(animated: true)
    }
    
    
}
