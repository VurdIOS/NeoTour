////
////  DetailInfoView.swift
////  NeoTour
////
////  Created by Камаль Атавалиев on 17.02.2024.
////
//
//import UIKit
//
//class DetailInfoView: UIViewController {
//    
//    var tourInfo: tourModel!
//    
//    private lazy var bgImage: UIImageView = {
//        let image = UIImageView()
//        image.image = tourInfo.image
//        image.translatesAutoresizingMaskIntoConstraints = false
//        
//        return image
//    }()
//    
//    private let commentsView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 36
//        view.translatesAutoresizingMaskIntoConstraints = false
//        
//        
//        return view
//    }()
//    
//    private lazy var tourNameLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.text = tourInfo.title
//        lbl.font = UIFont(name: "SFProDisplay-Black", size: 24)
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//    private lazy var tourLocationLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.text = tourInfo.title
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
//        lbl.text = tourInfo.description
//        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 16)
//        lbl.numberOfLines = 0
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .lightAccentColor
//        setuoConstraints()
//
//    }
//    
//    
//    private func setuoConstraints() {
//        view.addSubview(bgImage)
//        view.addSubview(commentsView)
//        commentsView.addSubview(tourNameLabel)
//        commentsView.addSubview(tourLocationLabel)
//        commentsView.addSubview(tourDescriptionTitleLabel)
//        commentsView.addSubview(tourDescriptionLabel)
//        
//        
//        
//        NSLayoutConstraint.activate([
//            bgImage.topAnchor.constraint(equalTo: view.topAnchor),
//            bgImage.widthAnchor.constraint(equalTo: view.widthAnchor),
//            bgImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            bgImage.heightAnchor.constraint(equalToConstant: 389),
//            
//            commentsView.topAnchor.constraint(equalTo: bgImage.bottomAnchor, constant: -30),
//            commentsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            commentsView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            commentsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            tourNameLabel.topAnchor.constraint(equalTo: commentsView.topAnchor, constant: 24),
//            tourNameLabel.leadingAnchor.constraint(equalTo: commentsView.leadingAnchor, constant: 16),
//            tourNameLabel.trailingAnchor.constraint(equalTo: commentsView.trailingAnchor, constant: -16),
//            tourNameLabel.heightAnchor.constraint(equalToConstant: 29),
//            
//            tourLocationLabel.topAnchor.constraint(equalTo: tourNameLabel.bottomAnchor, constant: 12),
//            tourLocationLabel.leadingAnchor.constraint(equalTo: commentsView.leadingAnchor, constant: 16),
//            tourLocationLabel.trailingAnchor.constraint(equalTo: commentsView.trailingAnchor, constant: -16),
//            tourLocationLabel.heightAnchor.constraint(equalToConstant: 14),
//            
//            tourDescriptionTitleLabel.topAnchor.constraint(equalTo: tourLocationLabel.bottomAnchor, constant: 32),
//            tourDescriptionTitleLabel.leadingAnchor.constraint(equalTo: commentsView.leadingAnchor, constant: 16),
//            tourDescriptionTitleLabel.trailingAnchor.constraint(equalTo: commentsView.trailingAnchor, constant: -16),
//            tourDescriptionTitleLabel.heightAnchor.constraint(equalToConstant: 24),
//            
//            tourDescriptionLabel.topAnchor.constraint(equalTo: tourDescriptionTitleLabel.bottomAnchor, constant: 12),
//            tourDescriptionLabel.leadingAnchor.constraint(equalTo: commentsView.leadingAnchor, constant: 16),
//            tourDescriptionLabel.trailingAnchor.constraint(equalTo: commentsView.trailingAnchor, constant: -16),
//            tourDescriptionLabel.heightAnchor.constraint(equalToConstant: 92),
//            
//            
//            
//            
//            
//        ])
//    }
//
//}
