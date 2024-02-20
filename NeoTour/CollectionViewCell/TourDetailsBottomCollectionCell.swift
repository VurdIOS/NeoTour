//
//  BottomTableViewCell.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import UIKit

class TourDetailsBottomCollectionCell: UITableViewCell {
    
    static let reuseIdentifier = "BottomTableViewCell"
    
    var bookButtonTriger: (() -> Void)?
    
    private lazy var tourNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "SFProDisplay-Black", size: 24)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var tourLocationLabel: UILabel = {
        let lbl = UILabel()
        lbl.addImage(image: UIImage(named: "locationMark")!)
        lbl.font = UIFont(name: "SFProDisplay-Medium", size: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let tourDescriptionTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Description"
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    

    private lazy var tourDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let tourReviewsTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Reviews"
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
       private let reviewsStackView: UIStackView = {
           let stackView = UIStackView()
           stackView.axis = .vertical
           stackView.spacing = 24
           stackView.alignment = .fill
           stackView.distribution = .equalSpacing
           stackView.translatesAutoresizingMaskIntoConstraints = false
           return stackView
       }()
       
       private let bookButton: UIButton = {
           let button = UIButton()
           button.setTitle("Book Now", for: .normal)
           button.backgroundColor = .accentColor
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 25
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupLayout()
           contentView.layer.cornerRadius = 36
           bookButton.addTarget(self, action: #selector(bookButtonTapped), for: .touchUpInside)
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Задаем отступ сверху для 'contentView', чтобы "поднять" содержимое ячейки вверх
        let offset: CGFloat = 30 // Высота, на которую ячейка будет "занесена" вверх
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: -offset, left: 0, bottom: 0, right: 0))

    }
    @objc func bookButtonTapped() {
        bookButtonTriger!()
    }
    
       private func setupLayout() {
           contentView.addSubview(tourNameLabel)
           contentView.addSubview(tourLocationLabel)
           contentView.addSubview(tourDescriptionTitleLabel)
           contentView.addSubview(tourDescriptionLabel)
           contentView.addSubview(tourReviewsTitleLabel)
           contentView.addSubview(reviewsStackView)
           contentView.addSubview(bookButton)
        
           
           NSLayoutConstraint.activate([
            
            tourNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tourNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tourNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tourNameLabel.heightAnchor.constraint(equalToConstant: 29),
            
            tourLocationLabel.topAnchor.constraint(equalTo: tourNameLabel.bottomAnchor, constant: 12),
            tourLocationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tourLocationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tourLocationLabel.heightAnchor.constraint(equalToConstant: 14),
            
            tourDescriptionTitleLabel.topAnchor.constraint(equalTo: tourLocationLabel.bottomAnchor, constant: 32),
            tourDescriptionTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tourDescriptionTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tourDescriptionTitleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            tourDescriptionLabel.topAnchor.constraint(equalTo: tourDescriptionTitleLabel.bottomAnchor, constant: 12),
            tourDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tourDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            tourReviewsTitleLabel.topAnchor.constraint(equalTo: tourDescriptionLabel.bottomAnchor, constant: 32),
            tourReviewsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tourReviewsTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            reviewsStackView.topAnchor.constraint(equalTo: tourReviewsTitleLabel.bottomAnchor, constant: 16),
            reviewsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            reviewsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            bookButton.topAnchor.constraint(equalTo: reviewsStackView.bottomAnchor, constant: 50),
            bookButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bookButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bookButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bookButton.heightAnchor.constraint(equalToConstant: 50)
           ])
       }
       
       func configure(tour: TourModel) {
           tourNameLabel.text = tour.title
           tourLocationLabel.attributedText = NSAttributedString(string: tour.title)
           tourDescriptionLabel.attributedText = tour.description.createLine(spacing: 7)
           // Очищаем стек от предыдущих отзывов
           reviewsStackView.arrangedSubviews.forEach {
               reviewsStackView.removeArrangedSubview($0)
               $0.removeFromSuperview()
           }
           // Добавляем новые отзывы
           for review in tour.comments {
               let reviewLabel = CommentsView(configuration: review)
               reviewsStackView.addArrangedSubview(reviewLabel)
           }
       }
}
