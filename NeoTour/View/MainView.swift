//
//  MainView.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 14.02.2024.
//

import UIKit

class MainView: UIViewController {
    
    private let mock = MockFiles()
    
    private lazy var carouselCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: carouselCollectionViewFlowLayout)
        collectionView.register(
            CarouselCollectionViewCell.self,
            forCellWithReuseIdentifier: CarouselCollectionViewCell.id
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let carouselCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        return flow
    }()
    
    private lazy var pointUnderSelected: UIView = {
        let shapeView = UIView()
        shapeView.backgroundColor = .accentColor
//        shapeView.layer.cornerRadius = min(self.bounds.width, self.bounds.height) / 2
        shapeView.isHidden = true
        shapeView.translatesAutoresizingMaskIntoConstraints = false
        return shapeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupConstraints()
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
    }
    
    private func setupNavBar() {
        self.navigationItem.hidesBackButton = true
        let titleLabel = UILabel()
        titleLabel.text = "Discover"
        titleLabel.font = UIFont(name: "SFProDisplay-Black", size: 32)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    
    private func setupConstraints() {
        view.addSubview(carouselCollectionView)
        view.addSubview(pointUnderSelected)
        
        NSLayoutConstraint.activate([
            carouselCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            carouselCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carouselCollectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
}
extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          if let cell = collectionView.cellForItem(at: indexPath) as? CarouselCollectionViewCell {
              cell.segmentControl.font = UIFont(name: "SFProDisplay-Bold", size: 16)
              cell.segmentControl.textColor = .accentColor
              cell.pointUnderSelected.isHidden = false
          }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CarouselCollectionViewCell {
            cell.segmentControl.font = UIFont(name: "SFProDisplay-Regular", size: 16)
            cell.segmentControl.textColor = .black
            cell.pointUnderSelected.isHidden = true
        }
    }
}
extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("mock.mockForCarousel.count")
        return mock.mockForCarousel.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CarouselCollectionViewCell.id,
            for: indexPath
        ) as! CarouselCollectionViewCell
        cell.get(data: mock.mockForCarousel[indexPath.item])
        return cell
    }
}
//TODO: Сделать нормальную ширину ячейки
extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: mock.mockForCarousel[indexPath.row].count * 10, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
}
