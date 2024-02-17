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
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let galeryCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        return flow
    }()
    
    var pageControl : UIPageControl = {
        let pc = UIPageControl(frame: .zero)
        pc.currentPage = 0
        pc.numberOfPages = 5
        pc.currentPageIndicatorTintColor = .accentColor
        pc.direction = .leftToRight
        pc.pageIndicatorTintColor = .lightAccentColor
        pc.backgroundStyle = .automatic
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    private var recommendedLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Recommended"
        lbl.font = UIFont(name: "SFProDisplay-Black", size: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var recommendedCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(
            GaleryCollectionViewCell.self,
            forCellWithReuseIdentifier: GaleryCollectionViewCell.id
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.indicatorStyle = .black
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
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
        recommendedCollectionView.delegate = self
        recommendedCollectionView.dataSource = self
        
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
        view.addSubview(pageControl)
        view.addSubview(recommendedLabel)
        view.addSubview(recommendedCollectionView)
        
        NSLayoutConstraint.activate([
            carouselCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            carouselCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carouselCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            galeryCollectionView.topAnchor.constraint(equalTo: carouselCollectionView.bottomAnchor, constant: 23),
            galeryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galeryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            galeryCollectionView.heightAnchor.constraint(equalToConstant: 254),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: galeryCollectionView.bottomAnchor, constant: 16),
            pageControl.widthAnchor.constraint(equalToConstant: 200),
            pageControl.heightAnchor.constraint(equalToConstant: 6),
            
            recommendedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            recommendedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            recommendedLabel.heightAnchor.constraint(equalToConstant: 24),
            recommendedLabel.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 32),
            
            recommendedCollectionView.topAnchor.constraint(equalTo: recommendedLabel.bottomAnchor, constant: 18),
            recommendedCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            recommendedCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recommendedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case carouselCollectionView:
            if let cell = collectionView.cellForItem(at: indexPath) as? CarouselCollectionViewCell {
                cell.segmentControl.font = UIFont(name: "SFProDisplay-Bold", size: 16)
                cell.segmentControl.textColor = .accentColor
                cell.pointUnderSelected.isHidden = false

            }
        case galeryCollectionView:
            let vc = DetailInfoView()
            navigationController?.pushViewController(vc, animated: true)
        case recommendedCollectionView:
            let vc = DetailInfoView()
            navigationController?.pushViewController(vc, animated: true)
        default: break
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == carouselCollectionView {
            if let cell = collectionView.cellForItem(at: indexPath) as? CarouselCollectionViewCell {
                cell.segmentControl.font = UIFont(name: "SFProDisplay-Regular", size: 16)
                cell.segmentControl.textColor = .black
                cell.pointUnderSelected.isHidden = true
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / (view.frame.width * 0.75)
        pageControl.currentPage = Int(scrollPos)
        
    }
    
}

extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case carouselCollectionView:
            return mock.mockForCarousel.count
        case galeryCollectionView:
            pageControl.numberOfPages = mock.mockForGalery.count
            return mock.mockForGalery.count
        case recommendedCollectionView:
            return mock.mockForRecommended.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case carouselCollectionView:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CarouselCollectionViewCell.id,
                for: indexPath
            ) as! CarouselCollectionViewCell
            cell.get(data: mock.mockForCarousel[indexPath.item])
            return cell
        case galeryCollectionView:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GaleryCollectionViewCell.id,
                for: indexPath
            ) as! GaleryCollectionViewCell
            let mock = mock.mockForGalery[indexPath.row]
            cell.get(label: mock.title, image: mock.image)
            return cell
        case recommendedCollectionView:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GaleryCollectionViewCell.id,
                for: indexPath
            ) as! GaleryCollectionViewCell
            let mock = mock.mockForRecommended[indexPath.row]
            cell.get(label: mock.title, image: mock.image)
            cell.setupCell(labelFont: UIFont(name: "SFProDisplay-Semibold", size: 14)!, cornerRadius: 10, labelLeadingConstant: 12)
            return cell
        default: return UICollectionViewCell()
        }
    }
}

//TODO: Сделать нормальную ширину ячейки
extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case carouselCollectionView:
            return CGSize(width: mock.mockForCarousel[indexPath.row].count * 10, height: 50)
        case galeryCollectionView:
            let width = view.frame.width - 80
            let height = width * 0.758
            return CGSize(width: width, height: height)
        case recommendedCollectionView:
            let width = ((recommendedCollectionView.frame.width - 45) / 2)
            let height = width
            return CGSize(width: width, height: height)
        default: return CGSize()
        }
    }
    // Посмотреть где куда какие размеры надо
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case carouselCollectionView:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        case galeryCollectionView:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        case recommendedCollectionView:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        default: return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
    }
}
