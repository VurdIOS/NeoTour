////
////  DetailInfoBottomCollectionCell.swift
////  NeoTour
////
////  Created by Камаль Атавалиев on 19.02.2024.
////
//
//import UIKit
//
//class DetailInfoBottomCollectionCell: UICollectionViewCell {
//    static let reuseIdentifier = "BottomCollectionViewCell"
//    
//    private lazy var tourNameLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.font = UIFont(name: "SFProDisplay-Black", size: 24)
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//    
//    private lazy var tourLocationLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.addImage(image: UIImage(named: "locationMark")!)
//        lbl.font = UIFont(name: "SFProDisplay-Medium", size: 12)
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//    
//    private let tourDescriptionTitleLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.text = "Description"
//        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//    //
//    private lazy var tourDescriptionLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 16)
//        lbl.numberOfLines = 0
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(tourNameLabel)
//        contentView.addSubview(tourLocationLabel)
//        contentView.addSubview(tourDescriptionTitleLabel)
//        contentView.addSubview(tourDescriptionLabel)
//        
//        NSLayoutConstraint.activate([
//            tourNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            tourNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            tourNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            tourNameLabel.heightAnchor.constraint(equalToConstant: 29),
//
//            tourLocationLabel.topAnchor.constraint(equalTo: tourNameLabel.bottomAnchor, constant: 12),
//            tourLocationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            tourLocationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            tourLocationLabel.heightAnchor.constraint(equalToConstant: 14),
//            
//            tourDescriptionTitleLabel.topAnchor.constraint(equalTo: tourLocationLabel.bottomAnchor, constant: 32),
//            tourDescriptionTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            tourDescriptionTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            tourDescriptionTitleLabel.heightAnchor.constraint(equalToConstant: 24),
//            
//            tourDescriptionLabel.topAnchor.constraint(equalTo: tourDescriptionTitleLabel.bottomAnchor, constant: 12),
//            tourDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            tourDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            tourDescriptionLabel.heightAnchor.constraint(equalToConstant: 650),
//            
//        ])
//        contentView.clipsToBounds = false
//        contentView.backgroundColor = .clear
//        
//        
//    }
//    
//    func get(data: tourModel) {
//        print("get data")
//        tourNameLabel.text = data.title
//        tourLocationLabel.text = data.title
//        tourDescriptionLabel.text = data.description
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//    }
//}
//
//
