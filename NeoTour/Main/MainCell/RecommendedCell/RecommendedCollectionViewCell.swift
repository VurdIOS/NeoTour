//
//  RecommendedCollectionViewCell.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 23.02.2024.
//

import Foundation

import UIKit

class RecommendedCollectionViewCell: UICollectionViewCell {
    static let id = "RecommendedCollectionViewCell"
    
    var viewModel: RecommendedCollectionViewCellViewModelProtocol! {
        didSet {
            cellLabel.text = viewModel.title
            viewModel.isImageLoaded = { [weak self] imageData in
                
                DispatchQueue.main.async {
                    self?.cellImage.image = UIImage(data: imageData!)
                }
                        
                    }
            viewModel.fetchImage()
        }
    }

    private let cellLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        
        return lbl
    }()
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .accentColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private lazy var blackoutBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blackoutColor
        
        return view
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
            
            cellLabel.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor, constant: 12),
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
