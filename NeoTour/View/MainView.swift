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
    
    private lazy var galeryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: galeryCollectionViewFlowLayout)
        collectionView.register(
            GaleryCollectionViewCell.self,
            forCellWithReuseIdentifier: GaleryCollectionViewCell.id
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.indicatorStyle = .black
        return collectionView
    }()
    
    private let galeryCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        return flow
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupConstraints()
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        galeryCollectionView.delegate = self
        galeryCollectionView.dataSource = self
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
        view.addSubview(galeryCollectionView)
        
        NSLayoutConstraint.activate([
            carouselCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            carouselCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carouselCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            galeryCollectionView.topAnchor.constraint(equalTo: carouselCollectionView.bottomAnchor, constant: 23),
            galeryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galeryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            galeryCollectionView.heightAnchor.constraint(equalToConstant: 254)
        ])
    }
}
extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == carouselCollectionView {
            if let cell = collectionView.cellForItem(at: indexPath) as? CarouselCollectionViewCell {
                cell.segmentControl.font = UIFont(name: "SFProDisplay-Bold", size: 16)
                cell.segmentControl.textColor = .accentColor
                cell.pointUnderSelected.isHidden = false
            }
        } else if collectionView == galeryCollectionView {
            // Хз пригодиться нет, пока добавил
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == carouselCollectionView {
            if let cell = collectionView.cellForItem(at: indexPath) as? CarouselCollectionViewCell {
                cell.segmentControl.font = UIFont(name: "SFProDisplay-Regular", size: 16)
                cell.segmentControl.textColor = .black
                cell.pointUnderSelected.isHidden = true
            }
        } else if collectionView == galeryCollectionView {
            // Хз пригодиться нет, пока добавил
            }
        }
}
extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == carouselCollectionView {
            return mock.mockForCarousel.count
        } else {
            return mock.mockForGalery.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == carouselCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CarouselCollectionViewCell.id,
                for: indexPath
            ) as! CarouselCollectionViewCell
            cell.get(data: mock.mockForCarousel[indexPath.item])
            return cell
        } else if collectionView == galeryCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GaleryCollectionViewCell.id,
                for: indexPath
            ) as! GaleryCollectionViewCell
            let mock = mock.mockForGalery[indexPath.row]
            cell.get(label: mock.title, image: mock.image)
            return cell
        }
        return UICollectionViewCell()
    }
}
//TODO: Сделать нормальную ширину ячейки
extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == carouselCollectionView {
            return CGSize(width: mock.mockForCarousel[indexPath.row].count * 10, height: 50)
        } else {
            let width = view.frame.width - 80
            let height = width * 0.758
            return CGSize(width: width, height: height)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
