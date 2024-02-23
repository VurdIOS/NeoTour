//
//  CarouselCollectionViewCell.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 14.02.2024.
//

import UIKit

class TourCategoriesCollectionViewCell: UICollectionViewCell {
    static let id = "CarouselCollectionViewCell"
    
    var viewModel: TourCategoriesCollectionViewCellViewModelProtocol! {
        didSet {
            segmentControl.text = viewModel.title
        }
    }
    
    let segmentControl: UILabel = {
        let btn = UILabel()
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.textAlignment = .center
        btn.textColor = .black
        btn.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        
        return btn
    }()
    
    lazy var pointUnderSelected: UIView = {
        let circleView = UIView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = .accentColor
        circleView.layer.cornerRadius = 3.5
        circleView.isHidden = true
        
        return circleView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(segmentControl)
        contentView.addSubview(pointUnderSelected)
        
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: contentView.topAnchor),
            segmentControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            segmentControl.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            segmentControl.rightAnchor.constraint(equalTo: contentView.rightAnchor),
          
            pointUnderSelected.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pointUnderSelected.topAnchor.constraint(equalTo: segmentControl.bottomAnchor),
            pointUnderSelected.widthAnchor.constraint(equalToConstant: 7), // Ширина круга
            pointUnderSelected.heightAnchor.constraint(equalToConstant: 7) // Высота круга
            
        ])
        contentView.clipsToBounds = false
        contentView.backgroundColor = .clear
        
        
    }
    
//    func get(data: Categories) {
//        segmentControl.text = data.title
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
