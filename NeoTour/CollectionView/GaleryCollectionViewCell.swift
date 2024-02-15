//
//  GaleryCollectioniewCell.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 15.02.2024.
//

import UIKit

class GaleryCollectionViewCell: UICollectionViewCell {
    static let id = "CarouselCollectionViewCell"
    
    
    let cellLabel: UILabel = {
        let btn = UILabel()
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.textAlignment = .center
        btn.textColor = .white
        btn.textAlignment = .left
        btn.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        
        return btn
    }()
    
    lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .accentColor
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 19
        imageView.backgroundColor = .blue
        
        return imageView
    }()
    
    lazy var blackoutBackground: UIView = {
        let circleView = UIView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = .blackoutColor
        
        return circleView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellImage)
        cellImage.addSubview(blackoutBackground)
        cellImage.addSubview(cellLabel)
        
        
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cellImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            cellLabel.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor, constant: 16),
            cellLabel.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: -16),
            cellLabel.widthAnchor.constraint(equalTo: cellImage.widthAnchor, constant: -30),
            
            blackoutBackground.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor),
            blackoutBackground.leftAnchor.constraint(equalTo: cellImage.leftAnchor),
            blackoutBackground.rightAnchor.constraint(equalTo: cellImage.rightAnchor),
            blackoutBackground.heightAnchor.constraint(equalToConstant: 56)
            
            

            
        ])
        contentView.clipsToBounds = false
        contentView.backgroundColor = .clear
        
        
    }
    
    func get(label: String, image: UIImage) {
        cellLabel.text = label
        cellImage.image = image
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
