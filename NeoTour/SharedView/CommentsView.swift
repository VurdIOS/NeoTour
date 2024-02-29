//
//  CommentsView.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import UIKit

class CommentsView: UIView {
    
      private let avatarImageView: UIImageView = {
          let imageView = UIImageView()
          imageView.image = UIImage(named: "userImage")
          imageView.contentMode = .scaleAspectFill
          imageView.layer.cornerRadius = 12
          imageView.layer.masksToBounds = true
          imageView.translatesAutoresizingMaskIntoConstraints = false
          return imageView
      }()
      
      private let nameLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont.boldSystemFont(ofSize: 14)
          label.textColor = .black
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
      private let reviewLabel: UILabel = {
          let label = UILabel()
          label.numberOfLines = 0 // для многострочного текста
          label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
      override init(frame: CGRect) {
          super.init(frame: frame)
          setupLayout()
      }
    
    init(configuration: Comments) {
            super.init(frame: .zero)
            setupLayout()
            configure(with: configuration)
        }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    private func configure(with configuration: Comments) {
//        avatarImageView.image = configuration.image
        nameLabel.text = configuration.author
        reviewLabel.attributedText = configuration.content.createLine(spacing: 4)
    }
      
      private func setupLayout() {
          addSubview(avatarImageView)
          addSubview(nameLabel)
          addSubview(reviewLabel)
          
          // Ограничения для аватара
          NSLayoutConstraint.activate([
              avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
              avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
              avatarImageView.widthAnchor.constraint(equalToConstant: 24),
              avatarImageView.heightAnchor.constraint(equalToConstant: 24)
          ])
          
          // Ограничения для имени
          NSLayoutConstraint.activate([
              nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
              nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
              nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
          ])
          
          // Ограничения для текста отзыва
          NSLayoutConstraint.activate([
              reviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
              reviewLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
              reviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
              reviewLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
          ])
      }

}
