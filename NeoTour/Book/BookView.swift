//
//  BookView.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import UIKit

class BookView: UIViewController {
    
    var viewModel: BookViewModelProtocol!
    
    let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.textAlignment = .left
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "To submit an application for a tour reservation, you need to fill in your information and select the number of people for the reservation"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)

        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Xcross"), for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    let phoneNumberTitle: UILabel = {
        let label = UILabel()
        label.text = "Phone number"
        label.textAlignment = .left
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var phoneNumberField: UITextField = {
        let field = UITextField()
        field.placeholder = ""
        field.borderStyle = .roundedRect
        field.keyboardType = .phonePad
        field.layer.cornerRadius = 25
        field.layer.borderWidth = 1 // если нужна граница
        field.layer.borderColor = UIColor.gray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let commentTitle: UILabel = {
        let label = UILabel()
        label.text = "Commentaries to trip"
        label.textAlignment = .left
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    var commentField: UITextField = {
        let field = UITextField()
        field.placeholder = "  Write your wishes to trip..."
        field.borderStyle = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.cornerRadius = 25
        field.layer.borderWidth = 1 // если нужна граница
        field.layer.borderColor = UIColor.gray.cgColor
        return field
    }()
    let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "5 People"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let counterTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of people"
        label.textAlignment = .left
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .left
        label.font = UIFont(name: "SFProDisplay-Black", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let minusButton: UIButton = {
       let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .accentColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        return button
    }()
    let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .accentColor
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .accentColor
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
    }
    
    func setupUI() {
        // Настройка фона и закругленных углов
        view.backgroundColor = .white
        view.layer.cornerRadius = 28
        view.clipsToBounds = true
    }
    
    func setupConstraints() {
        view.addSubview(infoTitleLabel)
        view.addSubview(closeButton)
        view.addSubview(infoLabel)
        view.addSubview(phoneNumberTitle)
        view.addSubview(phoneNumberField)
        view.addSubview(commentTitle)
        view.addSubview(commentField)
        view.addSubview(counterTitleLabel)
        view.addSubview(counterLabel)
        view.addSubview(numberLabel)
        view.addSubview(minusButton)
        view.addSubview(plusButton)
        view.addSubview(submitButton)
 
        NSLayoutConstraint.activate([
            infoTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            infoTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoTitleLabel.widthAnchor.constraint(equalToConstant: 150),
            
            closeButton.centerYAnchor.constraint(equalTo: infoTitleLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 16),
            
            infoLabel.topAnchor.constraint(equalTo: infoTitleLabel.bottomAnchor, constant: 16),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52),
            
            phoneNumberTitle.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 24),
            phoneNumberTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneNumberTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            phoneNumberField.topAnchor.constraint(equalTo: phoneNumberTitle.bottomAnchor, constant: 4),
            phoneNumberField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneNumberField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            phoneNumberField.heightAnchor.constraint(equalToConstant: 50),
            
            commentTitle.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor, constant: 20),
            commentTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            commentField.topAnchor.constraint(equalTo: commentTitle.bottomAnchor, constant: 4),
            commentField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            commentField.heightAnchor.constraint(equalToConstant: 50),
            
            counterTitleLabel.topAnchor.constraint(equalTo: commentField.bottomAnchor, constant: 20),
            counterTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            counterTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            minusButton.topAnchor.constraint(equalTo: counterTitleLabel.bottomAnchor, constant: 4),
            minusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            counterLabel.centerYAnchor.constraint(equalTo: minusButton.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            
            plusButton.centerYAnchor.constraint(equalTo: counterLabel.centerYAnchor),
            plusButton.leadingAnchor.constraint(equalTo: counterLabel.trailingAnchor, constant: 10),
            
            numberLabel.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: plusButton.trailingAnchor, constant: 20),
           
            
            submitButton.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 50),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
