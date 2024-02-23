//
//  topTableViewCell.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import UIKit

class TourDetailsTopCollectionCell: UITableViewCell {
    static let reuseIdentifier = "topTableViewCell"
    
    var viewModel: TourDetailsTopTableViewCellViewModelProtocol! {
        didSet {
            pictureImageView.image = viewModel.image
        }
    }
    
    let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var bottomBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.backgroundColor = .white
        view.layer.cornerRadius = 36
        
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(pictureImageView)
        contentView.addSubview(bottomBorder)
        
        
        
        NSLayoutConstraint.activate([
            pictureImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pictureImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pictureImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            pictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            bottomBorder.leadingAnchor.constraint(equalTo: pictureImageView.leadingAnchor, constant:  -2),
            bottomBorder.trailingAnchor.constraint(equalTo: pictureImageView.trailingAnchor, constant:  2),
            bottomBorder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomBorder.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


