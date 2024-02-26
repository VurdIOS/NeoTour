//
//  ViewController.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 12.02.2024.
//

import UIKit

class OnboardingView: UIViewController {
    
    var viewModel: OnboardinViewModelProtocol! {
        didSet {
            
        }
    }
    
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Winter Vacation Trips"
        label.font = UIFont(name: "SFProDisplay-Black", size: 36)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        // Создайте атрибутированную строку с вашим текстом
        let attributedString = NSMutableAttributedString(string:
        """
        Enjoy your winter vacations with warmth
        and amazing sightseeing on the mountains.
        Enjoy the best experience with us!
        """
        )
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.font = UIFont(name: "SFProDisplay-Light", size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //TO DO: Настроить нормально отступ между текстом и стрелкой
    private var goButton: UIButton = {
        let button = UIButton()
        button.setTitle("Let's Go!    ", for: .normal)
        button.setImage(UIImage(named: "buttonArrow"), for: .normal)
        button.backgroundColor = .accentColor
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.semanticContentAttribute = .forceRightToLeft
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        setupTargetAction()
        viewModel = OnboardingViewModel()
        
        viewModel.onDataLoaded = { [weak self] image in
            
            DispatchQueue.main.async {
                self?.mainImage.image = image
            }
                    
                }
        viewModel.loadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        goButton.layer.cornerRadius = goButton.frame.height / 2
        mainImage.layer.cornerRadius = 37
    }
    
    private func setupConstraints() {
        view.addSubview(mainImage)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(goButton)
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -32),
            
            titleLabel.bottomAnchor.constraint(equalTo: subTitleLabel.topAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.widthAnchor.constraint(equalToConstant: 283),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 86),
            
            subTitleLabel.bottomAnchor.constraint(equalTo: goButton.topAnchor, constant: -40),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 78),
            subTitleLabel.widthAnchor.constraint(equalToConstant: 289),
            
            goButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -115),
            goButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            goButton.widthAnchor.constraint(equalToConstant: 177),
            goButton.heightAnchor.constraint(equalToConstant: 53)
            
        ])
    }
    
    private func setupTargetAction() {
        goButton.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
    }
    
    @objc func goButtonTapped() {
        let vc = MainView()
        vc.viewModel = viewModel.getDataForMainView()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

