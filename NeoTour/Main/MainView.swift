//
//  2ExampleViewController.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 19.02.2024.
//

import UIKit

class MainView: UIViewController {
    
    static let sectionHeaderElementKind = "section-header-element-kin"
    
    enum Section: CaseIterable {
        case carouselTour
        case galeryTour
        case recommendedTour
    }
    
    enum Item: Hashable {
        
        case carousel(Categories)
        case galery(Tour)
        case recommended(Tour)
    }
    
//    let mock = MockFiles()
    
    var viewModel: MainViewModelProtocol!
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    private lazy var MainViewCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(
            TourCategoriesCollectionViewCell.self,
            forCellWithReuseIdentifier: TourCategoriesCollectionViewCell.id
        )
        collectionView.register(
            GaleryCollectionViewCell.self,
            forCellWithReuseIdentifier: GaleryCollectionViewCell.id
        )
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: MainView.sectionHeaderElementKind, withReuseIdentifier: HeaderView.reuseIdentifier)
        collectionView.register(
            RecommendedCollectionViewCell.self,
            forCellWithReuseIdentifier: RecommendedCollectionViewCell.id
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.indicatorStyle = .black
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MainViewCollectionView.delegate = self
        view.backgroundColor = .white
        configureCollectionView()
        configureDataSource()
        setupNavBar()
    }
    private func setupNavBar() {
        self.navigationItem.hidesBackButton = true
        let titleLabel = UILabel()
        titleLabel.text = "Discover"
        titleLabel.font = UIFont(name: "SFProDisplay-Black", size: 32)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    
    func createLayout() -> UICollectionViewLayout {
      let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,                                layoutEnvironment: NSCollectionLayoutEnvironment)
        -> NSCollectionLayoutSection? in
        let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500
        
        let sectionLayoutKind = Section.allCases[sectionIndex]
        switch (sectionLayoutKind) {
        case .carouselTour:
            return self.generateCarouselLayout(isWide: isWideView)
        case .galeryTour:
            return self.generateToursLayout(isWide: isWideView)
        case .recommendedTour:
            return self.generateRecommendedTourLayout()
        }
      }
      return layout
    }
    
    private func generateCarouselLayout(isWide: Bool) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupFractionalWidth = isWide ? 0.475 : 0.95
        let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(CGFloat(groupFractionalWidth)),
          heightDimension: .absolute(CGFloat(50)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(
          top: 5,
          leading: 5,
          bottom: 5,
          trailing: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func generateRecommendedTourLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets  = NSDirectionalEdgeInsets(
            top: 5,
            leading: 5,
            bottom: 5,
            trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: headerSize,
          elementKind: MainView.sectionHeaderElementKind,
          alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        
        
        return section
    }
    
    private func generateToursLayout(isWide: Bool) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(2/3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupFractionalWidth = isWide ? 0.475 : 0.95
        let groupFractionalHeight: Float = isWide ? 1/3 : 2/3
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(CGFloat(groupFractionalWidth)),
            heightDimension: .fractionalWidth(CGFloat(groupFractionalHeight)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 5,
            bottom: 5,
            trailing: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
      
        return section
    }
    
    private func configureCollectionView() {
        view.addSubview(MainViewCollectionView)
        NSLayoutConstraint.activate([
            
            MainViewCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            MainViewCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            MainViewCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MainViewCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: MainViewCollectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in

            let sectionType = Section.allCases[indexPath.section]
            switch sectionType {
            case .carouselTour:
                guard case let .carousel(data) = item else {
                                fatalError("Invalid item type for carouselTour section")
                            }
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: TourCategoriesCollectionViewCell.id,
                    for: indexPath
                ) as? TourCategoriesCollectionViewCell else {
                    fatalError("Failed to dequeue a cell of type CarouselCollectionViewCell")
                }
                cell.viewModel = self.viewModel.getDataForCategoriesCell(categories: data)
                return cell
            case .galeryTour:
                guard case let .galery(data) = item else {
                                fatalError("Invalid item type for carouselTour section")
                            }
                let cell = collectionView.dequeueReusableCell(
                  withReuseIdentifier: GaleryCollectionViewCell.id,
                  for: indexPath
                ) as! GaleryCollectionViewCell
                cell.viewModel = self.viewModel.getDataForGaleryCell(tour: data)
                return cell
            case .recommendedTour:
                guard case let .recommended(data) = item else {
                                fatalError("Invalid item type for carouselTour section")
                            }
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: RecommendedCollectionViewCell.id,
                    for: indexPath
                ) as! RecommendedCollectionViewCell
                cell.viewModel = self.viewModel.getDataForRecommendedCell(tour: data)
                return cell
            }
            
        })
        dataSource.supplementaryViewProvider = { (
          collectionView: UICollectionView,
          kind: String,
          indexPath: IndexPath)
          -> UICollectionReusableView? in
          
          guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderView.reuseIdentifier,
            for: indexPath) as? HeaderView else {
            fatalError("Cannot create header view")
          }
          
          supplementaryView.label.text = "Recommended"
          return supplementaryView
        }
        
        // Создание снимка
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()

        // Добавление секций
        snapshot.appendSections([.carouselTour, .galeryTour, .recommendedTour])

        // Добавление элементов для каждой секции
        let carouselItems = viewModel.categories // Пример данных для секции "carouselTour"
        snapshot.appendItems(carouselItems.map { Item.carousel($0) }, toSection: .carouselTour)

        let galeryItems: [Tour] = viewModel.toursForGalery
        snapshot.appendItems(galeryItems.map { Item.galery($0) }, toSection: .galeryTour)

        let recommendedItems: [Tour] = viewModel.toursForRecommended
        snapshot.appendItems(recommendedItems.map { Item.recommended($0) }, toSection: .recommendedTour)

        // Применение снимка к источнику данных
        dataSource.apply(snapshot, animatingDifferences: false)

    }
    
    
}


extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = Section.allCases[indexPath.section]
                let item = dataSource.itemIdentifier(for: indexPath)
                
                switch section {
                case .carouselTour:
                    if case let .carousel(_) = item {
                        if let cell = collectionView.cellForItem(at: indexPath) as? TourCategoriesCollectionViewCell {
                            cell.segmentControl.font = UIFont(name: "SFProDisplay-Bold", size: 16)
                            cell.segmentControl.textColor = .accentColor
                            cell.pointUnderSelected.isHidden = false

                            }
                    }
                case .galeryTour:
                    if case let .galery(data) = item {
                        let vc = TourDetailsView()
                        vc.viewModel = viewModel.getDataForDetailView(tour: data)
                        navigationController?.pushViewController(vc, animated: true)
                    }
                case .recommendedTour:
                    if case let .recommended(data) = item {
                        let vc = TourDetailsView()
                        vc.viewModel = viewModel.getDataForDetailView(tour: data)
                        navigationController?.pushViewController(vc, animated: true)
                    }
                }
        }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if Section.allCases[indexPath.section] == .carouselTour {
            let item = dataSource.itemIdentifier(for: indexPath)
            if case let .carousel(_) = item {
                if let cell = collectionView.cellForItem(at: indexPath) as? TourCategoriesCollectionViewCell {
                    cell.segmentControl.font = UIFont(name: "SFProDisplay-Regular", size: 16)
                    cell.segmentControl.textColor = .black
                    cell.pointUnderSelected.isHidden = true

                    }
            }
        }
    }
}
