//
//  GaleryCollectioniewCell.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 15.02.2024.
//

import UIKit

class GaleryCollectionViewCell: UICollectionViewCell {
    static let id = "GaleryCollectionViewCell"

    private let cellLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        
        return lbl
    }()
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .accentColor
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 19
        
        return imageView
    }()
    
    private lazy var blackoutBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blackoutColor
        
        return view
    }()
    
    // Нужно для изменении значения констрейнта для применения данной ячейки в другой коллекции
    private lazy var leadingLabelConstraint = cellLabel.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor, constant: 16)
    
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
            
            leadingLabelConstraint,
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
    // Данная функция изменяет параметры ячейки, чтобы можно было применить эту же самую ячейку в другой коллекции а не создавать новую
    func setupCell(labelFont: UIFont, cornerRadius: CGFloat, labelLeadingConstant: CGFloat) {
        cellLabel.font = labelFont
        cellImage.layer.cornerRadius = cornerRadius
        leadingLabelConstraint.constant = labelLeadingConstant
        layoutIfNeeded()
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
