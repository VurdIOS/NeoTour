//
//  DetailInfoTopCollectionCell.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 19.02.2024.
//

import UIKit

class DetailInfoTopCollectionCell: UICollectionViewCell {
    static let id = "TopCollectionViewCell"
    
    private lazy var image: UIImageView = {
        let image = UIImageView(frame: contentView.bounds)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .accentColor
        image.clipsToBounds = true
        
        return image
    }()
    
    private lazy var bottomBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blackoutColor
        view.layer.cornerRadius = 20
        
        return view
    }()
    
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        image.addSubview(bottomBorder)
        bottomBorder.addSubview(tourNameLabel)
        bottomBorder.addSubview(tourLocationLabel)
        
        NSLayoutConstraint.activate([
            bottomBorder.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomBorder.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomBorder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomBorder.heightAnchor.constraint(equalToConstant: 50),
            
            tourNameLabel.topAnchor.constraint(equalTo: bottomBorder.topAnchor, constant: 20),
            tourNameLabel.leadingAnchor.constraint(equalTo: bottomBorder.leadingAnchor, constant: 16),
            tourNameLabel.trailingAnchor.constraint(equalTo: bottomBorder.trailingAnchor, constant: -16),
            tourNameLabel.heightAnchor.constraint(equalToConstant: 29),
            
            tourLocationLabel.topAnchor.constraint(equalTo: tourNameLabel.bottomAnchor, constant: 12),
            tourLocationLabel.leadingAnchor.constraint(equalTo: bottomBorder.leadingAnchor, constant: 16),
            tourLocationLabel.trailingAnchor.constraint(equalTo: bottomBorder.trailingAnchor, constant: -16),
            tourLocationLabel.heightAnchor.constraint(equalToConstant: 14),
            
        ])
        contentView.clipsToBounds = false
        contentView.backgroundColor = .clear
        
        
    }
    
    func get(data: tourModel) {
        image.image = UIImage(named: "\(data.image)")
        tourNameLabel.text = data.title
        tourLocationLabel.text = data.title
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
