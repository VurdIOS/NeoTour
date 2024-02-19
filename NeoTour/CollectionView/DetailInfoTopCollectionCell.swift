//
//  DetailInfoTopCollectionCell.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 19.02.2024.
//

import UIKit

class DetailInfoTopCollectionCell: UICollectionViewCell {
    static let reuseIdentifier = "TopCollectionViewCell"
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .accentColor
        image.clipsToBounds = true
        
        return image
    }()
    
    private lazy var bottomBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.backgroundColor = .white
        view.layer.cornerRadius = 36
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        contentView.addSubview(bottomBorder)

        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            bottomBorder.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            bottomBorder.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            bottomBorder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomBorder.heightAnchor.constraint(equalToConstant: 60),
            
        ])
        contentView.clipsToBounds = false
        contentView.backgroundColor = .clear
        
        
    }
    
    func get(data: tourModel) {
        print("get data")
        image.image = data.image
//        tourNameLabel.text = data.title
//        tourLocationLabel.text = data.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
